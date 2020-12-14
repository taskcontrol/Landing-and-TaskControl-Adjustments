<?php
// Gestiona proyectos con respecto a fechas de finalizacion: actualiza los proyectos abiertos a cerrados segun se cumplio la fecha de finalizacion y envia email

define('IN_SITE', 	true);

include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/includes/cronbcommon.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/includes/functions.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/db_access/Cronjobs.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/db_access/Email.php");

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : 'ViewAll');

$cron = new Cronjobs();
$emails  = new Email();

/*
Project Status information
-------------------------------
1: Project open 
2: Project freezed 
3: Project close for bidding 
4: Project canceled (closed manually by user) 
5: Project semi-closed (aun le da una semana mas para asignar proveedor); 
6: Project complete 
7: Project closed
*/

//$cron->Deactivate_User();
$cron->Project_status(); // actualiza el estado de los proyectos de abiertos a cerrados segun se cumplio la fecha de finalizacion y asigna un valor a la fecha project_closed_date (el status pasa de 1 a 5)

$cron->send_mail_to_closedproject(); // obtiene todos los proyectos con estado igual a 5
$cnt = $db3->num_rows();	

$i=0; // de todos los proyectos con estado = 5, envia emails a los dueños de aquellos proyectos cuya fecha de finalizacion es igual a la fecha de finalizacion + 1 o 2 semanas
while($db3->next_record())		
{		
	$project_details[$i]['project_id']					= $db3->f('project_id');
	$project_details[$i]['project_title']				= $db3->f('project_title');
	$project_details[$i]['project_posted_by']			= $db3->f('project_posted_by');
	$project_details[$i]['auth_id_of_post_by']			= $db3->f('auth_id_of_post_by');
	$project_details[$i]['mem_email']			 	    = $db3->f('mem_email');	
	$project_details[$i]['project_closed_date']			= $db3->f('project_closed_date');
	$a = explode("-",$db3->f('project_closed_date'));
	$project_details[$i]['project_new_date']			 = date('Y-m-d', mktime(0,0,0,$a[1],($a[2]+ 7),$a[0]) ); // project_closed_date + 7 dias

	$today_date = date('Y-m-d');
	
	if ( $today_date == $project_details[$i]['project_closed_date'] ) { // Aviso de q el periodo de oferta acaba de vencer y notifica q tiene una semana (7 dias) para asignar el proyecto a algun proveedor.
		global $mail2;
		$mail2 = '';
		$mail2 = new htmlMimeMail();
		
		$sendinfo = $emails->GetEmailDetails1(PROJECT_WILL_BE_CLOSED);
		$mail2->setFrom($sendinfo->email_adress);
		$mail2->setSubject($sendinfo->email_subject);
		
		$search  = array("{\$user_id}", "{\$project_name}");
		$replace = array($project_details[$i]['project_posted_by'], "<a href=".$site_path."project_".$project_details[$i]['project_id']."_".clean_url($project_details[$i]['project_title']).".html>".$project_details[$i]['project_title']."</a>");
		
		$mail_content_reg = str_replace($search, $replace, $sendinfo->email_content);	
		
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
		$mail2->send(array($project_details[$i]['mem_email']));
	}
	elseif ( $today_date == $project_details[$i]['project_new_date'] ) { // Aviso de q el proyecto esta cerrado; hay q devolver el dinero.
	
		global $mail2;
		$mail2 = '';
		$mail2 = new htmlMimeMail();

		include_once($physical_path['DB_Access']. 'Project.php');

		$proj 		= new Project();
		
		$sendinfo = $emails->GetEmailDetails1(PROJECT_CLOSED);
		$mail2->setFrom($sendinfo->email_adress);
		$mail2->setSubject($sendinfo->email_subject);
		
		$search  = array("{\$user_id}", "{\$project_name}");
		$replace = array($project_details[$i]['project_posted_by'], "<a href=".$site_path."project_".$project_details[$i]['project_id']."_".clean_url($project_details[$i]['project_title']).".html>".$project_details[$i]['project_title']."</a>");
		
		$mail_content_reg = str_replace($search, $replace, $sendinfo->email_content);	
		
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
		$mail2->send(array($project_details[$i]['mem_email']));
		
		// Retornamos la comision
		$ret  = $proj->Payapl_Tran($project_details[$i]['project_id']);  // get the amount that need to be refunded
		$buyer_wallet = Select_wallet_sum($project_details[$i]['auth_id_of_post_by']); 
		$new_wallet = $buyer_wallet + $ret; 
		//Update Buyer Wallet (refund)
		Update_wallet_sum($project_details[$i]['auth_id_of_post_by'], $new_wallet);
		$proj->Return_Buyer_Paypal($project_details[$i]['auth_id_of_post_by'], $project_details[$i]['project_posted_by'], $ret, $project_details[$i]['project_title']); 
		
		$cron->Update_Status_Of_Project($project_details[$i]['project_id']);
	}
	$i++;
}
?>