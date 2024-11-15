ALTER USER macarrillo IDENTIFIED BY "$1rF4(u%*";
select * from bitnami_moodle.mdl_assign

env-analytics-daily-scripts


select a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user as a where `User` in ( 'mcerpa', 'andrescramirez','laguilar','vjuspian','jpolanco','mrodriguez', 'user_intranalytics') #core

select * from mysql.user as a where `User` like '%analytics%' 
in ( 'mcerpa', 'andrescramirez','laguilar','vjuspian','jpolanco','mrodriguez', 'user_intranalytics') #core

ALTER USER 'analytics_pipeline'@'%' IDENTIFIED BY '';

CREATE USER 'jpolanco'@'%' IDENTIFIED BY 'Ub1T$2024%*';
CREATE USER 'analytics_pipeline'@'%' IDENTIFIED BY '4pPU$3r2024%*';

GRANT SELECT, INSERT, UPDATE, DELETE ON learning_hub.* TO 'jpolanco'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'jpolanco'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'jpolanco'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON talentdb.* TO 'jpolanco'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON learning_hub.* TO 'analytics_pipeline'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'analytics_pipeline'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'analytics_pipeline'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON talentdb.* TO 'analytics_pipeline'@'%';



CREATE USER 'vjuspian'@'%' IDENTIFIED BY 'Vju$p14n2024%*';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'user_orgchart'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'wmosquera'@'%';


CREATE USER 'mpedraza'@'%' IDENTIFIED BY 't3mp0123%*' PASSWORD EXPIRE ;
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'mpedraza'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'mpedraza'@'%';

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
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'egarcia'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'egarcia'@'%';


CREATE USER 'jlopez'@'%' IDENTIFIED BY 't3mp0123%*' PASSWORD EXPIRE ;
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'jlopez'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'jlopez'@'%';
FLUSH PRIVILEGES;

drop user 'analytics_pipeline'@'%';
drop user 'mpedraza'@'%';
drop user 'jmontenegro'@'%';
drop user 'ofguerrero'@'%';
drop user 'jorgem'@'%';
drop user 'egarcia'@'%';
drop user 'jlopez'@'%';


select a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked  from mysql.user as a where a.`User`  like '%org%'




db.createUser({user: "vjuspian",pwd: "Ub1t$2024%*",roles:[{role: "readWrite", db: "centralization"}]});


----- PTT-25
CREATE USER 'user_goals'@'%' IDENTIFIED BY 'Ub1T$T3st2024%*';
GRANT SELECT, INSERT, UPDATE, ALTER, REFERENCES, DELETE on goals.* TO 'user_goals'@'%';
GRANT SELECT ON adminhr.* TO 'user_goals'@'%';
CREATE DATABASE `goals` /*!40100 DEFAULT CHARACTER SET utf8 */;

select  a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user as a where `User` 
in ( 'juhoyos', 'jsmoreno','scbustos','cmejia','bsaldarriaga','crrincon', 'juanh') #talent


drop user 'juanh'@'%'

CREATE USER 'juhoyos'@'%' IDENTIFIED BY 'Ub1T$2024%*';
CREATE USER 'jsmoreno'@'%' IDENTIFIED BY 'Ub1T$2024%*';
CREATE USER 'cmejia'@'%' IDENTIFIED BY 'Ub1T$2024%*';
CREATE USER 'bsaldarriaga'@'%' IDENTIFIED BY 'Ub1T$2024%*';
CREATE USER 'juanh'@'%' IDENTIFIED BY 'Ub1T$2024%*';

drop user 'juhoyos'@'%'
CREATE USER 'juhoyos'@'%' IDENTIFIED BY 'Ub1T$2024%*';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'juanh'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'juanh'@'%';

GRANT SELECT, INSERT, UPDATE ON .* TO 'juhoyos'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'jsmoreno'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'scbustos'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'cmejia'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'bsaldarriaga'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'crrincon'@'%';
GRANT DROP ON goals.* TO 'juhoyos'@'%';


drop user 'user_goals'@'%'
CREATE USER 'user_goals'@'%' IDENTIFIED BY 'Ub1T$T3st2024%*';
GRANT SELECT, INSERT, UPDATE, ALTER, REFERENCES, DELETE on goals.* TO 'user_goals'@'%';
GRANT SELECT ON adminhr.* TO 'user_goals'@'%';
GRANT DROP ON goals.* TO 'user_goalsapp'@'%';


