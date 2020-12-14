<?php

define('IN_SITE', 	true);

include_once("/home/gurufree/public_html/goitglobal/includes/cronbcommon.php");
include_once("/home/gurufree/public_html/goitglobal/db_access/Cronjobs.php");
include_once("/home/gurufree/public_html/goitglobal/db_access/Email.php");

$cron 	 = new Cronjobs();
$emails  = new Email();

$cron->Special_User_Deactive();

?>