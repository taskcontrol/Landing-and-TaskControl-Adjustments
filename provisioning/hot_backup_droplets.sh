#!/bin/bash
## Script para Hot Backup de droplets de clientes 
## RFG: 29-11-2019
## Lee el archivo de entrada Droplet_Data.txt
## Copyright TaskControl, LLC - 2019

## Descomentar para debugging
set -x

## set +x

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
export INFRA_ADDRESS='/var/www/taskcontrol.net/web/provisioning/infra/'
export PLANS_VERSION='/var/www/taskcontrol.net/web/provisioning/plans_versions/'
export PATH_LANDING='/var/www/taskcontrol.net/web/provisioning/infra/landing/'
export PATH_TMP='/var/www/taskcontrol.net/web/provisioning/customers/temp/'

## seteos para MySQL 
export DB_BACKUP_HOT='/var/www/taskcontrol.net/web/provisioning/customers/backups/hot/'

## Base a Backupear
export MYSQL_HOST='localhost'
export MYSQL_PORT='3306'
export MYSQL_USER='root'
export MYSQL_PASSWORD='taskcontrol2020!!'
export DATABASE_NAME='admin_task'

## Dias de Retencion del backup
export BACKUP_RETAIN_DAYS=8   ## Number of days to keep local backup copy

## Base Landing
export MYSQL_LANDING_USER='c1taskcontrol'
export MYSQL_LANDING_PASS='j6BRh3gN65tXnE'

## ------- fin token.sh ------

## Me posiciono en el directorio de backups hot
cd $DB_BACKUP_HOT

LOGHOT="hot_backup_droplets.log"

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

if [ -f ${PATH_TMP}"Droplet_Data.txt" ]; then
     rm -f ${PATH_TMP}"Droplet_Data.txt"
fi

## Creamos el txt de los droplets activos

current_date_time_start=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start":-----Creamos el txt con los droplets activos..." >> ${PATH_BASE}${LOGHOT} 

mysql -u root  -p"taskcontrol2020!!" --database c1bairesda_taskcontrol << EOF
## mysql -u ${MYSQL_LANDING_USER} -p"j6BRh3gN65tXnE" --database c1bairesda_taskcontrol << EOF
SELECT mem_company, membership_id, actual_version, server_ip
FROM member_master WHERE membership_id > 0 AND plan_expired = 0
AND server_ip != '' AND actual_version != ''
INTO OUTFILE '${PATH_TMP}Droplet_Data.txt'
FIELDS TERMINATED BY ','
ENCLOSED BY ''
LINES TERMINATED BY '\n';
EOF

input_file=${PATH_TMP}"Droplet_Data.txt"

## controla si hay datos en el Droplet_Data.txt
renglones= `cat ${input_file} | wc -l`
if [[ "$renglones" -le 4000 ]]; then
 	echo "No hay suficientes datos en Droplet_Data.txt. Favor Chequear!!"
 	((++errors))
## 	exit 1
fi

cat $input_file | while IFS=, read -r f1 f2 f3 f4 
do

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

DROPLET_NAME="$f1"
FECHA=`date +%Y-%m-%d-%H:%M:%S` 
VERSION="$f3"
IP_ADDRESS="$f4"

echo $current_date_time_start":-----Comenzando Customer Hot Backup Droplet-----:"$DROPLET_NAME >> ${PATH_BASE}${LOGHOT}

cd $DB_BACKUP_HOT
if [ ! -d "$FECHA-$DROPLET_NAME" ]; then
     mkdir -p "$FECHA-$DROPLET_NAME"
fi
        
filename="$DROPLET_NAME-$PLAN-$VERSION.sql"
backupfolder=$DB_BACKUP_HOT$FECHA-$DROPLET_NAME
fullbackupfile="$backupfolder/$filename"

echo "----------------------------------------"
echo "backupfolder: "$backupfolder
echo "fullbackupfile: "$fullbackupfile
echo "ipaddress: " $IP_ADDRESS
echo "----------------------------------------"

## /usr/bin/sshpass -e ssh -o StrictHostKeyChecking=no root@${IP_ADDRESS} 'mysqldump -u root -p"taskcontrol2020!!" --add-drop-database --add-drop-table --databases admin_task' > $fullbackupfile  2>&1 & | grep -v "Warning: Using a password"

 /usr/bin/sshpass -e ssh -o StrictHostKeyChecking=no taskcontrol@${IP_ADDRESS} 'sudo mysqldump -u root -p"taskcontrol2020!!" --add-drop-database --add-drop-table --databases admin_task' > $fullbackupfile  2>&1 & 


## Verifico que haya backupeado los datos efectivamente en el .sql
# sleep 5   ## tricky sleep, sino no alcanza a grabar los datos en el .sql y da error...
backup_ok=`cat ${fullbackupfile} | wc -l`

# if [[ "$backup_ok" -gt 4000 ]]; then
#      (( ++total_droplets_ok )) 
#      current_date_time=`date +%Y-%m-%d-%H:%M:%S`
#      echo $current_date_time":---Hot Backup de Droplet--:"$DROPLET_NAME"--Finalizo OK " >> ${PATH_BASE}${LOGHOT}
# else
#     (( ++errors ))
#     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
#     echo $current_date_time":--ERROR: No hay datos en el .sql - Chequear Hot Backup del Droplet :"$DROPLET_NAME >> ${PATH_BASE}${LOGHOT}
# fi     

## Contamos los droplets totales que procesamos (bien o mal)
(( ++total_droplets ))

done

echo "Backup Finished: Total of Customer Droplets Backuped OK---: "$total_droplets_ok >> ${PATH_BASE}${LOGHOT}
echo "Backup Finished: Total of Customer Droplets With Backup Errors---: "$errors >> ${PATH_BASE}${LOGHOT}
echo "Backup Finished: Total of Customer Droplets---: "$total_droplets >> ${PATH_BASE}${LOGHOT}

## 4- envia mail al fin de corrida de backup al admin
    if [[ "$errors" -eq 0 ]]; then
       ## Eliminar los hot backups de mas de ${BACKUP_RETAIN_DAYS} 
       ## reemplazar -print por -delete cuando se vea que funcione bien
       cd ${DB_BACKUP_HOT}
       if [ $? -eq 0 ]; then
              find . -mtime +${BACKUP_RETAIN_DAYS} -type d -print    
             ## find /var/www/taskcontrol.net/web/provisioning/customers/backups/hot/ -mtime +${BACKUP_RETAIN_DAYS} -type d -exec rm -rf {} +
       fi
       echo "CUSTOMERS DAILY HOT BACKUP Finished OK" | mail -s "DAILY CUSTOMERS HOT BACKUP Report" support@taskcontrol.net  
    else
       echo "CUSTOMERS DAILY HOT BACKUP Finished with errors - Please Check" | mail -s "DAILY CUSTOMERS HOT BACKUP Report" support@taskcontrol.net
    fi

exit $errors 

##  FIN ? ...maybe..but not today..
