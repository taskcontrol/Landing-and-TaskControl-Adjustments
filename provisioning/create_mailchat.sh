#!/bin/bash
## Script de provisioning del server de la mailchat page (taskcontrol.net)
## RFG: 11-04-2020
## Property of TaskControl, LLC

## Descomentar para debugging
 set -x
## set +x

if [ "$#" -ne 2 ]; then
    echo "Usage: create_mailchat.sh  Fecha (dd-mm-yy) Version "
    echo "ie. create_mailchat.sh "20-01-17" "v20.04.001.001.0001" "  
    sleep 5 
  ## exit 1 
fi  

echo "punto 0"

## Corremos el enviroment de claves
## . token.sh

## ----------------------------- token.sh -------------------------------
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
export PATH_MAILCHAT='/var/www/taskcontrol.net/web/provisioning/infra/mailchat/'
export PATH_TMP='/var/www/taskcontrol.net/web/provisioning/temp/'
export DB_BACKUP_PATH='/var/www/taskcontrol.net/web/provisioning/customers/'

export BACKUP_RETAIN_DAYS=8   ## Number of days to keep local backup copy

## Seteos para Cloudflare
export CLOUDFLARE_API_TOKEN=KamCT8vm8diHT7v5UjR-vzGYoYu9Sutsn0C2Hm4O
export CLOUDFLARE_GLOBAL_API_KEY=0241c0aad279f6a0721ea156af027958695f9
export CLOUDFLARE_ZONE_ID=32a2f66b0cb3ec48d59ef2ede8f80afe
export CLOUDFLARE_ACCOUNT_ID=4d385daee1402de17a059aa7fafe7e7b
## ---------------------------------------------------------------------

echo "punto 1"

## Armamos el directorio correcto para tomar la imagen solicitada
DROPLET_NAME="mailchat"
FECHA=$1
VERSION=$2 
DIRECTORIO=$FECHA-$VERSION

## Seteamos el slugname (el minimo)
SLUGNAME="ubuntu-18-04-x64" 
SIZE="s-2vcpu-4gb" ## 80 GB  (Ajustarlo de acuerdo a su perfomance)

if [ ! -f ${PATH_BASE}droplet_mailchat_creation.log ]; then
   touch ${PATH_BASE}droplet_mailchat_creation.log
fi

current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
echo "----------------------------------------------------------------------------------"
echo $current_date_time":------ Creando MailChat Imagen desde .vdi------" >> droplet_mailchat_creation.log

IMAGE_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/images" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"name":"'$SLUGNAME'","url":"'$SPACENAME_ENDPOINT'MailChat/'$DIRECTORIO'/mailchat.vdi.gz","distribution":"Ubuntu","region":"nyc3","description":"'$DIRECTORIO'","tags":["'$DIRECTORIO'", "prod"]}'`

export IMAGE_ID=`echo $IMAGE_OUTPUT | jq -r '.image.id'`

## Entra al loop de espera de creacion de imagen para crear luego el droplet

echo "punto 2"

while : 
do

## Chequea el estado de la imagen

IMAGE_STATUS=`curl -s "https://api.digitalocean.com/v2/images/$IMAGE_ID" "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq '.image.status'` 

if [ "$IMAGE_STATUS" == '"available"' ]; then
   current_date_time=`date +%Y-%m-%d-%H:%M:%S`
   echo $current_date_time":------ Imagen Creada --->Creando Droplet------>:"$DROPLET_NAME >> droplet_mailchat_creation.log

