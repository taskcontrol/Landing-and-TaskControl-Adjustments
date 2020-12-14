<?
define('IN_SITE', 	true);
define('IN_USER',	true);

// including related database and language files
include_once("includes/common.php");
include_once($physical_path['DB_Access']. 'Bid.php');
include_once($physical_path['Site_Lang'].'/manage_seller.php');

// creating objects
$bid  		= new Bid();

##############################################################################################
/// to get data of win project for user id
##############################################################################################
$bid->Seller_Listing_Win_Project($_SESSION['User_Name']);
$rscnt = $db->num_rows();
$i=0;
while($db->next_record())
{
	$arr_post_project[$i]['id']					  = $db->f('project_id');
	$arr_post_project[$i]['Project_Title']		  = $db->f('project_title');
	$arr_post_project[$i]['clear_title']		  = clean_url($db->f('project_title'));
	$arr_post_project[$i]['bid_amount']			  = $db->f('bid_amount');
	$arr_post_project[$i]['delivery_within']	  = $db->f('delivery_within');
	$i++;
} 
##############################################################################################

##############################################################################################
/// assing templates and javascript with related varibles according to template
##############################################################################################
if($_GET['profile'] == 'change')
	$SuccMsg	=	$lang['Seller_Profile_Change'];

$tpl->assign(array(	"T_Body"			=>	'manage_seller'. $config['tplEx'],
					"lang"              =>  $lang,
                    "user_name"         =>  $_SESSION['User_Name'], 
					"Site_Title"		=>	$config[WC_SITE_TITLE]." - ".$lang['Seller'],
					"Loop1"				=>	$rscnt,
					"post_project"      =>  $arr_post_project,
					"succMsg"           =>  $SuccMsg,
					"tab"          		=>  4,
					"navigation"		=>	'<label class=navigation>'.$lang['Seller_Activity'].'</label>'
					));
##############################################################################################

$tpl->display('default_layout'. $config['tplEx']);    // assign to layout template
?>