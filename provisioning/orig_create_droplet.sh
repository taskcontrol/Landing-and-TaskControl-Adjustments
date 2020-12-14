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
                ## SIZE="s-4vcpu-8gb"  ## 160 GB
                ;;
    "Professional")
                SLUGNAME="ubuntu-16-04-x64"
                ## SIZE="s-1vcpu-2gb"  ## 50 GB  
                ;; 
    "Enterprise-One")
		SLUGNAME="ubuntu-16-04-x64"
                ## SIZE="s-4vcpu-8gb"  ## 160 GB
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

IMAGE_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/images" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"name":"'$SLUGNAME'","url":"https://taskcontrol-10-2019.nyc3.digitaloceanspaces.com/'"$DIRECTORIO"'/taskco-07.vdi.gz","distribution": "Ubuntu","region":"nyc3","description":"'$DIRECTORIO'","tags":["'$DIRECTORIO'", "prod"]}'`

export IMAGE_ID=`echo $IMAGE_OUTPUT | jq -r '.image.id'`

## Entra al loop de espera de creacion de imagen para crear luego el droplet
 
while : 
do

## Chequea el estado de la imagen

IMAGE_STATUS=`curl -s "https://api.digitalocean.com/v2/images/$IMAGE_ID" "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq '.image.status'` 

echo "Image Status: "$IMAGE_STATUS >> ${PATH_BASE}droplet_creation.log

if [ "$IMAGE_STATUS" == '"available"' ]; then
   current_date_time=`date +%Y-%m-%d-%H:%M:%S`
   echo $current_date_time":------ Imagen Creada --->Creando Droplet------>:"$DROPLET_NAME >> ${PATH_BASE}droplet_creation.log

# crea el droplet si la imagen anterior esta disponible
DROPLET_OUTPUT=`curl -X POST "https://api.digitalocean.com/v2/droplets" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"name":"'$DROPLET_NAME'","region":"nyc3","size":"'$SIZE'","image":'$IMAGE_ID',"ssh_keys":["45:72:2e:ed:22:2d:ad:d8:0f:57:c0:65:12:e1:8d:61"],"backups":false,"ipv6":false,"user_data":"'"$(cat /home/taskcontrol/user-data-tc.yaml)"'","private_networking":false,"volumes": null,"tags":["'$PLAN'"]}'`

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
     ##  DELETE_STATUS=`curl -X DELETE "https://api.digitalocean.com/v2/images/$IMAGE_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN"` 
    ##   current_date_time=`date +%Y-%m-%d-%H:%M:%S`
    ##   echo $current_date_time:"------Codigo de eliminado de Imagen----:"$DELETE_STATUS >> ${PATH_BASE}droplet_creation.log

       ## Aqui lo asignamos al web firewall
       FWLL_ID=`curl -X GET "https://api.digitalocean.com/v2/firewalls/" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.firewalls[2].id'`

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
IP_ADDRESS=`curl -X GET "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.droplet.networks.v4[1].ip_address'`

NETMASK=`curl -X GET "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.droplet.networks.v4[1].netmask'`

GATEWAY=`curl -X GET "https://api.digitalocean.com/v2/droplets/$DROPLET_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" | jq -r '.droplet.networks.v4[1].gateway'`

echo "el nuevo IP_ADDRESS de v4[1] es : "$IP_ADDRESS >> ${PATH_BASE}droplet_creation.log
echo "el nuevo NETMASK de v4[1] es : "$NETMASK >> ${PATH_BASE}droplet_creation.log
echo "el nuevo GATEWAY de v4[1] es : "$GATEWAY >> ${PATH_BASE}droplet_creation.log

 ## Creamos un registro A para el subdomain.taskcontrol.net (nombre de la empresa)
ARECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"A","name":"'$DROPLET_NAME'","data":"'$IP_ADDRESS'","priority":null,"port":null,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"` 

DOMAIN_RECORD_ID=`echo $ARECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_RECORD_ID" == null ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Error al crear RECORD A para el subdomain---" >> ${PATH_BASE}droplet_creation.log
     ## exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A for the subdomain created succesfully! ------" >> ${PATH_BASE}droplet_creation.log
fi


## Creamos un registro A para el www.subdomain.taskcontrol.net (nombre de la empresa)
ARECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"A","name":"www.'$DROPLET_NAME'","data":"'$IP_ADDRESS'","priority":null,"port":null,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"`

DOMAIN_RECORD_ID=`echo $ARECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_RECORD_ID" == null ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Error al crear RECORD A para www.subdomain--------" >> ${PATH_BASE}droplet_creation.log
     ## exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD A for the www.subdomain created succesfully! ------" >> ${PATH_BASE}droplet_creation.log
fi


## Creamos un registro MX para el subdomain (nombre de la empresa)
MXRECORD=`curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"type":"MX","name":"'$DROPLET_NAME'","data":"mailchat.taskcontrol.net.","priority":1,"port":25,"ttl":1800,"weight":null,"flags":null,"tag":null}' "https://api.digitalocean.com/v2/domains/taskcontrol.net/records"`

