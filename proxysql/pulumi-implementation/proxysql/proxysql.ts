import * as aws from "@pulumi/aws";
import * as pulumi from "@pulumi/pulumi";
import { getEnv, prodValidation } from "../../global_config";
import { instacesSshKey } from "../../databases/commons"


export class proxySQL {
    private env: string;
    private appName: string;
    private toReturn: { [key: string]: any };
    private project: string;
    private networkSSM: any;
    private pulumiConfig: { [key: string]: any };

    constructor() {
        this.env = getEnv();
        this.appName = "proxysql";
        this.project = `${this.env}-${this.appName}`;
        this.pulumiConfig = new pulumi.Config("proxysql")
        if (this.pulumiConfig.requireNumber("num-instances") > 0) {
            this.createProxysql();
        }

    }

    async createProxysql() {
        try {
            await this.getSSM(`${this.env}-aws-vars`);
        } catch (error) {
            console.error("Error durante ejecucion:", error);
        }
        const vpcId = this.networkSSM.vpc_id;
        const vpcData = await aws.ec2.getVpc({ id: vpcId });
        const vpcCidrBlock = vpcData.cidrBlock;
        const proxysqlSG = new aws.ec2.SecurityGroup(`${this.project}-sg`, {
            vpcId: vpcId,
            description: `Grupo de seguridad para proyecto ${this.appName}`,
            name: `${this.project}-sg`,
            ingress: [{
                protocol: "tcp",
                fromPort: 22,
                toPort: 22,
                cidrBlocks: [vpcCidrBlock],
            },
            {
                protocol: "tcp",
                fromPort: 3306,
                toPort: 3306,
                cidrBlocks: [vpcCidrBlock],
            },
            {
                protocol: "tcp",
                fromPort: 8080,
                toPort: 8080,
                cidrBlocks: [vpcCidrBlock],
            }],
            egress: [{
                protocol: "-1",
                fromPort: 0,
                toPort: 0,
                cidrBlocks: ["0.0.0.0/0"],
            }],
            tags: {
                Name: `${this.project}-sg`,
                Application: `${this.appName}`,
                description: `Grupo de seguridad para proyecto ${this.appName}`
            }
        });
        const proxysqlRole = this.createRoleAndPolicies();
        const proxysqlInstanceProfile = new aws.iam.InstanceProfile(`${this.project}-instance-profile`, {
            role: proxysqlRole.name,
            name: `${this.project}-instance-profile`
        });
        const proxysqlLT = new aws.ec2.LaunchTemplate(`${this.project}-lt`, {
            name: `${this.project}-lt`,
            vpcSecurityGroupIds: proxysqlSG.id.apply(id => [id]),
            imageId: this.pulumiConfig.require("ami"),
            instanceType: prodValidation() ? "m5a.large" : "t2.micro",
            keyName: instacesSshKey,
            iamInstanceProfile: {
                name: proxysqlInstanceProfile.name
            },
            monitoring: {
                enabled: false,
            },
            blockDeviceMappings: [
                {
                    deviceName: "/dev/sda1", ebs: {
                    volumeSize: prodValidation() ? 30 : 8 , 
                    volumeType: "gp3",
                }
            }],
            tags: {
                Name: `${this.project}-lt`,
                Application: `${this.appName}`,
                Description: `Launch template del proyecto ${this.appName}`
            }
        },{
            ignoreChanges: ["rootBlockDevice"]
        });
        const subnets_data = this.networkSSM.subnets_data.map(subnetId => ({
            subnetId: subnetId,
        }));

        const proxysqlASG = new aws.autoscaling.Group(`${this.project}-asg`, {
            name: `${this.project}-asg`,
            desiredCapacity: this.pulumiConfig.require("num-instances"),
            maxSize: this.pulumiConfig.require("num-instances"),
            minSize: this.pulumiConfig.require("num-instances"),
            launchTemplate: {
                id: proxysqlLT.id,
                version: "$Latest",
            },
            vpcZoneIdentifiers: this.networkSSM.subnets_data,
            healthCheckGracePeriod: 60,
            tags: [
                {
                    key: "Name",
                    value: `${this.project}-asg`,
                    propagateAtLaunch: true,
                },
                {
                    key: "Application",
                    value: `${this.appName}`,
                    propagateAtLaunch: true,
                },
                {
                    key: "Environment",
                    value: this.env,
                    propagateAtLaunch: true,
                }
            ]
        });

        const proxysqlLB = new aws.lb.LoadBalancer(`${this.project}-nlb`, {
            name: `${this.project}-nlb`,
            internal: true,
            loadBalancerType: "network",
            securityGroups: [proxysqlSG.id],
            subnetMappings: subnets_data,
            tags: {
                Name: `${this.project}-app`,
                Application: `${this.appName}`,
                Description: `LB para manejo de ${this.project} `
            }
        });

        const proxysqlTg = new aws.lb.TargetGroup(`${this.project}-tg`, {
            name: `${this.project}-tg`,
            port: 3306,
            protocol: "TCP",
            targetType: "instance",
            vpcId: vpcId,
            tags: {
                Name: `${this.project}-app`,
                Application: `${this.appName}`,
                Description: `Target Group de ${this.project} `
            }
        });

        new aws.autoscaling.Attachment(`${this.project}-att`, {
            autoscalingGroupName: proxysqlASG.name,
            lbTargetGroupArn: proxysqlTg.arn

        });

        new aws.lb.Listener(`${this.project}-listener`, {
            loadBalancerArn: proxysqlLB.arn,
            protocol: "TCP",
            port: 3306,
            defaultActions: [{
                type: "forward",
                targetGroupArn: proxysqlTg.arn,
            }],
        });

        pulumi.all([proxysqlASG.name]).apply(([name]) => {
            const codeApp = this.createCodeDeploy(name,proxysqlTg.name);
        });

        this.createDNS("proxysql", prodValidation() ? "rds.facudomain.com" : `rds.${this.env}.secondarydomain.com`, proxysqlLB.dnsName);

    }

