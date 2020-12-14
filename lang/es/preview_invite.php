<?
define('IN_SITE', 	true);
include_once("includes/common.php");


global $mail2;
$mail2 = '';
$mail2 = new htmlMimeMail();

$tpl2 = new Smarty;
$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';

$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	

$mail_content_reg = $tpl2->fetch("email_template:".EMAIL_INVITE_TAC);	
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
//$a = $mail2->html;

	$tpl->assign(array(  "T_Body"		=>	'preview_invite'. $config['tplEx'],
						 "a"    	 	=> 	$mail2->html,
				));
$tpl->display('popupwin_layout'. $config['tplEx']);
?>