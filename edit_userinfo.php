<?
define('IN_SITE', 	true);
define('IN_USER', 	true);
// including related database and language files

include_once("includes/common.php");
include_once($physical_path['DB_Access']. 'Country.php');
include_once($physical_path['DB_Access']. 'Category.php');
include_once($physical_path['Site_Lang'].'/edit_userinfo.php');
$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : '');
// creating objects
$countr 	= new Country();
$cats 		= new Category();

##############################################################################################					
/// edit / insert member detail in table
##############################################################################################
if($Action == 'Edit' && $_POST['Submit'] = $lang['Button_Submit'])
{
	$ERROR = "";
	
	//Check if First Name is Empty or Not
	if(isset($_POST["mem_fname"]) && trim($_POST["mem_fname"]) == "")
	{
		$ERROR .=  "- " . $lang["JS_Fname"] . "<br>";
	}
	
	//Check if Last Name is Empty or Not
	if(isset($_POST["mem_lname"]) && trim($_POST["mem_lname"]) == "")
	{
		$ERROR .=  "- " . $lang["JS_Lname"] . "<br>";
	}

	//Check if Phone is Empty or Not
	if(isset($_POST["mem_phone"]) && trim($_POST["mem_phone"]) == "")
	{
		$ERROR .=  "- " . $lang["JS_Phone"] . "<br>";
	}
	
	//Check if Address is Empty or Not
	if(isset($_POST["mem_address"]) && trim($_POST["mem_address"]) == "")
	{
		$ERROR .=  "- " . $lang["JS_Address"] . "<br>";
	}
	
	//Check if City is Empty or Not
	if(isset($_POST["mem_city"]) && trim($_POST["mem_city"]) == "")
	{
		$ERROR .=  "- " . $lang["JS_City"] . "<br>";
	}
	
	//Check if Zipcode is Empty or Not
	if(isset($_POST["mem_zip"]) && trim($_POST["mem_zip"]) == "")
	{
		$ERROR .=  "- " . $lang["JS_ZipCode"] . "<br>";
	}
	
	//Check if Country is selected or Not
	if($_POST["mem_country"] == 0)
	{
		$ERROR .=  "- " . $lang["JS_Country"] . "<br>";
	}
	
	if($ERROR == "")
	{
	 	$user->UpdateMemberDetails($_POST);
	 	header("location: edit_userinfo.php?update=true");
	 	exit();
	}
	
}
##############################################################################################

    if($_GET['update'] == 'true')
	 {
	 	$sucmsg = $lang['Msg'];
	 }
##############################################################################################					
/// get member detail from table
##############################################################################################
	 
	$result = $user->GetChangeUserInfo1($_SESSION['User_Id']);
	#print_r($result);die;
	$country_id 	= $result->mem_country;
	$mem_pro_notice	= $result->mem_pro_notice;
	$mem_category	= $result->mem_category;
	
##############################################################################################
///get country list in array and set it to combo box
##############################################################################################
	$contry_list 	= $countr->GetCountryList();
	$Country	 	= fillDbCombo($contry_list,'country_id','country_name',$result->mem_country);
##############################################################################################

	##############################################################################################
	/// assing templates and javascript with related varibles according to template
	##############################################################################################
	$tpl->assign(array(		"T_Body"			=>	'edit_userinfo'. $config['tplEx'],
							"JavaScript"		=>	array('edit_userinfo.js'),
							"ERROR"				=>  $ERROR,
							"sucmsg"			=>  $sucmsg,
							"lang"				=>  $lang,
							"Action"			=>  "Edit",
							"Country_List"	    =>	$Country,
							"mem_emp"           =>  $mem_emp,
							"date1"				=>  date("l jS F Y"), 
							"mem_fname"         =>  $result->mem_fname, 
							"mem_lname"         =>  $result->mem_lname, 
							"mem_company"       =>  $result->mem_company, 
							"mem_address"       =>  $result->mem_address, 
							"mem_city" 			=>  $result->mem_city,
							"mem_state"         =>  $result->mem_state,
							"mem_zip"           =>  $result->mem_zip_code,
							"mem_phone" 		=>	$result->mem_phone,
							"mem_mobile" 		=>	$result->mem_mobile,
							"mem_fax_no" 		=>	$result->mem_fax_no,
							"mem_website"       =>  $result->mem_website, 
							"mem_email"       	=>  $result->mem_email, 
							"mem_emp"         	=>  fillArrayCombo($lang_arr['Employees'],$result->mem_employes),

							"option1" 			=> ($result->mem_pro_notice == 1) ? 'checked' : '',
							"option2"  			=> ($result->mem_pro_notice == 2) ? 'checked' : '',
							"option3"  			=> ($result->mem_pro_notice == 3) ? 'checked' : '',
							"checked"			=> ($result->mem_option == 1) ? 'checked' : '',
							"msg"               => $sucmsg,
							"tab"				=>	4,
							"navigation"		=> '<a href=account.php class=footerlink>'.$lang['My_Account'].'</a>',
							"navigation1"		=> '<label class=navigation>'.$lang['Edit_Account_Info'].'</label>',
        					));	
	
	##############################################################################################
	/// get listing of primary category for user
	##############################################################################################
	$result = $cats->HomeCategory();
	$rscnt = $db->num_rows();
	$total = 0;
	$i=0;
	$arr_cats =explode(",",$mem_category);
	
	while($db->next_record())
	{
	    $arr_cat_name[$i]			= $db->f('cat_name');
		$arr_cat_id[$i]				= $db->f('cat_id');
		$i++;
	}	

	//assign to template
	$tpl->assign(array("catid"			    =>	$arr_cat_id,
 					   "catname"   			=>	$arr_cat_name,
					   "Loop"				=>	$rscnt,
					   "checked_cat"		=>	$arr_cats,
				));
									
$tpl->display('default_layout'. $config['tplEx']);    // assign to layout template
?>