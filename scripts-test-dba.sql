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
GRANT SELECT, INSERT, UPDATE ON goals.* TO 'juanh'@'%';


drop user 'user_goals'@'%'
CREATE USER 'user_goals'@'%' IDENTIFIED BY 'Ub1T$T3st2024%*';
GRANT REFERENCES on goals.* TO 'user_goals'@'%';
GRANT SELECT ON adminhr.* TO 'user_goals'@'%';
GRANT ALTER ON adminhr.* TO 'user_goals'@'%';
GRANT ALTER ON goals.* TO 'user_goals'@'%';



select a.Host, a.`User` , a.password_expired , a.password_last_changed, a.account_locked  , a.authentication_string 
from mysql.user as a
where `User` in ( 'user_users_sync')


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


-- para proxysql
Para crear usuarios de aplicación en proxysql primero deben ser creados sobre la base de datos RDS 

CREATE USER 'user_NOMBRE_USUARIO'@'%' IDENTIFIED BY 'CLAVE_A_ASIGNAR';
GRANT CREATE, SELECT, INSERT, UPDATE, REFERENCES ON BD_ACCESO_SOLICITADO.* TO 'user_NOMBRE_USUARIO'@'%';

NOMBRE_USUARIO = Es el nombre del usuario que deben entregar los solicitantes
CLAVE_A_ASIGNAR = asignarle una clave 

Luego validar usando el siguiente query el hash de la clave
select `User` , authentication_string   from mysql.user where `User` in (  'user_NOMBRE_USUARIO' );


Una vez se tengan estos datos se procederá a ingresar a cada una de las instancias de proxysql usando SSM, luego ejecutamos el siguiente comando para 
conectarnos a la Base de datos

mysql -u admin -padmin -h 127.0.0.1 -P6032 --prompt='Admin>'

ejecutar el query para validar que el usuario no existe:

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
cp  /etc/proxysql.cnf /etc/proxysql.cnf-bkp-$fechaEjecucion

abrimos el archivo 

vi  /etc/proxysql.cnf

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








GRANT DELETE ON adminhr.* TO 'user_goals'@'%';
GRANT DELETE ON goals.* TO 'user_goals'@'%';







































---------------------------

CREATE SCHEMA IF NOT EXISTS `goals` DEFAULT CHARACTER SET utf8mb4;
USE `goals` ;

-- -----------------------------------------------------
-- Table `goals`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`area` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`periodicity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`periodicity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `period` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`status` (
  `id` INT NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  `type` INT(1) NOT NULL DEFAULT 0,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goals`.`cycle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`cycle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `date_start` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_end` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_id` INT NOT NULL,
  `periodicity_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cycle_periodicity1_idx` (`periodicity_id` ASC) VISIBLE,
  INDEX `fk_cycle_company1_idx` (`company_id` ASC) VISIBLE,
  INDEX `fk_cycle_status1_idx` (`status_id` ASC) VISIBLE,
  UNIQUE INDEX `data_unique` (`company_id` ASC, `name` ASC) VISIBLE,
  CONSTRAINT `fk_cycle_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `goals`.`company` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cycle_periodicity1`
    FOREIGN KEY (`periodicity_id`)
    REFERENCES `goals`.`periodicity` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cycle_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `goals`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`measure_operation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`measure_operation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `symbol` VARCHAR(45) NULL DEFAULT NULL,
  `operation` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`measure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`measure` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `measure_operation_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_measure_measure_operation1_idx` (`measure_operation_id` ASC) VISIBLE,
  CONSTRAINT `fk_measure_measure_operation1`
    FOREIGN KEY (`measure_operation_id`)
    REFERENCES `goals`.`measure_operation` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`measure_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`measure_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `measure_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_measure_type_measure1_idx` (`measure_id` ASC) VISIBLE,
  CONSTRAINT `fk_measure_type_measure1`
    FOREIGN KEY (`measure_id`)
    REFERENCES `goals`.`measure` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `full_name` VARCHAR(255) NULL DEFAULT NULL,
  `supervisor_id` INT NULL DEFAULT NULL,
  `profile_id` INT NOT NULL,
  `area_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_profile1_idx` (`profile_id` ASC) VISIBLE,
  INDEX `fk_user_area1_idx` (`area_id` ASC) VISIBLE,
  INDEX `fk_user_company1_idx` (`company_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_area1`
    FOREIGN KEY (`area_id`)
    REFERENCES `goals`.`area` (`id`),
  CONSTRAINT `fk_user_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `goals`.`profile` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `goals`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`goal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`goal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `weight` FLOAT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `is_approved` INT NULL DEFAULT NULL,
  `target` FLOAT NULL DEFAULT NULL,
  `measure_type_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `cycle_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_goal_measure_type1_idx` (`measure_type_id` ASC) VISIBLE,
  INDEX `fk_goal_cycle1_idx` (`cycle_id` ASC) VISIBLE,
  INDEX `fk_goal_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_goal_status1_idx` (`status_id` ASC) VISIBLE,
  UNIQUE INDEX `data_unique` (`cycle_id` ASC, `name` ASC) VISIBLE,
  CONSTRAINT `fk_goal_cycle1`
    FOREIGN KEY (`cycle_id`)
    REFERENCES `goals`.`cycle` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_goal_measure_type1`
    FOREIGN KEY (`measure_type_id`)
    REFERENCES `goals`.`measure_type` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_goal_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `goals`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_goal_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `goals`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`goal_regs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`goal_regs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `value` FLOAT NULL DEFAULT NULL,
  `is_initial` INT NULL DEFAULT NULL,
  `goal_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_goal_regs_goal1_idx` (`goal_id` ASC) VISIBLE,
  CONSTRAINT `fk_goal_regs_goal1`
    FOREIGN KEY (`goal_id`)
    REFERENCES `goals`.`goal` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`module` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`module_actions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`module_actions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `action` VARCHAR(45) NULL DEFAULT NULL,
  `module_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_module_actions_module1_idx` (`module_id` ASC) VISIBLE,
  CONSTRAINT `fk_module_actions_module1`
    FOREIGN KEY (`module_id`)
    REFERENCES `goals`.`module` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`profile_has_module_actions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`profile_has_module_actions` (
  `profile_id` INT NOT NULL,
  `module_actions_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`profile_id`, `module_actions_id`),
  INDEX `fk_profile_has_module_actions_module_actions1_idx` (`module_actions_id` ASC) VISIBLE,
  INDEX `fk_profile_has_module_actions_profile1_idx` (`profile_id` ASC) VISIBLE,
  INDEX `fk_profile_has_module_actions_company1_idx` (`company_id` ASC) VISIBLE,
  CONSTRAINT `fk_profile_has_module_actions_module_actions1`
    FOREIGN KEY (`module_actions_id`)
    REFERENCES `goals`.`module_actions` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_profile_has_module_actions_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `goals`.`profile` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_profile_has_module_actions_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `goals`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `goals`.`user_has_cycle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goals`.`user_has_cycle` (
  `user_id` INT NOT NULL,
  `cycle_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `cycle_id`),
  INDEX `fk_user_has_cycle_cycle1_idx` (`cycle_id` ASC) VISIBLE,
  INDEX `fk_user_has_cycle_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_cycle_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `goals`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_cycle_cycle1`
    FOREIGN KEY (`cycle_id`)
    REFERENCES `goals`.`cycle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




--------------- proxysql

SHOW VARIABLES LIKE 'mysql-connect_timeout_server';

select hostgroup, status, ConnERR, Queries, Latency_ms from stats_mysql_connection_pool;