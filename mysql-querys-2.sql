
# en AWS nos permite validar si el cache de la RDS esta bien usado o hay que hacer ajustes,, recordar que las rds usan cache para no aumentar consumo  de disco
# es importante analizar esto.

SHOW ENGINE INNODB STATUS;


--- validar que usuarios hayan sido creados y que la password les pida cambio en primer login
select Host, User, password_expired , password_last_changed  from mysql.user
where `User` in ( 'kdromero', 'cmejia','frvargas','jsmoreno','juanh','cvarango')


mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo --databases goals 360_assessments talentdb -p --no-create-info --skip-comments --skip-set-charset --skip-add-drop-table --skip-add-locks > backup.sql
--- estructura
mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo --databases goals 360_assessments talentdb -p --skip-comments --skip-set-charset --no-data  > estructuras.sql
mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo --databases goals -p --skip-comments --skip-set-charset --no-data --set-gtid-purged=OFF > estr-goals.sql
mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo --databases talentdb -p --skip-comments --skip-set-charset --no-data --set-gtid-purged=OFF > estr-talentdb.sql
mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo --databases 360_assessments -p --skip-comments --skip-set-charset --no-data --set-gtid-purged=OFF > estr-360_assessments.sql
--- data
mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo -p --databases goals --skip-comments --skip-set-charset --no-create-db  --set-gtid-purged=OFF > data-goals.sql
mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo -p --databases talentdb --skip-comments --skip-set-charset --no-create-db  --set-gtid-purged=OFF > data-talentdb.sql
mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo -p --databases 360_assessments --skip-comments --skip-set-charset --no-create-db  --set-gtid-purged=OFF > data-360_assessments.sql
--- sacar backup tabla mysql.user-P 
mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo -p --where="User NOT IN ('mysql.sys', 'root', 'rdsadmin', 'AWS_BEDROCK_ACCESS','AWS_COMPREHEND_ACCESS','AWS_LAMBDA_ACCESS','AWS_LOAD_S3_ACCESS','AWS_SAGEMAKER_ACCESS','AWS_SELECT_S3_ACCESS','AWS_SELECT_S3_ACCESS')" mysql user > backup_mysql_user.sql

--- Restauracion
mysql -h HOST_DESTINO_REESTABLECER -u USUARIO_DB-p  < archivo.sql
mysql -h test-db-cluster-upgrade-cluster.cluster-cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u moodle_dev_admin -p  < backup_mysql_user.sql
--- Estructura
mysql -h test-db-cluster-upgrade-cluster.cluster-cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u moodle_dev_admin -p  < estr-goals.sql
mysql -h test-db-cluster-upgrade-cluster.cluster-cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u moodle_dev_admin -p  < estr-talentdb.sql
mysql -h test-db-cluster-upgrade-cluster.cluster-cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u moodle_dev_admin -p  < estr-360_assessments.sql
--- Data
mysql -h test-db-cluster-upgrade-cluster.cluster-cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u moodle_dev_admin -p  < data-goals.sql
mysql -h test-db-cluster-upgrade-cluster.cluster-cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u moodle_dev_admin -p  < data-talentdb.sql
mysql -h test-db-cluster-upgrade-cluster.cluster-cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u moodle_dev_admin -p  < data-360_assessments.sql



GRANT ALL PRIVILEGES ON mysql.* TO 'moodle_dev_admin'@'%';




