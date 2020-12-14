<?php
class Cronjobs
{
	function Cronjobs()
	{
		#print hi;die;
	}
	
	function Deactivate_User()
	{
		global $db;
		$sql = "UPDATE ".AUTH_USER
			 ." SET  user_status = 0 "
			 ." WHERE DATE_SUB(CURDATE(),INTERVAL 30 DAY) > last_login_date "
			 ." AND user_type = 'User' AND user_status = 1";
		$db->query($sql);
	}

	function Project_status()
	{
		global $db,$db1;
		$sql = "SELECT * FROM ".PROJECT_MASTER." WHERE project_status = 1";
		$db->query($sql);
		while($db->next_record())
		{
			$a = explode("-",$db->f('project_posted_date'));
			$date1 = date('Y-m-d ', mktime(0,0,0,$a[1],($a[2]+$db->f('project_days_open')),$a[0]) );
			$date2 = date('Y-m-d');
			$s = strtotime($date1)-strtotime($date2);
			$d = intval($s/86400); 
			$s -= $d*86400;
			$h = intval($s/3600);
			$s -= $h*3600;
			$m = intval($s/60); 
			$s -= $m*60;	
			$remain_days = $d;
			
            if($remain_days < 0 || $remain_days == 0) 
			 {
			   		$sql1 = "UPDATE ".PROJECT_MASTER
							." SET "
							." project_status		='5' ,"
							." project_closed_date	= '".date('Y-m-d')."' "
							." WHERE project_id		=".$db->f('project_id');
					$db1->query($sql1);
			 }
			else
				{
					//nathing
				}
		}
	}
	
	function mailadd_for_all_project()
	{
		global $db;
		
		$email = '';
		
		$sql = "SELECT * FROM ".MEMBER_MASTER." WHERE mem_pro_notice = 1";
		$db->query($sql);
		while($db->next_record())
		{
			$email .= $db->f('mem_email').",";
		}
		$new_email = substr($email,0,-1);
		return $new_email;		
	}
	
	function all_emails()
	{
		global $db,$db1;
		
		$email = '';
		
		$sql = "SELECT * FROM ".MEMBER_MASTER." WHERE mem_pro_notice = 1";
		$db->query($sql);
		while($db->next_record())
		{
			$email = $email.$db->f('mem_email').",";
		}
		$new_email = substr($email,0,-1);
		return $new_email;		
	}
	
	function all_area_wise_emails()
	{
		global $db3;
		
		$sql = "SELECT * FROM ".MEMBER_MASTER." WHERE mem_pro_notice = 2";
		$db3->query($sql);
	}
	
	function All_Projects()
	{
		global $db;
	 	$sql= " SELECT * FROM ".PROJECT_MASTER." AS PM "
			 ." LEFT JOIN ".DEVELOPMENT_COST." AS DC ON PM.project_budget = DC.development_id"
			  ." WHERE PM.project_posted_date = '".date('Y-m-d ',mktime(0,0,0,date("m"),date("d")-1,date("y")))." '";

		$db->query($sql);
	}
	
	function Find_Last_Projects()
	{
		global $db1; 

	 	$sql= " SELECT * FROM ".PROJECT_MASTER." AS PM "
			 ." LEFT JOIN ".DEVELOPMENT_COST." AS DC ON PM.project_budget = DC.development_id"
			 ." WHERE "
			 ." TIME_TO_SEC(TIMEDIFF(now(), PM.project_post_time) )"
			 ." < 3600 "; 
		$db1->query($sql);
	}
	
	function Membership()
	{
		global $db1;
	 	$sql= " SELECT * FROM ".MEMBER_MASTER." AS MM "
			." LEFT JOIN ".MEMBERSHIP_PLAN_MASTER." AS MPM ON MM.membership_id = MPM.membership_id"
			 ." WHERE MM.membership_finish_date = '" . date('Y-m-d') . "' AND MM.membership_id != 0";
		$db1->query($sql);
	}		
	
