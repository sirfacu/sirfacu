Para la implementacion de este pipeline seguir la documentacion en:

https://ubits-dev.atlassian.net/wiki/spaces/IS/pages/3104800771/Multi+Servicios+-+Pipeline


Para ejecutar con dependencias de librerias del artifact de ubits agregar lo siguiente:

**Agregar step de autenticación**
- step: &get-token
        name: Creacion Token de Autenticación de codeArtifact
        clone:
          enabled: false
        script:
          - export AWS_ACCESS_KEY_ID=${DEV_AWS_ACCESS_KEY_ID}
          - export AWS_SECRET_ACCESS_KEY=${DEV_AWS_SECRET_ACCESS_KEY}
          - export AWS_DEFAULT_REGION=${DEV_AWS_DEFAULT_REGION}
          - echo CODEARTIFACT_AUTH_TOKEN=$(aws codeartifact get-authorization-token --domain ${CODEARTIFACT_DOMAIN} --domain-owner ${CODEARTIFACT_DOMAIN_OWNER} --query authorizationToken --output text) >> set_env.sh
        artifacts:
          - set_env.sh

**Agregar línea de login en el codeartifact antes de ejecutar npm install**

- npm config set registry=https://${CODEARTIFACT_DOMAIN}-${CODEARTIFACT_DOMAIN_OWNER}.d.codeartifact.${CODEARTIFACT_AWS_DEFAULT_REGION}.amazonaws.com/npm/${CODEARTIFACT_NODE_REPOSITORY}/
- npm config set //${CODEARTIFACT_DOMAIN}-${CODEARTIFACT_DOMAIN_OWNER}.d.codeartifact.${CODEARTIFACT_AWS_DEFAULT_REGION}.amazonaws.com/npm/${CODEARTIFACT_NODE_REPOSITORY}/:_authToken=${CODEARTIFACT_AUTH_TOKEN}