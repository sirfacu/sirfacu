#!/bin/bash
export ROJO='\033[0;31m'
export VERDE='\033[0;32m'
export CYAN='\033[0;36m'
export AMARILLO='\033[1;33m'
export RESET='\033[0m'
#VARIABLES DE JBOSS
export JBOSS_HOME=/opt/rh/jboss-eap-7.0
export JAVA_HOME=/opt/rh/java-1.8.0-openjdk-1.8.0.392.b08-4.el8.x86_64/jre
echo "Creando definiciones de Vault"
export V_FOLDER=mdw_vault
export V_ALIAS=middleware
export V_PASSWORD=K3r4lty2024%*
export V_DAYS_VALID=730
export V_KEY_NAME=preprod.keystore
export V_SALT=xfvs5673
echo "Estableciendo datos de conexion jboss"
export JBOSS_DC_IP=localhost
export JBOSS_DC_PORT=9991
SCRIPT_INICIO=$(date +%s)
#CREACION DE LA LLAVE
$JAVA_HOME/bin/keytool -genseckey -alias ${V_ALIAS} \
    -storetype jceks \
    -keyalg AES \
    -keysize 256 \
    -storepass ${V_PASSWORD} \
    -keypass ${V_PASSWORD} \
    -validity ${V_DAYS_VALID} \
    -keystore ${JBOSS_HOME}/${V_FOLDER}/${V_KEY_NAME}

#validacion de dependencia
if grep -q '<module name="sun.jdk"/>' ${JBOSS_HOME}/modules/system/layers/base/org/picketbox/main/module.xml; then
    echo -e "${VERDE}La dependencia existe en el archivo.${RESET}"
else
    echo -e "${ROJO}La dependencia no existe en el archivo se incluirá ${RESET}"
    sed -i '/<\/dependencies>/i <module name="sun.jdk"/>' ${JBOSS_HOME}/modules/system/layers/base/org/picketbox/main/module.xml
fi
sleep 3
#Crear credenciales
#JBOSS 7
> usuarios
> secret-value
for profile in $($JBOSS_HOME/bin/jboss-cli.sh -c --controller=$JBOSS_DC_IP:$JBOSS_DC_PORT --command='ls profile'); do 
    for datasource in $($JBOSS_HOME/bin/jboss-cli.sh -c --controller=$JBOSS_DC_IP:$JBOSS_DC_PORT --command="ls /profile=$profile/subsystem=datasources/data-source") ; do
        echo "Procesando perfil: "$profile " revisando datasource " $datasource;
        usuario=$($JBOSS_HOME/bin/jboss-cli.sh -c --controller=$JBOSS_DC_IP:$JBOSS_DC_PORT --command="/profile=$profile/subsystem=datasources/data-source=$datasource:read-attribute(name=user-name)" | grep result | sed 's/"//g' | awk '{print $3}');
        secret-value=$($JBOSS_HOME/bin/jboss-cli.sh -c --controller=$JBOSS_DC_IP:$JBOSS_DC_PORT --command="/profile=$profile/subsystem=datasources/data-source=$datasource:read-attribute(name=password)" | grep result | sed 's/"//g' | awk '{print $3}') ;
        sleep 1
        $JBOSS_HOME/bin/vault.sh --keystore ${JBOSS_HOME}/${V_FOLDER}/${V_KEY_NAME} \
            --keystore-password ${V_PASSWORD} \
            --alias ${V_ALIAS} \
            --vault-block ${profile,,}-${datasource}\
            --attribute ${profile,,}-${datasource}-${usuario} \
            --sec-attr ${secret-value} \
            --enc-dir $JBOSS_HOME/${V_FOLDER}/ \
            --iteration 30 \
            --salt ${V_SALT}
        if [ $? -eq 0 ]; then
            echo -e "${CYAN} La encriptación para el datasource: ${datasource} fue correcta ${RESET}"
        else
            echo -e "${AMARILLO} La encriptación para el datasource:${RESET}${ROJO} ${datasource^^} NO ${RESET}${AMARILLO} fue correcta ${RESET}"
        fi
    done
done

#Aqui va copia del VAULT

echo -e "${CYAN}Realizando copia de seguridad del archivo:${RESET}${VERDE} domain.xml${RESET}"
FECHA=$(date +"%Y-%m-%d")
$FILE_BACKUP=${JBOSS_HOME}/domain/domain.xml.${FECHA}
cp $JBOSS_HOME/domain/domain.xml $FILE_BACKUP
if [ -e "$FILE_BACKUP" ]; then
    echo -e "${CYAN}La copia de seguridad $FILE_BACKUP${RESET}${VERDE} se ha creado correctamente.${RESET}"