# crea el droplet si la imagen anterior esta disponible
DROPLET_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/droplets" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"name":"'$DROPLET_NAME'","region":"nyc3","size":"'$SIZE'","image":'$IMAGE_ID',"ssh_keys":["45:72:2e:ed:22:2d:ad:d8:0f:57:c0:65:12:e1:8d:61"],"backups":false,"ipv6":false,"user_data":"'"$(cat /home/taskcontrol/user-data-mailchat.yaml)"'","private_networking":false,"volumes": null,"tags":["'$DIRECTORIO'"]}'`  
 
   DROPLET_STATUS=`echo $DROPLET_OUTPUT | jq -r '.droplet.status'`

   ## Entra en el ciclo de espera de booteo del droplet
   for i in {1..60}; do

   DROPLET_ID=`echo $DROPLET_OUTPUT | jq -r '.droplet.id'`
   DROPLET_STATUS=`curl -X GET "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.droplet.status'`

    if [ "$DROPLET_STATUS" = "active" ]; then
       current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
       echo $current_date_time":------ Droplet booteo OK------" >> droplet_mailchat_creation.log

       ## aqui removemos la imagen base
       DELETE_STATUS=`curl -X DELETE "https://api.digitalocean.com/v2/images/$IMAGE_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN"` 
       current_date_time=`date +%Y-%m-%d-%H:%M:%S`
       echo $current_date_time:"------Codigo de eliminado de Imagen----:"$DELETE_STATUS >> droplet_mailchat_creation.log
    
       ## Aqui lo asignamos al web firewall 
       FWLL_ID=`curl -X GET "https://api.digitalocean.com/v2/firewalls/" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.firewalls[0].id'`

       echo $current_date_time:"------Asignando el MailChat Droplet al Firewall----:"$FWLL_ID >> droplet_mailchat_creation.log 
       FWLL_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/firewalls/$FWLL_ID/droplets" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"droplet_ids": [ '$DROPLET_ID' ]}'`
       echo $current_date_time:"------Salida de Asignacion al Firewall----:"$FWLL_OUTPUT >> droplet_mailchat_creation.log
       break
    fi

    echo -n '.'
    sleep 5
    done

    if [ "$DROPLET_STATUS" != "active" ]; then
       current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
       echo $current_date_time":------ Hubo problemas al bootear el MailChat Droplet ------" >> droplet_mailchat_creation.log
       break
    else
       current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
       echo $current_date_time":----- MailChat Droplet Up & Running! ------" >> droplet_mailchat_creation.log
       break
    fi

fi
  
current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
echo $current_date_time:"----- Imagen aun no disponible, esperando estado available ------" >> droplet_mailchat_creation.log
sleep 5 
 
done

## Obtenemos el IP del droplet nuevo
IP_ADDRESS=`curl -X GET "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.droplet.networks.v4[0].ip_address'`

## Creamos un registro A para taskcontrol.net 
ARECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"A","name":"mailchat","data":"'$IP_ADDRESS'","priority":null,"port":null,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"`

DOMAIN_RECORD_ID=`echo $ARECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_RECORD_ID" == null ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Error al crear RECORD A para mailchat.taskcontrol.net ---" >> droplet_mailchat_creation.log
     ## exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A for mailchat.taskcontrol.net created succesfully! ------" >> droplet_mailchat_creation.log
fi

## Creamos un registro A para el mail chat server: 
ARECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"A","name":"www.mailchat.","data":"'$IP_ADDRESS'","priority":null,"port":null,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"`

DOMAIN_RECORD_ID=`echo $ARECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_RECORD_ID" == null ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Error al crear RECORD A para el MailChat Server -----" >> droplet_mailchat_creation.log
     ## exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A for the MailChat Server created succesfully! ------" >> droplet_mailchat_creation.log
fi

## Creamos un registro MX para taskcontrol.net
MXRECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"MX","name":"mailchat","data":"taskcontrol.net.","priority":1,"port":25,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"`

