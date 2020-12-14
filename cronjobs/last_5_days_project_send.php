<?php
///////deactivate those user who are not logged in from last 31 days
define('IN_SITE', 	true);

include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/includes/cronjobs/cronbcommon.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/db_access/Cronjobs.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/db_access/Email.php");

$cron 	 = new Cronjobs();
$emails  = new Email();

    //select project :::  
	$cron->Last_Five_Days_Projects(date('Y-m-d', mktime(0,0,0,date("m"),date("d")-5,date("y"))),date('Y-m-d'));
	$cnt = $db->num_rows();	// get num of rows

	$i=0;
	while($db->next_record())		// loop till last record
	{
		$view_pro[$i]['id']					= $db->f('project_id');
		$view_pro[$i]['title']		        = $db->f('project_title');
		$view_pro[$i]['budget']		        = $db->f('development_title');
		$view_pro[$i]['dec']		        = $db->f('project_description');
		$view_pro[$i]['project_link']       = "<a href=".$site_path."project_".$db->f('project_id').".html>CLICK HERE TO VIEW THIS PROJECT</a>";
		$i++;
	}
	///send email to user who are select all projects send option
	$email_address = $cron->all_emails_limit();//chnages
	
	$mail_addresses = explode(",",$email_address);
	
    if($cnt > 0)
	{
		global $mail2;
		$mail2 = '';
		$mail2 = new htmlMimeMail();
		
		$tpl2 = new Smarty;
		$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
		
		$sendinfo = $emails->GetEmailDetails1(SEND_ALL_PROJECTS);
		
		$mail2->setFrom($sendinfo->email_adress);
		
		$subject_text = ereg_replace("%Sum%",$Avrage_Sum,$sendinfo->email_subject);
	
		$subject_text2 = ereg_replace("%date1%",date('d-m-Y ',mktime(0,0,0,date("m"),date("d")-1,date("y"))),$subject_text);
		
		$mail2->setSubject($subject_text2); #Email Subject
		
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
		
		foreach($mail_addresses as $key => $val)
		{
		  $result = $mail2->send(array($val));
		}
	}	
?>