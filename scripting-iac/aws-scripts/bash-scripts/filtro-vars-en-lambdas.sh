#!/bin/bash
# Definir el perfil y la región
AWS_PROFILE="default"
AWS_REGION="us-east-1"
> lambdas-found.log
while IFS= read -r linea
do
    SEARCH_VALUE=$linea

    # Obtén la lista de funciones Lambda
    echo "Obteniendo funciones Lambda..."
    FUNCTIONS=$(aws lambda list-functions --query 'Functions[].FunctionName' --output text --profile $AWS_PROFILE --region $AWS_REGION)

    if [ -z "$FUNCTIONS" ]; then
        echo "No se encontraron funciones Lambda."
        exit 0
    fi

    echo "Buscando el valor '$SEARCH_VALUE' en las variables de entorno..."

    for FUNCTION in $FUNCTIONS; do
        #echo "Revisando función: $FUNCTION"

        # Obtén las variables de entorno de la función
        ENV_VARS=$(aws lambda get-function-configuration --function-name "$FUNCTION" --query 'Environment.Variables' --output json --profile $AWS_PROFILE --region $AWS_REGION)

        if [ -z "$ENV_VARS" ]; then
            #echo "  No hay variables de entorno configuradas para esta función."
            continue
        fi

        # Busca el valor en las variables de entorno
        MATCH=$(echo "$ENV_VARS" | grep -o "$SEARCH_VALUE")
        if [ -n "$MATCH" ]; then
            echo "  ¡Valor encontrado en la función $FUNCTION!"
            echo "  Variables de entorno:"
            echo "Funcion "$FUNCTION" encontrada con valor "$linea >> lambdas-found.log
            echo "$ENV_VARS" | jq >> lambdas-found.log
        fi
    done

    echo "Búsqueda completada."

done < domains.txt
