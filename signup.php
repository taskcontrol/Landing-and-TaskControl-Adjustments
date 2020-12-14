<?
//agregado por security 27/6/2014 RFG
if ( isset( $_GET['mem_fname']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_GET['mem_fname'] ), "")); $_GET['mem_fname'] = $filtered_var;}
if ( isset( $_POST['mem_fname']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_POST['mem_fname'] ), "")); $_POST['mem_fname'] = $filtered_var;}
if ( isset( $_REQUEST['mem_fname']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_REQUEST['mem_fname'] ), "")); $_REQUEST['mem_fname'] = $filtered_var;}

if ( isset( $_GET['mem_lname']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_GET['mem_lname'] ), "")); $_GET['mem_lname'] = $filtered_var;}
if ( isset( $_POST['mem_lname']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_POST['mem_lname'] ), "")); $_POST['mem_lname'] = $filtered_var;}
if ( isset( $_REQUEST['mem_lname']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_REQUEST['mem_lname'] ), "")); $_REQUEST['mem_lname'] = $filtered_var;}

if ( isset( $_GET['mem_company']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_GET['mem_company'] ), "")); $_GET['mem_company'] = $filtered_var;}
if ( isset( $_POST['mem_company']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_POST['mem_company'] ), "")); $_POST['mem_company'] = $filtered_var;}
if ( isset( $_REQUEST['mem_company']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_REQUEST['mem_company'] ), "")); $_REQUEST['mem_company'] = $filtered_var;}

if ( isset( $_GET['mem_email']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_GET['mem_email'] ), "")); $_GET['mem_email'] = $filtered_var;}
if ( isset( $_POST['mem_email']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_POST['mem_email'] ), "")); $_POST['mem_email'] = $filtered_var;}
if ( isset( $_REQUEST['mem_email']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_REQUEST['mem_email'] ), "")); $_REQUEST['mem_email'] = $filtered_var;}

if ( isset( $_GET['user_id']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_GET['user_id'] ), "")); $_GET['user_id'] = $filtered_var;}
if ( isset( $_POST['user_id']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_POST['user_id'] ), "")); $_POST['user_id'] = $filtered_var;}
if ( isset( $_REQUEST['user_id']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_REQUEST['user_id'] ), "")); $_REQUEST['user_id'] = $filtered_var;}

if ( isset( $_GET['password']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_GET['password'] ), "")); $_GET['password'] = $filtered_var;}
if ( isset( $_POST['password']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_POST['password'] ), "")); $_POST['password'] = $filtered_var;}
if ( isset( $_REQUEST['password']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_REQUEST['password'] ), "")); $_REQUEST['password'] = $filtered_var;}

if ( isset( $_GET['password_retype']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_GET['password_retype'] ), "")); $_GET['password_retype'] = $filtered_var;}
if ( isset( $_POST['password_retype']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_POST['password_retype'] ), "")); $_POST['password_retype'] = $filtered_var;}
if ( isset( $_REQUEST['password_retype']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_REQUEST['password_retype'] ), "")); $_REQUEST['password_retype'] = $filtered_var;}

if ( isset( $_GET['mem_mobile']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_GET['mem_mobile'] ), "")); $_GET['mem_mobile'] = $filtered_var;}
if ( isset( $_POST['mem_mobile']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_POST['mem_mobile'] ), "")); $_POST['mem_mobile'] = $filtered_var;}
if ( isset( $_REQUEST['mem_mobile']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_REQUEST['mem_mobile'] ), "")); $_REQUEST['mem_mobile'] = $filtered_var;}

if ( isset( $_GET['mem_address']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_GET['mem_address'] ), "")); $_GET['mem_address'] = $filtered_var;}
if ( isset( $_POST['mem_address']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_POST['mem_address'] ), "")); $_POST['mem_address'] = $filtered_var;}
if ( isset( $_REQUEST['mem_address']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_REQUEST['mem_address'] ), "")); $_REQUEST['mem_address'] = $filtered_var;}

if ( isset( $_GET['mem_city']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_GET['mem_city'] ), "")); $_GET['mem_city'] = $filtered_var;}
if ( isset( $_POST['mem_city']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_POST['mem_city'] ), "")); $_POST['mem_city'] = $filtered_var;}
if ( isset( $_REQUEST['mem_city']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_REQUEST['mem_city'] ), "")); $_REQUEST['mem_city'] = $filtered_var;}

