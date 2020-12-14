<?
define('IN_SITE', 	true);
define('IN_USER', 	true);

include_once("includes/common.php");
include_once($physical_path['Site_Lang'].'/cancel.php');

       // session_unregister no anda en php 5.4 se reemplaza por unset, mas abajo

       $tpl->assign(array(	"T_Body"			=>	'Msg'. $config['tplEx'],
						"msg"		        =>	strtolower($_SESSION['pay_mehtod']) == "paypal" ? $lang['Cancel_Return'] : ( strtolower($_SESSION['pay_mehtod']) == "moneybooker" ? $lang['Cancel_Return_MB'] : ( strtolower($_SESSION['pay_mehtod']) == "mercadopago" ? $lang['Cancel_Return_MP'] : $lang['Cancel_Return_DM'] ))	
						));

       unset($_SESSION['amount']);
       unset($_SESSION['pay_mehtod']);

$tpl->display('default_layout'. $config['tplEx']);					
?>