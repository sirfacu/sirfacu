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
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'scbustos'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'jsmoreno'@'%';






































































