<?php
class Escrow
{
	function Escrow()
	{}
	
	
// View all ESCROW transactions for a specific user_id

	function ViewAll($user_id)  // View all ESCROW transactions for a specific user_id
	{
	  global $db;
      $sql = " SELECT * FROM ".ESCROW_PAYMENT_MASTER
	          ." WHERE from_user_login_id = '".$user_id."' OR to_user_login_id = '".$user_id."'";
	  $db->query($sql);
	}
	
	
	
// INSERT a ESCROWS transactions into the ESCROW_PAYMENT_MASTER table
	
	function Insert($from_user_auth_id,$from_user_login_id,$to_user_auth_id,$to_user_login_id,$amount,$project_id,$pay_type)
	{
	   	global $db;
		$sql="INSERT INTO ".ESCROW_PAYMENT_MASTER
			." (project_id,from_user_auth_id,from_user_login_id,to_user_auth_id,to_user_login_id,amount,status,payment_type,date) "
			." VALUES ("
			." '".$project_id."' ,"
			." '".$from_user_auth_id."' ,"
			." '".$from_user_login_id."' ,"
			." '".$to_user_auth_id."' ,"
			." '".$to_user_login_id."' ,"
			." '".$amount."', "
			." '1', "
			." '".$pay_type."', "
			." '".date('m/d/y \a\t H:i T')."' "
			." )";
		return($db->query($sql));	
	}
	
	
	

// show all ALREADY RELIEVED ESCROW payments for an specific user_id 
	
	function Escrow_Out($user_id)
	{
		global $db;
		$sql="SELECT * FROM ".ESCROW_PAYMENT_MASTER
			." WHERE from_user_login_id = '".$user_id."' AND status = 0";
		$db->query($sql);
		return($db->fetch_object());
	}

	
	
// show all PENDING ESCROW payments for an specific user_id 
	
	function Escrow_In($user_id)
	{
		global $db;
		$sql="SELECT * FROM ".ESCROW_PAYMENT_MASTER
			." WHERE to_user_login_id = '".$user_id."' AND status = 1";
		$db->query($sql);
		return($db->fetch_object());
	}
	
	
	
// Status definition for project_master table --------------------------------------------------
// project_master.status=
// 1= Project Open
// 2= Project Freezed
// 3= Project Closed for Bidding
// 4= Project Cancelled
// 5= Project Half-Closed (has one more week to assign a provider)
// 6= Project Complete_Project
// 7= Project Closed	
// ---------------------------------------------------------------------------------------------




// Show all data from project_master where project status=3 (freezed):
	
	function Select_User()
	{
		global $db;
		$sql="SELECT * FROM ".PROJECT_MASTER
			." WHERE project_status = '3' ";
		$db->query($sql);
	}
	
	

	
// Show data from project_master posted by an specific user where project status=3 (freezed):
	
	function Project_Listing($post_by_id)
	{
	  	 global $db;
		 $sql = "SELECT * FROM ".PROJECT_MASTER
		        ." WHERE auth_id_of_post_by = '".$post_by_id."' AND project_status = 3"
				." ORDER BY project_posted_date DESC ";
			$db->query($sql);
	}
	

	
	
// Shows all the data for freezed project and not in escrow payment 
	
	function Project_Listing_for_full($post_by_id)
	{
		global $db;
		$j = '';
	
		$sql=" SELECT * FROM ".ESCROW_PAYMENT_MASTER
			 ." WHERE from_user_auth_id = '".$post_by_id."'";			 
		$db->query($sql);
		while($db->next_record())
		{
			$j = $j.$db->f('project_id').",";
		}
		
		$new_string = substr($j,0,-1);
		
		$sql = "SELECT * FROM ".PROJECT_MASTER
		        ." WHERE auth_id_of_post_by = '".$post_by_id."' AND project_status = 3"
				."".($new_string != '' ? " AND project_id NOT IN (".$new_string.")":"")
				." ORDER BY project_posted_date DESC ";
		$db->query($sql);
	}




// Show data for an specific user that has freezed projects having partial payments on it 
	
