#!/usr/bin/env bash
set -e

echo "Ejecucion before Install "$(date +"%Y-%m-%d %H:%M:%S") >> /etc/proxysql-codedeploy.log
systemctl stop proxysql
rm -rf /var/lib/proxysql/proxysql.db
rm -rf /etc/proxysql.cnf
echo "Temina ejecucion de before Install "$(date +"%Y-%m-%d %H:%M:%S") >> /etc/proxysql-codedeploy.log

