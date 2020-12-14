#!/bin/bash
################################################################################
## Script de restore de hot backup del mailchat
## SE DEBERA CORRER SOLO BAJO PEDIDO LEGAL ESCRITO Y VALIDO DE PARTE DEL CLIENTE
## RFG: 26-12-2019
## CopyRight TaskControl LLC, 2019
###############################################################################

LOGRESTORE="hot_restore_mailchat.log"
PATH_BASE="/var/www/taskcontrol.net/web/provisioning/"
IP_ADDRESS="104.131.93.211"  ## CAMBIAR SI CAMBIA EL IP DEL MAILCHAT

## Descomentar para debugging
## set -x

if [ "$#" -ne 2 ]; then
  echo "Usage: hot_restore_mailchat.sh "Fecha" "Version" "
  echo "(ie. hot_restore_mailchat.sh "2019-12-24-17:44:19"  "19.03.001.001.001" )"
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
export REMOTE_ROOT_PASS='taskcontrol2019!!'
export REMOTE_USER='taskcontrol'
export SSHPASS='taskcontrol2019!!'
export PATH_LANDING='/var/www/taskcontrol.net/web/provisioning/'
export PATH_TMP='/var/www/taskcontrol.net/web/provisioning/temp/'

## seteos para MySQL 
export DB_BACKUP_HOT='/var/www/taskcontrol.net/web/provisioning/infra/mailchat/backups/hot/'
export MYSQL_HOST='localhost'
export MYSQL_PORT='3306'
export MYSQL_USER='root'
export MYSQL_PASSWORD='taskcontrol2019!!'
export BACKUP_RETAIN_DAYS=8   ## Number of days to keep local backup copy


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

## Base de Datos ROUNDCUBEMAIL (Informacion del modulo ROUNDCUBE)
export DATABASE_NAME6='roundcubemail'
export DB_USERNAME_ROUNDCUBEMAIL='root'
export DB_PASSWORD_ROUNDCUBEMAIL='taskcontrol2019!!'
export BACKUP_RETAIN_DAYS=8   ## Number of days to keep local backup copy
## ---------------------------------------------------------------------------------

## Elegimos el hot backup a restaurar en funcion de los datos pasados como argumento

DROPLET_NAME="mailchat"
FECHA=$1
VERSION=$2

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Restoring Hot Backup for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}

## Verificamos la existencia del directorio solicitado
fullbackupfolder=${DB_BACKUP_HOT}${FECHA}-${VERSION}