if ( isset( $_GET['project_id']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_GET['project_id'] ), "")); $_GET['project_id'] = $filtered_var;}
if ( isset( $_POST['project_id']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_POST['project_id'] ), "")); $_POST['project_id'] = $filtered_var;}
if ( isset( $_REQUEST['project_id']) ){ $filtered_var = str_replace('"', '', strip_tags(mysql_escape_string( $_REQUEST['project_id'] ), "")); $_REQUEST['project_id'] = $filtered_var;}

define('IN_SITE', 	true);
include_once("includes/common.php");
include_once($physical_path['DB_Access']. 'Country.php');
include_once($physical_path['DB_Access']. 'Category.php');
include_once($physical_path['DB_Access']. 'Email.php');
include_once($physical_path['DB_Access']. 'Employee.php');
include_once($physical_path['Site_Lang']. 'signup.php');


$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : '');
$country1 = new Country();
$employee1 = new Employee();
$cats= new Category();
$emails = new Email();

   
 if ($Action == "Signup")
 {
    
     $ERROR = "";

	//Check if User Id is Empty or Not
	if(isset($_POST["user_id"]) && trim($_POST["user_id"]) == "")
	{
		$ERROR .=  "- " . $lang["JS_User_ID"] . "<br>";
	}
	
	//Check if User Login Id contains Maximum 16 characters or not
	//Check if User Login Id contains Minimum 3 characters or not
	if(strlen(trim($_POST["user_id"])) < 3 || strlen(trim($_POST["user_id"])) > 16)
	{
		$ERROR .=  "- " . $lang["JS_Check_User_Login"] . "<br>";
	}
	
	//Check if User ID is not start form no...
	if($user->checkUserName_No(trim($_POST["user_id"])))
	{
		$ERROR .= "- " . $lang["JS_Check_User_Lenght"] . "<br>";
	}
	
	//Check if User Id is Valid or Not
	if(!$user->checkUserName(trim(strtolower($_POST["user_id"]))))
	{
		$ERROR .= "- " . $lang["JS_Check_Special_Cha"] . "<br>";
	}

	//Check if User Login Id is Unique or Not
	if(!$user->Check_User_Exist(trim($_POST["user_id"])))
	{
		$ERROR .= "- " . $lang["User_ID_Not_Available"] . "<br>";
	}
	
	//Check if Password is Empty or Not
	if(isset($_POST["password"]) && trim($_POST["password"]) == "")
	{
		$ERROR .=  "- " . $lang["JS_Passwd"] . "<br>";
	}

	//Check if Password Retype is Empty or Not
	if(isset($_POST["password_retype"]) && trim($_POST["password_retype"]) == "")
	{
		$ERROR .=  "- " . $lang["JS_Re_Passwd"] . "<br>";
	}
	
	//Check if Compair Password & Password Retype r same or not??
	if($_POST["password"] != $_POST["password_retype"])
	{
		$ERROR .=  "- " . $lang["JS_Confirm"] . "<br>";
	}
	
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
	if(isset($_POST["mem_zipcode"]) && trim($_POST["mem_zipcode"]) == "")
	{
		$ERROR .=  "- " . $lang["JS_Zipcode"] . "<br>";
	}
	
	//Check if Country is selected or Not
	if($_POST["mem_country"] == 0)
	{
		$ERROR .=  "- " . $lang["JS_Country"] . "<br>";
	}
	
	//Check if Number Of Employees is selected or Not
	if($_POST["mem_emp"] == 0)
	{
		$ERROR .=  "- " . $lang["JS_Employee"] . "<br>";
	}
	
	//Check if User Email is Empty or Not
	if(isset($_POST["mem_email"]) && trim($_POST["mem_email"]) == "")
	{
		$ERROR .=  "- " . $lang["JS_Mail"] . "<br>";
	}

	//Check if User Email  is Valid or Not
	elseif(!$user->checkUserEmail(trim($_POST["mem_email"])))
	{
		$ERROR .= "- " . $lang["JS_Valid_Mail"] . "<br>";
	}
	
	//Check  if user email is already exists or not
	if(!$user->Check_Email_ID(trim($_POST['mem_email'])) == true)
	{
		$ERROR .= "- " . $lang["JS_Taken_Mail"] . "<br>";
	}

    include_once("securimage/securimage.php");
    $securimage = new Securimage();

    if ( $securimage->check($_POST['captcha_code']) == false ) 
        $ERROR .=  "- " . 'Incorrect security code entered.<br />';

    // $ERROR="";
    
	if ( $ERROR == "" )
	{
		$verify_code = getActivationCode();
		global $mail2;
		$mail2 = '';
		$mail2 = new htmlMimeMail();
		
		$tpl2 = new Smarty;
		$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
		
		$sendinfo = $emails->GetEmailDetails1(ACCOUNT_ACTIVATED);
		$mail2->setFrom($sendinfo->email_adress);
		$mail2->setSubject($sendinfo->email_subject);
		$tpl2->assign(array("user_id"				=>	$_POST['user_id'],
							"password"				=>  $_POST['password'],
							"email_id"				=>  $_POST['mem_email'],
							"verify_url_1"          =>	"<a href=".$virtual_path['Site_Root']."verify.php?user_id=".md5($_POST['user_id']).">Click Here</a>", 
							"verify_url_2"          =>	"<a href=".$virtual_path['Site_Root']."verify.php?user_id=".md5($_POST['user_id'])."&code=".$verify_code.">Click Here</a>",
							"verification_code"     =>  $verify_code,
							));
							
		// $mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
		$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
		$mail_content_reg    = $tpl2->fetch("email_template:".EMAIL_SIGNUP);	
		
		$mail_html = "<table border=0 cellpadding=0 cellspacing=0 width=75%>
						 <tr>
						 	<td>".$mail_content_header."</td>
						 </tr>
					
						<tr>
						  <td>".$mail_content_reg."</td> 
						</tr>
					
						<tr>
							<td>".$mail_content_footer."</td>
						</tr>
					</table>";
		
		
				
		$mail2->setHtml($mail_html);
                $result = $mail2->send(array($_POST['mem_email']));
		
		
		$user_name = $_POST['user_id'];
		
		$user->Signup($_POST,$verify_code,$user_name);
		

		if($_POST['aff_user'] != '')		
   		{
     		$uid = $user->Check_User_ID($_POST['aff_user']);
			if($uid == 0)
			{
				$user->Insert_Affilation($_POST['aff_user'],$user_name);
			}
		} 

		$user->IsValidLogin($user_name,$_POST['password'],1);
		
		$_SESSION['Member_As_Buyer'] = 1; 
		$_SESSION['Member_As_Seller'] = 1;
		
		// if user is not as buyer or seller
	//	if($_SESSION['Member_As_Buyer'] != 1 && $_SESSION['Member_As_Seller'] != 1)
	//	{
			header("location: account.php");
			exit();
	//	}
	}	
	else
	{
	       $Action = A_VIEW;
	}
}
if($_GET['Checking'] == 'CheckID')
{
	$user->Check_User_ID($_GET['check']);
	if($db->num_rows() == 0)
		$response = $lang['User_ID_Available'];
	if($db->num_rows() == 1)
		$response = $lang['User_ID_Not_Available'];
	print $response;die;
}
elseif($_GET['Checking'] == 'CheckEmail')
{
    	$result = $user->Check_Email_ID($_GET['check']);
	if($result == 1)
		$response = $lang['JS_Not_Taken_Mail'];
	if($result == 0)
		$response = $lang['JS_Taken_Mail'];
	print $response;die;
}

 