DOMAIN_RECORD_ID=`echo $MXRECORD | jq -r '.domain_record.id'`

if [ "$DOMAIN_RECORD_ID" == null ]; then
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":------ Hubo problemas al crear el RECORD MX --------" >> ${PATH_BASE}droplet_creation.log
     ## exit 1
else
     current_date_time=`date +%Y-%m-%d-%H:%M:%S`
     echo $current_date_time":----- RECORD MX for the subdomain created succesfully! ------" >> ${PATH_BASE}droplet_creation.log
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


## echo "Generamos nuestra clave public/privada para compartirla con este nuevo droplet"
## sshpass -e ssh-keygen -q -t rsa -b 4096 -N '' -f /home/taskcontrol/.ssh/id_rsa
## sshpass -e ssh-keygen -q -t rsa -b 4096 -N '' -f /root/.ssh/id_rsa <<< "y

echo "## Copiamos nuestra public key al droplet del cliente en usuario taskcontrol"
sshpass -e ssh-copy-id -o StrictHostKeyChecking=no -f -i /home/taskcontrol/.ssh/id_rsa.pub taskcontrol@$IP_ADDRESS < "/var/www/taskcontrol.net/web/provisioning/answeryes.txt"  2>>${PATH_BASE}droplet_creation.log 

echo "## Copiamos nuestra public key al droplet del cliente en usuario root"
sshpass -e ssh-copy-id -o StrictHostKeyChecking=no -f -i /root/.ssh/id_rsa.pub ${REMOTE_ROOT_USER}@$IP_ADDRESS < "/var/www/taskcontrol.net/web/provisioning/answeryes.txt"  2>>${PATH_BASE}droplet_creation.log 

## sshpass -e ssh-copy-id -o StrictHostKeyChecking=no -f ${REMOTE_ROOT_USER}@$IP_ADDRESS < "/var/www/taskcontrol.net/web/provisioning/answeryes.txt"  2>>${PATH_BASE}droplet_creation.log 


echo "## corremos el script de configuracion inicial del droplet"
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'bash -s' < "/var/www/taskcontrol.net/web/provisioning/bootstrap.sh" $IP_ADDRESS  $DROPLET_NAME_LOWER  $NETMASK  $GATEWAY 2>>${PATH_BASE}droplet_creation.log 

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -e "drop database admin_task;"' 2>> ${PATH_BASE}droplet_creation.log 

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -e "create database admin_task;"' 2>> ${PATH_BASE}droplet_creation.log 

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -e "grant all privileges on admin_task.* to 'root'@'localhost';"' 2>> ${PATH_BASE}droplet_creation.log

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -e "grant all privileges on admin_task.* to 'taskcontrol'@'localhost';"' 2>> ${PATH_BASE}droplet_creation.log


echo "## Importamos la base default requerida por TaskControl"
cat ${PATH_BASE}temp/admin_task.sql | sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'mysql -u root -p"taskcontrol2020!!" -D admin_task' 2>> ${PATH_BASE}droplet_creation.log


echo "### Updateamos la nueva IP y PLAN del droplet del cliente"
mysql -u ${MYSQL_LANDING_USER} -p${MYSQL_LANDING_PASS} --database c1bairesda_taskcontrol << EOF
UPDATE member_master SET member_master.server_ip="$IP_ADDRESS", member_master.actual_version="$VERSION"
WHERE member_master.mem_company="$DROPLET_NAME_LOWER";
EOF


## Apuntamos el panel y el api a la nueva compañia -------------------------------------

## Panel
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan env:set APP_URL https://'$DROPLET_NAME_LOWER'.taskcontrol.net' 2>> ${PATH_BASE}droplet_creation.log

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan env:set API_PATH https://'$DROPLET_NAME_LOWER'.taskcontrol.net/api/' 2>> ${PATH_BASE}droplet_creation.log

## API
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan env:set API_DOMAIN '$DROPLET_NAME_LOWER'.taskcontrol.net/api /var/www/html/api/.env' 2>> ${PATH_BASE}droplet_creation.log 


## Clears : Estos clears eliminan los archivos temporales de cache y config para que tome en cuenta el cambio de ENV
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan route:clear' 2>> ${PATH_BASE}droplet_creation.log 

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan config:clear' 2>> ${PATH_BASE}droplet_creation.log 

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan cache:clear' 2>> ${PATH_BASE}droplet_creation.log 

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan view:clear' 2>> ${PATH_BASE}droplet_creation.log 
## -------------------------------------------------------------------------------------------


echo "## Creamos la nueva compañia del cliente  ----------------------------------------------------"

