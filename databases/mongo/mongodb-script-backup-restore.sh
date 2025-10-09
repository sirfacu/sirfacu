#!/bin/bash
# 1. para instalar la llave del repo
#sudo apt-get install -y gnupg curl
#curl -fsSL https://pgp.mongodb.com/server-7.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor


# 2. Instalacion mongo
#https://repo.mongodb.org/apt/debian/dists/buster/mongodb-org/4.4/main/binary-amd64/
#
#wget https://repo.mongodb.org/apt/debian/dists/buster/mongodb-org/4.4/main/binary-amd64/mongodb-mongosh_2.5.0_amd64.deb
#sudo apt install ./mongodb-mongosh_*_amd64.deb
#rm mongodb-mongosh_*_amd64.deb


# 2. Crear el archivo de lista para MongoDB
#echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
#sudo apt-get update
#sudo apt-get install -y mongodb-database-tools awscli

#####
# las partes en verde que se comentarearon son porq es para usar otro método este como se requiere full se usa el mongodump y restore
# pero si se quiere cambiar para sacar algunas colecciones o bd especificas usar el otro método
#
export RESET='\033[0m'
export CYAN='\033[36m'
export ROJO='\033[31m'
export AMARILLO='\033[33m'
export VERDE='\033[32m'
export NEGRO='\033[30m'

# para export
#export MONGO_PORT=27017
#export MONGO_HOST="lms-docdb.rds.ubitslearning.com"
#export MONGO_USER=user_lms_document
#export MONGO_PWD=tnCTpGN1Q3GeL6P5D0mb

#para import
export MONGO_PORT=27017
export MONGO_HOST="lms-docdb.rds.test.sandteck.com"
export MONGO_USER=ubitsadmin
export MONGO_PWD="M1L0(4lPwD%*"


echo -e $CYAN"Seleccione una operación:"$RESET
echo -e $ROJO"1) Exportar datos de la BD"$RESET
echo -e $VERDE"2) Importar datos (mongoimport)"$RESET
read -p "Opción (1/2): " OPCION



TMP_FOLDER=dumps
FECHA_BACKUP=$(date +"%Y-%mFIbTh3YKee47XGUR%d")
FECHA_EXEC=$(date +"%Y-%m-%d %H:%M")
echo "INICIO: "$FECHA_EXEC >> script.log
if [ -d "$TMP_FOLDER" ]; then
    echo "carpeta temporal existente"
else
    echo "Creando carpeta temporal "$TMP_FOLDER
    mkdir -p $TMP_FOLDER
fi

DB=$(mongosh --host $MONGO_HOST:$MONGO_PORT --username $MONGO_USER -p $MONGO_PWD --authenticationDatabase admin --quiet --eval "db.adminCommand('listDatabases').databases.map(d => d.name).join(' ')" | sed 's/\[//;s/\]//;s/\"//g')
case $OPCION in
  1)
    for DB_NAME in $DB; do
        echo -e "Procesando Base de datos "$VERDE$DB_NAME$RESET
        mongodump --host $MONGO_HOST:$MONGO_PORT --username $MONGO_USER -p $MONGO_PWD --authenticationDatabase admin --db $DB_NAME --readPreference secondaryPreferred --out $TMP_FOLDER
        #mongoexport --host $MONGO_HOST:$MONGO_PORT --username $MONGO_USER -p $MONGO_PWD --authenticationDatabase admin --db $DB_NAME --collection $COLLECTION --out $TMP_FOLDER/$DB_NAME-$COLLECTION-export.json
    done
    aws s3 cp $TMP_FOLDER s3://ubits-prod-bills/temporary/
    ;;
  2)
    aws s3 cp s3://ubits-prod-bills/temporary/ $TMP_FOLDER/ --recursive
    echo -e "El script buscara en la ruta $CYAN$TMP_FOLDER$RESET el archivo"
    if [ -n "$(find "$TMP_FOLDER" -maxdepth 1 -type f -print -quit)" ]; then
        #DATABASES=$(ls $TMP_FOLDER | awk -F- '{print $1}'| sort -u)
        #for DB_NAME in $DATABASES; do 
        #    BACKUP_FILES=$(ls $TMP_FOLDER | grep $DB_NAME)
        #    for FILES in $BACKUP_FILES; do 
        #        COLLECTION=$(echo $FILES | grep $DB_NAME |awk -F- '{print $2}')
        #        echo -e "Importacion Base de Datos:"$CYAN$DB_NAME$RESET" coleccion "$ROJO$COLLECTION$RESET
        #        #mongoimport --host $MONGO_HOST:$MONGO_PORT --username $MONGO_USER --password $MONGO_PWD --authenticationDatabase admin --db $DB_NAME  --collection $COLLECTION --file $TMP_FOLDER/$FILES
        #        mongoimport --host $MONGO_HOST:$MONGO_PORT --username $MONGO_USER --password $MONGO_PWD --authenticationDatabase admin --db $DB_NAME  --collection $COLLECTION --file $TMP_FOLDER/$FILES
        #    done
        #done
        for dir in $TMP_FOLDER; do 
            mongorestore --host $MONGO_HOST:$MONGO_PORT --username $MONGO_USER --password $MONGO_PWD --authenticationDatabase admin --dir "$TMP_FOLDER" 
        done

    else
        echo "El directorio está vacío o no contiene archivos para restaurar"
    fi
    ;;
esac

FECHA_EXEC=$(date +"%Y-%m-%d %H:%M")
echo "FIN: "$FECHA_EXEC >> script.log