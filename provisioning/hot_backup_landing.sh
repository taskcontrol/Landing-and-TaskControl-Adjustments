#!/bin/bash
## Script para Hot Backup de droplets de la landing
## RFG: 29-11-2019
## Copyright TaskControl, LLC - 2019

## Descomentar para debugging
set -x

## set +x

IP_ADDRESS="157.245.120.61"  ## cambiarla aqui cuando cambie el ip fijo
VERSION="v20.04.001.001.0001" ## cambiarla aqui cuando cambie la version

## Corremos el enviroment de claves y seteamos el PATH_BASE de los backups
## . token.sh

## ------- token.sh ------- 

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
export PATH_LANDING='/var/www/taskcontrol.net/web/provisioning/infra/landing/backups/hot/'
export PATH_TMP='/var/www/taskcontrol.net/web/provisioning/temp/'
export DB_BACKUP_HOT='/var/www/taskcontrol.net/web/provisioning/infra/landing/backups/hot/'

## seteos para MySQL 
export MYSQL_HOST='localhost'
export MYSQL_PORT='3306'
export MYSQL_USER='root'
## export MYSQL_PASSWORD='taskcontrol!!2020!!'
export MYSQL_PASSWORD='taskcontrol2020!!'

export DATABASE_NAME1='c1bairesda_taskcontrol'
export MYSQL_LANDING_USER='c1taskcontrol'
export MYSQL_LANDING_PASS='j6BRh3gN65tXnE'

export DATABASE_NAME2='c1bairesda_mant807'
export DATABASE_USER2='c1mant807'
export DATABASE_PASS2='30PXLTS0(!'

export DATABASE_NAME3='c1bairesda_chat_pro'
export DATABASE_USER3='c1chatpro'
export DATABASE_PASS3='taskcontrol2019!!'

## Number of days to keep local backup copy
export BACKUP_RETAIN_DAYS=8
## ------- fin token.sh ------

## Me posiciono en el home del usuario
cd $PATH_BASE

LOGHOT="hot_backup_landing.log"

if [ ! -f ${PATH_BASE}${LOGHOT} ]; then
   touch ${PATH_BASE}${LOGHOT}
fi


## Comenzamos el ciclo de recorrida de droplets existentes

current_date_time_start_backup=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start_backup":-----Comenzamos el ciclo de recorrida de droplets existentes..." >> ${PATH_BASE}${LOGHOT}
 
## Contador de droplets y potenciales errores
total_droplets=0
total_droplets_ok=0
errors=0
minimumsize=0
actualsize=0
archivo=0

current_date_time_start=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start":-----Comenzando Landing Hot Backup Droplet-----:"$DROPLET_NAME >> ${PATH_BASE}${LOGHOT}

current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
FECHA=`date +%Y-%m-%d-%H:%M:%S` 

cd $DB_BACKUP_HOT
if [ ! -d $FECHA-$VERSION ]; then
     mkdir -p $FECHA-$VERSION
fi
       
## ---- BBDD landing taskcontrol
filename=$DATABASE_NAME1.sql
backupfolder=$FECHA-$VERSION
fullbackupfile=$backupfolder/$filename
sshpass -e ssh ${REMOTE_USER}@$IP_ADDRESS "mysqldump -u ${MYSQL_USER} -p'${MYSQL_PASSWORD}' --add-drop-database --add-drop-table --databases ${DATABASE_NAME1}" > $fullbackupfile 2>${PATH_BASE}${LOGHOT}
##-----------------------------


## ---- BBDD landing mantis
filename=$DATABASE_NAME2.sql
backupfolder=$FECHA-$VERSION
fullbackupfile=$backupfolder/$filename
sshpass -e ssh ${REMOTE_USER}@$IP_ADDRESS "mysqldump -u ${MYSQL_USER} -p'${MYSQL_PASSWORD}' --add-drop-database --add-drop-table --databases ${DATABASE_NAME2}" > $fullbackupfile 2>${PATH_BASE}${LOGHOT} 
##-----------------------------


## ---- BBDD landing livechat
filename=$DATABASE_NAME3.sql
backupfolder=$FECHA-$VERSION
fullbackupfile=$backupfolder/$filename
sshpass -e ssh ${REMOTE_USER}@$IP_ADDRESS "mysqldump -u ${MYSQL_USER} -p'${MYSQL_PASSWORD}' --add-drop-database --add-drop-table --databases ${DATABASE_NAME3}" > $fullbackupfile 2>${PATH_BASE}${LOGHOT}
##-----------------------------


if [ $? -eq 0 ]; then
     echo "Vuelvo los permisos a web4:client1 en los directorios de backup"
     sudo chown -R web4:client1 * < "/var/www/taskcontrol.net/web/provisioning/answeryes.txt"  2>>${PATH_BASE}${LOGHOT} 
     ((++total_droplets_ok)) 
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":---Hot Backup de Landing Droplet--:"$DROPLET_NAME"--Finalizo OK " >> ${PATH_BASE}${LOGHOT}
else
     ((++errors))
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":--ERROR: Chequear Hot Backup de Landing Droplet :"$DROPLET_NAME >> ${PATH_BASE}${LOGHOT}
fi     


## Contamos los droplets totales que procesamos (bien o mal)
((++total_droplets))


echo "Backup Finished: Total of Customer Droplets Backuped OK---: "$total_droplets_ok >> ${PATH_BASE}${LOGHOT}
echo "Backup Finished: Total of Customer Droplets With Backup Errors---: "$errors >> ${PATH_BASE}${LOGHOT}
echo "Backup Finished: Total of Customer Droplets---: "$total_droplets >> ${PATH_BASE}${LOGHOT}

## Falta corregir el tiempo total del backup...no funciona .
## echo "Total Backup Time -----:"$TotalTime >> ${PATH_BASE}${LOGHOT}

## 4- envia mail al de fin de corrida de backup al admin
if [[ "$errors" -eq 0 ]]; then
   cd ${DB_BACKUP_HOT}
   if [ $? -eq 0 ]; then  ## Estoy en el directorio correcto
      ## find . -mtime +${BACKUP_RETAIN_DAYS} -type d -print
      find . -mtime +${BACKUP_RETAIN_DAYS} -type d -exec rm -rf {} +
   fi
   echo "DAILY LANDING HOT BACKUP Finished OK" | mail -s "DAILY LANDING HOT BACKUP Report" support@taskcontrol.net  
else
   echo "DAILY LANDING HOT BACKUP Finished with errors - Please Check" | mail -s "DAILY LANDING HOT BACKUP Report" support@taskcontrol.net
fi

## exit $errors 

##  FIN ? ...maybe..but not today..