	function Project_Listing_for_Partial($post_by_id)
	{
		global $db;
		$j = '';
		$sql=" SELECT * FROM ".ESCROW_PAYMENT_MASTER
			 ." WHERE from_user_auth_id = '".$post_by_id."' AND payment_type != 2 ";
		$db->query($sql);
		
		while($db->next_record())
		{
			$j = $j.$db->f('project_id').",";
		}
		
		$new_string = substr($j,0,-1);
		
		$sql = "SELECT * FROM ".PROJECT_MASTER
		        ." WHERE auth_id_of_post_by = '".$post_by_id."' AND project_status = 3"
				."".($new_string != '' ? " AND project_id NOT IN (".$new_string.")":"")
				." ORDER BY project_posted_date DESC ";
		$db->query($sql);
	}

	


// Shows project data for an specific project_id

	function SellerName($project_id)
	{
	  	 global $db;
		 $sql = "SELECT * FROM ".PROJECT_MASTER
		        ." WHERE project_id = '".$project_id."' ";
         $db->query($sql);
		 $db->next_record();
		 return($db->f('project_post_to'));
	}
	

	
	
//	Shows bid amount for an specific project_id 

	function Amount($project_id)
	{
	  	 global $db;
		 $sql = "SELECT * FROM ".PROJECT_MASTER." AS PM "
		        ." LEFT JOIN ".BID_MASTER." AS BM ON PM.project_id = BM.project_id" 
		        ." WHERE PM.project_id = '".$project_id."' AND (PM.project_post_to = BM.bid_by_user) ";
		 $db->query($sql);
		 $db->next_record();
		 return($db->f('bid_amount'));
	}
	

	
	
// Starting of functions for Insert BUYER ESCROW TRANSACTIONS to the corresponding payment gateways tables --


// PAYPAL --------------------------------------------------------------------------------------------------- 	

	function Insert_Escrow_Form_buyer_Paypal($user_id,$login_id,$amount,$seller,$project_title)
	{
		   $trans_type = "-";
		   $desc = "Escrow Payment to ".$seller." For <strong>".$project_title."</strong> Project";
	       global $db;
		   $sql="INSERT INTO ".PAYPAL_MASTER
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
	}	
		
		
		
// MONEYBOOKER------------------------------------------------------------------------------------------ 		
		
	function Insert_Escrow_Form_buyer_MoneyBooker($user_id,$login_id,$amount,$seller,$project_title)
	{
		   $trans_type = "-";
		   $desc = "Escrow Payment to ".$seller." For <strong>".$project_title."</strong> Project";
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
	}		
		
	

// MERCADOPAGO------------------------------------------------------------------------------------------ 		
		
	function Insert_Escrow_Form_buyer_MercadoPago($user_id,$login_id,$amount,$usdAmount,$seller,$project_title)
	{
		   $trans_type = "-";
		   $desc = "Escrow Payment to ".$seller." For <strong>".$project_title."</strong> Project";
	       global $db;
		   $sql="INSERT INTO ".MERCADOPAGO_MASTER
					." (user_auth_id,user_login_id,amount,usdAmount,status,description,trans_type,date ) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." '".$usdAmount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."' "
					." )";
		   $db->query($sql);	
	}			
		
		
		
// DINEROMAIL------------------------------------------------------------------------------------------ 		
		
	function Insert_Escrow_Form_buyer_DineroMail($user_id,$login_id,$amount,$usdAmount,$seller,$project_title)
	{
		   $trans_type = "-";
		   $desc = "Escrow Payment to ".$seller." For <strong>".$project_title."</strong> Project";
	       global $db;
		   $sql="INSERT INTO ".DINEROMAIL_MASTER
					." (user_auth_id,user_login_id,amount,usdAmount,status,description,trans_type,date ) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." '".$usdAmount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."' "
					." )";
		   $db->query($sql);	
	}			
				
		
		
// NETELLER------------------------------------------------------------------------------------------ 		
		
