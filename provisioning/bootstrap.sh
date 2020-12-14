#!/bin/bash

set -x 

PATH_BASE='/home/taskcontrol/'

## Toma como parametro la ip y el nombre de la compañia para el hosts
IP_ADDRESS=$1
DROPLET_NAME=$2 
NETMASK=$3
GATEWAY=$4

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo "--- Ingreso a Boostrap.sh ---"

echo $current_date_time:"--- Ingreso a bootstrap.sh: Customizing Droplet: "$DROPLET_NAME >> $PATH_BASE/droplet_creation.log


## echo "-- Fuerzo el IP ADDRESS hasta que encuentre una solucion definitiva --"
## ifconfig eth0 $IP_ADDRESS netmask $NETMASK up
## ip route add default via $GATEWAY


current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"---Customizando sshd, /etc/hosts, taskcontrol.conf y creando certificado ssl (Let's Encrypt): "$DROPLET_NAME >> $PATH_BASE/droplet_creation.log

## Agrego la nueva IP en /etc/hosts y el nameserver de google en /etc/resolv.conf
sudo sed -i 's/127.0.1.1 '"$DROPLET_NAME"' '"$DROPLET_NAME"'/'"$IP_ADDRESS"'	'"$DROPLET_NAME"'	'"$DROPLET_NAME"'.taskcontrol.net\n/' "/etc/hosts" 2>&1

sudo sed -i '$ s/$/'"$IP_ADDRESS"'	'"$DROPLET_NAME"'	www.'"$DROPLET_NAME"'.taskcontrol.net\n/' "/etc/hosts"
## sudo sed -i '$ s/$/nameserver 8.8.8.8\n/' "/etc/resolv.conf" 

## Cambio al nuevo hostname
sudo sed -i 's/taskcontrol/'"$DROPLET_NAME"'/' "/etc/hostname"

## Reemplazo company por el nombre de la compañia en la configuracion default del Apache2
sudo sed -i 's/company/'"$DROPLET_NAME"'/' "/etc/apache2/sites-available/taskcontrol.conf" 2>&1
## a2dissite taskcontrol-ssl  ## deshabilitamos el conf del web de testing
## a2ensite taskcontrol ## habilitamos el conf del web de prod (port 80)
## systemctl restart apache2

/home/taskcontrol/genssl.sh $DROPLET_NAME  >> $PATH_BASE/droplet_creation.log

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"--- Finish bootstrap Droplet Customizing: "$DROPLET_NAME >> $PATH_BASE/droplet_creation.log

exit 0
