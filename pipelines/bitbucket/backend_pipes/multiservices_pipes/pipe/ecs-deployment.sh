#!/bin/bash
#Formateo el nombre del branch para que no este en mayúsculas esto por:
#La imagen docker generada en el paso no permite mayúsculas en el nombre de la imagen.
echo -e "Aplicaciones "${CYAN}$APPS${RESET}
for APP_NAME in ${APPS,,}; do
    echo -e $CYAN"Nombre de Aplicación a desplegar "$RESET $ROJO$APP_NAME$RESET
    export TD_SERVICE_NAME=${ENVIRONMENT,,}"-"${APP_NAME,,}
    #El nombre de la imagen viene en las variables IMG_APP_NAME que en el paso del docker-build se agregan al set_env.sh la seteo primero a mayusculas y luego traigo el valor
    VAR_IMG_NAME=${APP_NAME^^}
    IMG_NAME="IMG_"${VAR_IMG_NAME//-/_}
    export TD_IMAGE_NAME=${!IMG_NAME}
    #Aqui voy a obtener a partir de variables del repo el puerto de la aplicación basado en el nombre PORT_{API,CREATOR,UPDATER}
    PREFIX=$(echo $APP_NAME | awk -F"-" '{print $NF}')
    VAR_NAME="PORT_"${PREFIX^^}
    export TD_PORT=${!VAR_NAME}
    echo -e "Servicio " $CYAN$TD_SERVICE_NAME $RESET "Puerto asignado: "$ROJO$TD_PORT $RESET
    > env.sh
    export TD_LOG_GROUP=${TD_SERVICE_NAME}"-log"
    if [ "$VAR_APM" == 'true' ]; then
      echo -e "Se ha configurado el despliegue para usar "${VERDE} "APM" ${RESET}
      envsubst < pipe/task_definition_datadog.json > taskDefinitionpre.json
      #Pre-cargue de variables para enviroment del docker de DataDog
      for var in "${!DD_@}"; do
        if [[ "$var" != "DD_API_KEY" ]]; then
          eval "echo ${var#ENV_}=${!var//&/\\&}" >> env.sh
        fi
      done
    else
      echo -e ${CYAN}"Se ha configurado el despliegue para"${RESET}${ROJO}" NO usar APM"${RESET}
      envsubst < pipe/task_definition_service.json > taskDefinitionpre.json
    fi
    #Pre-cargue de variables para enviroment del docker
    for var in "${!ENV_@}"; do
        eval "echo ${var#ENV_}=${!var//&/\\&}" >> env.sh
    done
    echo \"environment\": $(cat env.sh | jq -R 'split("=") | {name: .[0], value: .[1:] | join("=")}' | jq -s '.') > vars.sh
    sed -i 's#\"environment\":\ \[\]#'"$(cat vars.sh | sed 's#&#\\&#g')"'#g' taskDefinitionpre.json;
    envsubst < taskDefinitionpre.json > taskDefinition.json
    echo -e "Creando el servicio "${VERDE}${TD_SERVICE_NAME}${RESET}" en el cluster: "${ROJO}${CLUSTER_NAME}${RESET}
    mv taskDefinition.json task-definitions/taskDefinition-${APP_NAME,,}.json
    aws ecs register-task-definition --cli-input-json file://task-definitions/taskDefinition-${APP_NAME,,}.json
    aws ecs update-service --cluster "${CLUSTER_NAME}" --service "${TD_SERVICE_NAME}" --task-definition "${TD_SERVICE_NAME}" --force-new-deployment
done