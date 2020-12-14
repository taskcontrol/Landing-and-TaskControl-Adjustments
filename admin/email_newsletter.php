<?
define('IN_SITE', 	true);
define('IN_ADMIN', 	true);

include_once("/var/www/taskcontrol.net/web/includes/common.php");
include_once("/var/www/taskcontrol.net/web/db_access/Email.php");
include_once("/var/www/taskcontrol.net/web/db_access/Category.php");
include EDITOR_ROOT. 'spaw_control.class.php';

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : '');

$email = new Email();

$category = new Category();
$category->View_Cat_All_Order(0);

$cnt = $db->num_rows();
$i = 0;
while($db->next_record())
{
	$arr_cat[$i]['id']					=	$db->f('cat_id');
	$arr_cat[$i]['name']				=	$db->f('cat_name');
	$i++;
}

if($Action == 'Send' && $_POST['Submit']=='Save')
{
	$email_to_selllers = true;
	$email_to_buyers = true;

	$email_areas = [];

	if (count($_POST['email_areas']) == 0)
	{

		$tpl->assign(array("T_Body"					=> 'email_newsletter'. $config['tplEx'],
						   "JavaScript"	            => array("emailnewsletter.js"),
						   "en_email_subject"		=> $ret->email_subject,
						   "en_message"				=> 'You must select at least one area.',
						   "arr_cat"			=> $arr_cat,
							));

		$sw = new SPAW_Wysiwyg('content' /*name*/,		
							   $ret->email_content/*value*/,
					   		   'en' /*language*/, 
					   		   'full' /*toolbar mode*/, 
					   		   'default' /*theme*/,
					   		   '700px' /*width*/, 
					   		   '475px' /*height*/);					   
					   
		$tpl->assign("Page_Editor", $sw->getHtml());

	}
	else
	{
		foreach ($_POST['email_areas'] as $key => $value) {
			$email_areas[] = $value;
		}

		$email->SendNewsletter($_POST['en_email_subject'], $email_to_selllers, $email_to_buyers, $email_areas,$_POST['content']);

		$tpl->assign(array("T_Body"					=> 'email_newsletter'. $config['tplEx'],
						   "JavaScript"	            => array("emailnewsletter.js"),
						   "en_email_subject"		=> $ret->email_subject,
						   "en_message"				=> 'Mail sent successfully',
						   "arr_cat"			=> $arr_cat,
							));

		$sw = new SPAW_Wysiwyg('content' /*name*/,		
							   $ret->email_content/*value*/,
					   		   'en' /*language*/, 
					   		   'full' /*toolbar mode*/, 
					   		   'default' /*theme*/,
					   		   '700px' /*width*/, 
					   		   '475px' /*height*/);					   
					   
		$tpl->assign("Page_Editor", $sw->getHtml());

	}
}
elseif ($_POST['Submit'] == 'Cancel')
{
	header("location: email_newsletter.php");
	exit();
}

if($Action == 'View' || $Action =='')
{

	//$email_List1 	= $email->Email_List();
	//$email_List	 	= fillDbCombo($email_List1,'email_id', 'email_title', $ret->email_id_sending);
						
	$tpl->assign(array("T_Body"					=> 'email_newsletter'. $config['tplEx'],
					   "JavaScript"	            => array("emailnewsletter.js"),
					   "en_email_subject"		=> $ret->email_subject,
					   "en_message"				=> '',
					   "arr_cat"			=> $arr_cat,
						));

	$sw = new SPAW_Wysiwyg('content' /*name*/,		
						   $ret->email_content/*value*/,
				   		   'en' /*language*/, 
				   		   'full' /*toolbar mode*/, 
				   		   'default' /*theme*/,
				   		   '700px' /*width*/, 
				   		   '475px' /*height*/);					   
				   
	$tpl->assign("Page_Editor", $sw->getHtml());
}

$tpl->display('default_layout'. $config['tplEx']);
?>
