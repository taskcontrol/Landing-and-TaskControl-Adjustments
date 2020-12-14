#!/bin/bash
## Script de provisioning de droplets de planes
## RFG: 12-11-2019
## Property of TaskControl, LLC

## Descomentar para debugging
 set -x
## set +x

## if [ "$#" -ne 3 ]; then
##   echo "Usage: create_droplet.sh "DropletName" "Plan" "Version""
##   echo "(ie. create_droplet.sh "MyCompanyName" "Starter" "v19.03.001.001.001""
##   sleep 5
##   exit 1
## fi

#### prueba de token #############################################################

export DO_TOKEN=e6b3f9f8bc8dccca7afbc8dbb0dcb7c068b0e52e41e879f00735a019b5054b6f
export SPACES_KEY=L25ZD2V62OE7ZJHZOLUJ
export SPACES_SECRET=x/T3nbjCOLiw21xTYbsK40hxLEQ0CSxNWZBYdmp1+Mg
export ENDPOINT="nyc3.cdn.digitaloceanspaces.com"
export SPACENAME="taskcontrol-10-2019"
export SPACENAME_ENDPOINT="https://taskcontrol-10-2019.nyc3.cdn.digitaloceanspaces.com/"
export REMOTE_ROOT_USER='root'
export REMOTE_ROOT_PASS='taskcontrol2019!!'
export REMOTE_USER='taskcontrol'
export SSHPASS='taskcontrol2019!!'
export PATH_BASE='/var/www/vhosts/taskcontrol.net/public_html/taskcontrol.net/provisioning/'
export PIVOT_ADDRESS="prd01-taskcontrol.ddns.net"
export INFRA_ADDRESS='/var/www/vhosts/taskcontrol.net/public_html/taskcontrol.net/provisioning/infra/'
export PLANS_VERSION='/var/www/vhosts/taskcontrol.net/public_html/taskcontrol.net/provisioning/plans_versions/'
export PATH_LANDING='/var/www/vhosts/taskcontrol.net/public_html/taskcontrol.net/provisioning/infra/landing/'

## seteos para MySQL 
export DB_BACKUP_PATH='/var/www/vhosts/taskcontrol.net/public_html/taskcontrol.net/provisioning/customers/'
export MYSQL_HOST='localhost'
export MYSQL_PORT='3306'
export MYSQL_USER='root'
export MYSQL_PASSWORD='taskcontrol2019!!'
export DATABASE_NAME='admin_task'
export BACKUP_RETAIN_DAYS=7   ## Number of days to keep local backup copy
export MYSQL_LANDING_USER='bairesda_taskco'
export MYSQL_LANDING_PASS='j6BRh3gN65tXnE'

###### fin de prueba de token ##############################################


## Corremos el enviroment de claves
## . token.sh

## Armamos el directorio correcto para tomar la imagen solicitada
DIRECTORIO=$2-$3

## Seteamos el slugname de acuerdo al plan solicitado
case $2 in
    "Starter")
		SLUGNAME="ubuntu-16-04-x64" 
                SIZE="s-1vcpu-1gb" ## 25 GB
                ## SIZE="s-1vcpu-2gb"  ## 50 GB  
                ;;
    "Professional")
                SLUGNAME="ubuntu-16-04-x64"
                SIZE="s-1vcpu-2gb"  ## 50 GB  
                ;; 
    "Enterprise-One")
		SLUGNAME="ubuntu-16-04-x64"
                ## SIZE="s-4vcpu-8gb"  ## 160 GB
                SIZE="s-1vcpu-2gb"
                ;; 
                *)
                echo "Please enter the plan in the right format" 
                echo "Starter , Professional, Enterprise-One"
                sleep 5
                exit 1
                ;;    
esac
    
if [ ! -f ${PATH_BASE}droplet_creation.log ]; then
   touch ${PATH_BASE}droplet_creation.log
fi


