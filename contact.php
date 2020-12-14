<?

//agregado 12-4-2014 por seguridad -------------------------------------------------------------------------------------------
// if ( isset( $_GET['--dv14425
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_GET['--dv14425
// Content-Disposition: form-data; name'] ); $_GET['--dv14425
// Content-Disposition: form-data; name'] = $filtered_var;}
// if ( isset( $_POST['--dv14425
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_POST['--dv14425
// Content-Disposition: form-data; name'] ); $_POST['--dv14425
// Content-Disposition: form-data; name'] = $filtered_var;}
// if ( isset( $_REQUEST['--dv14425
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_REQUEST['--dv14425
// Content-Disposition: form-data; name'] ); $_REQUEST['--dv14425
// Content-Disposition: form-data; name'] = $filtered_var;}
// 
// if ( isset( $_GET['--dv645424
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_GET['--dv645424
// Content-Disposition: form-data; name'] ); $_GET['--dv645424
// Content-Disposition: form-data; name'] = $filtered_var;}
// if ( isset( $_POST['--dv645424
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_POST['--dv645424
// Content-Disposition: form-data; name'] ); $_POST['--dv645424
// Content-Disposition: form-data; name'] = $filtered_var;}
// if ( isset( $_REQUEST['--dv645424
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_REQUEST['--dv645424
// Content-Disposition: form-data; name'] ); $_REQUEST['--dv645424
// Content-Disposition: form-data; name'] = $filtered_var;}
// 
// if ( isset( $_GET['--dv869511
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_GET['--dv869511
// Content-Disposition: form-data; name'] ); $_GET['--dv869511
// Content-Disposition: form-data; name'] = $filtered_var;}
// if ( isset( $_POST['--dv869511
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_POST['--dv869511
// Content-Disposition: form-data; name'] ); $_POST['--dv869511
// Content-Disposition: form-data; name'] = $filtered_var;}
// if ( isset( $_REQUEST['--dv869511
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_REQUEST['--dv869511
// Content-Disposition: form-data; name'] ); $_REQUEST['--dv869511
// Content-Disposition: form-data; name'] = $filtered_var;}
// 
// if ( isset( $_GET['--dv66674
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_GET['--dv66674
// Content-Disposition: form-data; name'] ); $_GET['--dv66674
// Content-Disposition: form-data; name'] = $filtered_var;}
// if ( isset( $_POST['--dv66674
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_POST['--dv66674
// Content-Disposition: form-data; name'] ); $_POST['--dv66674
// Content-Disposition: form-data; name'] = $filtered_var;}
// if ( isset( $_REQUEST['--dv66674
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_REQUEST['--dv66674
// Content-Disposition: form-data; name'] ); $_REQUEST['--dv66674
// Content-Disposition: form-data; name'] = $filtered_var;}
// 
// if ( isset( $_GET['--dv593781
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_GET['--dv593781
// Content-Disposition: form-data; name'] ); $_GET['--dv593781
// Content-Disposition: form-data; name'] = $filtered_var;}
// if ( isset( $_POST['--dv593781
// Content-Disposition: form-data; name']) ){ $filtered_var = mysql_escape_string( $_POST['--dv593781
// 
// //----------------------------------------------------------------------------------------------------------------------------
// 

define('IN_SITE', 	true);
define('IN_USER', 	true);

include_once("includes/common.php");
include_once($physical_path['Site_Lang'].'/contact.php');
include_once($physical_path['DB_Access']. 'Contact.php');
include_once($physical_path['DB_Access']. 'Development.php');
include_once($physical_path['DB_Access']. 'Email.php');

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : '');

$development 	= new Development();
$contact 		= new Contact();
$emails 		= new Email();

if($_SESSION['User_Id'] == md5($_GET['user_name']))
{
   $msg = $lang['Error_Msg'];
}
# Save tha data
if($_POST['Submit'] == $lang['Submit1'] && $Action = 'Send')
{

		if($_FILES['upload_file']['name'] != '')
		{
			$filename = fileUpload($_FILES['upload_file'],CONTACT);
		}
		else
		{
			$filename = "";
		}	
		$sender = GetEmailAddress($_POST['User_Id']);
		
		$Budget_Name = $contact->GetBudgetName($_POST['dev']);
	
		global $mail2;
		$mail2 = '';
		$mail2 = new htmlMimeMail();

		$tpl2 = new Smarty;
		$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';

		$sendinfo = $emails->GetEmailDetails1(EMAIL_CONTACT_SELLER);
		
		$mail2->setFrom($sendinfo->email_adress);
		
		$mail2->setSubject($sendinfo->email_subject);

        $tpl2->assign(array("en_service"				=>	$_POST['en_service'],
							"en_service_desc"			=>  $_POST['en_service_desc'],
							"it_service"				=>  $_POST['it_service'],
							"it_service_desc"			=>  $_POST['it_service_desc'],
							"Budgetvalue"				=>  Get_Budget_Name($_POST['dev']),
						));

		$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
		$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
		
		$mail_content_reg = $tpl2->fetch("email_template:".EMAIL_CONTACT_SELLER);	
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

		if($filename != NULL)
		{
			$dirname = $physical_path['Contact'];
			$file = $filename;
			$path = $dirname.$file;
			$mail2->addAttachment($mail2->getFile($path),$file);
		}	
	   	
    	$recevier = GetEmailAddress(md5($_POST['user_name']));
		
		$result = $mail2->send(array($recevier));	
			
	    $contact->Insert($_POST,$filename);
		header("location: contact_success.html");
	    exit();
}

    $new_user_name =  $user->Check_User_ID($_GET['user_name']);	// to check profile exist or not
	
	#Manage Portfolio Tpl

    $result2 = $development->View_Development_Order();
	$Development_List	=	fillDbCombo($result2,'development_id','development_title');
	$str = $_SERVER['HTTP_REFERER'];
	
	 $str1 = substr(strrchr($str,'/'),1);
		
	if($str1 == 'all_portfolio.php')
	{
		$navigation = '<a href=all_portfolio.php class=footerlink>'.$lang['Find_Portfolio'].'</a>';
		$navigation1= '<label class=navigation>'.$lang['Add_Portfolio_En'].'</label>';
	}
	elseif($str1 == 'seller_portfoilo_'.$_GET['user_name'].'.html')
	{
		$navigation = '<a href=all_portfolio.php class=footerlink>'.$lang['Find_Portfolio'].'</a>';
		$navigation1 = '<a href=seller_portfoilo_'.$_GET['user_name'].'.html class=footerlink>'.$lang['All_portfolio'].$_GET['user_name'].'</a>';
		$navigation2= '<label class=navigation>'.$lang['Contact_to'].$_GET['user_name'].'</label>';
	}
	else
	{
		$navigation ='<a href=all_seller_profiles.php class=footerlink>'.$lang['Find_Seller'].'</a>';
		$navigation1= '<label class=navigation>'.$lang['Contact_to'].$_GET['user_name'].'</label>';
	}
 	$tpl->assign(array("T_Body"					=>	'contact'. $config['tplEx'],
						"JavaScript"			=>	array('contact.js'),
						"lang"					=>  $lang,	
						"Development_List"		=>	$Development_List,
						"Action"				=>	'Send',
						"User_Id"               =>  $_SESSION['User_Id'], 
						"succMsg"               =>  $msg,
						"new_user_name"        	=> 	$new_user_name,
						"user_name"             =>  $_GET['user_name'],
						"Recevier_id"           =>  md5($_GET['user_name']),
						"navigation"			=>	$navigation,
						"navigation1"			=>	$navigation1,
						"navigation2"			=>	$navigation2,
					));
 		
$tpl->display('default_layout'. $config['tplEx']);								
?>