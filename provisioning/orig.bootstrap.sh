## #!/bin/bash

set -x

## Si flag=0 generamos el certificado ssl nosotros, si flag=1 lo genera Let's Encrypt
## Mientras este en desarrollo, lo dejamos en 0 (lo generamos nosotros, no la CA)
flag=0

## Toma como parametro la ip y el nombre de la compañia para el hosts
IP_ADDRESS=$1
DROPLET_NAME=$2 

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"--- Customizing Droplet: "$DROPLET_NAME >> droplet_creation.log

cp -p /etc/hosts /etc/hostsorig
cp -p /etc/hostname /etc/hostnameorig

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"---Customizando /etc/hosts: "$DROPLET_NAME >> droplet_creation.log

sed -i 's/127.0.0.1	taskcontrol.net	taskcontrol/'"$IP_ADDRESS"'	'"$DROPLET_NAME"'.taskcontrol.net	'"$DROPLET_NAME"'/' "/etc/hosts"
sed -i '$ s/$/10.10.2.1	mailchat.taskcontrol.net\n/' "/etc/hosts"
sed -i '$ s/$/209.239.116.188 prd01-taskcontrol.ddns.net	prd01-taskcontrol/' "/etc/hosts"
sed -i 's/taskcontrol/'"$DROPLET_NAME"'/' "/etc/hostname"


#### comenzamos la generacion del cerfificado (nuestro o de Let's Encrypt, segun valor del flag)

if [ !flag ]; then
    current_date_time=`date +%Y-%m-%d-%H:%M:%S`
    echo $current_date_time:"--- Generamos certificado firmado por nosotros mismos:" $DROPLET_NAME >> droplet_creation.log

    mkdir /etc/apache2/ssl
    /etc/apache2/gen-self-cert.exp $DROPLET_NAME 
    current_date_time=`date +%Y-%m-%d-%H:%M:%S`
    echo $current_date_time:"--- Creamos y customizamos el apache ssl.conf:" $DROPLET_NAME >> droplet_creation.log
    cp -p /etc/apache2/sites-available/taskcontrol-ssl.conf /etc/apache2/sites-available/$DROPLET_NAME-ssl.conf
   
    sed -i 's/ServerName taskcontrol.net/ServerName '$DROPLET_NAME'.taskcontrol.net/' "/etc/apache2/sites-available/"$DROPLET_NAME"-ssl.conf"

    sed -i 's/ServerAlias www.taskcontrol.net/ServerAlias www.'$DROPLET_NAME'.taskcontrol.net/' "/etc/apache2/sites-available/"$DROPLET_NAME"-ssl.conf"

    sed -i 's/\/etc\/ssl\/certs\/ssl-cert-snakeoil.pem/\/etc\/apache2\/ssl\/apache.crt/' "/etc/apache2/sites-available/"$DROPLET_NAME"-ssl.conf"

    sed -i 's/\/etc\/ssl\/certs\/ssl-cert-snakeoil.key/\/etc\/apache2\/ssl\/apache.key/' "/etc/apache2/sites-available/"$DROPLET_NAME"-ssl.conf"

else

    ## Generamos el certificado por Let's Encrypt	 
    current_date_time=`date +%Y-%m-%d-%H:%M:%S`
    echo $current_date_time: "--- Obtenemos el certificados firmado por Let's Encrypt: " $DROPLET_NAME >> droplet_creation.log

    /usr/sbin/a2ensite /etc/apache2/sites-available/000-default.conf
    systemctl reload apache2

    /usr/bin/expect /etc/apache2/gen-letsencrypt-cert.exp $DROPLET_NAME

    ## certbot --apache -d $DROPLET_NAME.taskcontrol.net -d www.$DROPLET_NAME.taskcontrol.net
    ## (automatizar con tcl o expect) (seleccionar 2 all request to https access) 

    current_date_time=`date +%Y-%m-%d-%H:%M:%S`
    echo $current_date_time: "--- Creamos y customizamos apache ssl.conf:" $DROPLET_NAME >> droplet_creation.log
    cp -p /etc/apache2/sites-available/taskcontrol-ssl.conf /etc/apache2/sites-available/$DROPLET_NAME-ssl.conf
   
   sed -i 's/ServerName taskcontrol/ServerName '"$DROPLET_NAME"'.taskcontrol.net/' "/etc/apache2/sites-available/"$DROPLET_NAME"-ssl.conf"

   sed -i 's/ServerAlias www.taskcontrol/ServerAlias www.'"$DROPLET_NAME"'.taskcontrol.net/' "/etc/apache2/sites-available/"$DROPLET_NAME"-ssl.conf"

fi

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"--- Habilitamos el modulo de apache ssl y configuracion ssl: " $DROPLET_NAME >> droplet_creation.log

/usr/sbin/a2enmod ssl
systemctl reload apache2
## /usr/sbin/a2ensite /etc/apache2/sites-available/$DROPLET_NAME-ssl
a2ensite /etc/apache2/sites-available/$DROPLET_NAME-ssl
## systemctl restart apache2

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"--- Recargamos apache2, para que tome los cambios hechos: " $DROPLET_NAME >> droplet_creation.log

systemctl restart apache2

current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"--- Habilitamos Apache Full (443) y deshabilitamos el Apache (80) en el ufw: " $DROPLET_NAME >> droplet_creation.log

ufw allow 'Apache Full'
ufw delete allow 'Apache'

## finalizamos la customizacion del droplet nuevo
current_date_time=`date +%Y-%m-%d-%H:%M:%S`
echo $current_date_time:"--- Finishing Droplet Customizing: "$DROPLET_NAME >> droplet_creation.log

exit 0
