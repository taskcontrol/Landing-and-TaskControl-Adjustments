<?

define('IN_SITE', 	true);
define('HOME_PAGE', true);

// including related database and language files
include_once('./includes/common.php');
include_once($physical_path['DB_Access']. 'Category.php');
include_once($physical_path['DB_Access']. 'Project.php');
include_once($physical_path['Site_Lang'].'/home.php');


// creating objects
$cats 		= new Category();
$proj	 	= new Project();

// $tpl->clear_all_cache();

$cats->Home_Page_1();
$cnt = $db->num_rows();
$i = 0;
while($db->next_record())
{
	$arr_cat1_id[$i]			=	$db->f('cat_id');
	$arr_cat1_name[$i]			=	$db->f('cat_name');
	
	$proj->GetProjectAtHomePage_New($db->f('cat_id'));
	$project_count[$i] = $db1->num_rows();	
	$j=0;
	while($db1->next_record())
	{
		$view_pro[$i][$j]['id']					= $db1->f('project_id');
		$view_pro[$i][$j]['clear_title']		= clean_url($db1->f('project_title'));
		$view_pro[$i][$j]['status'] 			= $db1->f('project_status');
		$view_pro[$i][$j]['membership_id'] 	 	= $db1->f('membership_id');
		$view_pro[$i][$j]['project_date'] 		= $db1->f('project_posted_date');
		$view_pro[$i][$j]['premium_project'] 	= $db1->f('premium_project');
		$view_pro[$i][$j]['project_allow_bid'] 	= $db1->f('project_allow_bid');
		$view_pro[$i][$j]['title']		        = $db1->f('project_title');
		$view_pro[$i][$j]['urgent_project']		= $db1->f('urgent_project');
		list($view_pro[$i][$j]['bid'],$view_pro[$i][$j]['Ave_Bid'],$view_pro[$i][$j]['Ave_Time']) =  explode(",",Get_Bids_By_Id1($db1->f('project_id')));
		
		if($view_pro[$i][$j]['bid'] != 0)
		{
		  $view_pro[$i][$j]['Ave_Bid1'] = number_format((($view_pro[$i][$j]['Ave_Bid'])/($view_pro[$i][$j]['bid'])),2);
		}
	
		$j++;
	}
	$i++;
}
#print_r($url);die;
##############################################################################################
/// assing templates and javascript with related varibles according to template
##############################################################################################

$tpl->assign(array(	"T_Body"			=>	'home'. $config['tplEx'],
					"JavaScript"		=>	array('home.js'),
					"lang"				=>  $lang,
					"cat_id"  	  		=>	$arr_cat1_id,
					"cat_name"			=>	$arr_cat1_name,
					//"proj_list"			=>	$arr_cat1_project_list,
					"Loop1"				=>	$cnt,
					"total_cat"			=>	$cnt-1,
					"project_count"		=>	$project_count,
					"view_project"    	=>	$view_pro,
					"url"    	        =>	$url,
					"tab"				=>	0,
					"classLP"		=>	"active"
			));
##############################################################################################


$tpl->display('default_layout'. $config['tplEx']);    // assign to layout template
?>