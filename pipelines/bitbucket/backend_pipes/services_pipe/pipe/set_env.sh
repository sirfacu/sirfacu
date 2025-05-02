read -p "Digite el ambiente a probar " ENVIRONMENT
##########################################################################################
# VARIABLES QUE NO SE DEBEN INCLUIR SOLO SON PARA EJECUCION LOCAL
##########################################################################################
# esta variaables ya las continene bitbucket y no requieren agregarse en los repos donde se implemente

export DD_API_KEY=1234567890123 #API KEY de datadog la entrega bitbucket  no cambiar
export AWS_DEFAULT_REGION=us-east-1 # la entrega bitbucket  no cambiar
export BRANCH_NAME=infra-101 #Nombre de la rama la entrega bitbucket no cambiar
export DEV_ECR=ubits-dev-api-ecs-ecr # Variable en bitbucket no configurar en repo
export TEST_ECR=ubits-test-api-ecs-ecr # Variable en bitbucket no configurar en repo
export PROD_ECR=ubits-prod-ecr # Variable en bitbucket no configurar en repo 
export DEV_VAR_APM=true # Variable en bitbucket no configurar en repo
export TEST_VAR_APM=true # Variable en bitbucket no configurar en repo 
export PROD_VAR_APM=true # Variable en bitbucket no configurar en repo
export BITBUCKET_BRANCH=infra-test
export BITBUCKET_BUILD_NUMBER=101

##########################################################################################
# VARIABLES A NIVEL DE REPOSITORIO
##########################################################################################
export APP_NAME=infra # Variable a nivel de repositorio
eval REPO=\${"${ENVIRONMENT^^}"_ECR} #solo para probar local
eval VAR_APM=\${"${ENVIRONMENT^^}"_VAR_APM} #solo para probar local
# Variables de entorno por despliegue del task definition va dentro del environment del task defintion
# todas las variables que se definan en el deployment inciando con ENV_ se agregarán al task definition 
# y seran variables disponibles para la imagen al correr, no deberian ir sino: 
#  ENV_AWS_DEFAULT_REGION y ENV_ENVIRONMENT
#  variables 
# ya que si se requieren otras deberian ser tomadas en tiempo de ejecución desde el parameter store
export  ENV_AWS_DEFAULT_REGION=us-east-1 # Variable a nivel de repo
export  ENV_ENVIRONMENT=${ENVIRONMENT} # Variable a nivel de repo
    ## Variables del task definition
export  TD_ENVIRONMENT=$ENVIRONMENT # Variable a nivel de repo
export  TD_SERVICE_NAME=${ENVIRONMENT}-${APP_NAME} # Variable a nivel de repo
export  TD_LOG_REGION=${AWS_DEFAULT_REGION} # Variable a nivel de repo
export  TD_LOG_GROUP=${ENVIRONMENT}-${APP_NAME}-log # Variable a nivel de repo
export  TD_AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} # Variable a nivel de repo
export  TD_NETWORK_MODE=bridge # Variable en deployment
export  TD_HOST_PORT=0 # Variable en deployment
export  TD_PORT= # Variable en deployment
export  TD_PROTOCOL=tcp # Variable en deployment
export  TD_CLUSTER_COMPATIBILITY=EC2 # Variable en deployment
      # Variables de DATADOG no hay que hacer eval dado que estas el siguiente sed del pipeline:
      # sed -i 's#\"environment\":\ \[\]#'"$(cat vars.sh | sed 's#&#\\&#g')"'#g' taskDefinitionpre.json;
      # se encarga de cambiar a el valor real
export DD_SERVICE=${ENVIRONMENT}-${APP_NAME}
export DD_ENV=${ENVIRONMENT}-xlearning
export DD_AGENT_HOST=datadog-agent
export DD_LOGS_INJECTION=true
export DD_VERSION=1.0.0

##########################################################################################
# VARIABLES A NIVEL DE DESPLIEGUE
##########################################################################################
VAR_APM=false
TD_CPU=1024
TD_MEMORY=512
CLUSTER_NAME=ubits-dev-internal-api-ecs
DOCKER_EXTRA_ARGS=""











