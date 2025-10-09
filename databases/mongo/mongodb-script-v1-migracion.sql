mongo -u root -p $PWD_DB --eval 'db = db.getSiblingDB("centralization"); db.getUsers()' > users-dbs-centralization.js
db.getCollectionNames()
#listar la BD
DB=$(mongo -u root -p $PWD_DB --quiet --eval "db.adminCommand('listDatabases').databases.map(d => d.name).join(',')" | sed 's/\[//;s/\]//;s/\"//g')


#### script para importar/exporta las colecciones
TMP_FOLDER=tempo
if [ -d "$TMP_FOLDER" ]; then
    echo "carpeta temporal existente"
else
    echo "Creando carpeta temporal "$TMP_FOLDER
    mkdir -p tempo/exports
fi

DB=$(mongo -u root -p $PWD_DB --quiet --eval "db.adminCommand('listDatabases').databases.map(d => d.name).join(' ')" | sed 's/\[//;s/\]//;s/\"//g')

for DB_NAME in $DB; do 
    echo "Procesando Base de datos "$DB_NAME
    query=$(echo "mongo -u root -p $PWD_DB --quiet --eval 'db = db.getSiblingDB(\"${DB_NAME}\"); db.getCollectionNames()'");  
    eval $query > $TMP_FOLDER/$DB_NAME-collections.log; 
    sed -i 's/[][]//g; s/[",]//g'  $TMP_FOLDER/$DB_NAME-collections.log;
    COLLECS=$(cat $TMP_FOLDER/$DB_NAME-collections.log);
    echo -e "Archivo \n" $(cat $TMP_FOLDER/$DB_NAME-collections.log) "\nVariable n"$COLLECS;
    echo "EN LA COLECCION ES "$COLLECS
    for COLLECTION in $COLLECS; do 
        echo -e "Procesando coleccion "$COLLECTION  " en la BD \n"$DB_NAME
        mongoexport -u root -p $PWD_DB --authenticationDatabase admin --db $DB_NAME --collection $COLLECTION --out $TMP_FOLDER/exports/$DB_NAME-$COLLECTION-export.json
    done
done

cd $TMP_FOLDER

db= db.getSiblingDB("admin"); db.createUser({user: "user_lms_creator",pwd: "P6Fw9I5yU9QG",roles: [{ role: "readWrite", db: "lms_logs"}]);
db= db.getSiblingDB("admin"); db.createUser({user: "user_notifications_manager",pwd: "P5Jhj13j11Xe",roles: [{ role: "readWrite", db: "notifications_manage"}]);


mongosh --host $MONGO_HOST:$MONGO_PORT --username $MONGO_USER -p $MONGO_PWD --authenticationDatabase admin 

export MONGO_PORT=27017
export MONGO_HOST="lms-docdb.rds.test.sandteck.com"
export MONGO_USER=ubitsadmin
export MONGO_PWD="SEC_STUDENT_METRICS_PWD"


ubitsadmin

