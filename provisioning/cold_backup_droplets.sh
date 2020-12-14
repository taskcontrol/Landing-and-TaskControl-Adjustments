#!/bin/bash
## Script para hacer Cold Backup de droplets de clientes 
## RFG: 29-11-2019
## Lee el archivo de entrada Droplet_Data.txt
## Copyright TaskControl, LLC - 2019

## Descomentar para debugging
 set -x
## set +x
  
## Corro en environment para el script
## . token.sh


## -------------------- token.sh --------------------------------

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

## ------------------------------------------------------------

LOGCOLD="cold_backup_droplets.log"

if [ ! -f ${PATH_BASE}${LOGCOLD} ]; then
   touch ${PATH_BASE}${LOGCOLD}
fi


## Me posiciono en el home del usuario
cd $PATH_BASE

## Comenzamos el ciclo de recorrida de droplets existentes

current_date_time_start_backup=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start_backup":-----Comenzamos el ciclo de recorrida de droplets existentes..." >> ${PATH_BASE}${LOGCOLD}

## Contador de droplets y potenciales errores
declare -i total_droplets=0
declare -i total_droplets_ok=0
declare -i errors=0
declare -i size_total=0
declare -i minimumsize=0

if [ -f "${PATH_TMP}Droplet_Data.txt" ]; then
     rm -f "${PATH_TMP}Droplet_Data.txt"
fi

## Creamos el txt de los droplets activos

current_date_time_start=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start":-----Creamos el txt con los droplets activos..." >> ${PATH_BASE}${LOGCOLD}
 
/usr/bin/mysql -u ${MYSQL_LANDING_USER} -p${MYSQL_LANDING_PASS} --database bairesda_taskcontrol << EOF
SELECT mem_company, membership_id, actual_version, server_ip
FROM member_master WHERE membership_id > 0 and plan_expired = 0
INTO OUTFILE '${PATH_TMP}Droplet_Data.txt'
FIELDS TERMINATED BY ','
ENCLOSED BY ''
LINES TERMINATED BY '\n';
EOF

input_file=${PATH_TMP}Droplet_Data.txt

cat $input_file | while IFS=, read -r f1 f2 f3 f4
do

DROPLET_NAME="$f1"
PLAN="$f2"
case $PLAN in
    1)
    PLAN="Starter"
    ;;
    2)
    PLAN="Professional"
    ;;
    3)
    PLAN="Enterprise-One"
    ;;
esac
VERSION="$f3"
IP_ADDRESS="$f4"

current_date_time_start=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start":-----Comenzando COLD Backup Droplet-----:"$DROPLET_NAME >> ${PATH_BASE}${LOGCOLD}

current_date_time=`date +%Y-%m-%d-%H:%M:%S`

## Chequeo el directorio customers/cold donde estan todos los cold backups de este cliente

if [ ! -d "${DB_BACKUP_PATH}${DROPLET_NAME}/$PLAN/$VERSION/$current_date_time/Cold" ]; then
mkdir -p "${DB_BACKUP_PATH}${DROPLET_NAME}/$PLAN/$VERSION/$current_date_time/Cold"
directorio_output="${DB_BACKUP_PATH}${DROPLET_NAME}/$PLAN/$VERSION/$current_date_time/Cold"
fi

## Bajamos el mysql y zipeamos y transferimos la data
echo $current_date_time_start":---Bajando MySQL y Copiando los Datos del Droplet-----:"$DROPLET_NAME >> ${PATH_BASE}${LOGCOLD}

/usr/bin/sshpass -e ssh -p 22 ${REMOTE_ROOT_USER}@$IP_ADDRESS "systemctl stop mysql" &

if [ $? -eq 0 ]; then
      current_date_time=`date +%Y-%m-%d-%H:%M:%S`
      echo $current_date_time":---Se Bajo MySql de Droplet--:"$DROPLET_NAME"--Finalizo OK " >> ${PATH_BASE}${LOGCOLD}
else
	(( errors++ ))
      current_date_time=`date +%Y-%m-%d-%H:%M:%S`
      echo $current_date_time":--ERROR Bajando MySql del Droplet :"$DROPLET_NAME >> ${PATH_BASE}${LOGCOLD}
      exit 1
fi

## sshpass -p ${SSHPASS} rsync -v -e --force --compress -r ssh -p 22 ${REMOTE_ROOT_USER}@"$IP_ADDRESS":/var/lib/mysql/admin_task/  "$directorio_output" 

sshpass -e rsync -avzh ${REMOTE_ROOT_USER}@$IP_ADDRESS:/var/lib/mysql/ "$directorio_output" &

if [ $? -eq 0 ]; then
      current_date_time=`date +%Y-%m-%d-%H:%M:%S`
      echo $current_date_time":---Copia de directorio admin_task de Droplet--:"$DROPLET_NAME"--Finalizo OK " >> ${PATH_BASE}${LOGCOLD}
else
	(( errors++ ))
      current_date_time=`date +%Y-%m-%d-%H:%M:%S`
      echo $current_date_time":--ERROR al copiar directorio admin_task del Droplet :"$DROPLET_NAME >> ${PATH_BASE}${LOGCOLD}
      exit 1
fi

## Listo, levantamos el MySQL del cliente
/usr/bin/sshpass -e ssh -p 22 ${REMOTE_ROOT_USER}@$IP_ADDRESS "systemctl start mysql"  &

if [ $? -eq 0 ]; then
      (( total_droplets_ok++ ))
      current_date_time=`date +%Y-%m-%d-%H:%M:%S`
      echo $current_date_time":---COLD Backup de Droplet--:"$DROPLET_NAME"--Finalizo OK " >> ${PATH_BASE}${LOGCOLD}
else
      (( errors++ ))
      current_date_time=`date +%Y-%m-%d-%H:%M:%S`
      echo $current_date_time":--ERROR: Chequear COLD Backup del Droplet :"$DROPLET_NAME >> ${PATH_BASE}${LOGCOLD}
fi

(( total_droplets++ ))

#### Chequea que no haya mas de 4 COLD backups (1 x semana) del cliente y si hay los elimina
##find "${DB_BACKUP_PATH}${DROPLET_NAME}/$current_date_time/$PLAN/$VERSION/Cold" -type d -mtime +4 -name '*' -execdir rm -rdf -- '{}' \;

done

echo "COLD Backup Finished: Total Droplets--: "$total_droplets >> ${PATH_BASE}${LOGCOLD}

## Falta corregir el tiempo total del backup...no funciona .
## echo "Total Backup Time -----:"$TotalTime >> ${PATH_BASE}${LOGCOLD}

## 4- envia mail al de fin de corrida de backup al admin
if [ $errors -eq 0 ]; then
   echo "CUSTOMER COLD BACKUP Finished OK" | mail -s "Weekly CUSTOMERS COLD Backup Report" support@taskcontrol.net  
else
   echo "CUSTOMER COLD BACKUP Finished with errors - Please Check" | mail -s "Weekly CUSTOMERS COLD Backup Report" support@taskcontrol.net
fi

exit $errors

##  FIN ? ...maybe..but not today..