## Le pasamos el nombre del droplet en formato "company.taskcontrol.net" el plan y la version
DROPLET_NAME=$1
PLAN=$2
VERSION=$3

current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
echo "----------------------------------------------------------------------------------"
echo $current_date_time":------ Creando Imagen desde .vdi------" >> ${PATH_BASE}droplet_creation.log

IMAGE_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/images" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"name":"'$SLUGNAME'","url":"https://taskcontrol-10-2019.nyc3.cdn.digitaloceanspaces.com/'"$DIRECTORIO"'/TaskControl.vdi","distribution": "Ubuntu","region":"nyc3","description":"'$DIRECTORIO'","tags":["'$DIRECTORIO'", "prod"]}'`

export IMAGE_ID=`echo $IMAGE_OUTPUT | jq -r '.image.id'`

## Entra al loop de espera de creacion de imagen para crear luego el droplet
 
while : 
do

## Chequea el estado de la imagen

IMAGE_STATUS=`curl -s "https://api.digitalocean.com/v2/images/$IMAGE_ID" "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq '.image.status'` 

if [ "$IMAGE_STATUS" == '"available"' ]; then
   current_date_time=`date +%Y-%m-%d-%H:%M:%S`
   echo $current_date_time":------ Imagen Creada --->Creando Droplet------>:"$DROPLET_NAME >> ${PATH_BASE}droplet_creation.log

# crea el droplet si la imagen anterior esta disponible
   DROPLET_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/droplets" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"name":"'$DROPLET_NAME'","region":"nyc3","size":"'$SIZE'","image":'$IMAGE_ID',"ssh_keys":["45:72:2e:ed:22:2d:ad:d8:0f:57:c0:65:12:e1:8d:61"],"backups":false,"ipv6":false,"user_data":null,"private_networking":true,"volumes": null,"tags":["'$PLAN'"]}'`

   DROPLET_STATUS=`echo $DROPLET_OUTPUT | jq -r '.droplet.status'`

   ## Entra en el ciclo de espera de booteo del droplet
    for i in {1..10000}; do

   ## while : 
  ## do

   DROPLET_ID=`echo $DROPLET_OUTPUT | jq -r '.droplet.id'`
   DROPLET_STATUS=`curl -X GET "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.droplet.status'`

echo "estamos en el ciclo de creacion de droplet, DROPLET_STATUS: "$DROPLET_STATUS
echo "DROPLET_ID: "$DROPLET_ID
echo "indice i del for: "$i
echo "DROPLET_NAME: "$DROPLET_NAME

    if [ "$DROPLET_STATUS" == "active" ]; then
       current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
       echo $current_date_time":------ Droplet booteo OK------" >> ${PATH_BASE}droplet_creation.log

       ## aqui removemos la imagen base
       DELETE_STATUS=`curl -X DELETE "https://api.digitalocean.com/v2/images/$IMAGE_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN"` 
       current_date_time=`date +%Y-%m-%d-%H:%M:%S`
       echo $current_date_time:"------Codigo de eliminado de Imagen----:"$DELETE_STATUS >> ${PATH_BASE}droplet_creation.log

       ## Aqui lo asignamos al web firewall
       FWLL_ID=`curl -X GET "https://api.digitalocean.com/v2/firewalls/" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.firewalls[].id'`

       echo $current_date_time:"------Asignando el Droplet al Firewall----:"$FWLL_ID >> ${PATH_BASE}droplet_creation.log
       FWLL_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/firewalls/$FWLL_ID/droplets" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"droplet_ids": [ '$DROPLET_ID' ]}'`
       echo $current_date_time:"------Salida de Asignacion al Firewall----:"$FWLL_OUTPUT >> ${PATH_BASE}droplet_creation.log
       break
    fi

     echo -n '.'
     sleep 1

   done

    if [ "$DROPLET_STATUS" != "active" ]; then
       current_date_time=`date +%Y-%m-%d-%H:%M:%S`
       echo $current_date_time":------ Hubo problemas al bootear el Droplet ------" >> ${PATH_BASE}droplet_creation.log
       break
    else
       current_date_time=`date +%Y-%m-%d-%H:%M:%S`
       echo $current_date_time":----- Droplet Up & Running! ------" >> ${PATH_BASE}droplet_creation.log
       break
    fi

