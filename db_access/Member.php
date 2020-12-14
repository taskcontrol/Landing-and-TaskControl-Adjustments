<?
class Member
{
   function Member()
   {
   }



   function ViewAllBuyers()
   {
	   global $db;
	   $sql= " SELECT A.mem_fname, A.mem_lname, A.mem_email, A.mem_category FROM ". MEMBER_MASTER ." A '";
	   $db->query($sql);   	
   }



        function ViewAll()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".MEMBERSHIP_PLAN_MASTER." ORDER BY display_order ASC ";

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}

		$sql= " SELECT * FROM ".MEMBERSHIP_PLAN_MASTER." ORDER BY display_order ASC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}
	

	
	
       function Insert($post)
       {
       global $db;
	   $sql="INSERT INTO ".MEMBERSHIP_PLAN_MASTER
				." (membership_name,membership_time,membership_fees,membership_status ) "
				." VALUES ('".$post['membership_name']."' ,"
				." '".$post['membership_time']."' ,"
				." '".$post['membership_fee']."' ,"
				." '".$post['membership_status']."' "
				." )";
	   return($db->query($sql));	
	}
	

		
	function GetMember($memberid)
        {
       global $db;
	   $sql= " SELECT * FROM ".MEMBERSHIP_PLAN_MASTER." WHERE membership_id = '".$memberid." '";
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}	


	function GetMemberStorage($memberid)  // agregada 27-9-2017 RFG
        {
       global $db;
	   $sql= " SELECT * FROM ".storage_plan_master." WHERE storage_id = '".$memberid." '";
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}

	
	function Selectmember()
        {
       global $db;
	   $sql= " SELECT * FROM ".MEMBERSHIP_PLAN_MASTER;
	   $db->query($sql);
	   return ($db->fetch_object());
	}	


	function Selectmemberstorage()  // agregada 27-9-2017 RFG
        {
       global $db;
	   $sql= " SELECT * FROM ".storage_plan_master;
	   $db->query($sql);
	   return ($db->fetch_object());
	}	


	function Update($post)
	{
		global $db;

		$sql = " UPDATE ". MEMBERSHIP_PLAN_MASTER
			.  " SET membership_name 	= '". $post['membership_name']. "',"
			.  " membership_time        = '". $post['membership_time']."' ,"
			.  " membership_fees        = '". $post['membership_fee']."' ,"
			.  " membership_status      = '". $post['membership_status']."' "
			.  " WHERE membership_id	= '".$post['membership_id']. "' ";
		$db->query($sql);
		return ($db->query($sql));
	}


	function UpdateStorage($post)     // agregada 27-9-2017 RFG
	{
		global $db;

		$sql = " UPDATE ". storage_plan_master
			.  " SET storage_name 	= '". $post['storage_name']. "',"
			.  " storage_time        = '". $post['storage_time']."' ,"
			.  " storage_fees        = '". $post['storage_fee']."' ,"
			.  " storage_status      = '". $post['storage_status']."' "
			.  " WHERE storage_id	= '".$post['storage_id']. "' ";
		$db->query($sql);
		return ($db->query($sql));
	}


    function Update_finish_date($user_auth_id,$finished_date)
	{
		global $db;
		$sql = " UPDATE ". MEMBER_MASTER
			 . " SET membership_buy_date	='". date('Y-m-d')."',"
			 . " membership_finish_date		='". $finished_date."' "
			 . " WHERE user_auth_id ='".$user_auth_id. "' ";
		return ($db->query($sql));
	}


    function Update_Expired($user_auth_id,$expired)  // agregada 11-Oct-2017
	{
	    // expired=0 -> plan activo
	    // expired=1 -> plan expirado
	    
		global $db;
		$sql = " UPDATE ". MEMBER_MASTER
			 . " SET plan_expired	='". $expired."' "
			 . " WHERE user_auth_id ='".$user_auth_id. "' ";
		return ($db->query($sql));
	}


    function Update_Wallet_From_Renew($user_auth_id, $sumearning)
	{
		global $db;
		$sql = " UPDATE ". MEMBER_MASTER
			 . " SET earn_by_site	='".$sumearning."' "
			 . " WHERE user_auth_id ='".$user_auth_id. "' ";
		return ($db->query($sql));
	}


	function Delete($membership_id)  
	{
		global $db;
		
		$sql="DELETE FROM ".MEMBERSHIP_PLAN_MASTER
			." WHERE membership_id=".$membership_id;
		return($db->query($sql));
	}	


    function DeleteStorage($membership_id)   // agregada 27-9-2017 RFG
	{
		global $db;
		
		$sql="DELETE FROM ".storage_plan_master
			." WHERE storage_id=".$membership_id;
		return($db->query($sql));
	}


	 function View_membership_All_Order()
	{

		global $db;
		$sql= "SELECT * FROM ".MEMBERSHIP_PLAN_MASTER
	 		  ." ORDER BY display_order ASC  ";
		$db->query($sql);
	}


	 function View_membership_All_Storage()
 	 {

		global $db;
		$sql= "SELECT * FROM ".storage_plan_master
	 		  ." ORDER BY display_order ASC  ";
		$db->query($sql);
	 }


	function DisplayOrder_membership_Type($portfolio_id11, $display_order)
	{
		global $db;

		$sql = " UPDATE ". MEMBERSHIP_PLAN_MASTER
			.  " SET display_order 	= '". $display_order. "' "
			.  " WHERE membership_id	= '". $portfolio_id11. "' ";
		$db->query($sql);
		return ($db->affected_rows());
	}



	function ToggleStatusMember($member_id, $mem_visible)
	{
		global $db;
		$sql = " UPDATE ".MEMBERSHIP_PLAN_MASTER
			 . " SET membership_status ='". $mem_visible."'"
			 . " WHERE membership_id ='". $member_id. "'";
		return ($db->query($sql));
	}


	
	function ViewAll_MemberShip()
	{
		global $db;
		$sql= " SELECT * FROM ".MEMBERSHIP_PLAN_MASTER." WHERE membership_status = 1 ORDER BY display_order ASC ";
		$db->query($sql);
	}


	function ViewAll_Storage_Plans()   // agregada el 26-9-2017 RFG
	{
		global $db;
		$sql= " SELECT * FROM ".storage_plan_master." WHERE storage_status = 1 ORDER BY display_order ASC ";
		$db->query($sql);
	}


    function ViewAllUserActivePlans($user_id)  // agregada el 25-8-2017 RFG
	{
		global $db;
		$sql= " SELECT * FROM ".MEMBER_MEMBERSHIP_HISTORY." 
		        WHERE user_auth_id = '".$user_id."'";  
		$db->query($sql);
	}



    function CountAllUserActivePlans($user_id)  // agregada el 25-8-2017 RFG
	{
		global $db;
		$sql= " SELECT count(*) as cnt FROM ".MEMBER_MEMBERSHIP_HISTORY." 
		        WHERE user_auth_id = '".$user_id."'";  
		$db->query($sql);
	}





