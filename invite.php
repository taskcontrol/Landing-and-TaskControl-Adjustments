<?
define('IN_SITE', 	true);
define('IN_USER', 	true);
// including related database and language files
include_once("includes/common.php");
include_once($physical_path['Site_Lang'].'/invite.php');
include_once($physical_path['DB_Access']. 'Email.php');

// creating objects
$emails 		= new Email();

if($_POST['Submit'] == $lang['Button_Send'])
{

   $Fromusername = GetEmailAddress($_SESSION['User_Id']);
   $mail_addresses = explode(",",$_POST['mail_ids']);
   
   
	    global $mail2;
		$mail2 = '';
		$mail2 = new htmlMimeMail();

		$tpl2 = new Smarty;
		$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';

		$mail2->setFrom($Fromusername);
		
		$sendinfo = $emails->GetEmailDetails(EMAIL_INVITE_TAC);
		
		$mail2->setSubject($sendinfo->email_subject);
	

	//	$tpl2->assign(array(
//							"user_id"				=>	$_POST['user_id'],
//							"password"				=>  $_POST['password'],
//							"email_id"				=>  $_POST['mem_email'],
//							));
		$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
		$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
		
		
		$mail_content1 = $tpl2->fetch("email_template:".EMAIL_INVITE_TAC);
		$mail_content2 = $_POST['notes'];
		$mail_content_reg = $mail_content2."".$mail_content1;	
		
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

	if($_POST['mail_ids'] != NULL)
	{
	  foreach($mail_addresses as $key => $val)
		{
           $result = $mail2->send(array($val));
 		}
		
       	header('location: invite.php?send=true');
		exit();					
	}
	else
	{
        $tpl->assign(array(  "T_Body"			=>	'invite'. $config['tplEx'],
							 "JavaScript"		=>	array('invite.js'),
							
						 ));
	  
	}		
}
  
     if($_GET['send'] == 'true')
	    $SuccMsg = $lang['Message2'];

	 $str = $_SERVER['HTTP_REFERER'];
	
	 $str1 = substr(strrchr($str,'/'),1);
	#print $str1;die;
	 $str2 = substr($str1,0,strpos($str1,'?'));
		
	if($str2 == "verify.php")
	 {
		$skip = 'Yes';
	 }	
	else
	 {
		$skip = 'No';
	 }	
	if($str1 == 'account.php');
	{
		$navigation = '<a href=account.php class=footerlink>'.$lang['My_Account'].'</a>';
		$navigation1= '<label class=navigation>'.$lang['Invite'].'</label>';
	}
	$tpl->assign(array(
						"T_Body"			=>	'invite'. $config['tplEx'],
						"JavaScript"		=>	array('invite.js'),
						"lang"				=>	$lang,
						"skip"				=>	$skip,	
						"msg11"             =>  $SuccMsg,
						"tab"				=>	4,
						"navigation"		=>	$navigation,
						"navigation1"		=>	$navigation1,
						"navigation2"		=>	$navigation2,
					));
			
  
$tpl->display('default_layout'. $config['tplEx']);    // assign to layout template
?>