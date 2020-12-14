<?
define('IN_SITE', 	true);

include_once("includes/common.php");
include_once($physical_path['DB_Access'].'Page.php');
$page = new Page();

$rsPage = $page->getPage(isset($_GET['pid']) ? $_GET['pid'] : (isset($_POST['pid']) ? $_POST['pid'] : 1));
if($rsPage->page_id == 3)
{
	$link = '<label class=navigation>'.$lang['Help'].'</label>';
}
else if($rsPage->page_id == 5)
{
	$link = '<label class=navigation>'.$lang['Privacy_Policy'].'</label>';
}
else if($rsPage->page_id == 2)
{
	$link = '<label class=navigation>'.$lang['Footer_Terms_Use'].'</label>';
}
else if($rsPage->page_id == 11)
{
	$link = '<label class=navigation>'.$lang['Footer_About_Us'].'</label>';
}
else if($rsPage->page_id == 7)
{
	$navigation1 = '<label class=navigation>'.$lang['About_New_Escrow_Pay'].'</label>';
	$link = 	'<a href=manage_payments.php class=footerlink>'.$lang['Manage_Payment'].'</a>';
}
else if($rsPage->page_id == 12)
{
	$link = '<label class=navigation>'.$lang['Footer_Work_With_Us'].'</label>';
}
$tpl->assign(array(	"T_Body"			=>	'page'. $config['tplEx'],
					"page_content"		=>	$rsPage->page_content,
					"page_name"			=>	$rsPage->page_title,
					"page_id"			=>	$rsPage->page_id,
					"tab"				=>	4,
					"navigation"		=>	$link,
					"navigation1"		=>  $navigation1
				));

/*if($_GET['pop_up'] == true)
{		
	$tpl->assign(array(	"flag_flag"			=>	'1',
						));
	$tpl->display('popupwin_layout'. $config['tplEx']);
}
else
{	*/				
	$tpl->display('default_layout'. $config['tplEx']);
// }
?>