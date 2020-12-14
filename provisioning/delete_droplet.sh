#!/bin/bash
## Script de eliminado de un droplet especifico
## RFG: 10-02-2020
## Property of TaskControl, LLC

## Descomentar para debugging
 set -x
## set +x

if [ "$#" -ne 1 ]; then
  echo "Usage: delete_droplet.sh "DropletName" (WITHOUT taskcontrol.net)"
  echo "(ie. delete_droplet.sh "MyCompanyName" "
  sleep 10
  exit 1
fi


## Pedimos 4 confirmaciones antes de eliminarlo!!!
res='n'
echo "First Confirmation: Are you Sure you want to delete Droplet: "$1 "(y/n) ?"
read res
if [$rex != 'y'];then 
exit 
fi

echo "Second Confirmation: Are you Sure you want to delete Droplet: "$1 "(y/n) ?"
read res
if [ $res != 'y' ];then 
exit
fi

echo "Third Confirmation: Are you Sure you want to delete Droplet: "$1 "(y/n) ?"
read res
if [ $res != 'y' ];then 
exit
fi

echo "Fourth and LAST Confirmation!!: Are you Sure you want to delete Droplet: "$1 "(y/n) ?"
read res
if [ $res != 'y' ];then
exit
fi


## Corremos el enviroment de claves
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

## seteos para MySQL 
export DB_BACKUP_PATH='/var/www/taskcontrol.net/web/provisioning/customers/'
export MYSQL_HOST='localhost'
export MYSQL_PORT='3306'
export MYSQL_USER='root'
export MYSQL_PASSWORD='taskcontrol!!2020!!'
export DATABASE_NAME='admin_task'
export BACKUP_RETAIN_DAYS=7   ## Number of days to keep local backup copy
export MYSQL_LANDING_USER='c1taskcontrol'
export MYSQL_LANDING_PASS='j6BRh3gN65tXnE'

## Seteos para Cloudflare
export CLOUDFLARE_API_TOKEN=KamCT8vm8diHT7v5UjR-vzGYoYu9Sutsn0C2Hm4O
export CLOUDFLARE_GLOBAL_API_KEY=0241c0aad279f6a0721ea156af027958695f9
export CLOUDFLARE_ZONE_ID=32a2f66b0cb3ec48d59ef2ede8f80afe
export CLOUDFLARE_ACCOUNT_ID=4d385daee1402de17a059aa7fafe7e7b

###### fin de prueba de token ##############################################

## Comenzamos el proceso de eliminacion del droplet del customer

if [ ! -f ${PATH_BASE}"droplet_deletion.log" ]; then
   touch ${PATH_BASE}"droplet_deletion.log"
fi

## Le pasamos el droplet id
DROPLET_NAME=$1

current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
echo "----------------------------------------------------------------------------------"
echo $current_date_time":------ Eliminando Droplet...------> $DROPLET_NAME ">> ${PATH_BASE}"droplet_deletion.log"

## Encontramos el ID del droplet 
DROPLET_ID=`/snap/bin/doctl -t $DO_TOKEN compute droplet list | grep -i $DROPLET_NAME | grep -v "www" | awk '{print $1}'`

IP_ADDRESS=`/snap/bin/doctl -t $DO_TOKEN compute droplet list | grep -i $DROPLET_NAME | grep -v "www" | awk '{print $3}'`

## Encuentro y elimino el registro "A" de ese droplet (companyname)
A_RECORD_ID=`/snap/bin/doctl -t $DO_TOKEN compute domain records list taskcontrol.net | grep -i $IP_ADDRESS | grep -v "www" | awk '{ if ($2 == "A") print $1}'`

DELETE_RECORD_A_OUTPUT=`curl -X DELETE -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/domains/taskcontrol.net/records/$A_RECORD_ID"`


## Encuentro y elimino el registro "A" de ese droplet (www.companyname)
A_WWW_RECORD_ID=`/snap/bin/doctl -t $DO_TOKEN compute domain records list taskcontrol.net | grep -i $IP_ADDRESS | grep "www" | awk '{ if ($2 == "A") print $1}'`

DELETE_RECORD_A_WWW_OUTPUT=`curl -X DELETE -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/domains/taskcontrol.net/records/$A_WWW_RECORD_ID"`


## eliminamos el MX record de ese droplet
MX_RECORD_ID=`/snap/bin/doctl -t $DO_TOKEN compute domain records list taskcontrol.net | awk '{ if ( $2 == "MX" ) print $0 }' |  grep -i $DROPLET_NAME | awk '{ print $1 }' `


DELETE_RECORD_MX_OUTPUT=`curl -X DELETE -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/domains/taskcontrol.net/records/$MX_RECORD_ID"`


