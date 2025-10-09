import * as aws from "@pulumi/aws";
import * as tls from "@pulumi/tls";
import { getEnv, registerMandatoryTags, prodValidation } from '../global_config';
import * as fs from 'fs';

registerMandatoryTags({
    Environment: getEnv(),
    Automation: "True",
    "Business Unit": "Infrastructure"
});

let environment: string = getEnv()

function createKmsKeys() {
    const kmsKeyArgs: aws.kms.KeyArgs = {
        description: "Llave para encriptar las bases de datos",
        enableKeyRotation: false,
        tags: {
            Name: `${environment}-database-kms`,
            Application: "Base de Datos",
            Description: "Llave de encriptación para las bases de datos",
        },
    };
    
    if (prodValidation()) {
        kmsKeyArgs.policy = JSON.stringify({
            Version: "2012-10-17",
            Statement: [
                {
                    Sid: "Enable IAM User Permissions",
                    Effect: "Allow",
                    Principal: {
                        AWS: `arn:aws:iam::1234567890:root`,
                    },
                    Action: "kms:*",
                    Resource: "*",
                },
                {
                    Sid: "Allow cross-account access",
                    Effect: "Allow",
                    Principal: {
                        AWS: [
                            "arn:aws:iam::2345678901:root",
                            "arn:aws:iam::3456789012:root",
                            "arn:aws:iam::4567890123:root",
                            "arn:aws:iam::5678901234:root",
                        ],
                    },
                    Action: [
                        "kms:Encrypt",
                        "kms:Decrypt",
                        "kms:ReEncrypt*",
                        "kms:GenerateDataKey*",
                        "kms:DescribeKey",
                    ],
                    Resource: "*",
                },
            ],
        });
    }

    const kmsKey = new aws.kms.Key(`${environment}-database-kms`,kmsKeyArgs);

    const kmsAlias = new aws.kms.Alias(`${environment}-database-kms-alias`, {
        name: `alias/${environment}-database-kms`,
        targetKeyId: kmsKey.id,
    });

    return kmsKey
}

function createSSHKey() {
    const sshKeyPair = new tls.PrivateKey(`${environment}-database-keypar`, {
        algorithm: "RSA",
        rsaBits: 4096,
    });

    const sshKey = new aws.ec2.KeyPair(`${environment}-db-ssh-keys`, {
        publicKey: sshKeyPair.publicKeyOpenssh,
        keyName: `${environment}-db-ssh-keys`, 
        tags: {
            Name: `${environment}-db-ssh-keys`,
            Application: "Base de Datos",
            Description: "llaves de conexión para base de datos",
        },
    });


    sshKeyPair.privateKeyPem.apply(privateKey => {
        const filePath = `/tmp/${environment}-db-ssh-keys.pem`; 
        fs.writeFileSync(filePath, privateKey);
        console.log(`llave ssh guardada en : ${filePath}`);
    });

    return sshKey.keyName;
    
}

function sshkeysforInstances(){
    const sshKeyPair = new tls.PrivateKey(`${environment}-instance-keypar`, {
        algorithm: "RSA",
        rsaBits: 4096,
    });

    const instacesSshKey = new aws.ec2.KeyPair(`${environment}-instance-ssh-keys`, {
        publicKey: sshKeyPair.publicKeyOpenssh,
        keyName: `${environment}-instance-ssh-keys`, 
        tags: {
            Name: `${environment}-instance-ssh-keys`,
            Application: "Instancias EC2",
            Description: "llaves de conexión para instancias",
        },
    });
    sshKeyPair.privateKeyPem.apply(privateKey => {
        const filePath = `/tmp/${environment}-instance-ssh-keys.pem`; 
        fs.writeFileSync(filePath, privateKey);
        console.log(`llave ssh guardada en : ${filePath}`);
    });
    return instacesSshKey.keyName;
}

export const databaseKey = createKmsKeys();
export const dbSSHKey = createSSHKey();
export const instacesSshKey = sshkeysforInstances();
