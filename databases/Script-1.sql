#Activar modulos
	INSERT INTO bitnami_moodle.mdl_u_company_features_migrate
	(company_id, feature_id, value)
	VALUES(3247, 2, 1),
	(3247, 3, 1),
	(3247, 5, 1);

#Validar modulos
SELECT * from bitnami_moodle.mdl_u_company_features_migrate where company_id in (3247)



--- IN-937
alter user 'crrincon' identified by 'pHd!k1&KF^CK-mSZ'

-- IN-946
CREATE USER 'user_orgchart_v2'@'%' IDENTIFIED BY 'NXC%uIP4r1@c0c-=';
GRANT SELECT ON adminhr.ubits_user TO 'user_orgchart_v2'@'%';
GRANT SELECT ON adminhr.location TO 'user_orgchart_v2'@'%';
para 

show grants for 'user_orgchart_v2'@'%' ;


-- IN-996
DROP USER user_datastream;

CREATE USER 'user_datastream'@'%' IDENTIFIED BY '_MzzeWX9WnVP-v+T';

GRANT, SELECT, RELOAD, REPLICATION SLAVE, REPLICATION CLIENT, Lock Tables, Execute ON *.* TO 'user_datastream'@'%';
FLUSH PRIVILEGES;