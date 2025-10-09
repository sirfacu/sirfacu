#!/bin/bash
sudo dnf update
sudo dnf install postgresql15.x86_64 postgresql15-server -y
sudo postgresql-setup --initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo systemctl status postgresql

## configuracion de usuarios
sudo -i -u postgres psql -c "CREATE USER ubits_admin WITH PASSWORD '!Iw1zI2XVRE#Wqd';"
sudo -i -u postgres psql -c "ALTER USER ubits_admin WITH SUPERUSER;"
sudo -i -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'p0sTGr3s';"

## configurando  bd
# Backup configuracion por defecto
sudo cp /var/lib/pgsql/data/postgresql.conf /var/lib/pgsql/data/postgresql.conf.bck
sudo cp /var/lib/pgsql/data/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf.bk
# Agregar linea de listen en postgres.conf
echo "listen_addresses = '*'" >>  /var/lib/pgsql/data/postgresql.conf
# Permitir conexiones entrantes pg_hba.conf
echo "host    all             all             0.0.0.0/0               md5" >> /var/lib/pgsql/data/pg_hba.conf
# Reiniciar para que tome efecto
sudo systemctl restart postgresql    
# Instalar el agente de SSM
yum install -y amazon-ssm-agent
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent