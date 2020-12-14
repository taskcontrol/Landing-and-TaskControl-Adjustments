#!/bin/bash
## Script para Hot Backup de droplet de la mailchat 
## RFG: 13-04-2020
## Copyright TaskControl, LLC - 2020

## Descomentar para debugging
 set -x
## set +x

IP_ADDRESS="104.131.93.211"
VERSION="20.03.001.001.0001"

## Corremos el enviroment de claves y seteamos el PATH_MAILCHAT de los backups
## . token.sh

## ---------------------------------- token.sh ------------------------------
export DO_TOKEN=e6b3f9f8bc8dccca7afbc8dbb0dcb7c068b0e52e41e879f00735a019b5054b6f
export SPACES_KEY=L25ZD2V62OE7ZJHZOLUJ
export SPACES_SECRET=x/T3nbjCOLiw21xTYbsK40hxLEQ0CSxNWZBYdmp1+Mg
export ENDPOINT="nyc3.digitaloceanspaces.com"
export SPACENAME="taskcontrol-10-2019"
export SPACENAME_ENDPOINT="https://taskcontrol-10-2019.nyc3.digitaloceanspaces.com/"
export REMOTE_ROOT_USER='root'
export REMOTE_ROOT_PASS='taskcontrol2019!!'
export REMOTE_USER='taskcontrol'
export SSHPASS='taskcontrol2019!!'
export PATH_BASE='/var/www/taskcontrol.net/web/provisioning/'
export INFRA_ADDRESS='/var/www/taskcontrol.net/web/provisioning/infra/'
export PLANS_VERSION='/var/www/taskcontrol.net/web/provisioning/plans_versions/'
export PATH_MAILCHAT='/var/www/taskcontrol.net/web/provisioning/infra/mailchat/backups/hot/'
export PATH_TMP='/var/www/taskcontrol.net/web/provisioning/temp/'
export DB_BACKUP_HOT='/var/www/taskcontrol.net/web/provisioning/infra/mailchat/backups/hot/'

## seteos para MySQL 
export MYSQL_HOST='localhost'
export DB_CONNECTION='mysql'
export MYSQL_PORT='3306'

## Base de mail VMAIL (donde se almacenan los mails y la base de datos del API server)
export DATABASE_NAME1='vmail'
export DB_USERNAME_VMAIL='root'
export DB_PASSWORD_VMAIL='taskcontrol2019!!'

## Base AMAVISD (parte de IREDMAIL)
export DATABASE_NAME2='amavisd' 
export DB_USERNMAME_AMAVISD='root' 
export DB_PASSWORD_AMAVISD='taskcontrol2019!!'

## Base de Datos IREDADMIN (Informacion de los admin de iredmail)
export DATABASE_NAME3='iredadmin'
export DB_USERNAME_IREDADMIN='root'
export DB_PASSWORD_IREDADMIN='taskcontrol2019!!'

## Base de Datos IREDAPD (Informacion de los whitelist y blacklist de mails)
export DATABASE_NAME4='iredapd'
export DB_USERNAME_IREDAPD='root'
export DB_PASSWORD_IREDAPD='taskcontrol2019!!'

## Base de Datos SOGO (Informacion de los usuarios de SOGO)
export DATABASE_NAME5='sogo'
export DB_USERNAME_SOGO='root'
export DB_PASSWORD_SOGO='taskcontrol2019!!'

## Base de Datos ROCKETCHAT (Todos los users y data de rocketchat)
export DATABASE_NAME6='roundcubemail'
export DB_USERNAME_ROUNDCUBEMAIL='root'
export DB_PASSWORD_ROUNDCUBEMAIL='taskcontrol2019!!'

export BACKUP_RETAIN_DAYS=8   ## Number of days to keep local backup copy
## --------------------------------------------------------------------------

LOGHOT="hot_backup_mailchat.log"

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
FECHA=`date +%Y-%m-%d-%H:%M:%S` 

echo $current_date_time_start":-----Comenzando Landing Hot Backup Droplet-----:"$DROPLET_NAME >> ${PATH_BASE}${LOGHOT}
current_date_time=`date +%Y-%m-%d-%H:%M:%S` 

## Me posiciono en el home de infraestructura/mailchat
cd $DB_BACKUP_HOT
if [ ! -d "$FECHA-$VERSION" ]; then
   mkdir $FECHA-$VERSION
fi

## ---- BBDD Mail -------------
filename=$DATABASE_NAME1.sql
backupfolder=$FECHA-$VERSION
fullbackupfile=$backupfolder/$filename
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS "mysqldump -u ${DB_USERNAME_VMAIL} -p"${DB_PASSWORD_VMAIL}" --add-drop-database --add-drop-table --databases ${DATABASE_NAME1}" > $fullbackupfile 2>>${PATH_BASE}${LOGHOT}
##----------------------------

echo "backupeo  vmail"
       
## ---- BBDD AMAVISD -------
filename=$DATABASE_NAME2.sql
backupfolder=$FECHA-$VERSION
fullbackupfile=$backupfolder/$filename
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS "mysqldump -u ${DB_USERNAME_AMAVISD} -p"${DB_PASSWORD_AMAVISD}" --add-drop-database --add-drop-table  --databases ${DATABASE_NAME2}" > $fullbackupfile 2>>${PATH_BASE}${LOGHOT}
##-----------------------------


echo "backupeo  amavisd"

## ---- BBDD IREDADMIN -----------
filename=$DATABASE_NAME3.sql
backupfolder=$FECHA-$VERSION
fullbackupfile=$backupfolder/$filename
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS "mysqldump -u ${DB_USERNAME_IREDADMIN} -p"${DB_PASSWORD_IREDADMIN}" --add-drop-database --add-drop-table --databases ${DATABASE_NAME3}" > $fullbackupfile 2>>${PATH_BASE}${LOGHOT}
##-----------------------------


echo "backupeo iredadmin"

## ---- BBDD IREDAPD -----------
filename=$DATABASE_NAME4.sql
backupfolder=$FECHA-$VERSION
fullbackupfile=$backupfolder/$filename
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS "mysqldump -u ${DB_USERNAME_IREDAPD} -p"${DB_PASSWORD_IREDAPD}" --add-drop-database --add-drop-table  --databases ${DATABASE_NAME4}" > $fullbackupfile 2>>${PATH_BASE}${LOGHOT}
##-----------------------------


echo "backupeado iredadp"

## ---- BBDD SOGO -------------
filename=$DATABASE_NAME5.sql
backupfolder=$FECHA-$VERSION
fullbackupfile=$backupfolder/$filename
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS "mysqldump -u ${DB_USERNAME_SOGO} -p"${DB_PASSWORD_SOGO}" --add-drop-database --add-drop-table  --databases ${DATABASE_NAME5}" > $fullbackupfile 2>>${PATH_BASE}${LOGHOT}
##-----------------------------


echo "backupeado sogo"

## ---- BBDD ROUNDCUBEMAIL -------
filename=$DATABASE_NAME6.sql
backupfolder=$FECHA-$VERSION
fullbackupfile=$backupfolder/$filename
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS "mysqldump -u ${DB_USERNAME_ROUNDCUBEMAIL} -p"${DB_PASSWORD_ROUNDCUBEMAIL}" --add-drop-database --add-drop-table --databases ${DATABASE_NAME6}" > $fullbackupfile 2>>${PATH_BASE}${LOGHOT}
##-----------------------------

echo "backupeado roundcubemail"

echo "Chequea que los backups tengan datos, sino hay que revisar que paso.."

# SIZEVMAIL=`wc -c $backupfolder/$DATABASE_NAME1.sql | awk '{print $1}'` 
# SIZEAMAVISD=`wc -c $backupfolder/$DATABASE_NAME2.sql | awk '{print $1}'` 
# SIZEIREDADMIN=`wc -c $backupfolder/$DATABASE_NAME3.sql | awk '{print $1}'` 
# SIZEIREDADP=`wc -c $backupfolder/$DATABASE_NAME4.sql | awk '{print $1}'` 
# SIZESOGO=`wc -c $backupfolder/$DATABASE_NAME5.sql | awk '{print $1}'` 
# SIZEROUNDCUBE=`wc -c $backupfolder/$DATABASE_NAME6.sql | awk '{print $1}'` 

# if [ [$SIZEVMAIL -eq 0] || [$SIZEAMAVISD -eq 0] || [$SIZEIREDADMIN -eq 0] || [$SIZEIREDADP -eq 0] ]; then
#     echo "Los backups no tienen datos, por favor verificar!!"
#     exit
# fi


if [ $? -eq 0 ]; then
     ((++total_droplets_ok))
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":---Hot Backup de MailChat Droplet--:"$DROPLET_NAME"--Finalizo OK " >> ${PATH_BASE}${LOGHOT}
else
    ((++errors))
    current_date_time=`date +%Y-%m-%d-%H:%M:%S`
    echo $current_date_time":--ERROR: Chequear Hot Backup de MailChat Droplet :"$DROPLET_NAME >> ${PATH_BASE}${LOGHOT}
fi

## Contamos los droplets totales que procesamos (bien o mal)
((++total_droplets))

echo "Backup Finished: Total of MailChat Droplets Backuped OK---: "$total_droplets_ok >> ${PATH_BASE}${LOGHOT}
echo "Backup Finished: Total of MailChat Droplets With Backup Errors---: "$errors >> ${PATH_BASE}${LOGHOT}
echo "Backup Finished: Total of MailChat Droplets---: "$total_droplets >> ${PATH_BASE}${LOGHOT}

## Falta corregir el tiempo total del backup...no funciona .
## echo "Total Backup Time -----:"$TotalTime >> ${PATH_MAILCHAT}${LOGHOT}


## 4- envia mail al de fin de corrida de backup al admin
if [[ "$errors" -eq 0 ]]; then
   cd ${DB_BACKUP_HOT}
   if [ $? -eq 0 ]; then ## Estoy en el directorio correcto
      ## find . -mtime +${BACKUP_RETAIN_DAYS} -type d -print
      find . -mtime +${BACKUP_RETAIN_DAYS} -type d -exec rm -rf {} + 
   fi
   echo "DAILY MAILCHAT HOT BACKUP Finished OK" | mail -s "DAILY MAILCHAT HOT BACKUP Report" support@taskcontrol.net  
else
   echo "DAILY MAILCHAT HOT BACKUP Finished with errors - Please Check" | mail -s "DAILY MAILCHAT HOT BACKUP Report" support@taskcontrol.net
fi

## exit $errors 

##  FIN ? ...maybe..but not today..TOP GUN II