select a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked  , a.authentication_string 
from mysql.user as a
where `User` in ( 'user_goals')


ALTER USER 'user_goals'@'%' IDENTIFIED BY 'Ub1T$T3st2024%*'; 


select * from mysql.user where user = 'user_users_sync';
select `User` , authentication_string   from mysql.user where `User` in (  'user_goals' );

INSERT INTO mysql_users(username,default_hostgroup, password, default_schema , max_connections) VALUES ('user_goals',0,'*12D029BBF64B1416316605A213F16FD00FFC08B3', '', 500);
LOAD MYSQL USERS TO RUNTIME;
SAVE MYSQL USERS TO DISK;


drop user 'edelgado'@'%'
CREATE USER 'edelgado'@'%' IDENTIFIED BY 'Ub1T$TeSt2024%*';
GRANT SELECT, INSERT, UPDATE ON 360_assessments.* TO 'edelgado'@'%';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'edelgado'@'%';
GRANT SELECT, INSERT, UPDATE ON bitnami_moodle.* TO 'edelgado'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'edelgado'@'%';
GRANT SELECT, INSERT, UPDATE ON learning_hub.* TO 'edelgado'@'%';
GRANT SELECT, INSERT, UPDATE ON learning_map_test.* TO 'edelgado'@'%';
ALTER USER 'edelgado'@'%' IDENTIFIED BY  'Ub1T$2024%*'

  
-------------- PC-458
------ PC-458
drop user 'user_users-sync';
CREATE USER 'user_users_sync'@'%' IDENTIFIED BY 'AO=Ei6pGEt5Q';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'user_users_sync'@'%';
GRANT SELECT, INSERT, UPDATE ON bitnami_moodle.* TO 'user_users_sync'@'%';
select `User` , authentication_string  from mysql.user where `User` in (  'user_users_sync' )

 
select a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked  

select `User` , authentication_string  
 from mysql.user
where `User` in (  'user_users-sync' )



UPDATE mysql_users SET password='*24638A82EFAD31B2783FA10870DD87DE5D6D4F72' WHERE username= 'user_users_sync';

{ username = "user_users-sync" , password = "*24638A82EFAD31B2783FA10870DD87DE5D6D4F72" , default_hostgroup = 0 , active = 1, max_connections=500 }


INSERT INTO mysql_users(username,default_hostgroup, password, default_schema , max_connections) VALUES ('user_users_sync',0,'*24638A82EFAD31B2783FA10870DD87DE5D6D4F72', '', 500);

ELETE ON adminhr.* TO 'user_goals'@'%';
GRANT DELETE ON goals.* TO 'user_goals'@'%';


----- PTT-553
DROP USER 'user_auth0'
CREATE USER 'user_auth0'@'%' IDENTIFIED BY '46McC?hRsPaN7Tjh50p+95';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'user_auth0'@'%';

CREATE USER 'user_management'@'%' IDENTIFIED BY '46McC?hRsPaN7Tjh50p+95';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'user_management'@'%';


select `User` , authentication_string   from mysql.user where `User` in (  'user_management' );

*2F3B971A3971D99B24BBDC01D68F7427774DA6AB
*2F3B971A3971D99B24BBDC01D68F7427774DA6AB


INSERT INTO mysql_users(username,default_hostgroup, password, default_schema , max_connections) VALUES ('user_management',0,'*2F3B971A3971D99B24BBDC01D68F7427774DA6AB', '', 500);

#UPDATE mysql_users SET password='*2F3B971A3971D99B24BBDC01D68F7427774DA6AB' WHERE username= 'user_auth0';

{ username = "user_auth0" , password = "*2F3B971A3971D99B24BBDC01D68F7427774DA6AB" , default_hostgroup = 0 , active = 1, max_connections=500 }


INSERT INTO mysql_users(username,default_hostgroup, password, default_schema , max_connections) VALUES ('user_auth0',0,'*2F3B971A3971D99B24BBDC01D68F7427774DA6AB', '', 500);


----- IN-683
GRANT SELECT ON goals.* TO 'jpolanco'@'%';
GRANT SELECT ON goals.* TO 'mrodriguez'@'%';

-----

GRANT SELECT ON adminhr.* TO 'kdromero'@'%';



--- IN-742


