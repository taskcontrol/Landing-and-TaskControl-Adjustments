<?
define('IN_SITE', 	true);
// define('IN_USER',	true);
include_once("/var/www/taskcontrol.net/web/includes/common.php");
include_once($physical_path['DB_Access']. 'Member.php');
include_once($physical_path['Site_Lang'].'plans.php');


$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : A_VIEW_ALL);

$member =  new Member();

if($_POST['Submit2'] == $lang['Button_Cancel'])
{
  header("location: plans.php");
  exit(0);
}
elseif($_POST['Submit'] == $lang['Button_Submit'])
{
  $membership_id = $_POST['selected_membership'][0];	
  $details = $member->GetMember($membership_id);
  $totalamount1 = Select_wallet_sum($_SESSION['User_Id']);
  $test = substr($totalamount1,1);
  $test2	=	str_replace(",","",$test);
  
  if($test2 > ($details->membership_fees))
      {
	      $tpl->assign(array(	"T_Body"		  =>  'membership_confirm'. $config['tplEx'],
		                        "msg_confirm"     =>  $lang['Message_Confirm'], 
								"lang"			  =>  $lang,
								"membership_id"   =>  $membership_id,
								"membership_name" =>  $details->membership_name,
								"tab"			  =>  4,
								"navigation"	  =>  '<label class=navigation>'.$lang['Membership'].'</label>'
							));	
	  }
  else
	//  {
	//		$tpl->assign(array(	"T_Body"	=>	'Msg'. $config['tplEx'],
	//							"msg"       =>   $lang['Message'],
	//							"tab"	 	=>  4,
	//							"navigation"	=>  '<label class=navigation>'.$lang['Membership'].'</label>'
	//						));	
	 // }

      {
        header("location: signup.php");
        exit(0);
      }

    
}
elseif($_POST['Submit1'] == $lang['Button_Submit'])
{
  
  	exit(0);
  	
}
else
 {
	$ret = $member->ViewAll_MemberShip();
	$cnt = $db->num_rows();
	$i = 0;
	$str = $_SERVER['HTTP_REFERER'];
	
	$str1 = substr(strrchr($str,'/'),1);
		
	if($str1 == 'account.php')
	{
		$navigation = '<a href=account.php class=footerlink>'.$lang['My_Accoount'].'</a>';
		$navigation1= '<label class=navigation>'.$lang['Membership'].'</label>';
	}
	else
	{
		$navigation1= '<label class=navigation>'.$lang['Membership'].'</label>';
	}
	while($db->next_record())
	{
	    $arr_member[$i]['id']	   				=	$db->f('membership_id');
		$arr_member[$i]['name']					= 	$db->f('membership_name');
	//	$arr_member[$i]['time']					= 	$db->f('membership_time');
		$arr_member[$i]['fees']			 	  	=	$db->f('membership_fees');
		$arr_member[$i]['status']				=	$db->f('membership_status');
		$arr_member[$i]['display_order']	  	        =	$db->f('display_order');
		$arr_member[$i]['description']				=	explode(',', $arr_member[$i]['name']);
		$i++;
	}

	$tpl->assign(array(	"T_Body"			=>	'membership'. $config['tplEx'],
						"JavaScript"		=>  array("membership.js"),
						"lang"				=>  $lang,
						"arr_member"        =>  $arr_member,
						"Loop"              =>  $cnt,
						"tab"			  	=>  4,
						"navigation"		=>	$navigation,
						"navigation1"		=>	$navigation1,
						"navigation2"		=>	$navigation2,
						));
						
   $user_details = $member->GetMemberDetails($_SESSION['User_Id']);						
   
   	$tpl->assign(array(	
						"membership_id"              =>  $user_details->membership_id, 
						"membership_name"            =>  $user_details->membership_name,
						"start_date"                 =>  $user_details->membership_buy_date,
						"end_date"              	 =>  $user_details->membership_finish_date,
						));
				
}
$tpl->display('default_layout'. $config['tplEx']);
?>
