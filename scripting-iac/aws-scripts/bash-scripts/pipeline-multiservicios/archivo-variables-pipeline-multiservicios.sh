#!/bin/bash
# ============================================================================
# Script para configurar variables de entorno para pruebas locales
# Ambientes soportados: dev, test, prod, squad-poc
# ============================================================================

# Permite pasar el ambiente como argumento o pedirlo al usuario
if [ -z "$1" ]; then
  read -p "Digite el ambiente a probar (dev | test | prod | squad-poc): " ENVIRONMENT
else
  ENVIRONMENT=$1
fi

# Normalizar
export ENVIRONMENT=${ENVIRONMENT//-/_}
export ENVIRONMENT=$(echo "$ENVIRONMENT" | tr '[:upper:]' '[:lower:]')
# ----------------------------------------------------------------------------
# VARIABLES INTERNAS DE BITBUCKET (dummy solo para pruebas locales)
# ----------------------------------------------------------------------------
export BITBUCKET_BRANCH=${BITBUCKET_BRANCH:-infra-local}
export BITBUCKET_BUILD_NUMBER=${BITBUCKET_BUILD_NUMBER:-999}
export BITBUCKET_COMMIT=${BITBUCKET_COMMIT:-dummycommit123}
export BITBUCKET_CLONE_DIR=${BITBUCKET_CLONE_DIR:-$(pwd)}
export AWS_DEFAULT_REGION=us-east-1

# ----------------------------------------------------------------------------
# VARIABLES DE ECR (Repositorios por ambiente)
# ----------------------------------------------------------------------------
export DEV_ECR=ubits-dev-api-ecs-ecr
export TEST_ECR=ubits-test-api-ecs-ecr
export PROD_ECR=ubits-prod-api-ecs-ecr
export SQUAD_POC_ECR=squad-poc-talent-clusters-cluster-ecr

# ----------------------------------------------------------------------------
# VARIABLES DE APM (Datadog) por ambiente
# ----------------------------------------------------------------------------
export DEV_VAR_APM=true
export TEST_VAR_APM=true
export PROD_VAR_APM=true
export SQUAD_POC_VAR_APM=true

# ----------------------------------------------------------------------------
# Resolver dinámicamente las variables de ECR y APM para el ambiente elegido
# ----------------------------------------------------------------------------
eval export REPO=\${"${ENVIRONMENT^^}"_ECR}
eval export VAR_APM=\${"${ENVIRONMENT^^}"_VAR_APM}

# ----------------------------------------------------------------------------
# VARIABLES PARA TASK DEFINITION (Se agregan al environment de ECS)
# ----------------------------------------------------------------------------
export ENV_ENVIRONMENT=$ENVIRONMENT
export ENV_AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION

export TD_ENVIRONMENT=$ENVIRONMENT
export TD_LOG_REGION=$AWS_DEFAULT_REGION
export TD_LOG_GROUP=${ENVIRONMENT}-${APP_NAME}-log
export TD_AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION
export TD_NETWORK_MODE=bridge
export TD_HOST_PORT=0
export TD_PORT=5016
export TD_PROTOCOL=tcp
export TD_CLUSTER_COMPATIBILITY=FARGATE

# ----------------------------------------------------------------------------
# VARIABLES PARA DATADOG
# ----------------------------------------------------------------------------
export DD_API_KEY=${DD_API_KEY:-1234567890123}
export DD_SERVICE=${ENVIRONMENT}-${APP_NAME}
export DD_ENV=${ENVIRONMENT}
export DD_AGENT_HOST=datadog-agent
export DD_LOGS_INJECTION=true
export DD_VERSION=1.0.0

# ----------------------------------------------------------------------------
# VARIABLES PARA DESPLIEGUE
# ----------------------------------------------------------------------------
export TD_CPU=1024
export TD_MEMORY=2048
export CLUSTER_NAME=squad-poc-talent-clusters-ecs
export DOCKER_EXTRA_ARGS=""

# Valores dummy para ejecución local
export TD_IMAGE_NAME=${ENVIRONMENT}-${APP_NAME}-dummy-local
export DD_HOST_PORT=8126
export DD_CPU=10
export DD_MEMORY=256
export DATADOG_API_KEY=${DD_API_KEY}

# ============================================================================
# RESUMEN DE VARIABLES IMPORTANTES
# ============================================================================
echo -e "\nVariables cargadas para el ambiente: ${ENVIRONMENT}"
echo "Repositorio ECR: $REPO"
echo "APM habilitado: $VAR_APM"
echo "Service Name: $TD_SERVICE_NAME"
echo "Cluster: $CLUSTER_NAME"
echo "============================================================"
export APPS=$(ls apps/)
export ENV_AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)

export PORT_MICRO=5012
export PORT_WORKERS=5018
export PORT_SEARCH=5024

export IMG_USERS_MICRO=243350091275.dkr.ecr.us-east-1.amazonaws.com/squad-poc-talent-clusters-cluster-ecr:squad_poc-users-micro-infra-test.101
export IMG_USERS_SEARCH=243350091275.dkr.ecr.us-east-1.amazonaws.com/squad-poc-talent-clusters-cluster-ecr:squad_poc-users-search-infra-test.101
export IMG_USERS_WORKERS=243350091275.dkr.ecr.us-east-1.amazonaws.com/squad-poc-talent-clusters-cluster-ecr:squad_poc-users-workers-infra-test.101