SELECT * from mysql.user where `User` in ( 'ofguerrero', 'jlopez', 'jprodriguez', 'yillanten')

CREATE USER 'yillanten'@'%' IDENTIFIED BY 'Gfb0ivWe8FhKJjRmzFdh';

GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'jlopez'@'%';
GRANT SELECT, INSERT, UPDATE ON bitnami_moodle.* TO 'jlopez'@'%';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'ofguerrero'@'%';
GRANT SELECT, INSERT, UPDATE ON bitnami_moodle.* TO 'ofguerrero'@'%';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'jprodriguez'@'%';
GRANT SELECT, INSERT, UPDATE ON bitnami_moodle.* TO 'jprodriguez'@'%';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'yillanten'@'%';
GRANT SELECT, INSERT, UPDATE ON bitnami_moodle.* TO 'yillanten'@'%';

--- --- IN-741

GRANT DELETE ON adminhr.ubits_user_role TO 'user_management'@'%';
GRANT DELETE ON adminhr.ubits_user_auth0_role TO 'user_management'@'%';



----IN-833
CREATE USER 'scbustos'@'%' IDENTIFIED BY 'L-YHpHn89f!Qz5GS=*N$c1gE';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'scbustos'@'%';
GRANT SELECT ON bitnami_moodle.* TO 'scbustos'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'jsmoreno'@'%';

SELECT user FROM mysql.user WHERE USER like 'user_%'


--- IN-937
alter user 'crrincon' identified by 'pHd!k1&KF^CK-mSZ'


SHOW GRANTS FOR user_analitycs@'%';
GRANT USAGE ON *.* TO 'user_analitycs'@'%'
GRANT SELECT ON `talentdb`.* TO 'user_analitycs'@'%'

SHOW GRANTS FOR user_api_questionnaire@'%';
GRANT USAGE ON *.* TO 'user_api_questionnaire'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, ALTER ON `questionnaire`.* TO 'user_api_questionnaire'@'%'


SHOW GRANTS FOR user_assessments@'%';
GRANT USAGE ON *.* TO 'user_assessments'@'%'
GRANT SELECT ON `talendb`.* TO 'user_assessments'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, TRIGGER ON `talentdb`.* TO 'user_assessments'@'%' WITH GRANT OPTION

SHOW GRANTS FOR user_auth0@'%';
GRANT USAGE ON *.* TO 'user_auth0'@'%'
GRANT SELECT, INSERT, UPDATE ON `adminhr`.* TO 'user_auth0'@'%'


SHOW GRANTS FOR user_centralization@'%';
GRANT PROCESS, EVENT ON *.* TO 'user_centralization'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, TRIGGER ON `adminhr`.* TO 'user_centralization'@'%' WITH GRANT OPTION
GRANT ALL PRIVILEGES ON `adminhr`.`city` TO 'user_centralization'@'%' WITH GRANT OPTION
GRANT ALL PRIVILEGES ON `adminhr`.`country` TO 'user_centralization'@'%' WITH GRANT OPTION


SHOW GRANTS FOR user_crawlers@'%';
GRANT USAGE ON *.* TO 'user_crawlers'@'%'
GRANT SELECT, INSERT, UPDATE, ALTER ON `bitnami_moodle`.* TO 'user_crawlers'@'%'

SHOW GRANTS FOR user_credentials@'%';
GRANT USAGE ON *.* TO 'user_credentials'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON `bitnami_moodle`.* TO 'user_credentials'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON `bitnami_moodle_tars`.* TO 'user_credentials'@'%'


SHOW GRANTS FOR user_datapipeline@'%';
GRANT USAGE ON *.* TO 'user_datapipeline'@'%'
GRANT SELECT ON `bitnami_moodle`.* TO 'user_datapipeline'@'%'
GRANT SELECT ON `prod_logs_moodle`.* TO 'user_datapipeline'@'%'

SHOW GRANTS FOR user_etl_360_analitycs@'%';
GRANT USAGE ON *.* TO 'user_etl_360_analitycs'@'%'
GRANT SELECT ON `360_assessments`.* TO 'user_etl_360_analitycs'@'%'

SHOW GRANTS FOR user_goals@'%';
GRANT USAGE ON *.* TO 'user_goals'@'%'
GRANT SELECT, INSERT, DELETE, REFERENCES, ALTER ON `adminhr`.* TO 'user_goals'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, ALTER ON `goals`.* TO 'user_goals'@'%'
GRANT DELETE ON `goals`.`user_has_cycle` TO 'user_goals'@'%'


