#!/bin/bash

echo "Started at $(date -R)!" >> /home/opc/install.log

sudo rpm -Uvh https://yum.postgresql.org/12/redhat/rhel-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

echo "Installed Postgre repo at $(date -R)!" >> /home/opc/install.log

sudo yum install postgresql11-contrib -y 

echo "Installed postgresql lib 11 at $(date -R)!" >> /home/opc/install.log

sudo yum install postgresql12-contrib -y 

echo "Installed postgresql lib 12 at $(date -R)!" >> /home/opc/install.log

sudo yum install libpq -y

echo "Installed libpg at $(date -R)!" >> /home/opc/install.log

sudo yum install postgresql-odbc.x86_64 -y

echo "Installed odbc for postgresql at $(date -R)!" >> /home/opc/install.log

echo '${config_file}' >> /home/opc/postgresql/odbc.ini
echo "odbc.ini file is copied $(date -R)!" >> /home/opc/install.log


sudo sed -i "s/ip_address/${source_postgre}/g" /home/opc/postgresql/odbc.ini
echo "odbc.ini file is edited $(date -R)!" >> /home/opc/install.log

sudo chown opc:opc /home/opc/postgresql/odbc.ini
echo "odbc.ini file owner is changed to opc $(date -R)!" >> /home/opc/install.log

echo "Finished at $(date -R)!" >> /home/opc/install.log