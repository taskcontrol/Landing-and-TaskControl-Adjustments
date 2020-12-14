<?php
#====================================================================================================
#	Start Session and define site access valid
#----------------------------------------------------------------------------------------------------
if ( !IN_SITE )
{
	die("Hacking attempt");
}

## print "en common 1";

$timeout = 60 * 60; // 60 minutes session - Modified by Robert 09-Nov-2016
session_start();

## print "luego de session_start";

if ( (isset($_SESSION['last_active']) && (time() > ($_SESSION['last_active']+$timeout)))) 
{
	unset($_SESSION['User_Id']);
	unset($_SESSION['User_Name']);
	unset($_SESSION['User_Email']);
	unset($_SESSION['User_Perm']);
	unset($_SESSION['Membership_Name']);
	unset($_SESSION['Buy_Date']);
	unset($_SESSION['Finished_Date']);
	unset($_SESSION['Member_As_Buyer']);
	unset($_SESSION['Member_As_Seller']);


	@session_unset();
	@session_destroy();

	$_SESSION['prev_file_path'] = $_SERVER['SCRIPT_NAME'];
	
	header("location: index.php");
	exit();
}
//session_regenerate_id(); 
$_SESSION['last_active'] = time();


#====================================================================================================
#	addslashes to vars if magic_quotes_gpc is off
#	this is a security precaution to prevent someone
#	trying to break out of a SQL statement.
#----------------------------------------------------------------------------------------------------
error_reporting(E_ERROR | E_WARNING | E_PARSE); // This will NOT report uninitialized variables

#====================================================================================================
#	Define some basic configuration arrays. This also prevents
#	malicious rewriting of language and otherarray values via
#	URI params
#----------------------------------------------------------------------------------------------------
$physical_path	= array();
$virtual_path	= array();
$config 	= array();

/*header("location: under_maintenance.html");
exit();*/
#====================================================================================================
#	Define Site state and set site root
#----------------------------------------------------------------------------------------------------

// Set the server name
$config['Server_Name'] = strtoupper($_SERVER['SERVER_NAME']);
//print $config['Server_Name'];die;
// Set the installation directory
switch($config['Server_Name'])
{
	case "taskcontrol.net":
	case "www.taskcontrol.net":
        case "TASKCONTROL.NET":
	case "WWW.TASKCONTROL.NET":
		define("INSTALL_DIR", "/");
		## $physical_path['Site_Root']			=	$_SERVER['DOCUMENT_ROOT']. INSTALL_DIR;
		##$physical_path['Site_Root']			=	'/var/www/taskcontrol.net/web'.INSTALL_DIR;	
		$physical_path['Site_Root']			=	'/var/www/taskcontrol.net/web'.INSTALL_DIR;	
		$spaw_dir =  "/editor/";
    	break;
		
	default:
		define("INSTALL_DIR", "/");
		## $physical_path['Site_Root']			=	$_SERVER['DOCUMENT_ROOT']. INSTALL_DIR;
		##$physical_path['Site_Root']			=	'/var/www/taskcontrol.net/web'. INSTALL_DIR;	
		$physical_path['Site_Root']			=	'/var/www/taskcontrol.net/web'. INSTALL_DIR;	
		$spaw_dir =  "/";
    	break;

}
#print $spaw_dir;die;
// Define site root
//$physical_path['Site_Root']			=	$_SERVER['DOCUMENT_ROOT']. INSTALL_DIR;

## print "en common en el medio";

$virtual_path['Site_Root']			=	'https://'. $_SERVER['HTTP_HOST']. INSTALL_DIR;

// print_r($physical_path['Site_Root']);
// print_r($virtual_path['Site_Root']);die;

#====================================================================================================
#	Including required configuration
#----------------------------------------------------------------------------------------------------
$physical_path['Site_Include']		=	$physical_path['Site_Root']. 'includes/';

##  include_once($physical_path['Site_Include']. 'config.php');
##  include_once($physical_path['Site_Include']. 'constants.php');
##  include_once($physical_path['Site_Include']. 'functions.php');

 include('/var/www/taskcontrol.net/web/includes/config.php');
 include_once('/var/www/taskcontrol.net/web/includes/constants.php');
 include_once('/var/www/taskcontrol.net/web/includes/functions.php');

 ## print "[luego de varios include_once de config.php, constants.php y functions.php]";
 
#====================================================================================================
#	Including all required library
#----------------------------------------------------------------------------------------------------
## $physical_path['Libs']	=	$physical_path['Site_Root']. 'libs/';
#$physical_path['Libs']	= '/var/www/taskcontrol.net/web/libs/';
$physical_path['Libs']	= '/var/www/taskcontrol.net/web/libs/';

