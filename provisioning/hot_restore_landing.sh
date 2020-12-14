#!/bin/bash
################################################################################
## Script de restore de hot backup de la landing
## SE DEBERA CORRER SOLO BAJO PEDIDO LEGAL ESCRITO Y VALIDO DE PARTE DEL CLIENTE
## RFG: 26-12-2019
## CopyRight TaskControl LLC, 2019
## Se llama con los parametros "Fecha" "Version" 
###############################################################################

LOGRESTORE="hot_restore_landing.log"
PATH_BASE="/var/www/taskcontrol.net/web/provisioning/"
IP_ADDRESS="157.245.120.61"  ## CAMBIAR SI CAMBIA EL IP DE LA LANDING 

## Descomentar para debugging
set -x

if [ "$#" -ne 2 ]; then
  echo "Usage: hot_restore_landing.sh "Fecha" "Version" "
  echo "(ie. hot_restore_landing.sh "2019-12-24-17:44:19"  "v19.03.001.001.001" )"
  sleep 5
  ## exit 1
fi

if [ ! -f ${PATH_BASE}${LOGRESTORE} ]; then
   touch ${PATH_BASE}${LOGRESTORE}
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
export PATH_LANDING='/var/www/taskcontrol.net/web/provisioning/'
export PATH_TMP='/var/www/taskcontrol.net/web/provisioning/temp/'

## seteos para MySQL 
export DB_BACKUP_HOT='/var/www/taskcontrol.net/web/provisioning/infra/landing/backups/hot/'
export MYSQL_HOST='localhost'
export MYSQL_PORT='3306'
export MYSQL_USER='root'
export MYSQL_PASSWORD='taskcontrol2020!!'
export BACKUP_RETAIN_DAYS=7   ## Number of days to keep local backup copy

## Definiciones de bases de datos de la landing
export DATABASE_NAME1='c1bairesda_taskcontrol'
export MYSQL_LANDING_USER='c1taskcontrol'
export MYSQL_LANDING_PASS='j6BRh3gN65tXnE'

export DATABASE_NAME2='c1bairesda_mant807'
export DATABASE_USER2='c1mant807'
export DATABASE_PASS2='30PXLTS0(!'

export DATABASE_NAME3='c1bairesda_chat_pro'
export DATABASE_USER3='c1chatpro'
export DATABASE_PASS3='taskcontrol2019!!'
## ---------------------------------------------------------------------------------


## Elegimos el hot backup a restaurar en funcion de los datos pasados como argumento

DROPLET_NAME="landing"
FECHA=$1
VERSION=$2

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Restoring Hot Backup for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}

## Verificamos la existencia del directorio solicitado
backupfolder=${DB_BACKUP_HOT}${FECHA}-${VERSION}

if [ ! -d $backupfolder ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Backup Directory non-existent for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
## exit 1
fi

current_date_time_start=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start":-----Comenzando Landing Hot Restore-----:"$DROPLET_NAME >> ${PATH_BASE}${LOGHOT}

current_date_time=`date +%Y-%m-%d-%H:%M:%S` 

cd $backupfolder
       
## Hot Restore de c1bairesda_taskcontrol ########################################

filename=$DATABASE_NAME1.sql
if [ ! -f $filename ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Hot Backup file (sql) non-existent for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
  ## exit 1
fi

echo "backupfolder: " $backupfolder
echo "filename: " $filename
completefile=$backupfolder/$filename
echo "completefile: "$completefile

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2020!!" drop -f c1bairesda_taskcontrol;' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2020!!" create c1bairesda_taskcontrol;' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -e "grant all privileges on c1bairesda_taskcontrol.* to 'root'@'localhost';"' 2>&1

cat $completefile | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -D c1bairesda_taskcontrol' >> ${PATH_BASE}${LOGRESTORE}

if [ $? -ne 0 ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Error Hot Restore for DB taskcontrol:" $DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
    ## exit 1
fi

################################################################################


## Restore de c1bairesda_mant807 ###############################################

filename=$DATABASE_NAME2.sql
if [ ! -f $filename ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Hot Backup file (sql) non-existent for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
  ## exit 1
fi

echo "backupfolder: " $backupfolder
echo "filename: " $filename 
completefile=$backupfolder/$filename
echo "completefile: "$completefile

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2020!!" drop -f c1bairesda_mant807;' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2020!!" create c1bairesda_mant807;' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -e "grant all privileges on c1bairesda_mant807.* to 'root'@'localhost';"' >> ${PATH_BASE}${LOGRESTORE}

cat $completefile | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -D c1bairesda_mant807' >> ${PATH_BASE}${LOGRESTORE}

if [ $? -ne 0 ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Error while Hot Restore for DB Mantis: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
    ## exit 1
fi

################################################################################

## Restore de c1bairesda_chat_pro #############################################
filename=$DATABASE_NAME3.sql
if [ ! -f $filename ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Hot Backup file (sql) non-existent for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
  ## exit 1
fi

echo "backupfolder: "$backupfolder
echo "filename: "$filename
completefile=$backupfolder/$filename
echo "completefile: "$completefile

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2020!!" drop -f c1bairesda_chat_pro;' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2020!!" create c1bairesda_chat_pro;' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -e "grant all privileges on c1bairesda_chat_pro.* to 'root'@'localhost';"' >> ${PATH_BASE}${LOGRESTORE}

cat $completefile | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -D c1bairesda_chat_pro' >> ${PATH_BASE}${LOGRESTORE}

if [ $? -ne 0 ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Error while Hot Restore of DB chat_pro: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
    ## exit 1
fi

################################################################################


## si llego hasta aqui se hizo el restore hot completo, se cambia el owner y group 
## de las 3 bases a user mysql

sshpass -e ssh ${REMOTE_ROOT_USER}@${IP_ADDRESS} "cd /var/lib/mysql ; chown -R mysql:mysql c1bairesda_taskcontrol; chown -R mysql:mysql c1bairesda_mant807; chown -R mysql:mysql c1bairesda_chat_pro" 

if [ $? -ne 0 ]; then
  current_date_time=`date +%Y-%m-%d-%H:%M:%S`
  echo $current_date_time":------Error while changing permission for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
    ## exit 1
fi

## Otherwise all was fine
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":-----Restored Hot Backup for Landing OK!!: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}

## Envia mail al admin avisando que finalizo el restore del Hot Backup
echo "$DROPLET_NAME" |  mail -s "Hot Restore for Landing Finished OK!" support@taskcontrol.net

## exit 0

