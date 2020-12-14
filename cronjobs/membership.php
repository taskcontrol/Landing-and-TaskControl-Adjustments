<?php
// Gestiona operaciones con usuarios especiales y VIP

define('IN_SITE', 	true);

include_once("/var/www/taskcontrol.net/web/includes/cronbcommon.php");
include_once("/var/www/taskcontrol.net/web/db_access/Cronjobs.php");
include_once("/var/www/taskcontrol.net/web/db_access/Email.php");

$cron 	 = new Cronjobs();
$emails  = new Email();

$cron->One_Month_Special_User_Deactive(); // Desactiva los "usuarios especiales" q llegaron al limite de tiempo. No se q son los usuarios especiales.
$details = $cron->Membership();           // Obtiene todos los usuarios q son VIP q se les vence hoy el periodo y les envia un email para invitarlos a seguir comprando membresia

	$i=0;

	while($db1->next_record())		
	{
		$member[$i]['user_login_id']				= $db1->f('user_login_id');
		$member[$i]['membership_name']		        = $db1->f('membership_name');
		$member[$i]['membership_buy_date']		    = $db1->f('membership_buy_date');
		$member[$i]['membership_finish_date']		= $db1->f('membership_finish_date');
		$member[$i]['mem_email']		  			= $db1->f('mem_email');
         
		global $mail2;
		$mail2 = '';
		$mail2 = new htmlMimeMail();
		
		$tpl2 = new Smarty;
		$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
		
		$sendinfo = $emails->GetEmailDetails1(RENEW_MEMBERSHIP);
		$mail2->setFrom($sendinfo->email_adress);
			
		$mail2->setSubject($sendinfo->email_subject);
		$tpl2->assign(array(
		                    "member_name"				=>	$member[$i]['user_login_id'],
							"membership_name"			=>  $member[$i]['membership_name'],
							"buy_date"          		=>  $member[$i]['membership_buy_date'],
							"exp_date"          		=>  $member[$i]['membership_finish_date'],
							));
	
		$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
		$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
			
		$mail_content_reg = $tpl2->fetch("email_template:".RENEW_MEMBERSHIP);	
		$mail_html = "<table border=0 cellpadding=0 cellspacing=0 width=75%>
						<tr>
							<td>".$mail_content_header."</td>
						</tr>
						<tr>
							<td>".$mail_content_reg."</td>
						</tr>
						<tr>
							<td>".$mail_content_footer."</td>
						</tr>
					</table>";
		$mail2->setHtml($mail_html);
		$result = $mail2->send(array($member[$i]['mem_email'])); 
		
		$details = $cron->Update($member[$i]['user_login_id']);
		$i++;
}	
?>
