<?
define('IN_SITE', 	true);
define('IN_USER', 	true);

// including related database and language files
include_once("includes/common.php");
include_once("includes/functions.php");
include_once($physical_path['DB_Access']. 'Email.php');
include_once($physical_path['DB_Access']. 'User.php');
include_once($physical_path['Site_Lang'].'changepasswd.php');

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : 'ViewAll');

$emails 		= new Email();
$user           = new User();

##############################################################################################
//	Change Password into database
##############################################################################################
if($Action == 'ChangePass' && $_POST['Sumbit'] = $lang['Button_password'])
{
    
   if($user->UpdatePassUser($_SESSION['User_Id'],$_POST['old_password'],$_POST['new_password1']))
	{
	    // echo "paso 1-1";
		header('location: changepasswd.php?update=true');
		
		// Se le envia el mail de notificacion de cambio de password
        ////////////////////////////////////////////////////////////////////////////
        global $mail2;
        $mail2 = '';
        $mail2 = new htmlMimeMail();
		
		$tpl2 = new Smarty;
        $tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
        $mail2->setFrom('support@taskcontrol.co');
        $mail2->setSubject('TaskControl: Password changed');
        $tpl2->assign(array("user_id" =>$_SESSION['User_Id'],
                           ));
    
        $mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
        $mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
        $mail_content_reg = $tpl2->fetch("email_template:".EMAIL_CHANGE_PASSWORD);	


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
        $recevier = GetEmailAddress($_SESSION['User_Id']);
        // echo " El user auth id del usuario es: "; echo $_SESSION['User_Id'];
        // echo " El mail receiver es: "; echo $recevier;
        
        $result = $mail2->send(array($recevier));
    
        ////////////////////////////////////////////////////////////////////////////////////////    
		 
		exit();
	}
	else
	{
		header('location: changepasswd.php?update=false');
		exit();
	}
}
##############################################################################################

if($Action == 'ViewAll')
{

	if($_GET['update'] == 'true')
		$succMsg='<br>Password has been changed successfully.<br>';
	else if($_GET['update'] == 'false')
		$errMsg='<br>Please check your old password.<br>';

##############################################################################################
/// assing templates and javascript with related varibles according to template
/// get detail of user from session id
##############################################################################################
	$result = $user->UserInfo($_SESSION['User_Id']);
	
	$str = $_SERVER['HTTP_REFERER'];
	
	 $str1 = substr(strrchr($str,'/'),1);
	
	if($str1 == 'edit_userinfo.php')
	{
		$navigation = '<a href=post_project.php class=footerlink>'.$lang['My_Account'].'</a>';
		$navigation1= '<a href=edit_userinfo.php class=footerlink>'.$lang['Edit_Account_Info'].'</a>';
		$navigation2= '<label class=navigation>'.$lang['change_pass_Page'].'</label>';
	}
	else
	{
		$navigation				= '<a href=account.php class=footerlink>'.$lang['My_Account'].'</a>';
		$navigation1			= '<label class=navigation>'.$lang['change_pass_Page'].'</label>';
	}
	
	$tpl->assign(array("T_Body"					=>	'changepasswd'. $config['tplEx'],
						"JavaScript"			=>  array("changepasswd.js"),
						"A_Action"				=>	"changepasswd.php",
						"Action"				=>	'ChangePass',
						"succMsg"				=>	$succMsg,
						"old_pass"				=>	$result->user_passwd,
						"User_Id"				=>	$_SESSION['User_Id'],
						"Error_Message"	        =>	$errMsg,
						"lang"					=>  $lang,
						"tab"					=>	4,
						"navigation"			=>	$navigation,
						"navigation1"			=>	$navigation1,
						"navigation2"			=>	$navigation2,
					));
	
}
$tpl->display('default_layout'. $config['tplEx']);    // assign to layout template
?>