    async getSSM(paramStoreName: string) {
        try {
            const parameterStore = await aws.ssm.getParameter({
                name: paramStoreName,
                withDecryption: true,
            });
            this.networkSSM = JSON.parse(parameterStore.value!);

        } catch (error) {
            console.error(`No se pudo cargar el PS: ${paramStoreName}`, error);
        }
    }

    createRoleAndPolicies() {
        const role = new aws.iam.Role(`${this.project}-role`, {
            name: `${this.project}-role`,
            assumeRolePolicy: JSON.stringify({
                "Version": "2012-10-17",
                "Statement": [{
                    "Action": "sts:AssumeRole",
                    "Effect": "Allow",
                    "Principal": { "Service": "ec2.amazonaws.com", },
                }],
            }),
        });

        const accountId: any = pulumi.output(aws.getCallerIdentity()).accountId;
        accountId.apply(id => {
            new aws.iam.RolePolicy(`${this.project}-permissions`, {
                name: `${this.project}-permissions`,
                role: role.name,
                policy: {
                    Version: "2012-10-17",
                    Statement: [{
                        Effect: "Allow",
                        Action: [
                            "kms:Encrypt",
                            "kms:Decrypt",
                            "kms:ReEncrypt*",
                            "kms:GenerateDataKey*",
                            "kms:DescribeKey",
                        ],
                        Resource: [
                            `arn:aws:kms:us-east-1:${id}:key/alias/aws/ssm`
                        ]
                    },
                    {
                        "Effect": "Allow",
                        "Action": [
                            "ssm:GetParameter*",
                            "ssm:GetParameters*",
                            "ssm:UpdateInstanceInformation"
                        ],
                        "Resource": `arn:aws:ssm:us-east-1:${id}:parameter/${this.env}-conf-proxysql`
                    },
                    {
                        "Effect": "Allow",
                        "Action": [
                            "s3:GetObject*"
                        ],
                        "Resource": `arn:aws:s3:::${this.env}-artifacts-deployments/*`
                    },
                    {
                        "Effect": "Allow",
                        "Action": "ec2:DescribeTags",
                        "Resource": "*",
                    }]
                }
            });
        });
        new aws.iam.RolePolicyAttachment(`${this.project}-ssm`, {
            role: role.name,
            policyArn: "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
        });

        return role
    }

    createCodeDeploy(autoScalingGroupName: string, tgname : any) {
        const cdRole = new aws.iam.Role(`${this.project}-cd-role`, {
            name: `${this.project}-cd-role`,
            assumeRolePolicy: {
                "Version": "2012-10-17",
                "Statement": [
                    {
                        "Effect": "Allow",
                        "Principal": {
                            "Service": [
                                "codedeploy.amazonaws.com"
                            ]
                        },
                        "Action": "sts:AssumeRole"
                    }
                ]
            },
        });

        new aws.iam.RolePolicyAttachment(`${this.project}-cd-role-policy`, {
            policyArn: "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole",
            role: cdRole.name
        })

        const proxysqlApp = new aws.codedeploy.Application(`${this.project}-app`, {
            name: `${this.project}-app`,
            tags: {
                Name: `${this.project}-app`,
                Application: `${this.appName}`,
                Description: `Aplicacion de codedeploy para ${this.project} `
            }
        });
        new aws.codedeploy.DeploymentGroup(`${this.project}-deploy-group`, {
            appName: proxysqlApp.name,
            deploymentGroupName: `${this.project}-deploy-group`,
            serviceRoleArn: cdRole.arn,
            deploymentConfigName: prodValidation() ? "CodeDeployDefault.OneAtATime" : "CodeDeployDefault.AllAtOnce",
            autoRollbackConfiguration: {
                enabled: true,
                events: ["DEPLOYMENT_FAILURE"],
            },
            loadBalancerInfo: {
                targetGroupInfos:[{name: tgname}]
            },
            deploymentStyle : {
                deploymentOption: "WITHOUT_TRAFFIC_CONTROL",
                deploymentType: "IN_PLACE"
            },
            autoscalingGroups: [autoScalingGroupName],
            tags: {
                Name: `${this.project}-app`,
                Application: `${this.appName}`,
                Description: `Deployment Group para configuraciones de ${this.project} `
            }
        });
    }

    createDNS(prefix: string, domainName: string, destination: any) {
        const hostedZone = aws.route53.getZone({
            name: domainName,
            privateZone: true,
        });
        new aws.route53.Record(`${this.project}-cname`, {
            zoneId: hostedZone.then(zone => zone.zoneId),
            name: prefix,
            type: "CNAME",
            ttl: 300,
            records: destination.apply(value => [value]),
        });
    }

}