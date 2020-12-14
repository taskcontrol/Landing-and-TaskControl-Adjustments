<?php

define('IN_SITE', 	true);

include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/includes/cronbcommon.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/db_access/Cronjobs.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/db_access/Email.php");

$cron 	 = new Cronjobs();
$emails  = new Email();

	$Avrage_Sum = $cron->SUM_Of_All_Projects(); // suma de las ganancias en una dada fecha (dia anterior)

	$cron->All_Projects(); // retorna todos los proyectos posteados el dia anterior
	$cnt = $db->num_rows();	

	$i=0;
	while($db->next_record())		
	{
		$view_pro[$i]['id']					= $db->f('project_id');
		$view_pro[$i]['title']		        = $db->f('project_title');
		$view_pro[$i]['budget']		        = $db->f('development_title');
		$view_pro[$i]['dec']		        = $db->f('project_description');
		$view_pro[$i]['project_link']       = "<a href=".$site_path."project_".$db->f('project_id')."_".clean_url($db->f('project_title')).".html>CLICK HERE TO VIEW THIS PROJECT</a>";
		$i++;
	}

	$email_address = $cron->all_emails(); // retorna todos los emails de los usuarios q seleccionaron ser informados sobre todos los proyectos posteados
	
	$mail_addresses = explode(",",$email_address);
    if($cnt > 0)
	{
	
		global $mail2;
		$mail2 = '';
		$mail2 = new htmlMimeMail();
		
		
		$tpl2 = new Smarty;
		$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
		$sendinfo = $emails->GetEmailDetails1(SEND_ALL_PROJECTS);
		
		//$mail2->setFrom($sendinfo->email_adress);
		
		$subject_text = ereg_replace("%Sum%",$Avrage_Sum,$sendinfo->email_subject);
	
		$subject_text2 = ereg_replace("%date1%",date('d-m-Y ',mktime(0,0,0,date("m"),date("d")-1,date("y"))),$subject_text);
		
		//$mail2->setSubject($subject_text2); #Email Subject
		
		$tpl2->assign(array(	"view_project"				=>	$view_pro,
								"Loop"						=>  $cnt,
								"path"          			=>  $site_path,
								"path_post_project"			=>	"<a href=".$site_path."post_project.php>POST PROJECT NOW</a>",
							));
	
		$mail_content_reg = $tpl2->fetch("email_template:".SEND_ALL_PROJECTS);	
		$mail_html = "<table border=0 cellpadding=0 cellspacing=0 width=75%>
						<tr>
							<td>".$mail_content_reg."</td>
						</tr>
				      </table>";
		$mail2->setHtml($mail_html);
//print_r($mail_addresses);die;
		foreach($mail_addresses as $key => $val)
		{
//		  $result = $mail2->send(array($val));
		  $cron->Insert_In_PipeMail($val,$sendinfo->email_adress,$subject_text2,$mail_html);
		}

		
	}	
	
?>