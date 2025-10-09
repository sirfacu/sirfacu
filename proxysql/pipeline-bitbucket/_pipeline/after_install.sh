#!/usr/bin/env bash
set -e
echo $(date +"%Y-%m-%d %H:%M:%S")" Inicio Ejecucion After Install " >> /etc/proxysql-codedeploy.log
. /home/ssm-user/.server-tags
PARAM_NAME=${TAG_ENVIRONMENT}-conf-proxysql
DATA_PS=$(aws ssm get-parameter --name "$PARAM_NAME" --region "$REGION" --with-decryption --query 'Parameter.Value' --output text)

#####################################################################################################  
###                            OBTENCION DE PARAMETER STORE                                       ###
#####################################################################################################
if [ $? -ne 0 ]; then
    echo $(date +"%Y-%m-%d %H:%M:%S")"Error: Falló al intentar obtener el parameter store" >> /etc/proxysql-codedeploy.log
    exit 1
fi

if [ -z "$DATA_PS" ]; then
    echo $(date +"%Y-%m-%d %H:%M:%S")"Error: Parameter store vacio" >> /etc/proxysql-codedeploy.log
    exit 1
fi

total=$(echo "$DATA_PS" | jq '.mysql_users | length')

#####################################################################################################  
###                            CREACION ESTRUCTURA DE USUARIOS                                    ###
#####################################################################################################
count=1
> users
echo "$DATA_PS" | jq -r '.mysql_users | to_entries[] | "\(.key) \(.value)"' | while read -r usuario clave; do
    export user=$usuario
    export user_passwd=$clave
    if [ "$count" -eq "$total" ]; then
        echo '    { username = "${user}" , password = "${user_passwd}" , default_hostgroup = "0" , active = 1, max_connections=500 }' | envsubst >> users
    else
        echo '    { username = "${user}" , password = "${user_passwd}" , default_hostgroup = "0" , active = 1, max_connections=500 },' | envsubst >> users
    fi
    count=$((count + 1))
done
export MYSQL_USERS_DATA=$(cat users)

#####################################################################################################  
###                           CONFIGURACION VARIABLE CLUSTER                                      ###
#####################################################################################################

if [ "${TAG_ENVIRONMENT}" != 'prod' ]; then 
  export CHECK_TYPE="read_only"
else
  export $CHECK_TYPE="innodb_read_only"
fi

#####################################################################################################  
###                           CREACION DE ARCHIVO PROXYSQL.CNF                                    ###
#####################################################################################################
echo "$DATA_PS" | jq -r '.mysql_config | to_entries[] | "\(.key) \(.value)"' | while read -r llave valor; do
    clave=$(echo "$valor" | sed "s/^'//;s/'$//")
    echo eval export $llave="$valor" >> vars.sh
done
source vars.sh
envsubst < /tmp/proxysql-data/templates/proxysql.cnf.template > /etc/proxysql.cnf
systemctl restart proxysql
echo $(date +"%Y-%m-%d %H:%M:%S")" Finaliza After Install " >> /etc/proxysql-codedeploy.log