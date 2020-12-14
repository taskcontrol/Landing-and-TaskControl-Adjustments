## #!/bin/bash

set -x 

export PATH_BASE='/home/taskcontrol'
export IP_ADDRESS=$1
export DROPLET_NAME=$2 
export DB_BACKUP_PATH="/var/www/taskcontrol.net/web/provisioning/infra/landing/backups/initial/"
export FECHA=`date +%Y-%m-%d-%H:%M:%S`
export REMOTE_USER='taskcontrol'
export LOGRESTORE="/var/www/taskcontrol.net/web/provisioning/"
export SSHPASS='taskcontrol2020!!'
####################################################################

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"--- Ingreso a bootstrap_landing.sh: Customizing Droplet: "$DROPLET_NAME >> $PATH_BASE/droplet_creation.log

## Configuracion de /etc/hosts
sshpass -e sudo sed -i 's/127.0.1.1 taskcontrol.net www.taskcontrol.net/'"$IP_ADDRESS"'	taskcontrol.net	www.taskcontrol.net/' "/etc/hosts"

## Genera Certificado SSL de Let's Encrypt
## sudo $PATH_BASE/genssl.sh $DROPLET_NAME

## Importamos la base inicial de la landing
## ACHTUNG!!: Modificar el path de acuerdo a la fecha que haya que restaurar
############################################################################

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Creating Initial Landing DB: "$DROPLET_NAME >> ${LOGRESTORE}landing_creation.log

## Verificamos la existencia del directorio solicitado
backupfolder="${DB_BACKUP_PATH}"

if [ ! -d $backupfolder ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Initial Data Directory non-existent for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}landing_creation.log
 ## exit 1
fi

cd $backupfolder
filename="c1bairesda_taskcontrol.sql" ## nombre del dump inicial

if [ ! -f $filename ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Non-existent .sql for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}landing_creation.lo
  ## exit 1
fi

## descomprimo el sql.gz
## Hacemos el restore del hot en la base del cliente
## gunzip -f $filename | cat | sshpass -e ssh ${REMOTE_USER}@$IP_ADDRESS "mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD}"  
## zcat $filename | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS "mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD}"  2>/dev/null 

sshpass -e sudo mysql -u root -p"taskcontrol!!2020!!" -e "drop database c1bairesda_taskcontrol"; 2>&1

sshpass -e sudo mysql -u root -p"taskcontrol!!2020!!" -e "create database c1bairesda_taskcontrol"; 2>&1

sshpass -e sudo mysql -u root -p"taskcontrol!!2020!!" -e "grant all privileges on c1bairesda_taskcontrol.* to 'root'@'localhost'; flush privileges; commit;'" 2>&1


cat /var/www/taskcontrol.net/web/provisioning/infra/landing/backups/initial/c1bairesda_taskcontrol.sql | sshpass -e ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol!!2020!!" -D c1bairesda_taskcontrol' 2>&1

if [ $? -ne 0 ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Error while Importing Initial Dump for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}landing_creation.log
  ## exit 1
fi

## si llego hasta aqui se hizo el import completo, se cambia el owner y group a mysql
cd /var/lib/mysql 
sshpass -e sudo chown -R mysql:mysql c1bairesda_taskcontrol <<< "taskcontrol2020!!"
if [ $? -ne 0 ]; then
  current_date_time=`date +%Y-%m-%d-%H:%M:%S`
  echo $current_date_time":------Error while changing permission for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}landing_creation.log
   ## exit 1
fi

## Como ya tenemos el ip, reconfiguramos netlan
sshpass -e sudo sed -i 's/## - x.x.x.x/ - '$IP_ADDRESS'/' "/etc/netplan/50-cloud-init.yaml"  

sshpass -e sudo netplan generate <<< "taskcontrol2020!!"
sshpass -e sudo netplan apply <<< "taskcontrol2020!!"

##########################################################################

## Otherwise all was fine
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Initial Import for Landing DROPLET Finished OK!!: "$DROPLET_NAME >> ${LOGRESTORE}landing_creation.log

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"--- Finish Initial Landing Customizing: "$DROPLET_NAME >> ${LOGRESTORE}landing_creation.log

## exit 0
