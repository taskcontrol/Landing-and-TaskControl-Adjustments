#!/bin/bash
###################################################################################
## Script de restore de hot backup (base admin_task)
## SE DEBERA CORRER SOLO BAJO PEDIDO LEGAL ESCRITO Y VALIDO DE PARTE DEL CLIENTE
## RFG: 26-12-2019
## CopyRight TaskControl LLC, 2019
## Se llama con los parametros "DropletName" "Plan" "Version" "Fecha"
###################################################################################

## Descomentar para debugging
set -x

if [ "$#" -ne 5 ]; then
  echo "Usage: hot_restore_droplet.sh "DropletName" "Fecha" "Plan" "Version" "IP_ADDRESS" "
  echo "(ie. hot_restore_droplet.sh "MyCompany" "2019-12-24-17:44:19" "Starter" "v20.04.001.001.0001" "IP_ADDRESS" )"
  sleep 5
  ## exit 1
fi

## Corremos el enviroment de claves
## . token.sh

## --------------------------------- token.sh ---------------------------------------
export DO_TOKEN=e6b3f9f8bc8dccca7afbc8dbb0dcb7c068b0e52e41e879f00735a019b5054b6f
export SPACES_KEY=L25ZD2V62OE7ZJHZOLUJ
export SPACES_SECRET=x/T3nbjCOLiw21xTYbsK40hxLEQ0CSxNWZBYdmp1+Mg
export ENDPOINT="nyc3.digitaloceanspaces.com"
export SPACENAME="taskcontrol-10-2019"
export SPACENAME_ENDPOINT="https://taskcontrol-10-2019.nyc3.digitaloceanspaces.com/"
export REMOTE_ROOT_USER='root'
export REMOTE_ROOT_PASS='taskcontrol2020!!'
export REMOTE_USER='taskcontrol'
export SSHPASS='taskcontrol2020!!'
export PATH_BASE='/var/www/taskcontrol.net/web/provisioning/'
export INFRA_ADDRESS='/var/www/taskcontrol.net/web/provisioning/infra/'
export PLANS_VERSION='/var/www/taskcontrol.net/web/provisioning/plans_versions/'
export PATH_LANDING='/var/www/taskcontrol.net/web/provisioning/infra/landing/'
export PATH_TMP='/var/www/taskcontrol.net/web/provisioning/temp/'

## seteos para MySQL 
export DB_BACKUP_HOT='/var/www/taskcontrol.net/web/provisioning/customers/backups/hot/'
export MYSQL_HOST='localhost'
export MYSQL_PORT='3306'
export MYSQL_USER='root'
export MYSQL_PASSWORD='taskcontrol2020!!'
export DATABASE_NAME='admin_task'
export BACKUP_RETAIN_DAYS=8   ## Number of days to keep local backup copy
export MYSQL_LANDING_USER='c1taskcontrol'
export MYSQL_LANDING_PASS='j6BRh3gN65tXnE'

## ------------- fin token.sh ------------------------------------------------

errors=0

## Me posiciono en el directorio de backups hot

cd $DB_BACKUP_HOT

LOGRESTORE="hot_restore_droplet.log"


## Elegimos el hot backup a restaurar en funcion de los datos pasados como argumento

DROPLET_NAME=$1
FECHA=$2
PLAN=$3
VERSION=$4
IP_ADDRESS=$5

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Restoring Hot Backup for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}

filename="$DROPLET_NAME-$PLAN-$VERSION.sql"
backupfolder=$DB_BACKUP_HOT$FECHA-$DROPLET_NAME
fullbackupfile="$backupfolder/$filename"

echo "--------------------------------"
echo "backupfolder: "$backupfolder
echo "fullbackupfile: "$fullbackupfile
echo "IP ADDRESS: "$IP_ADDRESS
echo "filename: "$filename
echo "--------------------------------"

if [ ! -f $backupfolder/$filename ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Hot Backup file (.sql) non-existent for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
((++errors))
  ## exit 1
fi

## descomprimo el sql.gz
## Hacemos el restore del hot en la base del cliente
## gunzip -f $filename | cat | sshpass -e ssh ${REMOTE_USER}@$IP_ADDRESS "mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD}"  
## zcat $filename | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS "mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD}"  2>/dev/null 

## Primero hago un backup hot JIC ###
## /var/www/taskcontrol.net/web/provisioning/hot_backup_droplets.sh
## if [ $? -ne 0 ]; then
##  current_date_time=`date +%Y-%m-%d-%H:%M:%S`
##  echo $current_date_time":------Error Ejecutando Backup PREVIO for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
##  exit 1
## fi

## Comienzo el restore ##
sshpass -e ssh ${REMOTE_USER}@$IP_ADDRESS 'sudo mysqladmin -u root -p"taskcontrol2020!!" drop -f admin_task;' 2>> ${PATH_BASE}${LOGRESTORE}

sshpass -e ssh ${REMOTE_USER}@$IP_ADDRESS 'sudo mysqladmin -u root -p"taskcontrol2020!!" create admin_task;' 2>> ${PATH_BASE}${LOGRESTORE}

sshpass -e ssh ${REMOTE_USER}@$IP_ADDRESS 'sudo mysql -u root -p"taskcontrol2020!!" -e "grant all privileges on admin_task.* to 'taskcontrol'@'localhost';"' 2>> ${PATH_BASE}${LOGRESTORE}

cat $fullbackupfile | sshpass -e ssh ${REMOTE_USER}@$IP_ADDRESS 'sudo mysql -u root -p"taskcontrol2020!!" -D admin_task' >> ${PATH_BASE}${LOGRESTORE}

if [ $? -ne 0 ]; then
  current_date_time=`date +%Y-%m-%d-%H:%M:%S`
  echo $current_date_time":------Error Restoring Hot Backup for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
  ((++errors))
  ## exit 1
fi

## si llego hasta aqui se hizo el restore hot completo, se cambia el owner y group a mysql
#sshpass -e ssh ${REMOTE_USER}@${IP_ADDRESS} "cd /var/lib/mysql ; sudo chown -R mysql:mysql admin_task" 

#if [ $? -ne 0 ]; then
#  current_date_time=`date +%Y-%m-%d-%H:%M:%S`
#  echo $current_date_time":------Error while changing permission for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
#  ((++errors))
#  ## exit 1
#fi

## Otherwise all was fine
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":-----Restored Hot Backup for DROPLET OK!!: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}

## Envia mail al admin avisando que finalizo el restore del Hot Backup
if [[ "$errors" -eq 0 ]]; then
   echo "$DROPLET_NAME" |  mail -s "Restore for Droplet Finished OK!" support@taskcontrol.net
else
   echo "$DROPLET_NAME" |  mail -s "Restore for Droplet Has Error - Please Check!!" support@taskcontrol.net
fi
## exit 0

