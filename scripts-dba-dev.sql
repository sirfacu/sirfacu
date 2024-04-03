create database `360_assessments` /*!40100 DEFAULT CHARACTER SET utf8 */;

select * from mysql.user
where `User` in ( 'jhoyos')#, 'cmejia','frvargas','jsmoreno','juanh','cvarango') #talent



select a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked  
from mysql.user as a
where `User` in ( 'wmosquera', 'mpedraza','jmontenegro','ofguerrero','jorgem','egarcia', 'jlopez') #core

CREATE USER '4ckamilo'@'%' IDENTIFIED BY 't3mp0123%*' PASSWORD EXPIRE ;
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER ON PLATZIBLOG.* TO '4ckamilo'@'%';

drop user 'user_360_assessments';
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
FLUSH PRIVILEGES;

drop user 'wmosquera'@'%';
drop user 'mpedraza'@'%';
drop user 'jmontenegro'@'%';
drop user 'ofguerrero'@'%';
drop user 'jorgem'@'%';
drop user 'egarcia'@'%';
drop user 'jlopez'@'%';



SELECT * FROM information_schema.USER_PRIVILEGES
WHERE GRANTEE like '%wmosquera%'
or GRANTEE like  '%mpedraza%'
or GRANTEE like  '%jmontenegro%'
or GRANTEE like '%ofguerrero%'
or GRANTEE like '%jorgem%'
or GRANTEE like '%egarcia%'
or GRANTEE like '%jlopez%'




drop user 'user_intranalytics'@'%';


select * from mysql.user as a where `User` like '%analytics%' 


select  a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user as a where `User` like '%analytics%' 
in ( 'mcerpa', 'andrescramirez','laguilar','vjuspian','jpolanco','mrodriguez', 'user_intranalytics') #core

select  a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user as a where `User` 
in ( 'juhoyos', 'jsmoreno','scbustos','cmejia','bssaldarriaga','crrincon', 'juanh') #talent

juhoyos,bssaldarriaga


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

drop user 'vjuspian'@'%';
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

select  a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user as a where `User` 
in ( 'juhoyos', 'jsmoreno','scbustos','cmejia','bssaldarriaga','crrincon', 'juanh') #talent

juhoyos,bssaldarriaga


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

drop user 'juhoyos'@'%'
CREATE USER 'juhoyos'@'%' IDENTIFIED BY 'Ub1T$2024%*';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'juhoyos'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'juhoyos'@'%';


select  a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user 



drop user 'user_goalsapp'@'%'

CREATE USER 'user_goalsapp'@'%' IDENTIFIED BY 'Ub1T$D3v2024%*';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'user_goalsapp'@'%';
GRANT SELECT ON adminhr.* TO 'user_goalsapp'@'%';
ALTER USER 'user_goalsapp'@'%' IDENTIFIED BY  'Ub1T$D3v2024%*'