	function Update($post)
	{
		global $db2;
		$sql="UPDATE ".MEMBER_MASTER
			." SET membership_id		='0' ,"
			." membership_buy_date		='0000-00-00',"
			." membership_finish_date	='0000-00-00',"
			." transcation_id           ='0'  "
			." WHERE user_login_id	=	'".$post."' ";
		return($db2->query($sql));
	}
	
	function GetProjectByCategory($cdrinfoid) 
   {
      global $db1;
			  		
		$sql= " SELECT 
					PM.*,
					DC.development_title
				FROM " . 
					PROJECT_MASTER . " AS PM
			   	LEFT JOIN " . 
					DEVELOPMENT_COST ." AS DC ON PM.project_budget = DC.development_id
				WHERE 
					PM.project_posted_date = '" . date('Y-m-d ', mktime(0,0,0,date("m"),date("d")-1,date("y"))) . "' AND 
					PM.project_status = 1 AND (" ;
					  $op = "";
					  foreach ( $cdrinfoid as $key=>$val )  {
						  $sql.= $op . " PM.project_category LIKE '%$val%'";
						  $op = " OR ";
					 }	
			 $sql.=") 
			 	ORDER BY 
					PM.premium_project DESC, 
					PM.project_post_time DESC";  
			 
		$db1->query($sql);			 
    }
	
	function send_mail_to_closedproject()
	{
		global $db3;
		$sql = "SELECT * FROM ".PROJECT_MASTER." AS PM "
		        ." LEFT JOIN ".MEMBER_MASTER." AS MM ON PM.project_posted_by = MM.user_login_id "
				." WHERE PM.project_status = 5";
		$db3->query($sql);
	}
	
	function SUM_Of_All_Projects()
	{
		global $db;
	 	$sql= " SELECT SUM(DC.dev_max_amount) AS cnt FROM ".PROJECT_MASTER." AS PM "
			 ." LEFT JOIN ".DEVELOPMENT_COST." AS DC ON PM.project_budget = DC.development_id"
			 ." WHERE PM.project_posted_date = '".date('Y-m-d ',mktime(0,0,0,date("m"),date("d")-1,date("y")))."'";
			// SELECT SUM(DC.dev_max_amount) AS cnt FROM project_master AS PM LEFT JOIN development_cost AS DC ON PM.project_budget = DC.development_id WHERE PM.project_posted_date = '2014-01-13'
		$db->query($sql); 
        $db->next_record();
	    return($db->f('cnt'));

	}
	
	function Update_Status_Of_Project($project_id)
	{
		global $db;
		$sql = "UPDATE ".PROJECT_MASTER
			 ." SET project_status = '7' "
			 ." WHERE project_id = '".$project_id."' ";
		$db->query($sql);
	}
	
	function One_Month_Special_User_Deactive()
	{
		global $db,$db1;
		$new_date = "";
		$sql = "SELECT * FROM ".MEMBER_MASTER." AS MM "
			 ." LEFT JOIN ".AUTH_USER." AS AU ON MM.user_auth_id = AU.user_auth_id"
			 ." WHERE MM.special_user = '1' ";
		$db->query($sql);
		while($db->next_record())
		{
			$date_check = explode("-",$db->f('special_user_start_date') );
			
			$new_date = date('Y-m-d', mktime(0,0,0,$date_check[1]+1,($date_check[2]),$date_check[0]) );
			$today_date = date('Y-m-d');
			if($today_date == $new_date)
			{
				$sql_1 = "UPDATE ".MEMBER_MASTER
						 ." SET special_user = '0' ,"
						 ." special_user_start_date		='0000-00-00' "
						 ." WHERE user_auth_id = '".$db->f("user_auth_id")."' ";
				$db1->query($sql_1);
			}
		}
	}
	
	function Showall_Blocked_User()
	{
		global $db1;
	 	$sql= " SELECT * FROM ".AUTH_USER." AS AU "
			  ." LEFT JOIN ".MEMBER_MASTER." AS MM on AU.user_auth_id = MM.user_auth_id" 	
			  ." WHERE AU.user_status = 0 and AU.user_type = 'User'";	
			  	
		$db1->query($sql);
	}
	
	function Update_Block_User($user_auth_id)
	{
		global $db;
	 	$sql= " Update ".AUTH_USER
			 ." SET user_status = '1' "
			 ." WHERE user_auth_id = '".$user_auth_id."' ";
		$db->query($sql);
	}
	
	function New_Update_Category_Count()
	{
		global $db,$db1,$db2;
		$sql= "SELECT * FROM ".PROJECT_MASTER." WHERE project_posted_date ='".date('Y-m-d')."' ";
		$db->query($sql);
		
		while($db->next_record())
		{
			$project_cat = explode(",",$db->f('project_category') );
			
			foreach ($project_cat as $key=>$val)
			{
				$new_sql= " SELECT * FROM ".CATEGORY_MASTER
				." WHERE cat_id  = '".$val."' "; 
				$db1->query($new_sql);		 
				//print $new_sql."<br>";
				while($db1->next_record())
				{
					if($db1->f('cat_path') != '0')
					{
					//print $db1->f('cat_path');
					$cat = explode("/",$db1->f('cat_path'));
					
					//print_r($cat);
					
						$t = 1;
						while($cat[$t] > 0)
						{
							//print $cat[$t];
							$new_sql_1= " UPDATE ".CATEGORY_MASTER
								." SET "
								." WHERE cat_id  = '".$cat[$t]."' ";
							$db2->query($new_sql_1);		
							$new_count = $db2->f('total_projects');
							//print $new_count;
							$t++;
						}
					
					
					}
				}
			}
		}
		
	}
	
	function Open_Projects()
	{	
		global $db;
	 	$sql= " SELECT * FROM ".PROJECT_MASTER." AS AU "
			  ." WHERE project_status = 1 order by project_posted_date desc ";	
		$db->query($sql);
	}
	
	function Arab_to_Int($name)
	{
	   global $db1;
	   $sql= " SELECT * FROM ".AUTH_USER." AS AU "
	        ." LEFT JOIN ".MEMBER_MASTER." AS MM ON AU.user_auth_id = MM.user_auth_id"
	   		." WHERE AU.user_login_id LIKE '$name%'";	
	   $db1->query($sql);
	}
	
	function Update_Arab_User_Name($user_auth_id,$new_user_login_id)
	{
	   global $db2;
	   $sql= " UPDATE ".AUTH_USER
  			 ." SET "
			 ." user_auth_id = '".md5($new_user_login_id)."' ,"
			 ." user_login_id = '".$new_user_login_id."'"
			 ." WHERE user_auth_id  = '".$user_auth_id."' ";
	  $db2->query($sql);
	  $db2->free();
	  
	  $sql1= " UPDATE ".MEMBER_MASTER
  			 ." SET "
			 ." user_auth_id = '".md5($new_user_login_id)."' ,"
			 ." user_login_id = '".$new_user_login_id."'"
			 ." WHERE user_auth_id  = '".$user_auth_id."' ";
	  $db2->query($sql1);
	}
	
	function Insert_In_PipeMail($to,$from,$subject,$content)
	{
		global $db;
		$sql = "INSERT INTO ".EMAIL_IN_PIPELINE
				." (send_from,send_to,mail_subject,mail_content) "
				." values ("
				." '".$from."', " 
				." '".$to."', " 
				." '".$subject."', " 
				." '".$content."') " ;
		$db->query($sql);
	}
	
	function Get_Emails_From_Pipeline()
	{
		global $db;
		$sql = "SELECT * FROM ".EMAIL_IN_PIPELINE
			  ." LIMIT 0,400";
		$db->query($sql);
	}
	
	function Delete_From_Pipeline($pk_id)
	{
		global $db1;
		$sql = "DELETE FROM ".EMAIL_IN_PIPELINE
			  ." WHERE pk_id = ".$pk_id."";
		$db1->query($sql);
	}
	
	
	// Desde 22-9-2017
    function Membership_Active()
	{
		global $db1;
	 	$sql= " SELECT * FROM ".MEMBER_MASTER." WHERE membership_id != 0";
		$db1->query($sql);
	}
	
	
	
}	
?>