SHOW GRANTS FOR user_intranalytics_pipe@'%';
GRANT USAGE ON *.* TO 'user_intranalytics_pipe'@'%'
GRANT SELECT, INSERT, UPDATE ON `adminhr`.* TO 'user_intranalytics_pipe'@'%'
GRANT SELECT, INSERT, UPDATE ON `talentdb`.* TO 'user_intranalytics_pipe'@'%'
GRANT SELECT, INSERT, UPDATE ON `learning_hub`.* TO 'user_intranalytics_pipe'@'%'
GRANT SELECT, INSERT, UPDATE ON `bitnami_moodle`.* TO 'user_intranalytics_pipe'@'%'


SHOW GRANTS FOR user_lambda_downgrade@'%';
GRANT USAGE ON *.* TO 'user_lambda_downgrade'@'%'
GRANT SELECT, DELETE ON `adminhr`.`ubits_user_auth0_role` TO 'user_lambda_downgrade'@'%'
GRANT SELECT ON `adminhr`.`location` TO 'user_lambda_downgrade'@'%'
GRANT SELECT, INSERT, DELETE ON `adminhr`.`ubits_user_role` TO 'user_lambda_downgrade'@'%'
GRANT SELECT ON `adminhr`.`ubits_role` TO 'user_lambda_downgrade'@'%'
GRANT SELECT ON `adminhr`.`company` TO 'user_lambda_downgrade'@'%'
GRANT SELECT ON `adminhr`.`ubits_user` TO 'user_lambda_downgrade'@'%'
GRANT SELECT, DELETE ON `bitnami_moodle`.`mdl_role_assignments` TO 'user_lambda_downgrade'@'%'

SHOW GRANTS FOR user_learning@'%';
GRANT SELECT, INSERT, UPDATE, DROP, ALTER ON *.* TO 'user_learning'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON `bitnami_moodle`.* TO 'user_learning'@'%'


SHOW GRANTS FOR user_learning_hub@'%';
GRANT USAGE ON *.* TO 'user_learning_hub'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, TRIGGER ON `learning_hub`.* TO 'user_learning_hub'@'%' WITH GRANT OPTION

SHOW GRANTS FOR learning_map_user@'%';
GRANT EVENT ON *.* TO 'learning_map_user'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, TRIGGER ON `learning_map_test_2`.* TO 'learning_map_user'@'%' WITH GRANT OPTION
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, TRIGGER ON `learning_map_test`.* TO 'learning_map_user'@'%' WITH GRANT OPTION

SHOW GRANTS FOR user_liquibase@'%';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, REFERENCES, ALTER, EXECUTE, CREATE ROUTINE, ALTER ROUTINE ON *.* TO 'user_liquibase'@'%'

SHOW GRANTS FOR user_lms_creator@'%';
GRANT USAGE ON *.* TO 'user_lms_creator'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, ALTER ON `lms_creator`.* TO 'user_lms_creator'@'%'

SHOW GRANTS FOR user_lxp_lms_service@'%';
GRANT USAGE ON *.* TO 'user_lxp_lms_service'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, TRIGGER ON `bitnami_moodle`.* TO 'user_lxp_lms_service'@'%' WITH GRANT OPTION

SHOW GRANTS FOR user_lxp_lms_service_read@'%';
GRANT USAGE ON *.* TO 'user_lxp_lms_service_read'@'%'
GRANT SELECT ON `bitnami_moodle`.* TO 'user_lxp_lms_service_read'@'%'

SHOW GRANTS FOR user_management@'%';
GRANT USAGE ON *.* TO 'user_management'@'%'
GRANT SELECT, INSERT, UPDATE ON `adminhr`.* TO 'user_management'@'%'
GRANT DELETE ON `adminhr`.`ubits_user_role` TO 'user_management'@'%'
GRANT DELETE ON `adminhr`.`ubits_user_auth0_role` TO 'user_management'@'%'


SHOW GRANTS FOR user_middleware@'%';
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE ROUTINE, ALTER ROUTINE, LOAD FROM S3, SELECT INTO S3, INVOKE LAMBDA ON *.* TO 'user_middleware'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER, EXECUTE ON `bitnami_moodle`.* TO 'user_middleware'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER, EXECUTE ON `bitnami_moodle_tars`.* TO 'user_middleware'@'%'
GRANT SELECT ON `mysql`.`proc` TO 'user_middleware'@'%'