if [ ! -d $fullbackupfolder ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Backup Directory non-existent : "$fullbackupfolder >> ${PATH_BASE}${LOGRESTORE}
  ## exit 1
fi

current_date_time_start=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start":-----Comenzando Landing Hot Restore-----:"$DROPLET_NAME >> ${PATH_BASE}${LOGHOT}

current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
cd $DB_BACKUP_HOT

## Restore of VMAIL database (mails) ################

filename="$DATABASE_NAME1.sql"
if [ ! -f $fullbackupfolder/$filename ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Hot Backup file (sql) non-existent for DROPLET: "$DATABASE_NAME1 >> ${PATH_BASE}${LOGRESTORE}
  ## exit 1
fi

echo "backupfolder: " $fullbackupfolder
echo "filename: " $filename
completefile=$fullbackupfolder/$filename
echo "completefile: "$completefile

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2019!!" drop -f "'"$DATABASE_NAME1"'";' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2019!!" create "'"$DATABASE_NAME1"'";' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -e "grant all privileges on "'"$DATABASE_NAME1"'".* to 'root'@'localhost';"' 2>&1

cat $completefile | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -D "'"$DATABASE_NAME1"'"' >> ${PATH_BASE}${LOGRESTORE}

if [ $? -ne 0 ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Error Hot Restore for DB: " $DATABASE_NAME1 >> ${PATH_BASE}${LOGRESTORE}
   ## exit 1
fi

################################################################################


## Restore de amavisd (parte de IREDMAIL) ###############################################

filename="$DATABASE_NAME2.sql"
if [ ! -f $fullbackupfolder/$filename ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Hot Backup file (sql) non-existent for DROPLET: "$DATABASE_NAME2 >> ${PATH_BASE}${LOGRESTORE}
   ## exit 1
fi

echo "backupfolder: " $fullbackupfolder
echo "filename: " $filename
completefile=$fullbackupfolder/$filename
echo "completefile: "$completefile

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2019!!" drop -f "'"$DATABASE_NAME2"'";' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2019!!" create "'"$DATABASE_NAME2"'";' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -e "grant all privileges on "'"$DATABASE_NAME2"'".* to 'root'@'localhost';"' 2>&1

cat $completefile | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -D "'"$DATABASE_NAME2"'"' >> ${PATH_BASE}${LOGRESTORE}

if [ $? -ne 0 ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Error Hot Restore for DB: " $DATABASE_NAME2 >> ${PATH_BASE}${LOGRESTORE}
    ## exit 1
fi

################################################################################
################################################################################

## Restore de iredadmin #############################################

filename=$DATABASE_NAME3.sql
if [ ! -f $fullbackupfolder/$filename ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Hot Backup file (sql) non-existent for DATABASE: "$DATABASE_NAME3 >> ${PATH_BASE}${LOGRESTORE}
   ## exit 1
fi

echo "backupfolder: " $fullbackupfolder
echo "filename: " $filename
completefile=$fullbackupfolder/$filename
echo "completefile: "$completefile

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2019!!" drop -f "'"$DATABASE_NAME3"'";' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2019!!" create "'"$DATABASE_NAME3"'";' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -e "grant all privileges on "'"$DATABASE_NAME3"'".* to 'root'@'localhost';"' >> ${PATH_BASE}${LOGRESTORE}

cat $completefile | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -D "'"$DATABASE_NAME3"'"' >> ${PATH_BASE}${LOGRESTORE}

if [ $? -ne 0 ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Error while Hot Restore of DB: "$DATABASE_NAME3 >> ${PATH_BASE}${LOGRESTORE}
    ## exit 1
fi

################################################################################

## Restore de iredapd #####################################################

filename=$DATABASE_NAME4.sql
if [ ! -f $fullbackupfolder/$filename ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Hot Backup file (sql) non-existent for DATABASE: "$DATABASE_NAME4 >> ${PATH_BASE}${LOGRESTORE}
   ## exit 1
fi

echo "backupfolder: " $fullbackupfolder
echo "filename: " $filename
completefile=$fullbackupfolder/$filename
echo "completefile: "$completefile

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2019!!" drop -f "'"$DATABASE_NAME4"'";' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2019!!" create "'"$DATABASE_NAME4"'";' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -e "grant all privileges on "'"$DATABASE_NAME4"'".* to 'root'@'localhost';"' >> ${PATH_BASE}${LOGRESTORE}

cat $completefile | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -D "'"$DATABASE_NAME4"'"' >> ${PATH_BASE}${LOGRESTORE}

if [ $? -ne 0 ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Error while Hot Restore of DB: "$DATABASE_NAME4 >> ${PATH_BASE}${LOGRESTORE}
   ## exit 1
fi

################################################################################

## Restore de sogo ########################################################

filename=$DATABASE_NAME5.sql
if [ ! -f $fullbackupfolder/$filename ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Hot Backup file (sql) non-existent for DATABASE: "$DATABASE_NAME5 >> ${PATH_BASE}${LOGRESTORE}
  ##  exit 1
fi

echo "backupfolder: " $fullbackupfolder
echo "filename: " $filename
completefile=$fullbackupfolder/$filename
echo "completefile: "$completefile

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2019!!" drop -f "'"$DATABASE_NAME5"'";' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2019!!" create "'"$DATABASE_NAME5"'";' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -e "grant all privileges on "'"$DATABASE_NAME5"'".* to 'root'@'localhost';"' >> ${PATH_BASE}${LOGRESTORE}

cat $completefile | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -D "'"$DATABASE_NAME5"'"' >> ${PATH_BASE}${LOGRESTORE}

if [ $? -ne 0 ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Error while Hot Restore of DB: "$DATABASE_NAME5 >> ${PATH_BASE}${LOGRESTORE}
    ## exit 1
fi

################################## Restore de ROUNDCUBEMAIL ##############################################
filename=$DATABASE_NAME6.sql
if [ ! -f $fullbackupfolder/$filename ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":----- Hot Backup file (sql) non-existent for DATABASE: "$DATABASE_NAME6 >> ${PATH_BASE}${LOGRESTORE}
  ##  exit 1
fi

echo "backupfolder: " $fullbackupfolder
echo "filename: " $filename
completefile=$fullbackupfolder/$filename
echo "completefile: "$completefile

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2019!!" drop -f "'"$DATABASE_NAME6"'";' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysqladmin -u root -p"taskcontrol2019!!" create "'"$DATABASE_NAME6"'";' 2>&1
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -e "grant all privileges on "'"$DATABASE_NAME6"'".* to 'root'@'localhost';"' >> ${PATH_BASE}${LOGRESTORE}

cat $completefile | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -D "'"$DATABASE_NAME6"'"' >> ${PATH_BASE}${LOGRESTORE}

if [ $? -ne 0 ]; then
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Error while Hot Restore of DB: "$DATABASE_NAME6 >> ${PATH_BASE}${LOGRESTORE}
    ## exit 1
fi
################################################################################

## si llego hasta aqui se hizo el restore hot completo, se cambia el owner y group 
## de las 6 bases a user mysql

sshpass -e ssh ${REMOTE_ROOT_USER}@${IP_ADDRESS} "cd /var/lib/mysql ; sudo chown -R mysql:mysql vmail; chown -R mysql:mysql amavisd; chown -R mysql:mysql iredadmin; chown -R mysql:mysql iredapd; chown -R mysql:mysql sogo; chown -R mysql:mysql sogo;" 

if [ $? -ne 0 ]; then
  current_date_time=`date +%Y-%m-%d-%H:%M:%S`
  echo $current_date_time":------Error while changing permission for DROPLET: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
  echo "$DROPLET_NAME" |  mail -s "Hot Restore for MailChat Finished with ERRORS!" support@taskcontrol.net
  ## exit 1
else   
   ## Otherwise all was fine
   current_date_time=`date +%Y-%m-%d-%H:%M:%S`
   echo $current_date_time":-----Restored Hot Backup for MailChat OK!!: "$DROPLET_NAME >> ${PATH_BASE}${LOGRESTORE}
   ## Envia mail al admin avisando que finalizo el restore del Hot Backup
   echo "$DROPLET_NAME" |  mail -s "Hot Restore for MailChat Finished OK!" support@taskcontrol.net
fi

## exit 0
