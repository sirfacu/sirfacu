CREATE DATABASE`360_assessments` /*!40100 DEFAULT CHARACTER SET utf8 */;

SELECT * from mysql.user where `User` in ( 'edelgado')#, 'cmejia','frvargas','jsmoreno','juanh','cvarango') #talent

SELECT a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user as a where `User` in ( 'edelgado'), 'mpedraza','jmontenegro','ofguerrero','jorgem','egarcia', 'jlopez') #core

CREATE USER '4ckamilo'@'%' IDENTIFIED BY 't3mp0123%*' PASSWORD EXPIRE ;
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER ON PLATZIBLOG.* TO '4ckamilo'@'%';

DROP USER 'user_360_assessments';
CREATE USER 'user_360_assessments'@'%' IDENTIFIED BY '3604pPU$3r%*';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER ON 360_assessments.* TO 'user_360_assessments'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'user_360_assessments'@'%';

CREATE USER 'jmontenegro'@'%' IDENTIFIED BY 't3mp0123%*' PASSWORD EXPIRE ;
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'jmontenegro'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'jmontenegro'@'%';

CREATE USER 'ofguerrero'@'%' IDENTIFIED BY 't3mp0123%*' PASSWORD EXPIRE ;
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'ofguerrero'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'ofguerrero'@'%';

CREATE USER 'jorgem'@'%' IDENTIFIED BY 't3mp0123%*' PASSWORD EXPIRE ;
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'jorgem'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'jorgem'@'%';

CREATE USER 'egarcia'@'%' IDENTIFIED BY 't3mp0123%*' PASSWORD EXPIRE ;
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON bitnami_moodle.* TO 'egarcia'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON adminhr.* TO 'egarcia'@'%';

CREATE USER 'jlopez'@'%' IDENTIFIED BY 't3mp0123%*' PASSWORD EXPIRE ;
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON bitnami_moodle.* TO 'jlopez'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON adminhr.* TO 'jlopez'@'%';

DROP USER 'wmosquera'@'%';
DROP USER 'mpedraza'@'%';
DROP USER 'jmontenegro'@'%';
DROP USER 'ofguerrero'@'%';
DROP USER 'jorgem'@'%';
DROP USER 'egarcia'@'%';
DROP USER 'jlopez'@'%';

SELECT * FROM information_schema.USER_PRIVILEGES
WHERE GRANTEE like '%wmosquera%'
or GRANTEE like  '%mpedraza%'
or GRANTEE like  '%jmontenegro%'
or GRANTEE like '%ofguerrero%'
or GRANTEE like '%jorgem%'
or GRANTEE like '%egarcia%'
or GRANTEE like '%jlopez%'

DROP USER 'user_intranalytics'@'%';

SELECT * from mysql.user as a where `User` like '%analytics%' 
SELECT  a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user as a WHERE `User` like '%analytics%' IN ( 'mcerpa', 'andrescramirez','laguilar','vjuspian','jpolanco','mrodriguez', 'user_intranalytics') #core
SELECT  a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user as a WHERE `User` IN ( 'juhoyos', 'jsmoreno','scbustos','cmejia','bssaldarriaga','crrincon', 'juanh') #talent

CREATE USER 'jpolanco'@'%' IDENTIFIED BY 'Ub1T$D3v2024%*';
CREATE USER 'user_intranalytics_pipe'@'%' IDENTIFIED BY '4pPU$3rD3v2024%*';

GRANT SELECT, INSERT, UPDATE, DELETE ON learning_hub.* TO 'jpolanco'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'jpolanco'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'jpolanco'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON talentdb.* TO 'jpolanco'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON learning_hub.* TO 'user_intranalytics_pipe'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'user_intranalytics_pipe'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'user_intranalytics_pipe'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON talentdb.* TO 'user_intranalytics_pipe'@'%';

---- MONGO -----

