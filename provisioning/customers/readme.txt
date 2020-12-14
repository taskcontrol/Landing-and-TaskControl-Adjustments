## RFG: 27-11-2019
Aqui se backupea en cada folder, el ultimo backup de la BBDD de cada cliente.
Cada folder tendra el formato: CustomerCompany-Fecha-Plan-Version
(ie. MyCompanyABCD-2019-11-27 00:10-Starter-v19.03.01.01.01)
Se usara tanto para el backup como para el restore de los datos de los droplets de cada customer.
En el backup, se creara el folder con ese formato antes de dejar alli todo el dump zipeado de la bbdd.
En el restore, se descomprime el .sql.gz de acuerdo a la company, fecha, plan y version del customer.

 
