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

CREATE DATABASE `goals` /*!40100 DEFAULT CHARACTER SET utf8 */;

select  a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked from mysql.user as a where `User` 
in ( 'juhoyos', 'jsmoreno','scbustos','cmejia','bsaldarriaga','crrincon', 'juanh') #talent


drop user 'juhoyos'@'%'

CREATE USER 'juhoyos'@'%' IDENTIFIED BY 'Ub1T$2024%*';
CREATE USER 'jsmoreno'@'%' IDENTIFIED BY 'Ub1T$2024%*';
CREATE USER 'cmejia'@'%' IDENTIFIED BY 'Ub1T$2024%*';
CREATE USER 'bsaldarriaga'@'%' IDENTIFIED BY 'Ub1T$2024%*';
CREATE USER 'juanh'@'%' IDENTIFIED BY 'Ub1T$2024%*';

drop user 'juhoyos'@'%'
CREATE USER 'juhoyos'@'%' IDENTIFIED BY 'Ub1T$2024%*';
GRANT SELECT, INSERT, UPDATE ON adminhr.* TO 'juhoyos'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'juhoyos'@'%';

GRANT SELECT, INSERT, UPDATE ON .* TO 'juhoyos'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'jsmoreno'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'scbustos'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'cmejia'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'bsaldarriaga'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'crrincon'@'%';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'juanh'@'%';


drop user 'user_goals'@'%'
CREATE USER 'user_goals'@'%' IDENTIFIED BY 'Ub1T$T3st2024%*';
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'user_goals'@'%';
GRANT SELECT ON adminhr.* TO 'user_goals'@'%';

