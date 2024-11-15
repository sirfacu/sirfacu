

CREATE USER 'user_datastream'@'%' IDENTIFIED BY '_MzzeWX9WnVP-v+T';

CREATE DATABASE surveys;
create user user_surveys identified by "a1w+K#K&3x6F0jl9";
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, ALTER ON `surveys`.* TO 'user_surveys'@'%';
commit;

GRANT SELECT ON  `surveys`.* TO 'jhoyos'@'%';

show grants for user_surveys
ALTER USER ytrejos IDENTIFIED BY 'G7bJU72zZ6XwCBoy';


UPDATE goals.user_has_cycle SET user_id = 765502
WHERE user_id = 765071 AND cycle_id = 13;

UPDATE goals.user_has_cycle SET user_id = 765502
WHERE user_id = 765071 AND cycle_id = 16;

UPDATE goals.goal SET user_id = 765502
WHERE id = 1752;

UPDATE goals.goal SET user_id = 765502
WHERE id = 1753;

UPDATE goals.goal SET user_id = 765502
WHERE id = 1754;

UPDATE goals.goal SET user_id = 765502
WHERE id = 17555;

UPDATE goals.user SET deleted_at = CURRENT_TIMESTAMP()
WHERE user_id = 765071;

call mysql.rds_set_configuration('binlog retention hours', 168);
CALL mysql.rds_show_configuration;

CREATE USER 'user_datastream'@'%' IDENTIFIED BY '_MzzeWX9WnVP-v+T';

CREATE DATABASE surveys;
create user user_survey identified by "ySnpfR!iaZ#^8-oj";
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, ALTER ON `surveys`.* TO 'user_survey'@'%';
commit;


SHOW PROCESSLIST; # vemos las conexiones abiertas
SHOW VARIABLES LIKE 'wait_timeout'; #validamos el timeout de las conexiones en sleep
SHOW VARIABLES LIKE 'max_connections'; # Indica el maximo de conexiones que usará la BD
SHOW GLOBAL VARIABLES LIKE 'interactive_timeout';
SHOW GLOBAL VARIABLES LIKE 'max_allowed_packet';


SELECT COUNT(*) AS active_connections FROM information_schema.PROCESSLIST WHERE 
User like ('%360%') and 
COMMAND in ('sleep'); # Revisar las conexiones que estan en sleep

SELECT COUNT(*) AS active_connections FROM information_schema.PROCESSLIST WHERE 
User like ('%assessments%') and 
COMMAND in ('sleep'); # Revisar las conexiones que estan en sleep


SHOW STATUS LIKE 'threads_running' 

UPDATE goals.measure_type SET name = 'Numérico' WHERE goals.measure_type.`id` = 3;


select * from goals.measure_type mt where name like 'Numérico';


SHOW VARIABLES LIKE 'binlog_expire_logs_seconds';


--- IN-1112
create USER 'devs_yalvarez'@'%' IDENTIFIED BY 'T3mp0r4lPwd';
GRANT USAGE ON *.* TO `devs_yalvarez`@`%`
GRANT SELECT, EXECUTE ON `goals`.* TO `devs_yalvarez`@`%`
GRANT SELECT, EXECUTE ON `surveys`.* TO `devs_yalvarez`@`%`
GRANT SELECT, EXECUTE ON `talentdb`.* TO `devs_yalvarez`@`%`
GRANT SELECT, EXECUTE, ALTER ROUTINE ON `360_assessments`.* TO `devs_yalvarez`@`%`


SHOW GRANTS FOR 'devs_jalvarez'@'%';