SHOW GRANTS FOR user_middlware_reader@'%';
GRANT USAGE ON *.* TO 'user_middlware_reader'@'%'
GRANT EXECUTE ON `mysql`.* TO 'user_middlware_reader'@'%'
GRANT SELECT, EXECUTE ON `bitnami_moodle_tars`.* TO 'user_middlware_reader'@'%'
GRANT SELECT, EXECUTE ON `bitnami_moodle`.* TO 'user_middlware_reader'@'%'
GRANT SELECT ON `prod_logs_moodle`.* TO 'user_middlware_reader'@'%'
GRANT SELECT ON `mysql`.`proc` TO 'user_middlware_reader'@'%'

SHOW GRANTS FOR user_migration_adminhr@'%';
GRANT USAGE ON *.* TO 'user_migration_adminhr'@'%'
GRANT SELECT, INSERT, UPDATE, CREATE, INDEX, ALTER ON `adminhr`.* TO 'user_migration_adminhr'@'%'
GRANT SELECT, INSERT, UPDATE, ALTER ON `bitnami_moodle`.* TO 'user_migration_adminhr'@'%'


SHOW GRANTS FOR user_moodle@'%';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, TRIGGER, LOAD FROM S3, SELECT INTO S3, INVOKE LAMBDA ON *.* TO 'user_moodle'@'%' WITH GRANT OPTION


SHOW GRANTS FOR user_moodle_reader@'%';
GRANT USAGE ON *.* TO 'user_moodle_reader'@'%'
GRANT SELECT, EXECUTE ON `bitnami_moodle`.* TO 'user_moodle_reader'@'%'
GRANT SELECT ON `prod_logs_moodle`.* TO 'user_moodle_reader'@'%'
GRANT EXECUTE ON PROCEDURE `bitnami_moodle`.`getcompulsorycourseadvancepercentage` TO 'user_moodle_reader'@'%'
GRANT EXECUTE ON PROCEDURE `bitnami_moodle`.`getcompanyvalidities` TO 'user_moodle_reader'@'%'


SHOW GRANTS FOR user_opensearch@'%';
GRANT USAGE ON *.* TO 'user_opensearch'@'%'
GRANT SELECT ON `bitnami_moodle`.* TO 'user_opensearch'@'%'


SHOW GRANTS FOR user_orgchart@'%';
GRANT USAGE ON *.* TO 'user_orgchart'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE ON `adminhr`.* TO 'user_orgchart'@'%'

SHOW GRANTS FOR user_tars@'%';
GRANT USAGE ON *.* TO 'user_tars'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, TRIGGER ON `bitnami_moodle_tars`.* TO 'user_tars'@'%' WITH GRANT OPTION


SHOW GRANTS FOR user_users_sync@'%';
GRANT USAGE ON *.* TO 'user_users_sync'@'%'
GRANT SELECT, INSERT, UPDATE ON `adminhr`.* TO 'user_users_sync'@'%'
GRANT SELECT, INSERT, UPDATE ON `bitnami_moodle`.* TO 'user_users_sync'@'%'


SHOW GRANTS FOR ubits_api_user@'%';
SHOW GRANTS FOR ubits_enrollment_user@'%';
SHOW GRANTS FOR ubits_enrol_massive@'%';
SHOW GRANTS FOR ubits_learning_map_service@'%';

--- IN-946
CREATE USER 'user_orgchart_v2'@'%' IDENTIFIED BY 'M$df%DtOX%VHqP2z';
GRANT SELECT ON adminhr.ubits_user TO 'user_orgchart_v2'@'%';
GRANT SELECT ON adminhr.location TO 'user_orgchart_v2'@'%';





--- IN-946 PARA PROD
CREATE USER 'user_orgchart_v2'@'%' IDENTIFIED BY 'NXC%uIP4r1@c0c-=';
GRANT SELECT ON adminhr.ubits_user TO 'user_orgchart_v2'@'%';
GRANT SELECT ON adminhr.location TO 'user_orgchart_v2'@'%';

show grants for 'user_orgchart_v2'@'%' ;



-------- CREACION USUARIO SURVEYS PROD










