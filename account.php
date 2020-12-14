<?
define('IN_SITE', 	true);
define('IN_USER',	true);

// including related database and language files
include_once("/var/www/taskcontrol.net/web/includes/common.php");
include_once($physical_path['Site_Lang'].'/account.php');
include_once($physical_path['DB_Access']. 'Project.php');
include_once($physical_path['DB_Access']. 'Buyers.php');
include_once($physical_path['DB_Access']. 'Contact.php');
include_once($physical_path['DB_Access']. 'User.php');

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : 'ViewAll'); 

// creating objects
$project = new Project();
$buyer	 = new Buyers();
$contact = new Contact();
$user    = new User();

##############################################################################################
	/// assing templates and javascript with related varibles according to template
##############################################################################################
	$tpl->assign(array(	"T_Body"	    =>	'account'. $config['tplEx'],
				"lang"	   	    =>  $lang,
				"Action"	    =>	'Save',
				"JavaScript"	    =>  array("account.js"),
				"user"              =>  $_SESSION['User_Name'], 
				"Membership_Name"   =>  $_SESSION['Membership_Name'],
				"Buy_Date"   	    =>  $_SESSION['Buy_Date'],
				"Finished_Date"     =>  $_SESSION['Finished_Date'],
				"Mem_Company"       =>  $_SESSION['Mem_Company'],

				"tab"		    =>	4,
				"navigation"	    =>	'<label class=navigation>'.$lang['My_Account'].'</label>'
			));
##############################################################################################
     
$tpl->display('default_layout'. $config['tplEx']);    // assign to layout template
?>
