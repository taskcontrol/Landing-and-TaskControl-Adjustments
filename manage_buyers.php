<?
define('IN_SITE', 	true);
define('IN_USER',	true);

// including related database and language files
include_once("/var/www/taskcontrol.net/web/includes/common.php");
include_once($physical_path['DB_Access']. 'Buyers.php');
include_once($physical_path['DB_Access']. 'Project.php');
include_once($physical_path['Site_Lang'].'/manage_buyers.php');

// creating objects

$buyer   = new Buyers();
$pro	 = new Project();

if($_GET['edit'] == 'true')
  $SuccMsg = $lang['MSG_Buyer_Project_Update'];
elseif($_GET['extend'] == 'true')
  $SuccMsg = $lang['MSG_Buyer_Project_Extend'];

##############################################################################################					
/// get all projects data which are open posted by user
##############################################################################################
$result = $buyer->ViewAll_Project_User_Open($_SESSION['User_Id']);
$rscnt = $db->num_rows();

$i=0;
	while($db->next_record())
	{
		$arr_post_project[$i]['id']					  = $db->f('project_id');
		$arr_post_project[$i]['Project_Title']		  = $db->f('project_title');
		$arr_post_project[$i]['clear_title']		  = clean_url($db->f('project_title'));
		$arr_post_project[$i]['Project_Description']  = $db->f('project_description');
		$arr_post_project[$i]['project_status']	      = $db->f('project_status');

		list($arr_post_project[$i]['bid'],$arr_post_project[$i]['Ave_Bid'],$arr_post_project[$i]['Ave_Time']) =  explode(",",Get_Bids_By_Id1($db->f('project_id')));
		if($arr_post_project[$i]['bid'] != 0)
		{
		  $arr_post_project[$i]['Ave_Bid1'] = number_format((($arr_post_project[$i]['Ave_Bid'])/($arr_post_project[$i]['bid'])),2);
		}
		$i++;
	}
##############################################################################################

##############################################################################################
/// assing templates and javascript with related varibles according to template
##############################################################################################
if($_GET['profile'] == 'change')
	$SuccMsg	=	$lang['Buyer_Profile_Change'];

$tpl->assign(array(	"T_Body"			=>	'manage_buyers'. $config['tplEx'],
					"lang"				=>  $lang,
                    "user_name"         =>  $_SESSION['User_Name'], 
					"TOP_TITLE"         =>  strtoupper($lang['Buyer']),    
					"Site_Title"		=>	$config[WC_SITE_TITLE]." - ".$lang['Buyer'],
					"Loop1"				=>	$rscnt,
					"post_project"      =>  $arr_post_project,
					"succMsg"           =>  $SuccMsg,
					"tab"          		=>  4,
					"navigation"		=>	'<label class=navigation>'.$lang['Buyer'].'</label>'
					));
##############################################################################################

$tpl->display('default_layout'. $config['tplEx']);    // assign to layout template
?>
