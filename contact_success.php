<?
define('IN_SITE', 	true);
include_once("includes/common.php");
include_once($physical_path['Site_Lang'].'/contact_success.php');

##############################################################################################
/// assing templates and javascript with related varibles according to template
##############################################################################################
	
	$tpl->assign(array(	"T_Body"			=>	'contact_success'. $config['tplEx'],
						"Send_Msg"		    =>	$lang['Send_Msg'],	
						));

$tpl->display('default_layout'. $config['tplEx']);
?>