$user->Destroy();


if($Action == ''|| $Action == A_VIEW)
{
    $contry_list   = $country1->GetCountryList();
	$Country       = fillDbCombo($contry_list,'country_id','country_name');
	$employee_list = $employee1->GetEmployeeList();
	$Employee      = fillDbCombo($employee_list,'size_id','employees');
	
	$file_name = 'en_reg_condition.txt';
	$content = readFileContent($physical_path['Upload'].$file_name);

	$tpl->assign(array( "T_Body"			=>	'signup'. $config['tplEx'],
						"JavaScript"		=>	array('signup.js',"check.js"),
						"lang"				=>	$lang,	
						"country_List"		=>	$Country,
						"employee_list"     =>  $Employee,
						"msg"				=>	$msg,
						"ERROR"				=>  $ERROR,
						"checked"			=>	"checked",
						"aff"				=>  $_GET['aff'],
						"term1"             =>  stripslashes($content),
						"tab"				=>	4,
						"classSU"			=>	"active",
						"navigation"		=>	'<label class=navigation>'.$lang['Sign_Up'].'</label>'
				));
	
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
	
	$tpl->assign(array("catid"			    =>	$arr_cat_id,
					   "catname"   			=>	$arr_cat_name,
					   "Loop"				=>	$rscnt,
					   "checked_cat"		=>	$arr_cats,
					));
}
$tpl->display('default_layout'. $config['tplEx']);
?>