DOMAIN_RECORD_ID=`echo $MXRECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_RECORD_ID" == null ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Hubo problemas al crear el RECORD MX --------" >> droplet_mailchat_creation.log
     ## exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD MX for the domain taskcontrol.net created succesfully! ------" >> droplet_mailchat_creation.log
fi
 

## Apuntamos Cloudflare al nuevo Droplet mediante la creacion de un registro "A"

DROPLET_NAME_LOWER=`echo "$DROPLET_NAME" | awk '{print tolower($0)}'`

CLOUDFLARE_A_RECORD=`curl -X POST "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records/" -H "X-Auth-Email: support@taskcontrol.net" -H "X-Auth-Key: $CLOUDFLARE_GLOBAL_API_KEY" -H "Content-Type: application/json" --data '{"type":"A","name":"'"$DROPLET_NAME_LOWER"'","content":"'"$IP_ADDRESS"'","ttl":120,"priority":10,"proxied":true}'`


OUTPUT_CLOUDFLARE_A_RECORD=`echo $CLOUDFLARE_A_RECORD | jq  .success`
echo "ver que sale del cloudflare 1 : " $OUTPUT_CLOUDFLARE_A_RECORD


if [ "$OUTPUT_CLOUDFLARE_A_RECORD" != true ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Error al crear RECORD A in CloudFlare for subdomain mailchat --------" >> ${PATH_BASE}droplet_mailchat_creation.log
     ## exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A in CloudFlare for the subdomain mailchat created succesfully!" >> ${PATH_BASE}droplet_mailchat_creation.log
fi


## Apuntamos Cloudflare al nuevo mailchat Droplet con www mediante la creacion de un registro "A"

CLOUDFLARE_A_WWW_RECORD=`curl -X POST "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records/" -H "X-Auth-Email: support@taskcontrol.net" -H "X-Auth-Key: $CLOUDFLARE_GLOBAL_API_KEY" -H "Content-Type: application/json" --data '{"type":"A","name":"www.'"$DROPLET_NAME_LOWER"'","content":"'"$IP_ADDRESS"'","ttl":120,"priority":10,"proxied":true}'`


OUTPUT_CLOUDFLARE_A_WWW_RECORD=`echo $CLOUDFLARE_A_WWW_RECORD | jq  .success`
echo "ver que sale del cloudflare 1 : " $OUTPUT_CLOUDFLARE_A_WWW_RECORD


if [ "$OUTPUT_CLOUDFLARE_A_WWW_RECORD" != true ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Error al crear RECORD A in CloudFlare for www.mailchat --------" >> ${PATH_BASE}droplet_mailchat_creation.log
     ## exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A in CloudFlare for the www.mailchat created succesfully!" >> ${PATH_BASE}droplet_mailchat_creation.log
fi

## Hacemos una pausa de 60 segundos para dar tiempo a que se creen
## los registros A en Cloudflare y se vean en Internet
## (si se ve que es poco tiempo, aumentarlo a 2 minutos por ejemplo)
sleep 60


echo "Copiamos nuestra public key al droplet del mailchat server en usuario taskcontrol"
sshpass -e ssh-copy-id -o StrictHostKeyChecking=no -f -i /home/taskcontrol/.ssh/id_rsa.pub ${REMOTE_USER}@$IP_ADDRESS < "${PATH_BASE}answeryes.txt" 2>>${PATH_BASE}droplet_mailchat_creation.log 

echo "Copiamos nuestra public key al droplet del mailchat server en usuario root"
sshpass -e ssh-copy-id -o StrictHostKeyChecking=no -f -i /root/.ssh/id_rsa.pub ${REMOTE_ROOT_USER}@$IP_ADDRESS < "${PATH_BASE}answeryes.txt" 2>>${PATH_BASE}droplet_mailchat_creation.log 


## Corremos el script de inicializacion del droplet 
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'bash -s' < "${PATH_BASE}bootstrap_mailchat.sh" $IP_ADDRESS $DROPLET_NAME_LOWER 2>>${PATH_BASE}droplet_mailchat_creation.log


## Deshabilitamos configuraciones no seguras de /etc/sshd_config
echo "---Corremos ultimos scripts de configuracion de /etc/sshd ---"
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS '/home/taskcontrol/last_conf.sh' 2 >> ${PATH_BASE}droplet_creation.log


current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"----- Droplet MailChat listo para su uso: "$IP_ADDRESS >> droplet_mailchat_creation.log
echo " "
echo "---------------------------------------------------------------------------------------"

## exit 0   

##  THE END ? ...maybe..but not today.. (TOP GUN II) 
