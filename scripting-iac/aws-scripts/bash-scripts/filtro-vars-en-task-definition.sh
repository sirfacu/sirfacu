#!/bin/bash
> task-definitions-founds.log
while IFS= read -r linea
do

  # Definir el perfil y la región
  AWS_PROFILE="default"
  AWS_REGION="us-east-1"
  #Estableciendo el filtro
  FILTER_VALUE=$linea
  
  # Obtener todas las task definitions con su última versión
  #TASK_DEFINITIONS=$(aws ecs list-task-definitions --profile "$AWS_PROFILE" --region "$AWS_REGION" | jq -r '.taskDefinitionArns[]')
  TASK_DEFINITIONS=$(aws ecs list-task-definitions --profile "$AWS_PROFILE" --region "$AWS_REGION" | 
                   jq -r '.taskDefinitionArns[]' | 
                   awk -F'[:/]' '{
                       split($8, parts, ":"); 
                       familia = $7; 
                       version = parts[1]; 
                       if (version > max_version[familia]) {
                           max_version[familia] = version;
                           full_arn[familia] = $0
                       }
                   } END {
                       for (f in full_arn) {
                           print full_arn[f]
                       }
                   }')

  if [ -z "$TASK_DEFINITIONS" ]; then
    echo "No se encontraron task definitions en ECS."
    exit 1
  fi

  echo "Se encontraron $(echo "$TASK_DEFINITIONS" | wc -l) task definitions."
  # Variable para verificar si se encontró algún resultado
  FOUND=false

  # Iterar sobre cada task definition
  for TASK_DEF in $TASK_DEFINITIONS; do
    # Obtener la definición de la última versión de la tarea
    
    TASK_DEF_JSON=$(aws ecs describe-task-definition --task-definition "$TASK_DEF" --profile "$AWS_PROFILE" --region "$AWS_REGION")

    # Obtener el nombre de la tarea
    TASK_NAME=$(echo "$TASK_DEF_JSON" | jq -r '.taskDefinition.family')
    
    echo $VERDE"Procesando:"$RESET$CYAN$TASK_NAME$RESET
    # Omitir las task definitions que contengan "ubits"
    if echo "$TASK_NAME" | grep -qi "ubits"; then
      echo "⚠ Omitiendo task definition: $TASK_NAME (contiene 'ubits')"
      continue
    fi

    # Extraer el nombre del primer contenedor de la definición
    CONTAINERS_NAMES=$(echo "$TASK_DEF_JSON" | jq -r '.taskDefinition.containerDefinitions[].name' | xargs)
    if [ -z "$CONTAINERS_NAMES" ]; then
        echo "  ⚠ No se encontró un contenedor en la task definition, saltando..."
        continue
      fi
    for CONTAINER in $CONTAINERS_NAMES; do  
      echo "  Contenedor detectado: $CONTAINER"
      # Extraer variables de entorno del contenedor
      ENV_VARS=$(echo "$TASK_DEF_JSON" | jq -c --arg CONTAINER_NAME "$CONTAINER" '
        .taskDefinition.containerDefinitions[] | select(.name == $CONTAINER_NAME) | .environment')

      # Buscar valores que contengan la palabra clave
      MATCHING_VARS=$(echo "$ENV_VARS" | jq -c --arg FILTER_VALUE "$FILTER_VALUE" '
        [.[] | select(.value | contains($FILTER_VALUE))]')

      if [ "$(echo "$MATCHING_VARS" | jq length)" -gt 0 ]; then
        echo "  ❌ Se encontraron variables que contienen $ROJO\"$FILTER_VALUE\"$RESET en $TASK_NAME:"
        echo "task definition:"$TASK_NAME >> task-definitions-founds.log
        echo "$MATCHING_VARS" | jq . >> task-definitions-founds.log
        FOUND=true
      else
        echo "  ✅ No se encontraron variables que contengan $VERDE\"$FILTER_VALUE\"$RESET en $TASK_NAME."
      fi
    done
  done

  # Si no se encontró ningún resultado, mostrar mensaje
  if [ "$FOUND" = false ]; then
    echo "No se encontró ninguna task definition con una variable que contenga \"$FILTER_VALUE\" en su valor."
  fi

done < domains.txt