## Encuentro el fwll id  y eliminamos la asignacion del droplet al firewall
FWLL_ID=`curl -X GET "https://api.digitalocean.com/v2/firewalls/" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.firewalls[].id'`


DELETE_FWLL_ASSIGNAMENT_OUTPUT=`curl -X DELETE -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"droplet_ids":['$DROPLET_ID']}' "https://api.digitalocean.com/v2/firewalls/$FWLL_ID/droplets"`


### Eliminamos RECORD A de company en Cloudflare 

## Primero obtenemos el id de registro A
MINUSCULA=`echo "$DROPLET_NAME" | awk '{print tolower($0)}'`
CLOUDFLARE_ID_A_RECORD=`curl -X GET "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records?type=A&name=$MINUSCULA".taskcontrol.net"&content="$IP_ADDRESS"&proxied=true&page=1&per_page=20&order=type&direction=desc&match=all" -H "X-Auth-Email: support@taskcontrol.net" -H "X-Auth-Key: $CLOUDFLARE_GLOBAL_API_KEY" -H "Content-Type: application/json"`

OUTPUT_CLOUDFLARE_ID_A_RECORD=`echo $CLOUDFLARE_ID_A_RECORD | jq '.result[0]' | grep id | grep -v zone_id | awk -F: '{print $2}' | sed 's/"//g' | sed 's/,//g'| sed 's/ //g'`

echo "el id del record A es: " $OUTPUT_CLOUDFLARE_ID_A_RECORD

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
curl -X DELETE "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records/$OUTPUT_CLOUDFLARE_ID_A_RECORD" -H "X-Auth-Email: support@taskcontrol.net" -H "X-Auth-Key: $CLOUDFLARE_GLOBAL_API_KEY" -H "Content-Type: application/json"

## ahora obtengo el id record del www.subdomain
MINUSCULA=`echo "www.$DROPLET_NAME" | awk '{print tolower($0)}'`
echo "que tiene www.minuscula: "$MINUSCULA
CLOUDFLARE_ID_A_WWW_RECORD=`curl -X GET "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records?name=$MINUSCULA".taskcontrol.net"&type=A&content="$IP_ADDRESS"&proxied=true&page=1&per_page=100&order=type&direction=desc&match=all" -H "X-Auth-Email: support@taskcontrol.net" -H "X-Auth-Key: $CLOUDFLARE_GLOBAL_API_KEY" -H "Content-Type: application/json"`

OUTPUT_CLOUDFLARE_ID_A_WWW_RECORD=`echo $CLOUDFLARE_ID_A_WWW_RECORD | jq '.result[0]' | grep id | grep -v zone_id | awk -F: '{print $2}' | sed 's/"//g' | sed 's/,//g'| sed 's/ //g'`
echo "salida del ID_A_WWW_RECORD : " $OUTPUT_CLOUDFLARE_ID_A_WWW_RECORD

curl -X DELETE "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records/$OUTPUT_CLOUDFLARE_ID_A_WWW_RECORD" -H "X-Auth-Email: support@taskcontrol.net" -H "X-Auth-Key: $CLOUDFLARE_GLOBAL_API_KEY" -H "Content-Type: application/json"
     

## Elimino el droplet en si mismo
/snap/bin/doctl -t $DO_TOKEN compute droplet delete $DROPLET_NAME

if [ $? -ne 0 ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
     echo $current_date_time":------ No se pudo eliminar el Droplet(doctl): $DROPLET_NAME Chequear!!" >> ${PATH_BASE}"droplet_deletion.log"
     exit 1
fi

## Seteo a CERO el plan y la ip address y la version en la BBDD de la landing
## Tabla: member_master
/usr/bin/mysql -u ${MYSQL_LANDING_USER} -p${MYSQL_LANDING_PASS} --database c1bairesda_taskcontrol << EOF
UPDATE member_master SET member_master.membership_id=0, member_master.server_ip='', member_master.actual_version='' WHERE member_master.mem_company="$DROPLET_NAME";
EOF


if [ $? -ne 0 ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S` 
     echo $current_date_time":------ No se pudo eliminar Datos de la Landing: $DROPLET_NAME Chequear!!" >> ${PATH_BASE}"droplet_deletion.log"
     exit 1
fi

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"----- Droplet Eliminado: $DROPLET_NAME " >> ${PATH_BASE}"droplet_deletion.log"

echo "$DROPLET_NAME" | mail -s "Eliminacion de Droplet OK! " support@taskcontrol.net

echo " "
echo "---------------------------------------------------------------------------------------"

## exit 0

##  FIN ? ...maybe..but not today..