## Obtenemos la direccion y el mail registrado en la landing
mysql -u ${MYSQL_LANDING_USER} -p${MYSQL_LANDING_PASS} -B --disable-column-names --database c1bairesda_taskcontrol -e "SELECT CONCAT_WS(',',trim(mem_address), trim(mem_phone), trim(mem_email), trim(user_login_id), trim(mem_city), trim(mem_country)) FROM member_master WHERE mem_company=\"$DROPLET_NAME\" and server_ip=\"$IP_ADDRESS\";" | awk -F, '{print $1"," $2"," $3"," $4"," $5"," $6}' > /tmp/LINEA.txt  2>> ${PATH_BASE}droplet_creation.log


export CUSTOMER_COMPANY=$DROPLET_NAME
export CUSTOMER_ADDRESS=`cat /tmp/LINEA.txt | awk -F, '{print $1}' | sed s'/ /_/g'` 
export CUSTOMER_PHONE=`cat /tmp/LINEA.txt | awk -F, '{print $2}' | sed s'/ /_/g'` 
export CUSTOMER_EMAIL=`cat /tmp/LINEA.txt | awk -F, '{print $3}' | sed s'/ /_/g'`
export CUSTOMER_LOGIN_ID=`cat /tmp/LINEA.txt | awk -F, '{print $4}' | sed s'/ /_/g'` 
export CUSTOMER_CITY=`cat /tmp/LINEA.txt | awk -F, '{print $5}' | sed s'/ /_/g'` 
export CUSTOMER_COUNTRY=`cat /tmp/LINEA.txt | awk -F, '{print $6}' | sed s'/ /_/g'` 
## export CUSTOMER_COUNTRY='Argentina'

## sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; /usr/bin/php artisan create:company "'$CUSTOMER_COMPANY'"  "'$CUSTOMER_ADDRESS'" "'$CUSTOMER_PHONE'" "'$CUSTOMER_EMAIL'" "'$CUSTOMER_LOGIN_ID'" "'$CUSTOMER_CITY'" "'$CUSTOMER_COUNTRY'" ' 2>> ${PATH_BASE}droplet_creation.log

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; /usr/bin/php artisan create:company "'$CUSTOMER_COMPANY'"  "'$CUSTOMER_ADDRESS'" "'$CUSTOMER_PHONE'" "'$CUSTOMER_EMAIL'" "'$CUSTOMER_LOGIN_ID'" "'$CUSTOMER_COUNTRY'" "'$CUSTOMER_CITY'" ' 2>> ${PATH_BASE}droplet_creation.log

## ----------  fin de creacion de compañia en TaskControl -----------------

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"----- Droplet listo para su uso: "$IP_ADDRESS >> ${PATH_BASE}droplet_creation.log
echo " "
echo "---------------------------------------------------------------------------------------"

## Updateamos la nueva ip address del droplet del cliente
mysql -u ${MYSQL_LANDING_USER} -p${MYSQL_LANDING_PASS} --database c1bairesda_taskcontrol << EOF
UPDATE member_master SET member_master.server_ip="$IP_ADDRESS" WHERE member_master.mem_company="$DROPLET_NAME";
EOF

# ## Clears  de Laravel ------------------------------------------------------------------------
# sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan config:clear' 2>> ${PATH_BASE}droplet_creation.log 

# sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan cache:clear' 2>> ${PATH_BASE}droplet_creation.log 

# sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan config:cache' 2>> ${PATH_BASE}droplet_creation.log 

# sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan route:clear' 2>> ${PATH_BASE}droplet_creation.log 

# sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan view:clear' 2>> ${PATH_BASE}droplet_creation.log 
# ## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


## Clears  de Laravel ------------------------------------------------------------------------
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan route:clear' 2>> ${PATH_BASE}droplet_creation.log 

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan config:clear' 2>> ${PATH_BASE}droplet_creation.log 

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan cache:clear' 2>> ${PATH_BASE}droplet_creation.log 

sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS 'cd /var/www/html; php artisan view:clear' 2>> ${PATH_BASE}droplet_creation.log 
## -------------------------------------------------------------------------------------------


## Deshabilitamos configuraciones no seguras de /etc/sshd_config
echo "--- Corremos ultimos scripts de configuracion en /etc/sshd ---"
sshpass -e ssh ${REMOTE_ROOT_USER}@$IP_ADDRESS '/home/taskcontrol/last_conf.sh' 2>> ${PATH_BASE}droplet_creation.log

## aqui removemos la imagen base
DELETE_STATUS=`curl -X DELETE "https://api.digitalocean.com/v2/images/$IMAGE_ID" -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN"` 
 current_date_time=`date +%Y-%m-%d-%H:%M:%S`
 echo $current_date_time:"------Codigo de eliminado de Imagen----:"$DELETE_STATUS >> ${PATH_BASE}droplet_creation.log

echo "$DROPLET_NAME_LOWER" | mail -s "Creacion de Droplet OK" support@taskcontrol.net
echo "$IP_ADDRESS" 

## exit 0

##  FIN ? ...maybe..but not today..
