<?
define('IN_SITE', 	true);

include_once("includes/common.php");

$tpl->assign(array(	"T_Body"			=>	'tools'. $config['tplEx'],
					));
	
$tpl->display('default_layout'. $config['tplEx']);    // assign to layout template
?>