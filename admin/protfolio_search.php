<?
define('IN_SITE', 	true);
define('IN_ADMIN',	true);

include("../includes/common.php");

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : A_VIEW_ALL);


/*include_once($physical_path['DB_Access']. 'Development.php');
include_once($physical_path['DB_Access']. 'Category.php');

$development 	= new Development();
$cats 			= new Category();
*/


  /*  $result2 = $development->View_Development_Order();
	$Development_List	=	fillDbCombo($result2,'development_id',''.$_SESSION['Language_Types'].'_development_title');*/
	
	
	$tpl->assign(array(	"T_Body"			  => 'protfolio_search'. $config['tplEx'],
					));
					
$tpl->display('default_layout'. $config['tplEx']);
?>