import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";

import { getEnv, getStack, prodValidation, getStackReference , registerMandatoryTags } from "../global_config";
import { company, region } from "../global_cons";
import { parameterStore } from "./definitions/resources";

const env = getEnv();
const vpc = getStackReference("vpc");

registerMandatoryTags({
    Environment: env,
    Automation: "True",
});
const org_chart_ps = new parameterStore("org_chart");