db.createUser({user: 'mcerpa' , pwd: 'Ub1T$2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});
db.createUser({user: 'andrescramirez' , pwd: 'Ub1T$2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});
db.createUser({user: 'laguilar' , pwd: 'Ub1T$2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});
db.createUser({user: 'jpolanco' , pwd: 'Ub1T$2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});
db.createUser({user: 'vjuspian' , pwd: 'Ub1T$2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});
db.createUser({user: 'mrodriguez' , pwd: 'Ub1T$2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});
db.createUser({user: 'user_developer' , pwd: 'Ub1T$2024%*' , roles:[{role: 'read', db: 'centralization'}]});

DROP USER 'vjuspian'@'%';
CREATE USER 'vjuspian'@'%' IDENTIFIED BY 'VdNdxM99)lqVbjen';
GRANT SELECT, INSERT, UPDATE ON learning_hub.* TO 'vjuspian'@'%';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'vjuspian'@'%';
GRANT SELECT, INSERT, UPDATE ON bitnami_moodle.* TO 'vjuspian'@'%';
GRANT SELECT, INSERT, UPDATE ON talentdb.* TO 'vjuspian'@'%';
GRANT SELECT, INSERT, UPDATE ON learning_hub.* TO 'vjuspian'@'%';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'vjuspian'@'%';
GRANT SELECT, INSERT, UPDATE ON bitnami_moodle.* TO 'vjuspian'@'%';

#PTT-25
CREATE DATABASE `goals` /*!40100 DEFAULT CHARACTER SET utf8 */;

SELECT a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user as a where `User` in ( 'juhoyos', 'jsmoreno','scbustos','cmejia','bssaldarriaga','crrincon', 'juanh'); #talent

CREATE USER 'juhoyos'@'%' IDENTIFIED BY 'Ub1T$2024%*';
CREATE USER 'user_goalsapp'@'%' IDENTIFIED BY 'Ub1T$D3v2024%*';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'user_goalsapp'@'%';
CREATE USER 'bssaldarriaga'@'%' IDENTIFIED BY 'Ub1T$2024%*';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'juhoyos'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'jsmoreno'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'scbustos'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'cmejia'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'bssaldarriaga'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'crrincon'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'juanh'@'%';

DROP USER 'juhoyos'@'%'
CREATE USER 'juhoyos'@'%' IDENTIFIED BY 'Ub1T$2024%*';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'juhoyos'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'juhoyos'@'%';

SELECT a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user; 

DROP USER 'user_goals'@'%';

CREATE USER 'user_goals'@'%' IDENTIFIED BY 'Ub1T$D3v2024%*';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'user_goalsapp'@'%';
GRANT SELECT ON adminhr.* TO 'user_goalsapp'@'%';
GRANT DROP ON goals.* TO 'user_goalsapp'@'%';
GRANT DROP ON goals.* TO 'juhoyos'@'%';

GRANT CREATE,REFERENCES on goals.* TO 'user_goals'@'%';

DROP USER 'edelgado'@'%'
CREATE USER 'edelgado'@'%' IDENTIFIED BY 'Ub1T$D3v2024%*';
GRANT CREATE,REFERENCES, SELECT, INSERT, UPDATE ON 360_assessments.* TO 'edelgado'@'%';
GRANT CREATE,REFERENCES, SELECT, INSERT, UPDATE ON adminhr.* TO 'edelgado'@'%';
GRANT CREATE,REFERENCES, SELECT, INSERT, UPDATE ON bitnami_moodle.* TO 'edelgado'@'%';
GRANT CREATE,REFERENCES, SELECT, INSERT, UPDATE ON goals.* TO 'edelgado'@'%';
GRANT CREATE,REFERENCES, SELECT, INSERT, UPDATE ON learning_hub.* TO 'edelgado'@'%';
GRANT CREATE,REFERENCES, SELECT, INSERT, UPDATE ON learning_map_dev.* TO 'edelgado'@'%';

ALTER USER 'edelgado'@'%' IDENTIFIED BY  'Ub1T$2024%*';

## e5mHY156H\u0026E3JmL
------ PC-458

ALTER USER 'user_users_sync'@'%' IDENTIFIED BY 'e5mHY156H&E3IwK';
SELECT `User` , authentication_string   from mysql.user where `User` in (  'user_users_sync' );
GRANT CREATE,REFERENCES, SELECT, INSERT, UPDATE ON adminhr.* TO 'user_users_sync'@'%';
GRANT CREATE,REFERENCES, SELECT, INSERT, UPDATE ON bitnami_moodle.* TO 'user_users_sync'@'%';

------------
-- para mysql 

CREATE USER 'user_auth0'@'%' IDENTIFIED BY 'GK>>qGDLRem1VKyocujVLK0';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'user_users_auth0'@'%';

-- para proxysql
Para crear usuarios de aplicación en proxysql primero deben ser creados sobre la base de datos RDS 

CREATE USER 'user_NOMBRE_USUARIO'@'%' IDENTIFIED BY 'CLAVE_A_ASIGNAR';
GRANT CREATE, SELECT, INSERT, UPDATE, REFERENCES ON BD_ACCESO_SOLICITADO.* TO 'user_NOMBRE_USUARIO'@'%';

NOMBRE_USUARIO = Es el nombre del usuario que deben entregar los solicitantes
CLAVE_A_ASIGNAR = asignarle una clave 

Luego validar usando el siguiente query el hash de la clave en la RDS
select `User` , authentication_string   from mysql.user where `User` in (  'user_NOMBRE_USUARIO' );


Una vez se tengan estos datos se procederá a ingresar a cada una de las instancias de proxysql usando SSM, luego ejecutamos el siguiente comando para 
conectarnos a la Base de datos

mysql -u admin -padmin -h 127.0.0.1 -P6032 --prompt='Admin>'

ejecutar el query para validar que el usuario no existe en el PROXYSQL:

Admin> select * from mysql_users where username = 'usuario_a_agregar';

Ejecutar el siguiente query para insertar el usuario; 

authentication_string -> Es el hash de clave que genera mysql

INSERT INTO mysql_users(username,default_hostgroup, password, default_schema , max_connections) VALUES ('usuario_a_agregar',0,'authentication_string', '', 500);
LOAD MYSQL USERS TO RUNTIME;
SAVE MYSQL USERS TO DISK;
 
Validamos que se haya creado 

Admin> select username, password, active  from mysql.users where username = 'user_centralization';
+---------------------+-------------------------------------------+--------+
| username            | password                                  | active |
+---------------------+-------------------------------------------+--------+
| user_centralization | *100CA05F641EC836EC565311F7E21235DCAF635F | 1      |
+---------------------+-------------------------------------------+--------+
1 row in set (0.00 sec)



{ username = "usuario_a_agregar" , password = "authentication_string" , default_hostgroup = 0 , active = 1, max_connections=500 }

ej:
  { username = "user_centralization" , password = "*100CA05F641EC836EC565311F7E21235DCAF635F" , default_hostgroup = 0 , active = 1, max_connections=500 }

  salimos del motor ejecutando el comando 
  exit
  
Luego tomamos el backup del siguiente archivo  ejecutando estas lineas

export fechaEjecucion=$(date +"%Y-%m-%d-%H-%M-%S") 
sudo cp  /etc/proxysql.cnf /etc/proxysql.cnf-bkp-$fechaEjecucion

abrimos el archivo 

sudo vi /etc/proxysql.cnf

y buscamos la sección 

mysql_users: 

y vamos al final de la linea y agregamos una coma (,) en el registro inmediatamente anterior, luego agregamos la nuestra que NO quede con el coma al final

ej:
mysql_users: {
	.
	.
	.
  { username = "ultima_linea" , password = "password_ultima_linea" , default_hostgroup = 0 , active = 1, max_connections=500 },
  { username = "user_centralization" , password = "*811CA05F641EC836EC565311F7E2345DCAF635FA" , default_hostgroup = 0 , active = 1, max_connections=500 }

Guardamos y listo ya debio haber quedado el cambio completado


------ PC-458
DROP USER 'user_users-sync';

CREATE USER 'user_users_sync'@'%' IDENTIFIED BY 'AO=Ei6pGEt5Q';

GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'user_users_sync'@'%';
GRANT SELECT, INSERT, UPDATE ON bitnami_moodle.* TO 'user_users_sync'@'%';

SELECT `User` , authentication_string from mysql.user where `User` in (  'user_users_sync' )

SELECT a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked  
SELECT `User` , authentication_string from mysql.user where `User` in (  'user_users-sync' )

UPDATE mysql_users SET password='*C5386E368F9719F26A3764FED7156C5C5FB54C13' WHERE username= 'user_users-sync';
UPDATE mysql_users SET username='user_users_sync' WHERE username= 'user_users-sync';

{ username = "user_users-sync" , password = "*C5386E368F9719F26A3764FED7156C5C5FB54C13" , default_hostgroup = 0 , active = 1, max_connections=500 }

CREATE DATABASE `goals` /*!40100 DEFAULT CHARACTER SET utf8 */;

------------------------
DROP USER datastream;

CREATE USER 'datastream'@'%' IDENTIFIED BY '8UiUV3ZqNqxsiZQiUC3L';

GRANT, SELECT, RELOAD, REPLICATION SLAVE, REPLICATION CLIENT, Lock Tables, Execute ON *.* TO 'datastream'@'%';
FLUSH PRIVILEGES;

GRANT ALTER ON goals.user_has_cycle TO 'user_goals'@'%';
GRANT DELETE ON goals.user_has_cycle TO 'user_goals'@'%';
ALTER TABLE company MODIFY COLUMN name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL;

--------------- proxysql

SHOW VARIABLES LIKE 'mysql-connect_timeout_server';
SELECT hostgroup, status, ConnERR, Queries, Latency_ms from stats_mysql_connection_pool;
SET mysql-connect_timeout_server=9000;
LOAD MYSQL VARIABLES TO RUNTIME;
SAVE MYSQL VARIABLES TO DISK;



----- PTT-553
drop user user_management;
CREATE USER 'user_management'@'%' IDENTIFIED BY 'GKqGDLRem1VKyocujVLK0';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'user_management'@'%';


select `User` , authentication_string   from mysql.user where `User` in (  'user_management' );

*369015F9D72DF914AAC6E53A6E512A1F13712C62

usuario user_management prodzb%VLjP2H27Kx&bYcopielo pa borrarlo por fa

*BCEEA4AA102745746F3C28E54445C20372B5171A


----- IN-683
GRANT SELECT ON goals.* TO 'jpolanco'@'%';
GRANT SELECT ON goals.* TO 'mrodriguez'@'%';



------ 

GRANT SELECT ON adminhr.* TO 'kdromero'@'%';



--- IN-741

GRANT DELETE ON adminhr.ubits_user_role TO 'user_management'@'%';
GRANT DELETE ON adminhr.ubits_user_auth0_role TO 'user_management'@'%';



----IN-833

GRANT SELECT, INSERT, UPDATE ON goals.* TO 'scbustos'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'jsmoreno'@'%';






