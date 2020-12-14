#!/bin/bash 
## Script para hacer Upgrade droplets de clientes (de plan y/o de version) 
## RFG: 27-12-2019 ## Lee el archivo de entrada Droplet_Data.txt
## Copyright TaskControl, LLC - 2017
## All Rights Reserved 2017-2020

## Descomentar para debugging
set -x
## set +x
  
if [ "$#" -ne 5 ]; then
 echo "Usage: upgrade_droplet.sh "DropletName" "Plan_Actual" "Version_Actual" "Plan_Nuevo" "Version_Nueva" "
 echo "(ie. upgrade_droplet.sh "MyCompanyName" "Starter" "v19.03.001.001.001" "Professional" "v19.03.001.002.001")"  
 sleep 10
 exit 1 
fi

## Corro el environment para el script
## . token.sh

#### prueba de token #############################################################
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
export PATH_TMP_UPGRADE='/var/www/taskcontrol.net/web/provisioning/temp/upgrade/'

## seteos para MySQL 
export DB_BACKUP_PATH='/var/www/taskcontrol.net/web/provisioning/customers/'
export MYSQL_HOST='localhost'
export MYSQL_PORT='3306'
export MYSQL_USER='root'
export MYSQL_PASSWORD='taskcontrol!!2020!!'
export DATABASE_NAME='admin_task'
export BACKUP_RETAIN_DAYS=8   ## Number of days to keep local backup copy
export MYSQL_LANDING_USER='c1taskcontrol'
export MYSQL_LANDING_PASS='j6BRh3gN65tXnE'

## Seteos para Cloudflare
export CLOUDFLARE_API_TOKEN=KamCT8vm8diHT7v5UjR-vzGYoYu9Sutsn0C2Hm4O
export CLOUDFLARE_GLOBAL_API_KEY=0241c0aad279f6a0721ea156af027958695f9
export CLOUDFLARE_ZONE_ID=32a2f66b0cb3ec48d59ef2ede8f80afe
export CLOUDFLARE_ACCOUNT_ID=4d385daee1402de17a059aa7fafe7e7b
###### fin de prueba de token ############################################## 

LOGUPGRADE=${PATH_BASE}"upgrade_droplet.log"

if [ ! -f ${LOGUPGRADE} ]; then
   touch ${LOGUPGRADE}
fi
 
## Me posiciono en el home del usuario
cd ${PATH_BASE}

## Workflow de Upgrade de Plan y/o Version (pueden ser ambas o una de ellas)

## 1- se hace un mysqldump de la base admin_task
## 2- se crea el droplet del plan/version nuevo con un nombre temporal
## 4- se importa el dump de la base admin_task en el droplet temporal
## 5- se corren los scripts de upgrade sobre el droplet temporal sobre la base y sobre lo que sea necesario 
## 6- Si todo salio bien, se elimina el droplet viejo y se renombra el droplet nuevo y se elimina su imagen
## Sino se vuelve atras:
## 7- Procedimiento de vuelta atras: 6-1- Se elimina el droplet nuevo y su imagen 
##                                   6-2- Se avisa al admin para que chequee que paso y lo corra nuevamente


## Comenzamos el ciclo de recorrida de droplets a actualizar plan y/o version 

current_date_time_start_backup=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start_backup":-----Comenzamos el ciclo de recorrida de droplets existentes..." >> ${LOGUPGRADE}

## Contador de droplets y potenciales errores
total_droplets=0
total_droplets_ok=0
errors=0

if [ -f ${PATH_TMP}"Droplet_Data.txt" ]; then
    rm -f ${PATH_TMP}"Droplet_Data.txt"
fi

DROPLET_NAME=$1

case $2 in
    "Starter")
     PLAN_ACTUAL=1 
     ;; 
    "Professional") 
     PLAN_ACTUAL=2
     ;;
    "Enterprise-One")
     PLAN_ACTUAL=3
     ;;
esac

## Creamos el txt de el/de los droplets activos a actualizar

current_date_time_start=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start":-----Creamos el txt con los droplets activos a actualizar..." >>${LOGUPGRADE}