	function Insert_Escrow_Form_buyer_Neteller($user_id,$login_id,$amount,$seller,$project_title)
	{
		   $trans_type = "-";
		   $desc = "Escrow Payment to ".$seller." For <strong>".$project_title."</strong> Project";
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
	}			
				
		
//------------------------------- End of Functions for insert Escrows for Buyers -------------------------


		
		
//------Starting for functions for insert escrow deposits for Sellers on each payment gateway tables ------
	

	
// PAYPAL -------------------------------------------------------------------------------------------------
	
	function Insert_Escrow_Form_Seller_Paypal($user_id,$login_id,$amount,$buyer,$project_title)
	{
		   $trans_type = "+";
		   $desc = "Escrow Payment from ".$buyer." For <strong>".$project_title."</strong> Project";
	       global $db;
		   $sql="INSERT INTO ".PAYPAL_MASTER
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
	}	



// MONEYBOOKER ----------------------------------------------------------------------------------------------
	
	function Insert_Escrow_Form_Seller_MoneyBooker($user_id,$login_id,$amount,$buyer,$project_title)
	{
		   $trans_type = "+";
		   $desc = "Escrow Payment from ".$buyer." For <strong>".$project_title."</strong> Project";
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
	}	
	

	
// MERCADOPAGO--------------------------------------------------------------------------------------------
	
	function Insert_Escrow_Form_Seller_MercadoPago($user_id,$login_id,$amount,$usdAmount,$buyer,$project_title)
	{
		   $trans_type = "+";
		   $desc = "Escrow Payment from ".$buyer." For <strong>".$project_title."</strong> Project";
	       global $db;
		   $sql="INSERT INTO ".MERCADOPAGO_MASTER
					." (user_auth_id,user_login_id,amount,usdAmount,status,description,trans_type,date ) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." '".$usdAmount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."' "
					." )";
		   $db->query($sql);	
	}	

	
	
// DINEROMAIL --------------------------------------------------------------------------------------------
	
	function Insert_Escrow_Form_Seller_DineroMail($user_id,$login_id,$amount,$usdAmount,$buyer,$project_title)
	{
		   $trans_type = "+";
		   $desc = "Escrow Payment from ".$buyer." For <strong>".$project_title."</strong> Project";
	       global $db;
		   $sql="INSERT INTO ".DINEROMAIL_MASTER
					." (user_auth_id,user_login_id,amount,usdAmount,status,description,trans_type,date ) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." '".$usdAmount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."' "
					." )";
		   $db->query($sql);	
	}
	

	
// NETELLER------------------------------------------------------------------------------------------

	
	function Insert_Escrow_Form_Seller_Neteller($user_id,$login_id,$amount,$buyer,$project_title)
	{
		   $trans_type = "+";
		   $desc = "Escrow Payment from ".$buyer." For <strong>".$project_title."</strong> Project";
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
	}

// ---------------------------- End of functions to insert the escrow deposit for Sellers	
		
	

// Shows data for escrow payment for an specific project id and escrow payment id ------
	
	function Get_Details($id)
	{
		global $db;
		$sql = "SELECT * FROM ".ESCROW_PAYMENT_MASTER." AS EPM "
			   ." LEFT JOIN ".PROJECT_MASTER." AS PM on EPM.project_id = PM.project_id"
			   ." WHERE EPM.ep_id='".$id."' ";
		$db->query($sql);
		return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}
	

	
// Return 0 if an specific  project id has escrow payments, return 1 otherwise	

	function Get_Amount_Details($id)
	{
		global $db;
	    $sql =  "SELECT * FROM ". ESCROW_PAYMENT_MASTER
            . 	" WHERE project_id='". $id. "' ";
		$db->query($sql);

	    if($db->num_rows() > 0)
	    {
			return 0;
	    }
	    return 1;
	}
	
	
	
// Return the SUM of ESCROW AMOUNT for an specific project_id
	
	function Get_ESC_Amount_Details($id)
	{
		global $db;
	    $sql =  "SELECT SUM(amount) AS escrow_amount FROM ". ESCROW_PAYMENT_MASTER
            . 	" WHERE project_id  = '". $id. "' ";
		$db->query($sql);
		$db->next_record();
		return($db->f('escrow_amount'));
	}
	

	
// Delete an escrow payment for an specific escrow_id
	
