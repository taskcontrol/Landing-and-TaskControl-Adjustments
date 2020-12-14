<?php
// Envia los emails registrados en email_in_pipeline

define('IN_SITE', 	true);

/*include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/includes/cronbcommon.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/db_access/Cronjobs.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/db_access/Email.php");*/
include_once("../includes/cronbcommon.php");
include_once($physical_path['DB_Access']. 'Cronjobs.php');
include_once($physical_path['DB_Access']. 'Email.php');

$cron 	 = new Cronjobs();
$emails  = new Email();


	global $mail2;
	$mail2 = '';
	$mail2 = new htmlMimeMail();
	
	
	$tpl2 = new Smarty;
	$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';

	$cron->Get_Emails_From_Pipeline();
	$cnt = $db->num_rows();	// get num of rows

	$i=0;
	while($db->next_record())		// loop till last record
	{
		$mail2->setFrom($db->f('send_from'));
		$mail2->setSubject($db->f('mail_subject')); #Email Subject
		$mail_html = $db->f('mail_content');
		$mail2->setHtml($mail_html);
		$result = $mail2->send(array($db->f('send_to')));
		
		$cron->Delete_From_Pipeline($db->f('pk_id'));
		$i++;
	}
?>