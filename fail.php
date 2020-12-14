<?
define('IN_SITE', 	true);
define('IN_USER',	true);
// including related database and language files
include_once("includes/common.php");
include_once($physical_path['Site_Lang'].'success.php');
include_once($physical_path['Site_Lang'].'/manage_payments.php');


$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : 'ViewAll');


//$msg = $lang['Msg']; 
$tpl->assign(array(		"T_Body"			=>	'Msg'. $config['tplEx'],
						"msg"		        =>	$lang['Msg'],
						"lang"				=>	$lang,
						"Page_Title_1"		=>	$lang['Deposit_Money'],
						"From_Payment"		=>	1, // To show payment menu selected, instead of seller menu
						"Current_Page"		=>	'payment',
						"Submenu_Page" 		=>  'deposit_money',	
				  ));
$tpl->display('default_layout'. $config['tplEx']);    // assign to layout template
						
?>