mysql -u ${MYSQL_LANDING_USER} -p${MYSQL_LANDING_PASS} --database bairesda_taskcontrol << EOF
SELECT mem_company, membership_id, actual_version, server_ip
FROM member_master WHERE membership_id > 0
and plan_expired = 0
and mem_company='${DROPLET_NAME}'
INTO OUTFILE '${PATH_TMP}Droplet_Data.txt'
FIELDS TERMINATED BY ','
ENCLOSED BY ''
LINES TERMINATED BY '\n';
EOF

input_file=${PATH_TMP}"Droplet_Data.txt"

VERSION_ACTUAL=$3

case $4 in
    "Starter")
     PLAN_NUEVO=1
     ;;
    "Professional")
     PLAN_NUEVO=2
     ;;
    "Enterprise-One")
     PLAN_NUEVO=3
     ;;
esac

VERSION_NUEVA="$5"

IP_ACTUAL=`cat ${PATH_TMP}Droplet_Data.txt | awk -F, '{ print $4 }'`


## Recupero DROPLET_ID del droplet actual para eliminarlo luego del upgrade exitoso

## DROPLET_ACTUAL_ID=`curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/droplets?page=1&per_page=1" | jq -r 'droplets.id'` 

DROPLET_ACTUAL_ID=`doctl compute droplet list | grep $DROPLET_NAME | awk '{print $1}'`

current_date_time_start=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start":-----Recuperando DROPLET_ID actual-----:"$DROPLET_ACTUAL_ID >> ${LOGUPGRADE}


current_date_time_start=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time_start":-----Comenzando UPGRADE Droplet-----:"$DROPLET_NAME >> ${LOGUPGRADE}

current_date_time=`date +%Y-%m-%d-%H:%M:%S`

## Existe la imagen (o por lo menos el directorio de los datos de la imagen)
cd "${PATH_BASE}plans_versions/$4-$VERSION_NUEVA"
SLUGNAME=`cat slugname`
SIZE=`cat size`

## Hacemos un mysqldump de la base del cliente (backup previo "just in case")  
echo $current_date_time_start":---Haciendo Dump de la base admin_task del Droplet-----:"$DROPLET_NAME >> ${LOGUPGRADE}

backuptemp=${PATH_TMP_UPGRADE}
fullbackupfile=$backuptemp

sshpass -e ssh -o StrictHostKeyChecking=no ${REMOTE_ROOT_USER}@${IP_ACTUAL} 'mysqldump -u "'${MYSQL_USER}'" -p"'${MYSQL_PASSWORD}'" --add-drop-database --add-drop-table --add-drop-trigger --databases admin_task' > ${fullbackupfile}admin_task.sql 2>/dev/null

if [ $? -ne 0 ]; then
	echo "Hubo errores en el export previo de la BBDD del cliente: "$DROPLET_NAME >> ${LOGUPGRADE}
	exit 1
fi

## Creamos la imagen del nuevo plan
DIRECTORIO="$4-$VERSION_NUEVA"
IMAGE_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/images" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"name":"'$SLUGNAME'","url":"https://taskcontrol-10-2019.nyc3.digitaloceanspaces.com/'"$DIRECTORIO"'/taskcontrol.vdi.gz","distribution": "Ubuntu","region":"nyc3","description":"'$DIRECTORIO'","tags":["'$DIRECTORIO'", "prod"]}'`

export IMAGE_ID=`echo $IMAGE_OUTPUT | jq -r '.image.id'`

## Entra al loop de espera de creacion de imagen para crear luego el droplet
 
while :
do

## Chequea el estado de la imagen

IMAGE_STATUS=`curl -s "https://api.digitalocean.com/v2/images/$IMAGE_ID" "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq '.image.status'`

DROPLET_TEMP_NAME="Temporal"

if [ "$IMAGE_STATUS" == '"available"' ]; then
   current_date_time=`date +%Y-%m-%d-%H:%M:%S`
   echo $current_date_time":---- Imagen Creada --->Creando Droplet------>:"$DROPLET_TEMP_NAME >>${LOGUPGRADE}