## echo "paso larry";

## $virtual_path['Libs'	=	$virtual_path['Site_Root']. 'libs/';
#$virtual_path['Libs']	= '/var/www/taskcontrol.net/web/libs/';
$virtual_path['Libs']	= '/var/www/taskcontrol.net/web/libs/';

 ## echo "paso curly";

 ## include_once($physical_path['Libs']. 'mysql.php');
 
 include_once('/var/www/taskcontrol.net/web/libs/mysql.php');
 include_once('/var/www/taskcontrol.net/web/libs/htmlMimeMail.php');
 include_once('/var/www/taskcontrol.net/web/libs/thumbnail.php');
 include_once('/var/www/taskcontrol.net/web/libs/Smarty.class.php');

#====================================================================================================
#	Including required language files and folders
#----------------------------------------------------------------------------------------------------
// $physical_path['Site_Lang']		=	$physical_path['Site_Root']. 'lang/'.$_SESSION['Language_Types'].'/';

$physical_path['Site_Lang']		=	$physical_path['Site_Root']. 'lang/default/';


## print "llego hasta aqui 1";

#====================================================================================================
#	Define Rich HTML editor path
#----------------------------------------------------------------------------------------------------
$physical_path['Editor']			=	$physical_path['Site_Root']. 'editor/';
$virtual_path['Editor']				=	$virtual_path['Site_Root']. 'editor/';
global $spaw_root;
define('EDITOR_ROOT', 	$physical_path['Editor']);
define('EDITOR_URL', 	$virtual_path['Editor']);
$spaw_root = EDITOR_ROOT;
//print_r(EDITOR_URL);die;
#====================================================================================================
#	Define Data Access root
#----------------------------------------------------------------------------------------------------
## $physical_path['DB_Access']			=	$physical_path['Site_Root']. 'db_access/';
#$physical_path['DB_Access'] = '/var/www/taskcontrol.net/web/db_access/';
$physical_path['DB_Access'] = '/var/www/taskcontrol.net/web/db_access/';

// include_once($physical_path['DB_Access']. 'WebConfig.php');
// include_once($physical_path['DB_Access']. 'User.php');
// include_once($physical_path['DB_Access']. 'Utility.php');

 include_once('/var/www/taskcontrol.net/web/db_access/WebConfig.php');
 include_once('/var/www/taskcontrol.net/web/db_access/User.php');
 include_once('/var/www/taskcontrol.net/web/db_access/Utility.php');
#====================================================================================================
#	Email Template
#----------------------------------------------------------------------------------------------------
$physical_path['EmailTemplate']			=	$physical_path['Site_Root']. 'email_templates/';
$virtual_path['EmailTemplate']			=	$virtual_path['Site_Root']. 'email_templates/';

$physical_path['EmailTemplate_Images']		=	$physical_path['EmailTemplate']. 'images/';
$virtual_path['EmailTemplate_Images']		=	$virtual_path['EmailTemplate']. 'images/';

#
## print "llego hasta aca 2";

#====================================================================================================
#	Upload
#----------------------------------------------------------------------------------------------------
$physical_path['Upload']		=	$physical_path['Site_Root']. 'upload/';
$virtual_path['Upload']			=	$virtual_path['Site_Root']. 'upload/';

$physical_path['Seller_Logo']	=	$physical_path['Upload']. 'Seller_Logo/';
$virtual_path['Seller_Logo']	=	$virtual_path['Upload']. 'Seller_Logo/';

$physical_path['Portfolio']	=	$physical_path['Upload']. 'Portfolio/';
$virtual_path['Portfolio']	=	$virtual_path['Upload']. 'Portfolio/';

$physical_path['Contact']	=	$physical_path['Upload']. 'Contact/';
$virtual_path['Contact']	=	$virtual_path['Upload']. 'Contact/';

$physical_path['Project']	=	$physical_path['Upload']. 'Project/';
$virtual_path['Project']	=	$virtual_path['Upload']. 'Project/';

$physical_path['Private_Message']	=	$physical_path['Upload']. 'Private_Message/';
$virtual_path['Private_Message']	=	$virtual_path['Upload']. 'Private_Message/';

$physical_path['Pdf']	=	$physical_path['Upload']. 'Pdf/';
$virtual_path['Pdf']	=	$virtual_path['Upload']. 'Pdf/';

