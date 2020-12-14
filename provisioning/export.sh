#!/bin/bash
 
##   MySQL Database Backup Script 
##   RFG: 13-12-2019        
##   Property of TaskControl, LLC
## Recibe el nombre del directorio donde dejar el backup de la BBDD  

export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=`date +"%d%b%Y"`
 
################## Settings  ########################
 
DB_BACKUP_PATH=$1  
MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_USER='admin_task'
MYSQL_PASSWORD='TaskC0ntr0l2019'
DATABASE_NAME='admin_task'
## BACKUP_RETAIN_DAYS=30   ## Number of days to keep local backup copy
BACKUP_RETAIN_DAYS=7       ## Number of days to keep local backup copy
 
#################################################################
 
mysqldump -h ${MYSQL_HOST} \
   -P ${MYSQL_PORT} \
   -u ${MYSQL_USER} \
   -p${MYSQL_PASSWORD} \
   ${DATABASE_NAME} | gzip > ${DB_BACKUP_PATH}.sql.gz
 
if [ $? -eq 0 ]; then
  echo "Database backup successfully completed"
else
  echo "Error found during backup"
  exit 1
fi
 
 
##### Remove backups older than {BACKUP_RETAIN_DAYS} days  #####
 
DBDELDATE=`date +"%d%b%Y" --date="${BACKUP_RETAIN_DAYS} days ago"`
 
if [ ! -z ${DB_BACKUP_PATH} ]; then
      cd ${DB_BACKUP_PATH}
      if [ ! -z ${DBDELDATE} ] && [ -d ${DBDELDATE} ]; then
            rm -rf ${DBDELDATE}
      fi
fi
 
### End of script ####    