## crea el droplet con la imagen anterior disponible
DROPLET_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/droplets" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"name":"'$DROPLET_TEMP_NAME'","region":"nyc3","size":"'$SIZE'","image":'$IMAGE_ID',"ssh_keys":["45:72:2e:ed:22:2d:ad:d8:0f:57:c0:65:12:e1:8d:61"],"backups":false,"ipv6":false,"user_data":"'"$(cat /home/taskcontrol/user-data-tc.yml)"'","private_networking":null,"volumes": null,"tags":["Upgrade"]}'` 

   DROPLET_STATUS=`echo $DROPLET_OUTPUT | jq -r '.droplet.status'`

   ## Entra en el ciclo de espera de booteo del droplet
   for i in {1..10000}; do

   DROPLET_ID=`echo $DROPLET_OUTPUT | jq -r '.droplet.id'`
   DROPLET_STATUS=`curl -X GET "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.droplet.status'`

    if [ "$DROPLET_STATUS" = "active" ]; then
       current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
       echo $current_date_time":------ Droplet Temporal booteo OK------" >> ${LOGUPGRADE}
       break
    fi

    echo -n '.'
    sleep 1
  done  ## ciclo de espera de booteo     

  if [ "$DROPLET_STATUS" != "active" ]; then
       current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
       echo $current_date_time":------ Hubo problemas al bootear el Droplet ------" >> ${LOGUPGRADE}
       ((++error))
    else
       current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
       echo $current_date_time":----- Droplet Up & Running! ------" >> ${LOGUPGRADE}
       break
  fi

fi
  
current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
echo $current_date_time:"----- Imagen aun no disponible, esperando estado available ------" >> ${LOGUPGRADE} 
sleep 5
 
done  ## del loop de creacion de imagen

## Obtenemos el IP del droplet nuevo
IP_ADDRESS=`curl -X GET "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.droplet.networks.v4[1].ip_address'`

if [ $? -ne 0 ]; then
  current_date_time=`date +%Y-%m-%d-%H:%M:%S`
  echo $current_date_time":------Errors while getting the IP for DROPLET: "$DROPLET_TEMP_NAME >> ${LOGUPGRADE}

  ##  se debe eliminar la imagen y el droplet nuevo porque algo no salio bien..
  ## chequear lo que anduvo mal y correr el upgrade nuevamente

  ## eliminamos imagen
   DELETE_STATUS=`curl -X DELETE -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/images/$IMAGE_ID"` 
   current_date_time=`date +%Y-%m-%d-%H:%M:%S`
   echo $current_date_time:"------Codigo de eliminado de Imagen----:"$DELETE_STATUS >> ${LOGUPGRADE}

  ## eliminamos el droplet temporal 
   DELETE_STATUS1=`curl -X DELETE "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN"`  
   current_date_time=`date +%Y-%m-%d-%H:%M:%S`
   echo $current_date_time:"------Codigo de eliminado de Droplet Temporal----: "$DELETE_STATUS1 >> ${LOGUPGRADE}
   ((++error))
   exit 1
fi


## Se corren los scripts de upgrade sobre la base y se hace todo demas que sea necesario

 if [ $VERSION_ACTUAL != $VERSION_NUEVA ]; then

      ${PATH_BASE}plans_versions/$4-$VERSION_NUEVA/upgrades_necesarios.sh >> ${LOGUPGRADE}

     if [ $? -ne 0 ]; then
       current_date_time=`date +%Y-%m-%d-%H:%M:%S`
       echo $current_date_time ":------Errors while running upgrades scripts for DROPLET: "$DROPLET_TEMP_NAME >> ${LOGUPGRADE}

      # Se elimina la imagen y el droplet ya que el upgrade.sh tuvo errores

      ## eliminamos imagen
       DELETE_STATUS2=`curl -X DELETE "https://api.digitalocean.com/v2/images/$IMAGE_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN"`
       current_date_time=`date +%Y-%m-%d-%H:%M:%S`
       echo $current_date_time:"------Codigo de eliminado de Imagen----:"$DELETE_STATUS2 >> ${LOGUPGRADE}

      ## eliminamos el droplet temporal
       DELETE_STATUS3=`curl -X DELETE -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/droplets/$DROPLET_ID"`
       current_date_time=`date +%Y-%m-%d-%H:%M:%S`
       echo $current_date_time:"------Codigo de eliminado de Droplet Temporal----: "$DELETE_STATUS3 >> ${LOGUPGRADE}
       ((++error))
       exit 1
     fi  