// Paypal	
	function Insert_Member_Paypal($user_id,$login_id,$amount,$membership_name)
	{
	    $trans_type = "-";
		$desc = "Subscription For: ".$membership_name;
		global $db;
		$sql="INSERT INTO ".PAYPAL_MASTER
					." (user_auth_id,user_login_id,amount,status,description,trans_type,date,total_amount_paid) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."' ,"
					." '".$amount."' "
					." )";
        	$db->query($sql);
		$insertid=$db->sql_inserted_id();
		return($insertid);
        }
   

// Moneybooker	
	function Insert_Member_MoneyBooker($user_id,$login_id,$amount)
	{
	    $trans_type = "-";
		$desc = "Fees Taken Form Site For buying membership by you";   
		global $db;
		$sql="INSERT INTO ".MONEYBOOKER_MASTER
					." (user_auth_id,user_login_id,amount,status,description,trans_type,date ) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."' "
					." )";
        	$db->query($sql);
		$insertid=$db->sql_inserted_id();
		return($insertid);
        }
      
      
   
 // DineroMail	
	function Insert_Member_DineroMail($user_id,$login_id,$amount)
	{
	    $trans_type = "-";
		$desc = "Fees Taken Form Site For buying membership by you";   
		global $db;
		$sql="INSERT INTO ".DINEROMAIL_MASTER
					." (user_auth_id,user_login_id,amount,status,description,trans_type,date ) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."' "
					." )";
        	$db->query($sql);
		$insertid=$db->sql_inserted_id();
		return($insertid);
        }
     
     
   
 // MercadoPago	
	function Insert_Member_MercadoPago($user_id,$login_id,$amount)
	{
	    $trans_type = "-";
		$desc = "Fees Taken Form Site For buying membership by you";   
		global $db;
		$sql="INSERT INTO ".MERCADOPAGO_MASTER
					." (user_auth_id,user_login_id,amount,status,description,trans_type,date ) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."' "
					." )";
        	$db->query($sql);
		$insertid=$db->sql_inserted_id();
		return($insertid);
        }
     
   
   
 // Neteller	
	function Insert_Member_Neteller($user_id,$login_id,$amount)
	{
	    $trans_type = "-";
		$desc = "Fees Taken Form Site For buying membership by you";   
		global $db;
		$sql="INSERT INTO ".NETELLER_MASTER
					." (user_auth_id,user_login_id,amount,status,description,trans_type,date ) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."' "
					." )";
        	$db->query($sql);
		$insertid=$db->sql_inserted_id();
		return($insertid);
        }
     
   
    function Update_Member_details($member_id, $transcation_id,$user_auth_id,$finished_date,$earning,$ip_address,$version)
	{
		global $db;
		$sql = " UPDATE ".MEMBER_MASTER
			 . " SET membership_id 			='". $member_id."',"
			 . " membership_buy_date	 	='". date('Y-m-d')."',"
			 . " membership_finish_date		='". $finished_date."',"
			 . " transcation_id 			='". $transcation_id."',"
			 . " server_ip                  ='". $ip_address."',"
			 . " actual_version             ='". $version."',"
		 	 . " earn_by_site 		    	='". $earning."' "
			 . " WHERE user_auth_id ='".$user_auth_id."'";
		return ($db->query($sql));
	}


    function Update_Member_Storage_details($user_auth_id,$transcation_id,$plan_gigas_id) // Agregada 27-9-2017 RFG
	{
		global $db;
		$sql = " UPDATE ".MEMBER_MASTER
			 . " SET plan_gigas_id 			='". $plan_gigas_id."',"
			 . " storage_buy_date	     	='". date('Y-m-d')."',"
			 . " transcation_id 			='". $transcation_id."'"
			 . " WHERE user_auth_id ='".$user_auth_id."'";
		return ($db->query($sql));
	}


	function Insert_History($user_id,$login_id,$membership_id,$membership_name,$membership_time,$membership_fees,$finished_date)
	{
		global $db;
		$sql="INSERT INTO ".MEMBER_MEMBERSHIP_HISTORY
					." (user_auth_id,user_login_id,membership_id,membership_name,membership_time,membership_fees,buy_date,finish_date ) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$membership_id."' ,"
					." '".$membership_name."' ,"
					." '".$membership_time."' ,"
					." '".$membership_fees."' ,"
					." '".date('Y-m-d')."' ,"
					." '".$finished_date."' "
					." )";
		$db->query($sql);
	}


	function GetMemberDetails($userid)
   	{
       global $db;
	   $sql = " SELECT * FROM ".MEMBER_MASTER." AS MM "
	          ." LEFT JOIN ".MEMBERSHIP_PLAN_MASTER." AS MPM ON MM.membership_id = MPM.membership_id "
			  ." WHERE MM.user_auth_id  = '".$userid."'";
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}


	function GetMemberStorageDetails($userid)
   	{
       global $db;
	   $sql = " SELECT * FROM ".MEMBER_MASTER." AS MM "
	          ." LEFT JOIN ".storage_plan_master." AS SPM ON MM.plan_gigas_id = SPM.storage_id "
			  ." WHERE MM.user_auth_id  = '".$userid."'";
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}

	
	function ViewAllcsv()
   	{
       global $db;
	   $sql = " SELECT user_login_id,mem_email FROM ".MEMBER_MASTER
	   		  ." ORDER BY user_login_id ASC";
	   			
	   $db->query($sql);
	}

	
	function ViewAccount()
   	{
       global $db;
	   
	   $sql="SELECT count(*) as cnt FROM ".MEMBER_MASTER
			." WHERE wallet_sum > 0 OR earn_by_site > 0 "; 	
		$db->query($sql);
		$db->next_record();
		
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
	   
	   $sql = " SELECT * FROM ".MEMBER_MASTER
 	   		 ." WHERE wallet_sum > 0 OR earn_by_site > 0 LIMIT " 
			 . $_SESSION['start_record']. ", ". $_SESSION['page_size'];
	   $db->query($sql);
	}
	
	
	function ViewPaypal($userid)
   	{
       global $db;
	   $sql = " SELECT * FROM ".PAYPAL_MASTER
 	   		 ." WHERE user_auth_id = '".$userid."'";
	   	
	   $db->query($sql);
	}
	
		
	function ViewMoneybooker($userid)
   	{
       global $db;
	   $sql = " SELECT * FROM ".MONEYBOOKER_PENDING_DEPOSITE
 	   		 ." WHERE user_auth_id = '".$userid."'";
	   
	   $db->query($sql);
	}
	
		
        function ViewDineroMail($userid)
   	{
       global $db;
	   $sql = " SELECT * FROM ".DINEROMAIL_MASTER
 	   		 ." WHERE user_auth_id = '".$userid."'";
	   	
	   $db->query($sql);
	}
	
		
        function ViewMercadoPago($userid)
   	{
       global $db;
	   $sql = " SELECT * FROM ".MERCADOPAGO_MASTER
 	   		 ." WHERE user_auth_id = '".$userid."'";
	   	
	   $db->query($sql);
	}
	
	
	function ViewNeteller($userid)
   	{
       global $db;
	   $sql = " SELECT * FROM ".NETELLER_MASTER
 	   		 ." WHERE user_auth_id = '".$userid."'";
	   	
	   $db->query($sql);
	}	
	

	function ViewEscrow($userid)
   	{
       global $db;
	   
	   $sql = " SELECT * FROM ".ESCROW_PAYMENT_MASTER
 	   		 ." WHERE from_user_auth_id = '".$userid."'";
	   		
	   $db->query($sql);
	}	
	function Sum_OF_Wallet()
   	{
       global $db;
	   
	   $sql="SELECT SUM(wallet_sum) as Wallet FROM ".MEMBER_MASTER
			." WHERE wallet_sum > 0 " ; 	
	   $db->query($sql);
	   $db->next_record();
	   return $db->f('Wallet');
	}
	function Sum_OF_Earn()
   	{
       global $db;
	   
	   ## $sql="SELECT SUM(earn_by_site) as Earn FROM ".MEMBER_MASTER
	   ##		." WHERE earn_by_site > 0 " ; 	
			
	   $sql="SELECT SUM(earning) as Earn FROM ".SITE_EARNING_DEPOSITE
			." WHERE earning > 0 " ; 		
			
	   $db->query($sql);
	   $db->next_record();
	   return $db->f('Earn');
	}	
	function ViewPostProjcsv()
   	{
       global $db;
	   $sql = " SELECT DISTINCT MM.user_login_id,MM.mem_email FROM ".PROJECT_MASTER." AS PM"
	   		 ." LEFT JOIN ".MEMBER_MASTER." AS MM ON PM.auth_id_of_post_by = MM.user_auth_id"
			 ." ORDER BY MM.user_login_id ASC";
	   $db->query($sql);
	}
	
	function ViewProjInfoAllcsv()
   	{
       global $db;
	   $sql = " SELECT DISTINCT MM.user_login_id,MM.mem_email FROM ".PROJECT_MASTER." AS PM"
	   		 ." LEFT JOIN ".MEMBER_MASTER." AS MM ON PM.auth_id_of_post_by = MM.user_auth_id"
			 ." ORDER BY MM.user_login_id ASC";
	   $db->query($sql);
	}
	
	function ViewPostBidcsv()
   	{
       global $db;
	   $sql = " SELECT DISTINCT MM.user_login_id,MM.mem_email FROM ".BID_MASTER." AS BM"
	   		 ." LEFT JOIN ".MEMBER_MASTER." AS MM ON BM.bid_by_user = MM.user_login_id"
			 ." ORDER BY MM.user_login_id ASC";
	   $db->query($sql);
	}	
	
	function GetSeller($cdrinfoid, $offset=0, $items=20 ) 
	{
		global $db1;

		$sql= " SELECT * FROM ".MEMBER_MASTER." AS MM "
			." LEFT JOIN ".PROFILE_MASTER." AS PM ON MM.user_auth_id = PM.user_auth_id "
			." LEFT JOIN ".COUNTRY_MASTER." AS CM ON MM.mem_country = CM.country_id"
			." WHERE FIND_IN_SET('$cdrinfoid',MM.mem_category) LIMIT $offset, $items";  
		$db1->query($sql);			 
	}
	
    /**
     * getListNumber
     * Devuelve la cantidad de sellers registrados segun los parametros dados
     * PARAMETROS:
     *  $cdrinfoid
     * DEVUELVE:
     *  cantidad de sellers, false en caso de error
     */
    function getListNumber ( $cdrinfoid ) {
		global $db1;

		$sql = " SELECT 
						COUNT(*) AS cnt
				FROM " . 
						MEMBER_MASTER . " AS MM " .
			" LEFT JOIN " . 
						PROFILE_MASTER." AS PM ON MM.user_auth_id = PM.user_auth_id "
			." LEFT JOIN ".
						COUNTRY_MASTER." AS CM ON MM.mem_country = CM.country_id"
			." WHERE 
					FIND_IN_SET('$cdrinfoid',MM.mem_category)"; 
		
		$db1->query($sql);
		$db1->next_record();
      	
      	$result = $db1->f("cnt");

      	return $result;
    }
				
 }  
?>
