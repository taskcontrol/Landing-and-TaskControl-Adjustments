#!/bin/bash
## create_landing_sh
## Script de provisioning de droplets de planes
## RFG: 09-07-2020
## Property of TaskControl, LLC

## Descomentar para debugging
 set -x
## set +x

## if [ "$#" -ne 2 ]; then
##  echo "Usage: create_landing.sh  "Fecha" "Version""
##   echo "(ie. create_landing.sh  "20-07-08" "v20.03.001.001.0001""
##   sleep 5
##   exit 1
## fi

#### prueba de token #############################################################
export DO_TOKEN=e6b3f9f8bc8dccca7afbc8dbb0dcb7c068b0e52e41e879f00735a019b5054b6f
export SPACES_KEY=L25ZD2V62OE7ZJHZOLUJ
export SPACES_SECRET=x/T3nbjCOLiw21xTYbsK40hxLEQ0CSxNWZBYdmp1+Mg
export ENDPOINT="nyc3.digitaloceanspaces.com"
export SPACENAME="taskcontrol-10-2019"
export SPACENAME_ENDPOINT="https://$SPACENAME.nyc3.digitaloceanspaces.com/"
export REMOTE_ROOT_USER='root'
export REMOTE_ROOT_PASS='taskcontrol2020!!'
export REMOTE_USER='taskcontrol'
export SSHPASS='taskcontrol2020!!'
export PATH_BASE='/var/www/taskcontrol.net/web/provisioning/'
export INFRA_ADDRESS='/var/www/taskcontrol.net/web/provisioning/infra/'
export PLANS_VERSION='/var/www/taskcontrol.net/web/provisioning/plans_versions/'
export PATH_LANDING='/var/www/taskcontrol.net/web/provisioning/infra/landing/'
export PATH_TMP='/var/www/taskcontrol.net/web/provisioning/landing/temp/'

## seteos para MySQL
export DB_BACKUP_PATH='/var/www/taskcontrol.net/web/provisioning/customers/'
export MYSQL_HOST='localhost'
export MYSQL_PORT='3306'
export MYSQL_USER='root'
export MYSQL_PASSWORD='taskcontrol!!2020!!'
export DATABASE_NAME='c1bairesda_taskcontrol'
export MYSQL_LANDING_USER='c1taskcontrol'
export MYSQL_LANDING_PASS='j6BRh3gN65tXnE'
export BACKUP_RETAIN_DAYS=7   ## Number of days to keep local backup copy
##------------------ fin token.sh ----------------------------------------------------

## Corremos el enviroment de claves
## . token.sh

## Armamos el directorio correcto para tomar la imagen solicitada
DIRECTORIO="Landing/"$1-$2

## Seteamos el slugname de acuerdo a como veamos la performance (por ahora 1gb 25 GB HD)
SLUGNAME="ubuntu-18-04-x64"
SIZE="s-1vcpu-1gb" ## 25 GB
## SIZE="s-1vcpu-2gb"  ## 50 GB  
## SIZE="s-4vcpu-8gb"  ## 160 GB
    
if [ ! -f ${PATH_BASE}landing_creation.log ]; then
   touch ${PATH_BASE}landing_creation.log
fi


## Le pasamos el nombre del droplet en formato "company.taskcontrol.net" el plan y la version
DROPLET_NAME="landing"
VERSION=$1
PLAN="Basico"

current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
echo "----------------------------------------------------------------------------------"
echo $current_date_time":------ Creando Imagen desde .vdi------" >> ${PATH_BASE}landing_creation.log

IMAGE_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/images" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"name":"'$SLUGNAME'","url":"'$SPACENAME_ENDPOINT''$DIRECTORIO'/landing.vdi.gz","distribution": "Ubuntu","region":"nyc3","description":"Landing TaskControl","tags":["'$DIRECTORIO'", "prod"]}'`

export IMAGE_ID=`echo $IMAGE_OUTPUT | jq -r '.image.id'`

## Entra al loop de espera de creacion de imagen para crear luego el droplet
 
while : 
do

## Chequea el estado de la imagen

IMAGE_STATUS=`curl -s "https://api.digitalocean.com/v2/images/$IMAGE_ID" "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq '.image.status'` 

if [ "$IMAGE_STATUS" == '"available"' ]; then
   current_date_time=`date +%Y-%m-%d-%H:%M:%S`
   echo $current_date_time":------ Imagen Creada --->Creando Droplet------>:"$DROPLET_NAME >> ${PATH_BASE}landing_creation.log

