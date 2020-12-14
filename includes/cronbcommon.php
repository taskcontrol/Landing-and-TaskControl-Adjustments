<?php
#====================================================================================================
#	Start Session and define site access valid
#----------------------------------------------------------------------------------------------------
if ( !defined('IN_SITE') )
{
	die("Hacking attempt");
}

session_start();

 ## print "paso 1 en cronbcommon";

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

#====================================================================================================
#	Define Site state and set site root
#----------------------------------------------------------------------------------------------------

// Set the server name
$config['Server_Name'] = strtoupper($_SERVER['SERVER_NAME']);

// Set the installation directory
switch($config['Server_Name'])
{
				
	case "taskcontrol.net":
	case "WWW.taskcontrol.net":
	case "www.taskcontrol.net":
		define("INSTALL_DIR", "/");
		## $physical_path['Site_Root']			=	$_SERVER['DOCUMENT_ROOT']. INSTALL_DIR;
		 $physical_path['Site_Root']			=	'/var/www/taskcontrol.net/web'. INSTALL_DIR;	
    	break;
	
    default:
		define("INSTALL_DIR", "/");
		## $physical_path['Site_Root']			=	$_SERVER['DOCUMENT_ROOT']. INSTALL_DIR;
		$physical_path['Site_Root']			=	'/var/www/taskcontrol.net/web'. INSTALL_DIR;	
    	break;

}

// Define site root
$virtual_path['Site_Root'] =	'https://'. $_SERVER['HTTP_HOST']. INSTALL_DIR;

//print_r($physical_path['Site_Root']);
//print_r($virtual_path['Site_Root']);die;
$site_path = "https://www.taskcontrol.net/";
#
#
 ## print "paso 2 en cronbcommon";
#====================================================================================================
#	Including required configuration
#----------------------------------------------------------------------------------------------------
$physical_path['Site_Include']	= $physical_path['Site_Root']. 'includes/';

 include($physical_path['Site_Include']. 'config.php');
 include($physical_path['Site_Include']. 'constants.php');
 include($physical_path['Site_Include']. 'functions.php');

 ## include_once('/var/www/taskcontrol.net/web/includes/config.php');
## include_once('/var/www/taskcontrol.net/web/includes/constants.php');
## include_once('/var/www/taskcontrol.net/web/includes/functions.php');

#====================================================================================================
#	Including all required library
#----------------------------------------------------------------------------------------------------
## $physical_path['Libs'] = $physical_path['Site_Root']. 'libs/';
$physical_path['Libs']	= '/var/www/taskcontrol.net/web/libs/';

## $virtual_path['Libs'] = $virtual_path['Site_Root']. 'libs/';
$virtual_path['Libs']	= '/var/www/taskcontrol.net/web/libs/';

 ## print "[ va a incluir el mysql.php en cronbcommon ]";

## include_once('/var/www/taskcontrol.net/web/libs/mysql.php');

 include($physical_path['Libs']. 'mysql.php');
 include($physical_path['Libs']. 'htmlMimeMail.php');
 include($physical_path['Libs']. 'thumbnail.php');
 include($physical_path['Libs']. 'Smarty.class.php');

 ## print " ..sigue? ...";

// include_once('/var/www/taskcontrol.net/web/libs/htmlMimeMail.php');
// include_once('/var/www/taskcontrol.net/web/libs/thumbnail.php');
// include_once('/var/www/taskcontrol.net/web/libs/Smarty.class.php');

#====================================================================================================
#	Define Data Access root
#----------------------------------------------------------------------------------------------------
## $physical_path['DB_Access']	= $physical_path['Site_Root']. 'db_access/';
$physical_path['DB_Access'] = '/var/www/taskcontrol.net/web/db_access/';

include($physical_path['DB_Access']. 'WebConfig.php');
include($physical_path['DB_Access']. 'User.php');

// include_once('/var/www/taskcontrol.net/web/db_access/WebConfig.php');
// include_once('/var/www/taskcontrol.net/web/db_access/User.php');

#====================================================================================================
#	Email Template
#----------------------------------------------------------------------------------------------------
// $physical_path['EmailTemplate']			=	$physical_path['Site_Root']. 'email_templates/';
$physical_path['EmailTemplate']	= 'email_templates/';

// $virtual_path['EmailTemplate']			=	$virtual_path['Site_Root']. 'email_templates/';
$virtual_path['EmailTemplate']	= $virtual_path['Site_Root']. 'email_templates/';
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
$db3 = '';
$db3 = new DB_Sql($config['DB_Host'], $config['DB_Name'], $config['DB_User'], $config['DB_Passwd'], false);
if(!$db->link_id())
{
  die("Could not connect to the database");
}
#
#	Read site configuration
#----------------------------------------------------------------------------------------------------
global $webConf;
$webConf = '';
$webConf = new WebConfig();

$tpl = new Smarty;

$tpl->compile_check = true;
//$tpl->force_compile = true;
$tpl->debugging 	= DEBUG;

# Define page layout
$tpl->template_dir 	= $physical_path['Templates_Root'];
$tpl->compile_dir 	= $physical_path['User_Root']. 'templates_c/';

 ## print "paso 3 y sale de cronbcommon";

?>
