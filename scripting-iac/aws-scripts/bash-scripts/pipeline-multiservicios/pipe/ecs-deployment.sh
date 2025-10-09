#!/bin/bash
function setFargateValues(){
  if [ $TD_CLUSTER_COMPATIBILITY == "FARGATE" ]; then
    export TD_NETWORK_MODE="awsvpc"
    export TD_HOST_PORT=${TD_PORT}
  else
    export TD_NETWORK_MODE="bridge"
    export TD_HOST_PORT=0
  fi 
}

function setCpuMemoryValues(){
  if [ "${VAR_APM}" == "true" ]; then
    export TD_SERVICE_CPU=$((TD_CPU - $DD_CPU))
    export TD_SERVICE_MEMORY=$((TD_MEMORY - $DD_MEMORY))
  else
    export TD_SERVICE_CPU=$TD_CPU
    export TD_SERVICE_MEMORY=$TD_MEMORY
  fi 
}
echo -e "${AMARILLO}================= CONFIGURACIÓN DE DESPLIEGUE =================${RESET}"
echo -e "Tipo de despliegue:     ${VERDE}${TD_CLUSTER_COMPATIBILITY}${RESET}"
echo -e "Aplicaciones "${CYAN}$APPS${RESET}
for APP_NAME in ${APPS,,}; do
    export TD_SERVICE_NAME=${ENVIRONMENT,,}"-"${APP_NAME,,}
    #El nombre de la imagen viene en las variables IMG_APP_NAME que en el paso del docker-build se agregan al set_env.sh la seteo primero a mayusculas y luego traigo el valor
    VAR_IMG_NAME=${APP_NAME^^}
    IMG_NAME="IMG_"${VAR_IMG_NAME//-/_}
    export TD_IMAGE_NAME=${!IMG_NAME}
    #Aqui voy a obtener a partir de variables del repo el puerto de la aplicación basado en el nombre PORT_{API,CREATOR,UPDATER}
    PREFIX=$(echo $APP_NAME | awk -F"-" '{print $NF}')
    VAR_NAME="PORT_"${PREFIX^^}
    export TD_PORT=${!VAR_NAME}
    setFargateValues
    setCpuMemoryValues
    echo -e "Servicio " $CYAN$TD_SERVICE_NAME $RESET "Puerto asignado: "$ROJO$TD_PORT $RESET
    > env.sh
    export TD_LOG_GROUP=${TD_SERVICE_NAME}"-log"
    if [ "${VAR_APM}" == "true" ]; then
      echo -e "Se ha configurado el despliegue para usar "${VERDE} "APM" ${RESET}
      if [ $TD_CLUSTER_COMPATIBILITY == "FARGATE" ]; then
        export DD_HOST_PORT=8126
        envsubst < pipe/task_definition_datadog.json > draft-td.json
        sed -i '/"links": \["datadog-agent"\],/d' draft-td.json
      else
        export DD_HOST_PORT=0
        envsubst < pipe/task_definition_datadog.json > draft-td.json  
      fi
      for var in "${!ENV_@}" "${!DD_@}"; do echo -e "Variable a incluir" $CYAN$var$RESET; eval "echo ${var#ENV_}=${!var//&/\\&}" >> env.sh ; done
    else
      echo -e "Se ha configurado el despliegue "${VERDE}"SIN APM" ${RESET}
      if [ $TD_CLUSTER_COMPATIBILITY == "FARGATE" ]; then
        export DD_HOST_PORT=8126
        envsubst < pipe/task_definition_service.json > draft-td.json  
        sed -i '/"links": \["datadog-agent"\],/d' draft-td.json
      else
        export DD_HOST_PORT=0
        envsubst < pipe/task_definition_service.json > draft-td.json  
      fi
      for var in "${!ENV_@}" ; do echo -e "Variable a incluir" $CYAN$var$RESET; eval "echo ${var#ENV_}=${!var//&/\\&}" >> env.sh; done
    fi
    echo -e "Memoria Asignada:       ${CYAN}${TD_SERVICE_MEMORY}${RESET}"
    echo -e "CPU Asignada:           ${VERDE}${TD_SERVICE_CPU}${RESET}"
    echo -e "Modo de red (network):  ${CYAN}${TD_NETWORK_MODE}${RESET}"
    echo -e "Puerto del host:        ${ROJO}${TD_HOST_PORT}${RESET}"
    echo -e "${AMARILLO}===============================================================${RESET}" 
    echo -e "$CYAN Cargando variables de entorno para docker $RESET"
    echo \"environment\": $(cat env.sh | jq -R 'split("=") | {name: .[0], value: .[1:] | join("=")}' | jq -s '.') > vars.sh
    sed -i 's#\"environment\":\ \[\]#'"$(cat vars.sh | sed 's#&#\\&#g')"'#g' draft-td.json
    echo -e "Creando el servicio $VERDE" $TD_SERVICE_NAME "$RESET en el cluster :$ROJO" $CLUSTER_NAME "$RESET"
    envsubst < draft-td.json > task-definition-${APP_NAME}.json
    unset TD_PORT
    export TD_ARN=$(aws ecs register-task-definition --cli-input-json file://task-definition-${APP_NAME}.json --query 'taskDefinition.taskDefinitionArn' --output text)
    aws ecs update-service --cluster "${CLUSTER_NAME}" --service "${TD_SERVICE_NAME}" --task-definition "${TD_ARN}" --force-new-deployment
done