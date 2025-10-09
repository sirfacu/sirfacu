import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";
import * as file from "fs"; //import to get the file from the SO
import { execSync } from "child_process";

import { getEnv, prodValidation, getStackReference } from "../../global_config";
import { company, region } from "../../global_cons";

export class parameterStore {
    private env: string;
    private projectName: string;
    private toReturn: { [key: string]: any };
    //private parameterStoreValues= { [key: string]: any };
    constructor(appName: string) {
        this.env = getEnv();
        this.projectName = `${this.env}-${appName}`;
        this.toReturn = {};
        this.createParameterStore(`${appName}`);
    }
    createParameterStore(appName: string) {
        //decript and populate the teams-secrets.yaml
        const config = new pulumi.Config();
        const fileEnc = file.readFileSync(`./definitions/tmp/${appName}-conf.json`,"utf-8");
        const parameter = new aws.ssm.Parameter(`${this.projectName}-ps`, {
            name: `${this.env}_${appName}`, 
            type: "SecureString",
            value: config.requireSecret(`${appName}`),
            tags: {
                Name: `${this.env}_${appName}`,
                "Bussiness Unit": "talent",
                Application: `${appName}`,
                Description: `secure values to ${appName}`
            }
        });        
    }
}