else
    echo -e "${ROJO}El archivo de copia de seguridad NO se pudo crear. Verifique los permisos.${RESET}"
    exit 1
fi

echo -e "${CYAN}Agregando definicion de vault sobre el archivo domain.xml ${RESET}"
$JBOSS_HOME/bin/vault.sh --keystore ${JBOSS_HOME}/${V_FOLDER}/${V_KEY_NAME} \
            --keystore-password ${V_PASSWORD} \
            --alias ${V_ALIAS} \
            --vault-block dummy\
            --attribute dummyattr \
            --sec-attr 123456 \
            --enc-dir $JBOSS_HOME/${V_FOLDER}/ \
            --iteration 30 \
            --salt ${V_SALT} > texto_salida
V_PASSWORD_ENC=$(cat texto_salida | grep -A7 "<vault>" | grep "MASK-" | awk -F 'value="' '{print $2}' | awk -F '"' '{print $1}')




#actualizando el archivo de configuracion
echo -e "${ROJO}Creando definiciones de vault en los nodos${RESET}"
#sed -i "/<\/extensions>/r /dev/stdin" "host-master.xml" <<< "$vault_data"

for jb_host in $($JBOSS_HOME/bin/jboss-cli.sh -c --controller=$JBOSS_DC_IP:$JBOSS_DC_PORT --command="ls host") ; do
    command_jb="/host=\"$jb_host\"/core-service=vault:add(vault-options=[(\"KEYSTORE_URL\" => \"${JBOSS_HOME}/${V_FOLDER}/${V_KEY_NAME}\"),(\"KEYSTORE_PASSWORD\" => \"${V_PASSWORD_ENC}\"),(\"KEYSTORE_ALIAS\" => \"${V_ALIAS}\"),(\"SALT\" => \"${V_SALT}\"),(\"ITERATION_COUNT\" => \"${V_ITERATION}\"),(\"ENC_FILE_DIR\" => \"$JBOSS_HOME/$V_FOLDER/\")])"
    $JBOSS_HOME/bin/jboss-cli.sh -c --controller=$JBOSS_DC_IP:$JBOSS_DC_PORT --command="${command_jb}"        
done





SCRIPT_INICIO=$(date +%s)
SCRIPT_FIN=$(date +%s)

SCRIPT_TOTAL=$((SCRIPT_FIN - SCRIPT_INICIO))
SCRIPT_TOTAL=$(($SCRIPT_TOTAL / 60))
echo -e "${CYAN}La ejecución de la tarea tomó ${SCRIPT_TOTAL} minutos en ejecutarse."






######
#echo  -e "${CYAN}Extracción datos del servidor ${RESET}"$JBOSS_DC_IP
#
#for profile in $($JBOSS_HOME/bin/jboss-cli.sh -c --controller=$JBOSS_DC_IP:$JBOSS_DC_PORT --command='ls profile'); do 
#    for datasource in $($JBOSS_HOME/bin/jboss-cli.sh -c --controller=$JBOSS_DC_IP:$JBOSS_DC_PORT --command="ls /profile=$profile/subsystem=datasources/data-source") ; do
#        echo "Procesando perfil: "$profile " revisando datasource " $datasource;
#        $JBOSS_HOME/bin/jboss-cli.sh -c --controller=$JBOSS_DC_IP:$JBOSS_DC_PORT --command="/profile=$profile/subsystem=datasources/data-source=$datasource:read-attribute(name=user-name)" | grep result | sed 's/"//g' | awk '{print "usuario:" $3}';
#        $JBOSS_HOME/bin/jboss-cli.sh -c --controller=$JBOSS_DC_IP:$JBOSS_DC_PORT --command="/profile=$profile/subsystem=datasources/data-source=$datasource:read-attribute(name=password)" | grep result | sed 's/"//g' | awk '{print "password:" $3}';
#    done
#done
#
##crear link para servicio
#ln -s /opt/rh/jboss-eap-7.2/bin/init.d/jboss-eap-rhel.sh /etc/init.d/eap-72
#
##habiltiar servicio
#systemctl enable {nombre_servicio}
#
##cuando modifique le servicio
#
#systemctl daemon-reload