--- validar que usuarios hayan sido creados y que la password les pida cambio en primer login
select Host, User, password_expired , password_last_changed  from mysql.user
where `User` in ( 'kdromero', 'cmejia','frvargas','jsmoreno','juanh','cvarango')

ALTER USER 'kdromero'@'%' PASSWORD EXPIRE;
ALTER USER 'cmejia'@'%' PASSWORD EXPIRE;
ALTER USER 'frvargas'@'%' PASSWORD EXPIRE;
ALTER USER 'jsmoreno'@'%' PASSWORD EXPIRE;
ALTER USER 'juanh'@'%' PASSWORD EXPIRE;
ALTER USER 'cvarango'@'%' PASSWORD EXPIRE;

ALTER USER 'frvargas'@'%' IDENTIFIED BY 't3mPo123%*';
ALTER USER 'jsmoreno'@'%' IDENTIFIED BY 't3mPo123%*';
ALTER USER 'juanh'@'%' IDENTIFIED BY 't3mPo123%*';
ALTER USER 'cvarango'@'%' IDENTIFIED BY 't3mPo123%*';
ALTER USER 'kdromero'@'%' IDENTIFIED BY 't3mPo123%*';
ALTER USER 'cmejia'@'%' IDENTIFIED BY 't3mPo123%*';

-- todos los demas usuarios:liW+-o0SJqDl28g+
-- admin: ufTZG4VcB2pGesB8
-- backup de solo data
mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo --databases goals 360_assessments talentdb -p --no-create-info --skip-comments --skip-set-charset --skip-add-drop-table --skip-add-locks > backup.sql
--- estructura
mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo --databases goals 360_assessments talentdb -p --skip-comments --skip-set-charset --no-data  > estructuras.sql
--- data
mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo --databases goals 360_assessments talentdb -p --skip-comments --skip-set-charset --no-create-db  >> estructuras.sql
--- sacar backup tabla mysql.user
mysqldump -h test-manual-upgrade-from-prod.cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u macarrillo -p --where="User NOT IN ('mysql.sys', 'root', 'rdsadmin', 'AWS_BEDROCK_ACCESS','AWS_COMPREHEND_ACCESS','AWS_LAMBDA_ACCESS','AWS_LOAD_S3_ACCESS','AWS_SAGEMAKER_ACCESS','AWS_SELECT_S3_ACCESS','AWS_SELECT_S3_ACCESS')" mysql user > backup_mysql_user.sql

---restauracion
mysql -h HOST_DESTINO_REESTABLECER -u USUARIO_DB-p  < archivo.sql
mysql -h test-db-cluster-upgrade-cluster.cluster-cjqpovg6bsbu.us-east-1.rds.amazonaws.com -u moodle_dev_admin -p  < backup_mysql_user.sql

GRANT ALL PRIVILEGES ON mysql.* TO 'moodle_dev_admin'@'%';


{"vpc_id":"vpc-018a67ed2f2b7abcc","subnets_data":["subnet-0df2943ef4a15fcd8","subnet-09305c5a5b77a54b0"],"subnets_app":["subnet-0a2901b9df6b6846f","subnet-0134f85cfb4ecd7b1"],"subnets_public":["subnet-0c8143c08ed2a0184","subnet-063f1bb422efdbe4d"],"account_id":"123456789","region":"us-east-1"}