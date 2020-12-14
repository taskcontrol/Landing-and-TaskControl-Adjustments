## Script de restore de cold backup (base admin_task)
## Se deberia correr SOLO bajo pedido legal del cliente
## RFG: 26-12-2019
## CopyRight TaskControl LLC, 2019
## Se llama con los parametros "DropletName" "Plan" "Version" "Fecha IP_Address"

LOGRESTORE=${PATH_BASE}cold_restore_droplet.log

## Descomentar para debugging
set -x

if [ "$#" -ne 5 ]
then
  echo "Usage: cold_restore_droplet.sh "DropletName" "Plan" "Version" "Date" "IP_Address""
  echo "(ie. cold_restore_droplet.sh "MyCompany" "Starter" "v19.03.001.001.001" "2019-12-24-17:44:19" "157.245.222.202" "
  sleep 10
  exit 1
fi

if [ ! -f ${LOGRESTORE} ]; then
   touch ${LOGRESTORE}
fi

## Corremos el enviroment de claves
## . token.sh

## ---------------------------------- token.sh ---------------------------------------
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
export PATH_LANDING='/var/www/taskcontrol.net/web/provisioning/infra/landing/'
export PATH_TMP='/var/www/taskcontrol.net/web/provisioning/temp/'

## seteos para MySQL 
export DB_BACKUP_PATH='/var/www/taskcontrol.net/web/provisioning/customers/'
export MYSQL_HOST='localhost'
export MYSQL_PORT='3306'
export MYSQL_USER='root'
export MYSQL_PASSWORD='taskcontrol2020!!'
export DATABASE_NAME='admin_task'
export BACKUP_RETAIN_DAYS=7   ## Number of days to keep local backup copy
export MYSQL_LANDING_USER='c1taskcontrol'
export MYSQL_LANDING_PASS='j6BRh3gN65tXnE'
## ----------------------------------------------------------------------------------

## Elegimos el cold backup a restaurar en funcion de los datos pasados como argumento

DROPLET_NAME=$1
PLAN=$2
VERSION=$3
FECHA=$4
IP_ADDRESS=$5

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Restoring Cold Backup for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}

## Verificamos la existencia del directorio solicitado
backupfolder="${DB_BACKUP_PATH}$DROPLET_NAME/$PLAN/$VERSION/$FECHA/Cold/"

if [ ! -d $backupfolder ]; then
  current_date_time=`date +%Y-%m-%d-%H:%M:%S`
  echo $current_date_time":----- Cold Backup Directory non-existent for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}
  exit 1
fi

cd $backupfolder
## number_of_files=`ls -ls | wc -l`

## if [ $number_of_files -ne 22 ]; then
## current_date_time=`date +%Y-%m-%d %H:%M:%S`
## echo $current_date_time":---- Cold Backup file con diferencia en nro de archivos en DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}
## exit 1
## fi

## Hacemos el restore del cold en la base del cliente

echo $current_date_time_start":---Bajando MySQL y Copiando los Datos hacia el Droplet-----:"$DROPLET_NAME >> ${LOGRESTORE}

/usr/bin/sshpass -e /usr/bin/ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS "systemctl stop mysql"

if [ $? -ne 0 ]; then
  current_date_time=`date +%Y-%m-%d-%H:%M:%S`
  echo $current_date_time":------Errors while shutdown the DB for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}
  exit 1
fi

## Restauramos los datos de /var/lib/mysql/admin_task hacia el droplet 
## rsync -v -e --force --compress -r --delete sshpass -p ${SSHPASS} ssh $backupfile ${REMOTE_ROOT_USER}@"$IP_ADDRESS":/var/lib/mysql/admin_task

/usr/bin/sshpass -e /usr/bin/rsync -avz $backupfolder ${REMOTE_ROOT_USER}@$IP_ADDRESS:/var/lib/mysql/

if [ $? -ne 0 ]; then
   echo $current_date_time":-----Errors while restoring cold for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}
   exit 1
else
   ## si llego hasta aqui se hizo el restore cold completo, se cambia el owner y group a mysql
  /usr/bin/sshpass -e /usr/bin/ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS "cd /var/lib/ ; chown -R mysql:mysql mysql"
   if [ $? -ne 0 ]; then
      echo $current_date_time":-----Errors while changing owners & groups for DROPLET: "$DROPLET_NAME >> ${LOGRESTORE}
       exit 1
   else
      echo $current_date_time":----Data Restore OK for DROPLET: "$DROPLET_NAME  

   fi
fi

## Si llego hasta aqui, copio toda la data y cambio el owner y group a mysql
## Entonces, levantamos el MySQL
/usr/bin/sshpass -e /usr/bin/ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS "systemctl start mysql" 

## remote_number_of_files=`sshpass -e ssh ${REMOTE_USER}@"$IP_ADDRESS" "ls -ls /var/lib/mysql | wc -l"`

if [ $? -eq 0 ]; then
    echo $current_date_time_start":---MySQL Levantado OK -----:"$DROPLET_NAME >> ${LOGRESTORE}
else
    echo $current_date_time_start":---Chequear estado de  MySQL !!!----: "$DROPLET_NAME >> ${LOGRESTORE}
    exit 1
fi

## Otherwise all was fine
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":-----Restored Cold Backup for DROPLET OK!!: "$DROPLET_NAME >> ${LOGRESTORE}

## Envia mail al admin avisando que finalizo el restore del Cold Backup
echo "$DROPLET_NAME" | mail -s "Restore Cold Backup Finished OK!" support@taskcontrol.net 

exit 0

## FIN: Maybe...but not today...