# crea el droplet si la imagen anterior esta disponible
DROPLET_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/droplets" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"name":"'$DROPLET_NAME'","region":"nyc3","size":"'$SIZE'","image":'$IMAGE_ID',"ssh_keys":["45:72:2e:ed:22:2d:ad:d8:0f:57:c0:65:12:e1:8d:61"],"backups":false,"ipv6":false,"user_data":"'"$(cat /home/taskcontrol/user-data.yml)"'","private_networking":"default-nyc3","volumes": null,"tags":["'$PLAN'"]}'`

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
       echo $current_date_time":------ Droplet booteo OK------" >> ${PATH_BASE}landing_creation.log

       ## aqui removemos la imagen base
       DELETE_STATUS=`curl -X DELETE "https://api.digitalocean.com/v2/images/$IMAGE_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN"` 
       current_date_time=`date +%Y-%m-%d-%H:%M:%S`
       echo $current_date_time:"------Codigo de eliminado de Imagen----:"$DELETE_STATUS >> ${PATH_BASE}landing_creation.log

       ## Aqui lo asignamos al web firewall
       FWLL_ID=`curl -X GET "https://api.digitalocean.com/v2/firewalls/" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.firewalls[1].id'`

       echo $current_date_time:"------Asignando el Droplet al Firewall----:"$FWLL_ID >> ${PATH_BASE}landing_creation.log
       FWLL_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/firewalls/$FWLL_ID/droplets" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"droplet_ids": [ '$DROPLET_ID' ]}'`
       echo $current_date_time:"------Salida de Asignacion al Firewall----:"$FWLL_OUTPUT >> ${PATH_BASE}landing_creation.log
       break
    fi

     echo -n '.'
     sleep 1

   done

    if [ "$DROPLET_STATUS" != "active" ]; then
       current_date_time=`date +%Y-%m-%d-%H:%M:%S`
       echo $current_date_time":------ Hubo problemas al bootear el Droplet ------" >> ${PATH_BASE}landing_creation.log
       break
    else
       current_date_time=`date +%Y-%m-%d-%H:%M:%S`
       echo $current_date_time":----- Droplet Up & Running! ------" >> ${PATH_BASE}landing_creation.log
       break
    fi

fi

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"----- Imagen aun no disponible, esperando estado available ------" >> ${PATH_BASE}landing_creation.log
sleep 5

done

## Obtenemos el IP del droplet nuevo
IP_ADDRESS=`curl -X GET "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.droplet.networks.v4[0].ip_address'`

sleep 5   ## just in the case the "API" has some "delays to getting the IP ADDRESS..."


## Creamos un registro A para el subdomain.taskcontrol.net (nombre de la empresa)
ARECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"A","name":"'\@'","data":"'$IP_ADDRESS'","priority":null,"port":null,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"` 

DOMAIN_RECORD_ID=`echo $ARECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_RECORD_ID" == null ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Error al crear RECORD A para el subdomain---" >> ${PATH_BASE}landing_creation.log
     ## exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A for the subdomain created succesfully! ------" >> ${PATH_BASE}landing_creation.log
fi


## Creamos un registro A para el www.subdomain.taskcontrol.net (nombre de la empresa)
ARECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"A","name":"www","data":"'$IP_ADDRESS'","priority":null,"port":null,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"`


DOMAIN_RECORD_ID=`echo $ARECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_RECORD_ID" == null ]; then
       current_date_time=`date +%Y-%m-%d-%H:%M:%S`
       echo $current_date_time":------ Error al crear RECORD A para www.subdomain--------" >> ${PATH_BASE}landing_creation.log
       ## exit 1
 else
       current_date_time=`date +%Y-%m-%d-%H:%M:%S`
        echo $current_date_time":----- RECORD A for the www.subdomain created succesfully! ------" >> ${PATH_BASE}landing_creation.log
fi


## Creamos un registro MX para el subdomain (nombre de la empresa)
MXRECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"MX","name":"'\@'","data":"mx.noip.com.","priority":1,"port":25,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"`

DOMAIN_RECORD_ID=`echo $MXRECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_RECORD_ID" == null ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Hubo problemas al crear el RECORD MX --------" >> ${PATH_BASE}landing_creation.log
     ## exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD MX for the subdomain created succesfully! ------" >> ${PATH_BASE}landing_creation.log
fi

## Generamos clave public/privada SSH local asi podemos ingresar sin root (ya esta generado en este equipo, si se necesita regenerarlo, descomentarlo una vez y generar)
##  ssh-keygen -p 22 -q -t rsa -b 4096 -N '' -f /home/taskcontrol/.ssh/id_rsa 2>>${PATH_BASE}landing_creation.log <<< y >/dev/null

## Copiamos nuestra public key al droplet del cliente en usuario taskcontrol
sshpass -e ssh-copy-id -i /home/taskcontrol/.ssh/id_rsa.pub ${REMOTE_USER}@$IP_ADDRESS 2>>${PATH_BASE}landing_creation.log <<< taskcontrol2020!! >/dev/null

echo "Corremos el script de configuracion inicial del droplet...bootstrap_landing.sh.."
sshpass -e ssh ${REMOTE_USER}@$IP_ADDRESS 'bash -s' < "/var/www/taskcontrol.net/web/provisioning/bootstrap_landing.sh" $IP_ADDRESS $DROPLET_NAME 

## -------------------------------------------------------------------------------------------
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"----- Droplet Landing listo para su uso: "$IP_ADDRESS >> ${PATH_BASE}landing_creation.log
echo " "
echo "---------------------------------------------------------------------------------------"

echo "$DROPLET_NAME" | mail -s "Fin Creacion de Droplet de Landing" support@taskcontrol.net

echo "$IP_ADDRESS" 

## exit 0

##  FIN ? ...maybe..but not today..
