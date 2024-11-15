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










select  a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user as a where `User` in ( 'mcerpa', 'andrescramirez','laguilar','vjuspian','jpolanco','mrodriguez', 'user_intranalytics') #core

CREATE USER 'jpolanco'@'%' IDENTIFIED BY 'Ub1T$D3v2024%*';
CREATE USER 'user_intranalytics'@'%' IDENTIFIED BY '4pPU$3rD3v2024%*';

GRANT SELECT, INSERT, UPDATE, DELETE ON learning_hub.* TO 'jpolanco'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'jpolanco'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'jpolanco'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON talentdb.* TO 'jpolanco'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON learning_hub.* TO 'user_intranalytics'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON adminhr.* TO 'user_intranalytics'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON bitnami_moodle.* TO 'user_intranalytics'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON talentdb.* TO 'user_intranalytics'@'%';




---- MONGO -----

db.createUser({user: 'mcerpa' , pwd: 'Ub1T$2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});
db.createUser({user: 'andrescramirez' , pwd: 'Ub1T$2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});
db.createUser({user: 'laguilar' , pwd: 'Ub1T$2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});
db.createUser({user: 'jpolanco' , pwd: 'Ub1T$2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});
db.createUser({user: 'vjuspian' , pwd: 'Ub1T$2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});
db.createUser({user: 'mrodriguez' , pwd: 'Ub1T$2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});
db.createUser({user: 'user_intranalytics' , pwd: '4pPU$3r2024%*' , roles:[{role: 'readWrite', db: 'centralization'}]});










