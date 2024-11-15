pulumi init stack infrastructure-lower-envs/back-projects/squad-poc



reemplazos
sed -n '/,$/s/,$//p;=;' archivo.txt | sed 'N;s/\n/ /'

sed -i "5s/.*/    - aws-creds-$TEAM/" $fileConf



edelgado
pass: 
tTqH$4S5v&qZYTwB



users_user_sync --> pass: XB!bCHvIX+uHgjD5


db: bitnami_moodle, db_learning_map, learning_hub, adminhr
host: ubits-prod-xlearning-cluster.cluster-c9maghmfm0zw.us-east-1.rds.amazonaws.com


#reemplazo del swagger  variables en minusculas a mayusculas
while IFS= read -r line; do
  key=$(echo "$line" | awk -F'><' '{print $1}')
  key_uppercase=$(echo "$key" | tr '[:lower:]' '[:upper:]')
  sed -i "s/{$key}/{$key_uppercase}/g" infrastructure/swagger/templates/private-api-template.json
done < keys_json 
#validar coindencias
sum=0
              while IFS= read -r line
                do
                llave=$(echo "$line" | cut -d ">" -f 1)
                numCoincidencias=$(grep -o "{$llave}" infrastructure/swagger/templates/private-api-template.json | wc -l)
                echo -e "$CYAN Coincidencias valor {$llave} son $RESET$ROJO" $numCoincidencias
                sum=$((sum + numCoincidencias))
              done < keys_json
          - echo -e "$CYAN El total de coincidencias previo cambio es:$RESET$ROJO" $sum"$RESET"


https://access.redhat.com/labs/jvmconfig
https://access.redhat.com/labs/jvmconfig/



#crear definicion de threads a eliminar
mysql -u admin -padmin -h 127.0.0.1 -P 6032 -e "SHOW PROCESSLIST" | grep  "user_orgchart"| awk '{print "KILL CONNECTION " $1";"}' > script_kill_user
#conteo de conexiones
mysql -u admin -padmin -h 127.0.0.1 -P 6032 -e "SHOW PROCESSLIST" | grep  "user_orgchart"| wc -l
#ejecucion 
mysql -u admin -padmin -h 127.0.0.1 -P 6032 < script_kill_user

#realizar port-forward
ssh -i ~/.ssh/squad-poc-infra-key.pem -N -L 3306:rds.squad-poc.sandteck.com:3306 ec2-user@bastion.squad-poc.sandteck.com