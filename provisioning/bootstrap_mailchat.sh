## #!/bin/bash

set -x 

## Toma como parametro la ip y el nombre de la compañia para el hosts
IP_ADDRESS=$1
DROPLET_NAME=$2 

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"--- Customizing Droplet: "$DROPLET_NAME >> droplet_mailchat_creation.log
  
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"---Customizando /etc/hosts: "$DROPLET_NAME >> droplet_mailchat_creation.log

sed -i 's/127.0.1.0 mailchat	mailchat.taskcontrol.net/"'$IP_ADDRESS'" mailchat	mailchat.taskcontrol.net/' "/etc/hosts"

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"--- Habilitamos modulo de ssl y generamos certificado ssl: " $DROPLET_NAME >> droplet_mailchat_creation.log

## Generamos certificado de Let's Encrypt 
/home/taskcontrol/genssl.sh $DROPLET_NAME >> $PATH_BASE/droplet_mailchat_creation.log
## a2enmod ssl
## a2ensite /etc/nginx/sites-available/$DROPLET_NAME-ssl.conf  
## systemctl reload nginx

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"--- Finishing MailChat Droplet Customizing: "$DROPLET_NAME >> droplet_mailchat_creation.log

exit 0
