import { registerMandatoryTags, getEnv } from "../global_config";
import { proxySQL } from "./proxysql/proxysql"



const env = getEnv();
const toExport = {};

registerMandatoryTags({
    Environment: env,
    Automation: "True",
    "Business Unit": "Infrastructure"
});

const proxysql= new proxySQL();