$physical_path['Affilates']		=	$physical_path['Site_Root']. 'Affilates/';
$virtual_path['Affilates']		=	$virtual_path['Site_Root']. 'Affilates/';

#====================================================================================================
#	Define User the user root file path
#----------------------------------------------------------------------------------------------------
if(defined("IN_USER"))
{
	$physical_path['User_Root']			=	$physical_path['Site_Root'];
	$virtual_path['User_Root']			=	$virtual_path['Site_Root'];
}
elseif(defined("IN_ADMIN"))
{
	$physical_path['User_Root']			=	$physical_path['Site_Root']. 'admin/';
	$virtual_path['User_Root']			=	$virtual_path['Site_Root']. 'admin/';
}

// Define Template root
$physical_path['Templates_Root']		=	$physical_path['User_Root']. 'templates/';
$virtual_path['Templates_Root']			=	$virtual_path['User_Root'].  'templates/';

$virtual_path['Templates_CSS']			=	$virtual_path['Templates_Root']. 'css/';
$virtual_path['Templates_JS']			=	$virtual_path['Templates_Root']. 'js/';
$virtual_path['Templates_Image']		=	$virtual_path['Templates_Root']. 'images/';

$virtual_path['Templates_Help']			=	$virtual_path['Templates_Image']. 'help/';


#====================================================================================================
#	Initial the required object
#----------------------------------------------------------------------------------------------------

# 	Make the mail object
#----------------------------------------------------------------------------------------------------
global $mail,$mail1;
$mail = '';
$mail = new htmlMimeMail();

# Make the database connection
#----------------------------------------------------------------------------------------------------
global $db,$db1,$db2;
$db = '';
$db = new DB_Sql($config['DB_Host'], $config['DB_Name'], $config['DB_User'], $config['DB_Passwd'], false);
$db1 = '';
$db1 = new DB_Sql($config['DB_Host'], $config['DB_Name'], $config['DB_User'], $config['DB_Passwd'], false);
$db2 = '';
$db2 = new DB_Sql($config['DB_Host'], $config['DB_Name'], $config['DB_User'], $config['DB_Passwd'], false);
if(!$db->link_id())
{
  die("Could not connect to the database");
}

#	Read site configuration
#----------------------------------------------------------------------------------------------------
global $webConf;
$webConf = '';
$webConf = new WebConfig();


#	Utility
#----------------------------------------------------------------------------------------------------
global $utility;
$utility = '';
$utility = new Utility();

#	Thumbnail
#----------------------------------------------------------------------------------------------------
global $thumb;
$thumb = '';
$thumb = new thumbnail();

#	Homepage
#----------------------------------------------------------------------------------------------------
global $homepage;
$homepage = '';
$hpcontent = ViewAllHomePageContent();

# Initiate User and start session
#----------------------------------------------------------------------------------------------------

//$user->StartSession();

# Set page size under cookie
if($_POST['page_size'])
	setcookie('page_size', $_POST['page_size'], time()+24*3600);
	
if($_POST['user_page_size'])
	setcookie('user_page_size', $_POST['user_page_size'], time()+24*3600);
# Initial the smarty object
#----------------------------------------------------------------------------------------------------
$tpl = new Smarty;
$tpl_1 = new Smarty;

$tpl->compile_check = true;
$tpl_1->compile_check = true;
//$tpl->force_compile = true;
$tpl->debugging 	= DEBUG;
$tpl_1->debugging 	= DEBUG;

# Define page layout
$tpl->template_dir 	= $physical_path['Templates_Root'];
$tpl->compile_dir 	= $physical_path['User_Root']. 'templates_c/';
# Define page layout
$tpl_1->template_dir 	= $physical_path['Templates_Root'];
$tpl_1->compile_dir 	= $physical_path['User_Root']. 'templates_c/';


if(defined("POPUP_WINDOW"))
{
	$tpl->assign(array(	"T_Body"	=>	'popupwin_layout'. $config['tplEx'],
						));
}