	function Delete($id)
	{
		global $db;
		$sql=" DELETE FROM ".ESCROW_PAYMENT_MASTER
			." WHERE ep_id  = '".$id."' ";
		$db->query($sql);
	}
	
	

// Update an status escrow payment for an specific escrow id with status of 0 (RELIEVED) 	

	function Update($id)
	{
	    global $db;
		$sql= " UPDATE ".ESCROW_PAYMENT_MASTER
				." SET "
				." status   =   ' 0 ' "
				." WHERE ep_id = '".$id." '";
		$db->query($sql);
	}


	
// Set the project status to 6 (Completed) for an specific project_id
	
	function Complete_Project($project_id)
	{
	    global $db;
		$sql= " UPDATE ".PROJECT_MASTER
				." SET "
				." project_status   =   '6' "
				." WHERE project_id  = '".$project_id." '";
		$db->query($sql);
	}

	
	
// return the escrow amount for an specific project_id
	
	function Reamining_Amount($project_id)
	{
		global $db;
	    $sql =  "SELECT * FROM ". ESCROW_PAYMENT_MASTER." AS EPM "
			.	" LEFT JOIN ".PROJECT_MASTER." AS PM on EPM.project_id = PM.project_id"
			.	" LEFT JOIN ".BID_MASTER." AS BM on PM.project_id = BM.project_id"
            . 	" WHERE EPM.project_id  = '". $project_id. "' ";
		$db->query($sql);
		$db->next_record();
		return($db->f('escrow_amount'));
	}

	
	
// return the data for escrow payments for an specific project id with escrow already relieved (EMP.status=0)
		
	function Listing_Payment()
	{
		global $db;
	   $sql = " SELECT count(*) as cnt FROM ".ESCROW_PAYMENT_MASTER." AS EPM, "
	          .PROJECT_MASTER." AS PM where EPM.project_id = PM.project_id and EPM.status = 0";

		$db->query($sql);
		$db->next_record();
	
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();
		
		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
		
		$sql =  "SELECT * FROM ". ESCROW_PAYMENT_MASTER." AS EPM ,"
			.	PROJECT_MASTER." AS PM  "
			.   " WHERE EPM.project_id = PM.project_id  and EPM.status = 0 ORDER BY EPM.ep_id DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		
		$db->query($sql);
	}

	
	
// Return total amount relieved from escrow for an specific project id with status = 0 (relieved)	
		
	function Listing_Payment_Amount()
	{
	   global $db;
	   $sql = " SELECT sum(EPM.amount) as total FROM ".ESCROW_PAYMENT_MASTER." AS EPM ,"
	          .PROJECT_MASTER." AS PM where EPM.project_id = PM.project_id and EPM.status = 0";
	   $db->query($sql);
	   $db->next_record();		
	   return $db->f('total');  
	}

	

// Return data from escrow payments for project id with status=1 (PENDING TO RELIEVE)

	function Listing_Pending_Escrow_Payment()
	{
		global $db;
	   $sql = " SELECT count(*) as cnt FROM ".ESCROW_PAYMENT_MASTER." AS EPM "
	          ." LEFT JOIN ".PROJECT_MASTER." AS PM ON EPM.project_id = PM.project_id WHERE EPM.status = 1";

		$db->query($sql);
		$db->next_record();
	
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();
		
		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
		
		$sql =  "SELECT * FROM ". ESCROW_PAYMENT_MASTER." AS EPM "
			.	" LEFT JOIN ".PROJECT_MASTER." AS PM on EPM.project_id = PM.project_id "
			.   " WHERE EPM.status = 1 LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		
		$db->query($sql);
	}
	
	

// Return the total amount for escrow payments for a project with status = 1 (PENDING TO RELIEVE)	

	function Listing_Pending_Escrow_Amount()
	{
	   global $db;
	   $sql = " SELECT sum(EPM.amount) as total FROM ".ESCROW_PAYMENT_MASTER." AS EPM "
	          ." LEFT JOIN ".PROJECT_MASTER." AS PM ON EPM.project_id = PM.project_id WHERE EPM.status = 1";
	   $db->query($sql);
	   $db->next_record();		
	   return $db->f('total');  
	}
}
?>