fi

## Si llego hasta aca, el upgrade.sh corrio correctamente
## Por lo tanto, se elimina el droplet viejo y la imagen del droplet nueva 
 DELETE_STATUS4=`curl -X DELETE "https://api.digitalocean.com/v2/droplets/$DROPLET_ACTUAL_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN"`
 current_date_time=`date +%Y-%m-%d-%H:%M:%S`
 echo $current_date_time:"------Codigo de eliminado de Droplet Anterior----: "$DELETE_STATUS4 >>${LOGUPGRADE}

## eliminamos imagen del dropet nuevo ya que no se utilizara mas 
DELETE_STATUS5=`curl -X DELETE "https://api.digitalocean.com/v2/images/$IMAGE_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN"`
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"------Codigo de eliminado de Imagen Nueva----:"$DELETE_STATUS5 >> ${LOGUPGRADE}


## Se renombra el droplet nuevo a como estaba el viejo

echo "DROPLET_NAME: "$DROPLET_NAME

RENAME_STATUS=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"rename","name":"'${DROPLET_NAME}'"}' "https://api.digitalocean.com/v2/droplets/$DROPLET_ID/actions"` 

## Esperamos hasta el renombrado del nuevo droplet...(ir viendo si hay que ajustar el tiempo)
sleep 60

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time":------Codigo de renombrado de Droplet ----:"$RENAME_STATUS >> ${LOGUPGRADE}

## Aqui lo asignamos al web firewall
FWLL_ID=`curl -X GET "https://api.digitalocean.com/v2/firewalls/" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.firewalls[].id'`

echo $current_date_time:"------Asignando el Droplet al Firewall----:"$FWLL_ID >> ${LOGUPGRADE}
FWLL_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/firewalls/$FWLL_ID/droplets" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"droplet_ids": [ '$DROPLET_ID' ]}'`

## Creamos un registro A para el subdomain (nombre de la empresa)
ARECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"A","name":"'$DROPLET_NAME'","data":"'$IP_ADDRESS'","priority":null,"port":null,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"`

