#!/bin/bash 
## Script para hacer Cold Backup del droplet de la mailchat ## RFG: 18-01-2020
## Lee el archivo de entrada Droplet_Data.txt
## 13-04-2020
## Copyright TaskControl, LLC - 2020

## Descomentar para debugging
## set -x
set +x

## Corro el environment para el script
## . token.sh

## --------------------------- token.sh ---------------------------
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
export MYSQL_MAILCHAT_USER='c1taskcontrol'
export MYSQL_MAILCHAT_PASS='j6BRh3gN65tXnE'
## ----------------------------------------------------------------

DROPLET_NAME="mailchat.taskcontrol.net"
LOGCOLD="cold_backup_mailchat_droplets.log"
LOCAL_IP=`cat /etc/hosts | grep prd01-taskcontrol.ddns.net | awk '{print $1}'`

if [ ! -f ${PATH_MAILCHAT}${LOGCOLD} ]; then
   touch ${PATH_MAILCHAT}${LOGCOLD}
fi


## Me posiciono en el home de infra de la mailchat page
cd ${PATH_MAILCHAT}${DROPLET_NAME}


## Comenzamos el ciclo de recorrida de droplets existentes
current_date_time_start_backup=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start_backup":-----Comenzamos el ciclo de recorrida de droplets existentes..." >> ${PATH_MAILCHAT}${LOGCOLD}


## Contador de droplets y potenciales errores
total_droplets=0
total_droplets_ok=0
errors=0
size_total=0
minimumsize=0

if [ -f ${PATH_MAILCHAT}"Droplet_Infra.txt" ]; then
     rm -f ${PATH_MAILCHAT}"Droplet_Infra.txt"
fi

## Creamos el txt de los droplets activos

current_date_time_start=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start":-----leemos el txt con los droplets activos..." >> ${PATH_MAILCHAT}${LOGCOLD}
 
input_file=${PATH_MAILCHAT}"Droplet_Infra.txt"

cat $input_file | while IFS=, read -r f1 f2 f3 
do

DROPLET_NAME="taskcontrol.net"
FECHA="$f1"
VERSION="$f2"
IP_ADDRESS="$f3"

current_date_time_start=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start":-----Comenzando COLD Backup Droplet-----:"$DROPLET_NAME >> ${PATH_MAILCHAT}${LOGCOLD}

current_date_time=`date +%Y-%m-%d-%H:%M:%S`

## Chequeo el directorio customers/cold donde estan todos los cold backups de este droplet
if [ ! -d ${PATH_MAILCHAT}${DROPLET_NAME}/${FECHA}-${VERSION}/"Cold" ]; then
mkdir -p ${PATH_MAILCHAT}${DROPLET_NAME}/${FECHA}-${VERSION}/"Cold"
directorio_output=${PATH_MAILCHAT}${DROPLET_NAME}/${FECHA}-${VERSION}/"Cold"
fi

## Bajamos el mysql y zipeamos y transferimos la data
echo $current_date_time_start":---Bajando MySQL y Copiando los Datos del Droplet-----:"$DROPLET_NAME >> ${PATH_MAILCHAT}${LOGCOLD}

sshpass -e ssh root@"$IP_ADDRESS" "service mysql stop" 

sshpass -p ${SSHPASS} rsync -v -e --force --compress -r -e ssh root@"$IP_ADDRESS":/var/lib/mysql  "$directorio_output" 

## Listo, levantamos el MySQL del cliente
OUTPUT=`sshpass -e ssh ${REMOTE_USER}@"$IP_ADDRESS" "service mysql start ; mysqladmin -u ${MYSQL_USER} -p${MYSQL_PASSWORD} 2>/dev/null status" | awk '{ print $1 }'` 

if [ $OUTPUT == "Uptime:" ]; then
    echo $current_date_time_start":---MySQL Levantado -----:"$DROPLET_NAME >> ${PATH_MAILCHAT}${LOGCOLD}
else
    echo $current_date_time_start":---Chequear estado de  MySQL !!!----: "$DROPLET_NAME >> ${PATH_MAILCHAT}${LOGCOLD}
fi

if [ $? -eq 0 ]; then
	(( total_droplets_ok++ ))
      current_date_time=`date +%Y-%m-%d-%H:%M:%S`
      echo $current_date_time":---COLD Backup de Droplet--:"$DROPLET_NAME"--Finalizo OK " >> ${PATH_MAILCHAT}${LOGCOLD}
else
	(( errors++ ))
      current_date_time=`date +%Y-%m-%d-%H:%M:%S`
      echo $current_date_time":--ERROR: Chequear COLD Backup de la mailchat, Droplet :"$DROPLET_NAME >> ${PATH_MAILCHAT}${LOGCOLD}
fi

(( total_droplets++ ))

### Chequea que no haya mas de 4 COLD backups (1 x semana) del droplet y si hay, elimina los sobrantes
## find "${PATH_MAILCHAT}/$FECHA-$VERSION/Cold/mysql" -type d -mtime +4 -name 'mysql*' -execdir rm -rdf -- '{}' \;

done

echo "COLD Backup Finished: Total Droplets--: "$total_droplets >> ${PATH_MAILCHAT}${LOGCOLD}

## Falta corregir el tiempo total del backup...no funciona .
## echo "Total Backup Time -----:"$TotalTime >> ${PATH_MAILCHAT}${LOGCOLD}

## 4- envia mail al de fin de corrida de backup al admin
if [ !$errors ]; then
   echo "MAILCHAT COLD BACKUP Finished OK" | mail -s "Weekly MailChat COLD Backup Report" support@taskcontrol.net  
else
   echo "MAILCHAT COLD BACKUP Finished with errors - Please Check" | mail -s "Weekly MailChat COLD Backup Report" support@taskcontrol.net
fi

exit $errors

##  FIN ? ...maybe..but not today..
