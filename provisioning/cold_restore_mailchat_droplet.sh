## Script de restore de cold backup de la mailchat
## RFG: 13-04-2020
## CopyRight TaskControl LLC, 2020
## Se llama con los parametros   "Fecha Version IP_Address"


## Descomentar para debugging
set -x

if [ "$#" -ne 3 ]
then
  echo "Usage: cold_restore_mailchat_droplet.sh "Date" "Version" "IP_Address" "
  echo "(ie. cold_restore_mailchat_droplet.sh "2019-12-24" "v19.03.001.001.001" "157.245.222.202" "
  sleep 10
  exit
fi

## Corremos el enviroment de claves
## . token.sh

## --------------------------------- token.sh ---------------------------------
export DO_TOKEN=e6b3f9f8bc8dccca7afbc8dbb0dcb7c068b0e52e41e879f00735a019b5054b6f
export SPACES_KEY=L25ZD2V62OE7ZJHZOLUJ
export SPACES_SECRET=x/T3nbjCOLiw21xTYbsK40hxLEQ0CSxNWZBYdmp1+Mg
export ENDPOINT="nyc3.cdn.digitaloceanspaces.com"
export SPACENAME="taskcontrol-10-2019"
export SPACENAME_ENDPOINT="https://taskcontrol-10-2019.nyc3.cdn.digitaloceanspaces.com/"
export REMOTE_ROOT_USER='root'
export REMOTE_ROOT_PASS='taskcontrol2020!!'
export REMOTE_USER='taskcontrol'
export SSHPASS=taskcontrol2020!!
export PATH_BASE='/var/www/taskcontrol.net/web/provisioning/'
export INFRA_ADDRESS='/var/www/taskcontrol.net/web/provisioning/infra/'
export PLANS_VERSION='/var/www/taskcontrol.net/web/provisioning/plans_versions/'
export PATH_MAILCHAT='/var/www/taskcontrol.net/web/provisioning/infra/mailchat/'
export PATH_TMP='/var/www/taskcontrol.net/web/provisioning/temp/'

## seteos para MySQL 
export DB_BACKUP_PATH='/var/www/taskcontrol.net/web/provisioning/customers/'
export MYSQL_HOST='localhost'
export MYSQL_PORT='3306'
export MYSQL_USER='root'
export MYSQL_PASSWORD='taskcontrol2020!!'
export DATABASE_NAME='admin_task'
export BACKUP_RETAIN_DAYS=7   ## Number of days to keep local backup copy
export MYSQL_MAILCHAT_USER='c1bairesdate'
export MYSQL_MAILCHAT_PASS='j6BRh3gN65tXnE'
## ---------------------------------------------------------------------------

LOGRESTORE=${PATH_BASE}"cold_restore_mailchat_droplet.log"

if [ ! -f ${LOGRESTORE} ]; then
   touch ${LOGRESTORE}
fi


## Elegimos el cold backup a restaurar en funcion de los datos pasados como argumento

DROPLET_NAME="mailchat.taskcontrol.net"
FECHA=$1
VERSION=$2
IP_ADDRESS=$3

current_date_time=`date +%Y-%m-%d %H:%M:%S`
echo $current_date_time":------Restoring Cold Backup for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}

## Verificamos la existencia del directorio solicitado
backupfolder="${PATH_MAILCHAT}${DROPLET_NAME}/$FECHA-$VERSION/Cold/mysql"

if [ ! -d $backupfolder ]; then
 current_date_time=`date +%Y-%m-%d %H:%M:%S`
 echo $current_date_time":----- Cold Backup Directory non-existent for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}
 exit 1
fi

cd $backupfolder

## Hacemos el restore del cold en la base de la mailchat
echo $current_date_time_start":---Bajando MySQL y Copiando los Datos hacia el Droplet-----:" $DROPLET_NAME >> ${PATH_MAILCHAT}${LOGCOLD}

sshpass -e ssh root@"$IP_ADDRESS" "service mysql stop"

if [ $? -ne 0 ]; then
 current_date_time=`date +%Y-%m-%d %H:%M:%S`
 echo $current_date_time":------Errors while shutdown the DB for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}
 exit 1
fi


## Restauramos los datos de /var/lib/mysql hacia el droplet 
rsync -v -e --force --compress -r --delete sshpass -p ${SSHPASS} ssh $backupfile root@"$IP_ADDRESS":/var/lib
if [ $? -ne 0 ]; then
   echo $current_date_time":-----Errors while restoring cold for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}
   exit 1
else
   ## si llego hasta aqui se hizo el restore cold completo, se cambia el owner y group a mysql
   sshpass -e ssh root@"$IP_ADDRESS" "cd /var/lib/mysql ; chown -R mysql:mysql *"
   if [ $? -ne 0 ]; then
     echo $current_date_time":-----Errors while changing owners & groups for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}
     exit 1
   else
     echo $current_date_time":-----Data Restore OK for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}
   fi
fi


## Si llego hasta aqui, copio toda la data y cambio el owner y group a mysql
## Entonces, levantamos el MySQL
sshpass -e ssh ${REMOTE_USER}@"$IP_ADDRESS" "service mysql start ; mysqladmin -u ${MYSQL_USER} -p${MYSQL_PASSWORD} 2>/dev/null status" 

## remote_number_of_files=`sshpass -e ssh ${REMOTE_USER}@"$IP_ADDRESS" "ls -ls /var/lib/mysql | wc -l"`

if [ $? -eq 0 ]; then
    echo $current_date_time_start":---MySQL Levantado OK -----:"$DROPLET_NAME >> ${PATH_MAILCHAT}${LOGCOLD}
else
    echo $current_date_time_start":---Chequear estado de  MySQL !!!----: "$DROPLET_NAME >> ${PATH_MAILCHAT}${LOGCOLD}
    exit 1
fi

## Otherwise all was fine
current_date_time=`date +%Y-%m-%d %H:%M:%S`
echo $current_date_time":-----Restored MailChat Cold Backup for DROPLET OK!!: "$DROPLET_NAME >> ${LOGRESTORE}

## Envia mail al admin avisando que finalizo el restore del Cold Backup
echo "$DROPLET_NAME" | mail -s "Restore for Cold Backup Finished OK!" support@taskcontrol.net

exit 0

## FIN: Maybe...but not today...