elseif(defined("IN_ADMIN"))
{
	include_once($physical_path['DB_Access']. 'Admins.php');
	global $admin;
	
	$admins = new Admins();

	$tpl->assign(array(	"T_Header"		=>	'default_header'. $config['tplEx'],
						"T_Menu"		=>	'default_menu'. $config['tplEx'],	
						"T_Footer"		=>	'default_footer'. $config['tplEx'],
						));
}
else
{

	global $user;
	$user = new User();
	//$physical_path['Theme_Root']		=	$physical_path['Templates_Root']. $config[WC_THEME].'/';
	//$virtual_path['Theme_Root']			=	$virtual_path['Templates_Root'].  $config[WC_THEME].'/';
	
	//$virtual_path['Templates_CSS']		=	$virtual_path['Theme_Root'].'css/';
	//$virtual_path['Templates_Image']	=	$virtual_path['Theme_Root'].'images/';
	
	$virtual_path['Templates_CSS']		=	$virtual_path['Templates_Root'].'css/';
	$virtual_path['Templates_Image']	=	$virtual_path['Templates_Root'].'images/';
	
	if(defined("HOME_PAGE"))
	{
 		//if some special homepage is there
		$tpl->assign(array(	"T_Header"	=>	'default_header'. $config['tplEx'],
							"T_Footer"	=>	'default_footer'. $config['tplEx'],
							#"T_Menu"	=>	'default_menu'. $config['tplEx'],	
							));
	}
	elseif(defined("IN_USER") && $_SESSION['User_Id'])
	{
		//$user->GetUserStatus($_SESSION['User_Id']);
		// login of user
		$tpl->assign(array(	"T_Header"	=>	'default_header'. $config['tplEx'],
							"T_Footer"	=>	'default_footer'. $config['tplEx'],
							"T_Balance"	=>	'balance'. $config['tplEx'],	
							));
		include_once('balance.php');
	}
	else
	{
		// without logins
		$tpl->assign(array(	"T_Header"	=>	'default_header'. $config['tplEx'],
							"T_Footer"	=>	'default_footer'. $config['tplEx'],
							"T_Menu"	=>	'default_menu'. $config['tplEx'],	
							));
	}


}
# Assign default values

$dbx = mysql_connect($config['DB_Host'], $config['DB_User'], $config['DB_Passwd']);
mysql_select_db($config['DB_Name'],$dbx);
$result2 = mysql_query("SELECT * from project_master",$dbx);
$cate=mysql_num_rows($result2);
/*

 */
$total=0;
$dbx = mysql_connect($config['DB_Host'], $config['DB_User'], $config['DB_Passwd']);
mysql_select_db($config['DB_Name'],$dbx);
$result2 = mysql_query("SELECT * from project_master WHERE project_post_to NOT LIKE ''",$dbx);
$cate2=mysql_num_rows($result2);
while ($myrow = mysql_fetch_row($result2)) {
	$idul=$myrow[0];
	$cine=$myrow[4];
$dbx2 = mysql_connect($config['DB_Host'], $config['DB_User'], $config['DB_Passwd']);
mysql_select_db($config['DB_Name'],$dbx2);
$result3 = mysql_query("SELECT bid_amount from bid_master WHERE project_id=$idul AND bid_by_user='$cine'",$dbx2);
while ($myrow2 = mysql_fetch_row($result3)) {
	$total=$total + $myrow2[0];
}
}
$cate2=$total;


$dbx = mysql_connect($config['DB_Host'], $config['DB_User'], $config['DB_Passwd']);
mysql_select_db($config['DB_Name'],$dbx);
$result2 = mysql_query("SELECT * from member_master",$dbx);
$cate3=mysql_num_rows($result2); 


$tpl->assign(array("Templates_CSS"			=> 	$virtual_path['Templates_CSS'],
					"Templates_JS"			=> 	$virtual_path['Templates_JS'],
					"Templates_Image"		=> 	$virtual_path['Templates_Image'],
					"Affilates_Image"		=> 	$virtual_path['Affilates'],
					"Templates_Help"		=> 	$virtual_path['Templates_Help'],

					"Site_Root"				=> 	$virtual_path['Site_Root'],
                    "Company_Title"			=>	$config[WC_COMPANY_TITLE],
                    "Site_Title"			=>	$config[WC_SITE_TITLE],
					"Meta_Title"			=>	$config[WC_SITE_TITLE],
					"Meta_Keyword"			=>	$config[WC_SITE_KEYWORD],
					"Meta_Description"		=>	$config[site_description],
					"google_adsense_code"	=>	$config[WC_GOOGLE_ADSENSE],
					"google_adsense_code_125"	=>	$config[WC_GOOGLE_ADSENSE_125],
					"tab"					=>	1,
					"cate"			=>	$cate,
					"cate2"			=>	$cate2,
					"cate3"			=>	$cate3, 
					"home_content"			=> $hpcontent,
					));

//for local
include_once($physical_path['Site_Lang'].'/common.php');


# Assign default languages
$tpl->assign(array( "lang_common"				=> 	$lang,
					));
## print "saliendo de common";

?>
