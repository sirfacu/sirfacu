--- IN-946
create schema org_chart;
CREATE USER user_orgchart_v2 WITH PASSWORD 'VDyhv@dU2uflKeU';
grant usage, create on schema org_chart to user_orgchart_v2;
ALTER user user_orgchart_v2 SET search_path TO org_chart;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES IN SCHEMA org_chart TO user_orgchart_v2;


-- Permissions;

REVOKE ALL PRIVILEGES ON DATABASE ubits FROM user_orgchart;


SELECT usename as user, useconfig FROM pg_user where usename='user_orgchart_v2';




--- IN-946 PARA PROD
create schema org_chart;
CREATE USER user_orgchart_v2 WITH PASSWORD 'RjGRK5u6%-s_4lU';
grant usage, create on schema org_chart to user_orgchart_v2;
ALTER user user_orgchart_v2 SET search_path TO org_chart;
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES IN SCHEMA org_chart TO user_orgchart_v2;