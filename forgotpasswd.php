<?

// agregado el 12-4-2014 por seguridad -------------------------------------------------------------------------------------------
if ( isset( $_GET['mem_email']) ){ $filtered_var = mysql_escape_string( $_GET['mem_email'] ); $_GET['mem_email'] = $filtered_var;}
if ( isset( $_POST['mem_email']) ){ $filtered_var = mysql_escape_string( $_POST['mem_email'] ); $_POST['mem_email'] = $filtered_var;}
if ( isset( $_REQUEST['mem_email']) ){ $filtered_var = mysql_escape_string( $_REQUEST['mem_email'] ); $_REQUEST['mem_email'] = $filtered_var;}
// --------------------------------------------------------------------------------------------------------------------------------


define('IN_SITE', 	true);
include_once("includes/common.php");
include_once($physical_path['DB_Access']. 'User.php');
include_once($physical_path['DB_Access']. 'Email.php');
include_once($physical_path['Site_Lang'].'forgotpasswd.php');
include_once($physical_path['DB_Access']. 'Security.php');
$security = new Security();

$Action 	= isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : '');

$emails 		= new Email();
//print($Action);die;
////////////first step validate data here
if($Action == 'Save' && $_POST['Submit'] = $lang['Button_Submit'])
{
 //  $uid = $user->Check_User_ID($_POST['user_id']);
 
  $mail = $user->Check_Email_ID_New($_POST['mem_email']);

/* if($uid == 1 && $mail == 1)
 {
    $msg = $lang['MailError_1'];
 }
 elseif($uid == 1 && $mail == 0)
   {
 		 $msg = $lang['MailError_2'];
   }
 elseif($uid == 0 && $mail == 1)
   {
       $msg = $lang['MailError_3'];
   } 
*/ 
   if($mail == 1)
	 {
		$msg = $lang['MailError_1'];
	 }   
   if($mail == 0)
     {
    //    $details = $user->GetChangeUserInfo1(md5($_POST['user_id']));
        
      //  if($_POST['mem_email'] == ($details->mem_email)) 
	//	{
	//		$forgot_password = $user->Get_Password($_POST['user_id']);
			
			$forgot_password = $user->Get_Password_New($_POST['mem_email']);

			global $mail2;
			$mail2 = '';
			$mail2 = new htmlMimeMail();
			
			$tpl2 = new Smarty;
			$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
			
			$sendinfo = $emails->GetEmailDetails1(EMAIL_FORGET_PASSWORD);
			
			
			$mail2->setFrom($sendinfo->email_adress);
			$mail2->setSubject($sendinfo->email_subject);
			
			$tpl2->assign(array("user_id"				 =>	$_POST['user_id'],
								"email_id"				 => $_POST['mem_email'],
								"password"				 => $security->decrypt($forgot_password->user_passwd1),
								
			));
			$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
			// $mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
			
			$mail_content_reg = $tpl2->fetch("email_template:".EMAIL_FORGET_PASSWORD);	
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

			$result = $mail2->send(array($_POST['mem_email']));
			
			header("location: forgotpasswd_success.html");
			exit();
		}
/*		else
		{
			$msg = $lang['MailError_3'];
		}
 }  */
 else
 {
	$msg = $lang['MailError_3'];
 }

  $tpl->assign(array(	"T_Body"			=>	'forgotpasswd'. $config['tplEx'],
						"JavaScript"		=>	array('forgotpasswd.js'),
            			"msg"				=>	$msg,
						"tab"				=>	4,
				   ));
}

/*first step validate data here*/
$tpl->assign(array(	"T_Body"			=>	'forgotpasswd'. $config['tplEx'],
					"JavaScript"		=>	array('forgotpasswd.js'),
					"lang"				=>  $lang,	
					"Action"			=>	'Save',
					"tab"				=>	4,
					"navigation"		=>	'<label class=navigation>'.$lang['Recover_It'].'</label>'
					));
$tpl->display('default_layout'. $config['tplEx']);
?>