fi

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"----- Imagen aun no disponible, esperando estado available ------" >> ${PATH_BASE}droplet_creation.log
sleep 5

done

## Obtenemos el IP del droplet nuevo
IP_ADDRESS=`curl -X GET "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.droplet.networks.v4[0].ip_address'`

sleep 10  ## just in the case the "API" has some "delays the IP ADDRESS..."

 ## Creamos un registro A para el subdomain.taskcontrol.net (nombre de la empresa)
ARECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"A","name":"'$DROPLET_NAME'.taskcontrol.net","data":"'$IP_ADDRESS'","priority":null,"port":null,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"` 

DOMAIN_RECORD_ID=`echo $ARECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_RECORD_ID" == null ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Error al crear RECORD A para el subdomain---" >> ${PATH_BASE}droplet_creation.log
     exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A for the subdomain created succesfully! ------" >> ${PATH_BASE}droplet_creation.log
fi


## Creamos un registro A para el www.subdomain.taskcontrol.net (nombre de la empresa)
ARECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"A","name":"www.'$DROPLET_NAME'.taskcontrol.net","data":"'$IP_ADDRESS'","priority":null,"port":null,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"`

DOMAIN_RECORD_ID=`echo $ARECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_RECORD_ID" == null ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Error al crear RECORD A para www.subdomain--------" >> ${PATH_BASE}droplet_creation.log
     exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A for the www.subdomain created succesfully! ------" >> ${PATH_BASE}droplet_creation.log
fi


## Creamos un registro MX para el subdomain (nombre de la empresa)
MXRECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"MX","name":"'$DROPLET_NAME'","data":"mail.taskcontrol.net.","priority":1,"port":25,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"`

DOMAIN_RECORD_ID=`echo $MXRECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_RECORD_ID" == null ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Hubo problemas al crear el RECORD MX --------" >> ${PATH_BASE}droplet_creation.log
     exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD MX for the subdomain created succesfully! ------" >> ${PATH_BASE}droplet_creation.log
fi

## corremos el script de configuracion inicial del droplet
sshpass -e /usr/bin/ssh -o StrictHostKeyChecking=no ${REMOTE_ROOT_USER}@$IP_ADDRESS 'bash -s' < "${PATH_BASE}bootstrap.sh" $IP_ADDRESS $DROPLET_NAME 2>&1

## Importamos la base default requerida por TaskControl 
sshpass -e ssh -p 22 ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -e "create database admin_task;"' 2>&1

sshpass -e ssh -p 22 ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" -e "grant all privileges on admin_task.* to 'root'@'localhost';"' 2>&1

sshpass -e ssh -p 22 ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2019!!" admin_task' < /var/www/vhosts/taskcontrol.net/public_html/taskcontrol.net/provisioning/temp/admin_task.sql 2>&1

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"----- Droplet listo para su uso: "$IP_ADDRESS >> ${PATH_BASE}droplet_creation.log
echo " "
echo "---------------------------------------------------------------------------------------"

### Updateamos la nueva ip address del droplet del cliente
/usr/bin/mysql -u ${MYSQL_LANDING_USER} -p${MYSQL_LANDING_PASS} --database bairesda_taskcontrol << EOF
UPDATE member_master SET member_master.server_ip="$IP_ADDRESS" WHERE member_master.mem_company="$DROPLET_NAME";
EOF

echo "$DROPLET_NAME" | mail -s "Creacion de Droplet OK" support@taskcontrol.net

echo "$IP_ADDRESS" 

exit 0

##  FIN ? ...maybe..but not today..
