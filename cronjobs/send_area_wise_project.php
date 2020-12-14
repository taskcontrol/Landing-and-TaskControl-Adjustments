<?php
// Para los usuarios con mem_pro_notice = 2 obtiene las categorias de interes y envia emails con los proyectos q machean
define('IN_SITE', 	true);

include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/includes/cronbcommon.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/includes/functions.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/db_access/Cronjobs.php");
include_once("/var/www/vhosts/bairesdate.com/public_html/goitglobal/db_access/Email.php");

$cron 	 = new Cronjobs();
$emails  = new Email();

$member_details = $cron->all_area_wise_emails();
	
$sendinfo = $emails->GetEmailDetails1(SEND_ALL_PROJECTS);

$i = 0;
while ( $db3->next_record() ) {	// loop till last record
	
	$member_info[$i]['user_login_id']				= $db3->f('user_login_id');
	$member_info[$i]['user_auth_id']			    = $db3->f('user_auth_id');
	$member_info[$i]['mem_email']			 	    = $db3->f('mem_email');
	$member_info[$i]['mem_email']			 	    = $db3->f('mem_email');
	$member_info[$i]['mem_category']			 	= $db3->f('mem_category');
	$member_info_cat     							= explode(",",$member_info[$i]['mem_category']);

	$cron->GetProjectByCategory($member_info_cat);
		
	$mail_content_reg = "
						<div style='margin: 0pt; padding: 0pt; display: inline; float: left; width: 577px; background-color: rgb(255, 255, 255);'>
							<div style='margin: 10px 0pt; display: inline; float: left;'>Dear <br>Here is your list of consultations listed. </div>
							<div style='margin: 0pt; padding: 0pt; display: inline; float: left; width: 577px; background-color: rgb(255, 255, 255);'>
						</div>
						<div style='clear: both;'>&nbsp;</div>
	";

	$j = 0; 
	while ( $db1->next_record() ) {
		$arr_related_project[$j]['project_cate']        = Get_Cat_Names_Project($db1->f('project_category'));
		$arr_related_project[$j]['title']		        = $db1->f('project_title');
		$arr_related_project[$j]['budget']		        = $db1->f('development_title'); 
		$arr_related_project[$j]['project_link']        = "<a href='" . $site_path . "project_" . $db1->f('project_id') . "_" . stripslashes(clean_url($db1->f('project_title'))) . ".html'>CLICK HERE TO VIEW THIS PROJECT</a>";
			
		$txt = $j%2 == 0 ? "background-color: rgb(245, 245, 245)" : "";
		$mail_content_reg .= "
               <div style='padding: 0pt 0pt 20px; display: inline; min-height: 50px; float: left; width: 577px; $txt'>
				<div style='margin: 20px 0pt 0pt; display: inline; font-weight: normal; font-size: 10px; float: left; width: 275px; color: rgb(0, 0, 0);'>{$arr_related_project[$j][project_cate]}</div>               	
				<div style='margin: 20px 0pt 0pt; display: inline; font-weight: bold; font-size: 10px; float: left; width: 275px; color: rgb(0, 0, 0);'>{$arr_related_project[$j][title]}<br></div>
               	<div style='margin: 20px 0pt 0pt; display: inline; font-weight: normal; font-size: 10px; float: left; width: 150px; color: rgb(0, 0, 0);'><strong>Budget:</strong> <br>{$arr_related_project[$j][budget]}</div>					              	                {$arr_related_project[$j][project_link]} 
           	</div>
		";
			
		$j++;
	}
		
	$mail_content_reg .= "
			<div style='clear: both;'>&nbsp;</div>
			<!-- are u a buyer ? -->
			<div style='margin: 10px 0pt; display: inline; float: left;'><b>Are you a buyer ?</b> </div>
			<div style='margin: 0pt; padding: 0pt; display: inline; float: left; width: 577px; background-color: rgb(255, 255, 255);'>
				<div style='padding: 0pt 0pt 20px; display: inline; min-height: 50px; float: left; width: 577px;'>
					<div style='margin: 5px 10px 10px; display: inline; font-size: 10px; float: left; color: rgb(0, 0, 0);'>
						<div align='justify'><br>Post your consultation for free and start receiving bids within minutes. Expect to achieve a greater return on investment by using our leading system.<br><br><b>Gain money with the GoItGlobal.com affiliation program.</b><br>Talk about GoItGlobal.com with your friends. You can gain 20% of the revenues done on the site by each new user that you will make register on GoItGlobal.com. Discover how in your my account page<br>
						</div>
					</div>
				</div>
				<div style='clear: both;'>&nbsp;</div>
				<!-- are u a SELLER -->
				<div style='margin: 10px 0pt; display: inline; float: left;'><b>Are you a seller ?</b> </div>
				<div style='margin: 0pt; padding: 0pt; display: inline; float: left; width: 577px; background-color: rgb(255, 255, 255);'>
					<div style='padding: 0pt 0pt 20px; display: inline; min-height: 50px; float: left; width: 577px;'>
						<div style='margin: 5px 10px 10px; display: inline; font-size: 10px; float: left; color: rgb(0, 0, 0);'>
							<div align='justify'><br>Place bids for free to everyday new posted consultations on our site, <br>receive requirements and withdraw your money safetly with our free Escrow.<br><br><b>Gain money with GoItGlobal.com affiliation program.</b><br>Talk about GoItGlobal.com with your friends.You can gain 20% of the revenues done on the site by each of new users that you will make register on GoItGlobal.com. Discover how in your my account page<br>
						</div>
					</div>
				</div>
			</div>
	";
		
	$hdr = "MIME-Version: 1.0\n";
	$hdr .= "Content-type: text/html; charset=iso-8859-1\n";
	$hdr .= "Content-Transfer-Encoding: 8bit\n"; 
	$hdr .= "From: \"GoItGlobal.com\" <{$sendinfo->email_adress}>\n"; 
	$body = $mail_content_reg;
	
	mail($member_info[$i]['mem_email'], $sendinfo->email_subject, $body, $hdr); 
	$i++;
}
?>