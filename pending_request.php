<?
define('IN_SITE', 	true);
define('IN_USER', 	true);

include_once("/var/www/taskcontrol.net/web/includes/common.php");
include_once($physical_path['Site_Lang'].'/manage_payments.php');

/*session_unregister('amount');
session_unregister('pay_mehtod');*/

$tpl->assign(array("T_Body" =>	'Msg'. $config['tplEx'],
	        "msg"	    =>	$lang["Requested"],	
   	        "lang"   	    =>	$lang,
  	       "Page_Title_1" =>	$lang['Deposit_Money'],
	       "From_Payment" =>	1, // To show payment menu selected, instead of seller menu
	       "Current_Page"   =>	'payment',
	       "Submenu_Page" =>       'deposit_money',
         ));

$tpl->display('default_layout'. $config['tplEx']);					
?>
