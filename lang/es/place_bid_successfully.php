<?
define('IN_SITE', 	true);
define('IN_USER', 	true);
// including related database and language files

include_once("includes/common.php");
include_once($physical_path['Site_Lang'].'place_bid.php');
include_once($physical_path['DB_Access']. 'Project.php');
$project 		= new Project();

$ret = $project->GetProjectDetails($_GET['project_id']);

if($_GET['flag'] == '1')	
{
	$new_msg = $lang['Bid_Pending_Msg'];
}
if($_GET['flag'] == '0')	
{
	$new_msg = $lang['Bid_Success'];
}
if($_GET['flag'] == '2')	
{
	$new_msg = $lang['Bid_Update'];
}
##############################################################################################
/// assing templates and javascript with related varibles according to template
##############################################################################################
	$tpl->assign(array(	"T_Body"			=>	'Msg'. $config['tplEx'],
						"msg"		   		=>	$new_msg,
						"navigation"		=>	'<a href=project_'.$_GET['project_id'].'.html class=footerlink>'.$ret->project_title.'</a>',
						"navigation1"		=>	'<a href=place_bid_'.$_GET['project_id'].'_'.clean_url($ret->project_title).'.html class=footerlink>'.$lang['Place_Bid'].'</a>',
						"navigation2"		=>	'<label class=navigation>'.$lang['Placed_Success'].'</label>',
						));

$tpl->display('default_layout'. $config['tplEx']);
?>