<?php
// Envia los proyectos nuevos a los usuarios q solicitaron ser informados via email.
define('IN_SITE', 	true);

include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/includes/cronbcommon.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/db_access/Cronjobs.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/db_access/Email.php");

    $cron  = new Cronjobs();
    $emails  = new Email();

	$email_address = $cron->mailadd_for_all_project();
	$mail_addresses = explode(",",$email_address);
	$cron->Find_Last_Projects();

	foreach($mail_addresses as $key => $val) {
		$i=0; 
		while($db1->next_record())		// loop till last record
		{
			$view_pro[$i]['id']					= $db1->f('project_id');
			$view_pro[$i]['title']		        = $db1->f('project_title');
			$view_pro[$i]['budget']		        = $db1->f('development_title');
			$view_pro[$i]['posted_by']		    = $db1->f('project_posted_by');
			$view_pro[$i]['cate']		        = Get_Cat_Names_Project($db1->f('project_category'));
				
			global $mail2;
			$mail2 = '';
			$mail2 = new htmlMimeMail();
			
			$tpl2 = new Smarty;
			$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
			
			$sendinfo = $emails->GetEmailDetails1(SEND_NEW_PROJECTS);
			
			$mail2->setFrom($sendinfo->email_adress);
			
			$mail2->setSubject($sendinfo->email_subject);
			$tpl2->assign(array(
									"budget"					=>  $view_pro[$i]['budget'],
									"posted_by"          		=>  $view_pro[$i]['posted_by'],
									"cate"          			=>  $view_pro[$i]['cate'],
									"project_link"				=>	"<a href='" . $site_path . "project_" . $view_pro[$i]['id'] . "_" . stripslashes(clean_url($view_pro[$i]['title'])) . ".html'>".$view_pro[$i]['title']."</a>"
								));
		
			$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
			$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
				
			$mail_content_reg = $tpl2->fetch("email_template:".SEND_NEW_PROJECTS);	
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
			$result = $mail2->send(array($val));  
			$i++;
		}
		/* Si hay proyectos posteados, obtenemos el primero */
		if ( $i )
			$db1->seek();
	}
?>