DOMAIN_RECORD_ID=`echo $ARECORD | jq -r '.domain_record.id'`
if [ "$DOMAIN_RECORD_ID" == "" ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Hubo problemas al crear el RECORD A --------" >> ${LOGUPGRADE}
     ((++error))
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A for the subdomain created succesfully! ------" >> ${LOGUPGRADE} 
fi

## Creamos un registro A para el www.subdomain.taskcontrol.net (www.nombre de la empresa)
ARECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"A","name":"www.'$DROPLET_NAME'.taskcontrol.net","data":"'$IP_ADDRESS'","priority":null,"port":null,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"`

DOMAIN_WWW_RECORD_ID=`echo $ARECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_WWW_RECORD_ID" == "" ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Error al crear RECORD A para www.subdomain--------" >> droplet_creation.log
     ((++error))
     exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A for the www.subdomain created succesfully! ------" >> droplet_creation.log
fi

## Creamos un registro MX para el subdomain (nombre de la empresa)
MXRECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"MX","name":"'$DROPLET_NAME'","data":"mail.taskcontrol.net.","priority":1,"port":25,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"`

DOMAIN_RECORD_ID=`echo $MXRECORD | jq -r '.domain_record.id'`
if [ "$DOMAIN_RECORD_ID" == "" ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Hubo problemas al crear el RECORD MX --------" >> ${LOGUPGRADE}
     ((++error))
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD MX for the subdomain created succesfully! ------" >> ${LOGUPGRADE} 
fi


## Apuntamos Cloudflare al nuevo Droplet mediante la creacion de un registro "A"

DROPLET_NAME_LOWER=`echo "$DROPLET_NAME" | awk '{print tolower($0)}'`

CLOUDFLARE_A_RECORD=`curl -X POST "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records/" -H "X-Auth-Email: support@taskcontrol.net" -H "X-Auth-Key: $CLOUDFLARE_GLOBAL_API_KEY" -H "Content-Type: application/json" --data '{"type":"A","name":"'"$DROPLET_NAME_LOWER"'","content":"'"$IP_ADDRESS"'","ttl":120,"priority":10,"proxied":true}'`


OUTPUT_CLOUDFLARE_A_RECORD=`echo $CLOUDFLARE_A_RECORD | jq  .success`
echo "ver que sale del cloudflare 1 : " $OUTPUT_CLOUDFLARE_A_RECORD


if [ "$OUTPUT_CLOUDFLARE_A_RECORD" != true ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Error al crear RECORD A in CloudFlare for subdomain--------" >> ${PATH_BASE}droplet_creation.log
     ## exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A in CloudFlare for the subdomain created succesfully!" >> ${PATH_BASE}droplet_creation.log
fi


## Apuntamos Cloudflare al nuevo Droplet con www mediante la creacion de un registro "A"

CLOUDFLARE_A_WWW_RECORD=`curl -X POST "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records/" -H "X-Auth-Email: support@taskcontrol.net" -H "X-Auth-Key: $CLOUDFLARE_GLOBAL_API_KEY" -H "Content-Type: application/json" --data '{"type":"A","name":"www.'"$DROPLET_NAME_LOWER"'","content":"'"$IP_ADDRESS"'","ttl":120,"priority":10,"proxied":true}'`


OUTPUT_CLOUDFLARE_A_WWW_RECORD=`echo $CLOUDFLARE_A_WWW_RECORD | jq  .success`
echo "ver que sale del cloudflare 1 : " $OUTPUT_CLOUDFLARE_A_WWW_RECORD


if [ "$OUTPUT_CLOUDFLARE_A_WWW_RECORD" != true ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Error al crear RECORD A in CloudFlare for www.subdomain--------" >> ${PATH_BASE}droplet_creation.log
     ## exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A in CloudFlare for the www.subdomain created succesfully!" >> ${PATH_BASE}droplet_creation.log
fi

## Hacemos una pausa de 60 segundos para dar tiempo a que se creen
## los registros A en Cloudflare y se vean en Internet
## (si se ve que es poco tiempo, aumentarlo a 2 minutos por ejemplo)
sleep 60


if [[ "$error" -eq 0 ]]; then  ## NO hubo errores 

## corremos el script de configuracion inicial del droplet
sshpass -e ssh -o StrictHostKeyChecking=no ${REMOTE_ROOT_USER}@${IP_ADDRESS} 'bash -s' < ${PATH_BASE}bootstrap.sh $IP_ADDRESS $DROPLET_NAME 2>/dev/null

## Creamos la base vacia
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -e "create database admin_task;"' 2>/dev/null

## Damos privilegios de admin a root
sshpass -e ssh  ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -e "grant all privileges on admin_task.* to 'root'@'localhost';"' 2>/dev/null

## Se importa el dump de la base admin_task en el droplet nuevo
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"----- Se importa el dump previo : "${fullbackupfile}admin_task.sql >> ${LOGUPGRADE}

cat ${fullbackupfile}admin_task.sql | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -D admin_task' 2>/dev/null

if [ $? -ne 0 ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Hubo problemas al importar el backup previo ------" >> ${LOGUPGRADE}
     ((++error))
     exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time:"----- Import Ejecutado OK: "$IP_ADDRESS >> ${LOGUPGRADE}
fi

## Actualiza la base de datos de clientes (tabla member_master)
mysql -u ${MYSQL_LANDING_USER} -p${MYSQL_LANDING_PASS} --database bairesda_taskcontrol << EOF
UPDATE member_master SET member_master.server_ip="$IP_ADDRESS", member_master.actual_version="$VERSION_NUEVA", member_master.membership_id="$PLAN_NUEVO" WHERE member_master.mem_company="$DROPLET_NAME";
EOF

## mando mail de terminacion de Upgrade OK al Admin
  echo $DROPLET_NAME | mail -s "Upgrade finalizo OK !!!" support@taskcontrol.net
   exit 0
 else ## significa que hubo algun error durante el proceso de upgrade
  ## Se avisa al admin para que chequee que paso
  echo $DROPLET_NAME | mail -s "Upgrade con errores Chequear !!!" support@taskcontrol.net
   exit 1
fi

##  FIN ? ...maybe..but not today..
