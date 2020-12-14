<?
class Payment
{
	function Payment()
	{}
	
	
	function ViewAll($user_id) // VIEW ALL TRANSACTIONS from the master payments gateways tables
	{
		global $db;
		$sql = "
				SELECT 
					COUNT(*) AS cnt
				FROM (
						(
							SELECT 
								pp_id
							FROM 
								" . PAYPAL_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION
						(
							
							SELECT 
								mb_id
							FROM 
								" . MONEYBOOKER_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION 
						(
							SELECT 
								mp_id
							FROM 
								" . MERCADOPAGO_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION 
						(
							SELECT 
								dm_id
							FROM 
								" . DINEROMAIL_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
                                                UNION 
						(
							SELECT 
								nt_id
							FROM 
								" . NETELLER_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)                
					) AS todas" ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
		   $_SESSION['start_record'] = 0;
		}
		
		$sql = "
				SELECT 
					*
				FROM (
						(
							SELECT 
								pp_id, user_auth_id, user_login_id, amount, status, description, trans_type, date
							FROM 
								" . PAYPAL_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION
						(
							
							SELECT 
								mb_id, user_auth_id, user_login_id, amount, status, description, trans_type, date
							FROM 
								" . MONEYBOOKER_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION 
						(
							SELECT 
								mp_id, user_auth_id, user_login_id, IF(trans_type = '-', amount, usdAmount) AS amount, status, description, trans_type, date
							FROM 
								" . MERCADOPAGO_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION 
						(
							SELECT 
								dm_id, user_auth_id, user_login_id, IF(trans_type = '-', amount, usdAmount) AS amount, status, description, trans_type, date
							FROM 
								" . DINEROMAIL_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
                                                UNION 
						(
							SELECT 
								nt_id, user_auth_id, user_login_id, amount, status, description, trans_type, date
							FROM 
								" . NETELLER_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
					) AS todas
				ORDER BY 
					date DESC
				LIMIT ". $_SESSION['start_record']. ", 20";   

		$db->query($sql);
	}
	
//-----  Here start Functions to VIEW THE WITHDRAWS for all the payments gateways ------------
	
	function ViewAllWithdrawDetails_of_Paypal() 
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".WITHDRAW_MASTER." WHERE withdraw_type='Paypal' " ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
		$sql= " SELECT * FROM ".WITHDRAW_MASTER." WHERE withdraw_type='Paypal' ORDER BY ww_id DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}

//-----
	
	function WithdrawDetails_of_Moneybooker()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".WITHDRAW_MASTER." WHERE withdraw_type='Moneybooker' " ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
		$sql=" SELECT * FROM ".WITHDRAW_MASTER." WHERE withdraw_type='Moneybooker' ORDER BY ww_id DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}

//------	
	
	function WithdrawDetails_of_Mercadopago()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".WITHDRAW_MASTER." WHERE withdraw_type='Mercadopago' " ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
		$sql= " SELECT * FROM ".WITHDRAW_MASTER." WHERE withdraw_type='Mercadopago' ORDER BY ww_id DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
  	}

//-----
	
	function WithdrawDetails_of_Dineromail()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".WITHDRAW_MASTER." WHERE withdraw_type='Dineromail' " ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
		$sql= " SELECT * FROM ".WITHDRAW_MASTER." WHERE withdraw_type='Dineromail' ORDER BY ww_id DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
  	}
	
//------

        function WithdrawDetails_of_Neteller()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".WITHDRAW_MASTER." WHERE withdraw_type='Neteller' " ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
		$sql= " SELECT * FROM ".WITHDRAW_MASTER." WHERE withdraw_type='Neteller' ORDER BY ww_id DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
  	}

	
	
//--------	VIEW ALL THE WITHDRAWS for all the payment gateways
	
 	
	function ViewAllwithdarw($user_id) 
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".WITHDRAW_MASTER." WHERE user_auth_id = '".$user_id."' " ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
		$sql= " SELECT * FROM ".WITHDRAW_MASTER."  WHERE user_auth_id = '".$user_id."' ORDER BY ww_id DESC LIMIT ". $_SESSION['start_record']. ", ". 20;
		$db->query($sql); 
	}
	
//---------------- End of functions for viewing withdraws transactions details ----------------------


	
//--------------- Start Functions to INSERT DEPOSITS in all Payment Gateways master tables -------


	function Insert_PP($user_id,$login_id,$amount,$desc,$bruto) // Paypal
	{
		   $trans_type = "+";
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
					." '".$bruto."' "
					." )";
		  return($db->query($sql));	
	}	

	
	function Insert_MB($user_id,$login_id,$amount,$desc,$transaction_id) // MoneyBooker
	{
		   $trans_type = "+";
	       global $db;
		   $sql="INSERT INTO " .MONEYBOOKER_MASTER
					." (user_auth_id,user_login_id,amount,status,description,trans_type,date,transaction_id) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."',"
					." '".$transaction_id."'"
					." )";
		  return($db->query($sql));	
	}

	
	function Insert_MP($user_id,$login_id,$amount,$usdAmount,$desc,$currency_id) // MercadoPago
	{
		   $trans_type = "+";
	       global $db;
		   $sql="INSERT INTO ".MERCADOPAGO_MASTER
					." (user_auth_id,user_login_id,amount,usdAmount,status,description,trans_type,date,currency_id) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." '".$usdAmount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."' ,"
					." '".$currency_id."'"
					." )";
		  return($db->query($sql));	
	}	
		

	function Insert_DM($user_id,$login_id,$amount,$usdAmount,$desc,$currency_id) // DineroMail
	{
		   $trans_type = "+";
	       global $db;
		   $sql="INSERT INTO ".DINEROMAIL_MASTER
					." (user_auth_id,user_login_id,amount,usdAmount,status,description,trans_type,date,currency_id) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." '".$usdAmount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."' ,"
					." '".$currency_id."'"
					." )"; 
		  return($db->query($sql));	
	}	
	
	
	function Insert_NT($user_id,$login_id,$amount,$desc,$transaction_id) // Neteller
    {
		   $trans_type = "+";
	       global $db;
		   $sql="INSERT INTO " .NETELLER_MASTER
					." (user_auth_id,user_login_id,amount,status,description,trans_type,date,transaction_id) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." 1 ,"
					." '".$desc."' ,"
					." '".$trans_type."' ,"
					." '".date('Y-m-d H:i:s')."',"
					." '".$transaction_id."'"
					." )";
		  return($db->query($sql));	
	}

//----------------------- End of functions to insert deposits transactions --------------------------------



//----------------------- Start of functions to insert PENDING deposits for all Payment Gateways -----------


	function Pending_Insert_Paypal($user_id,$login_id,$amount,$desc)  // Paypal
	{
	       global $db;
		   $sql="INSERT INTO ".PAYPAL_PENDING_DEPOSITE
					." (user_auth_id,user_login_id,amount,status,description,pending_date) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." 0 ,"
					." '".$desc."' ,"
					." '".date('Y-m-d')."' "
					." )";
		   return($db->query($sql));	
	}		
	
	
//-----


    function Pending_Insert_Moneybooker($user_id,$login_id,$amount,$desc) // MoneyBooker
	{
	       global $db;
		   $sql="INSERT INTO ".MONEYBOOKER_PENDING_DEPOSITE
					." (user_auth_id,user_login_id,amount,status,description,pending_date) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." 0 ,"
					." '".$desc."' ,"
					." '".date('Y-m-d')."' "
					." )";
		   return($db->query($sql));	
	}
	
	
//-----	
	
	
	function Pending_Insert_MP($user_id,$login_id,$amount,$usdAmount,$desc,$currency_id) // MercadoPago
    {
	       global $db;
		   $sql="INSERT INTO ".MERCADOPAGO_PENDING_DEPOSITE
					." (user_auth_id,user_login_id,amount,usdAmount,status,description,pending_date,currency_id) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." '".$usdAmount."' ,"
					." 0 ,"
					." '".$desc."' ,"
					." '".date('Y-m-d')."' ,"
					." '".$currency_id."'"
					." )";
		   return($db->query($sql));	
	}		

	
//-----	
	
	
	function Pending_Insert_DM($user_id,$login_id,$amount,$usdAmount,$desc,$currency_id) // DineroMail
	{
	       global $db;
		   $sql="INSERT INTO ".DINEROMAIL_PENDING_DEPOSITE
					." (user_auth_id,user_login_id,amount,usdAmount,status,description,pending_date,currency_id) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." '".$usdAmount."' ,"
					." 0 ,"
					." '".$desc."' ,"
					." '".date('Y-m-d')."' ,"
					." '".$currency_id."'"
					." )";
		   return($db->query($sql));	
	}		

	
//-----


    function Pending_Insert_NT($user_id,$login_id,$amount,$desc) // Neteller
	{
	       global $db;
		   $sql="INSERT INTO ".NETELLER_PENDING_DEPOSITE
					." (user_auth_id,user_login_id,amount,status,description,pending_date) "
					." VALUES ('".$user_id."' ,"
					." '".$login_id."' ,"
					." '".$amount."' ,"
					." 0 ,"
					." '".$desc."' ,"
					." '".date('Y-m-d')."' "
					." )";
		   return($db->query($sql));	
	}

// ----------- End of functions for inserting pending deposits --------------------------------------------------



// ------------------ SHOW ALL THE TRANSACTIONS for all the payments methods ------------------------------------

	function Viewtrans($user_id) 
	{
		global $db;
		$sql = "
				SELECT 
					COUNT(*) AS cnt
				FROM (
						(
							SELECT 
								pp_id
							FROM 
								" . PAYPAL_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION
						(
							
							SELECT 
								mb_id
							FROM 
								" . MONEYBOOKER_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION 
						(
							SELECT 
								mp_id
							FROM 
								" . MERCADOPAGO_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION 
						(
							SELECT 
								dm_id
							FROM 
								" . DINEROMAIL_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
                                                UNION 
						(
							SELECT 
								nt_id
							FROM 
								" . NETELLER_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
					) AS todas" ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();
         
		# Reset the start record if required
		if($_SESSION['user_page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
				$sql = "
				SELECT 
					*
				FROM (
						(
							SELECT 
								pp_id, user_auth_id, user_login_id, amount, status, description, trans_type, date
							FROM 
								" . PAYPAL_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION
						(
							
							SELECT 
								mb_id, user_auth_id, user_login_id, amount, status, description, trans_type, date
							FROM 
								" . MONEYBOOKER_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION 
						(
							SELECT 
								mp_id, user_auth_id, user_login_id, IF(trans_type = '-', amount, usdAmount) AS amount, status, description, trans_type, date
							FROM 
								" . MERCADOPAGO_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION 
						(
							SELECT 
								dm_id, user_auth_id, user_login_id, IF(trans_type = '-', amount, usdAmount) AS amount, status, description, trans_type, date
							FROM 
								" . DINEROMAIL_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
                                                UNION 
						(
							SELECT 
								nt_id, user_auth_id, user_login_id, amount, status, description, trans_type, date
							FROM 
								" . NETELLER_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
					) AS todas
				ORDER BY 
					date DESC
				LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
				
		$db->query($sql);
	}

	
//---------------- INSERT WITHDRAWS in the withdraw_master table ----------------------


	function InsertWithdraw($user_id,$user_name1,$req_date,$amount,$method,$details,$etimate_date,$rec_amount,$email_to)
	{
		   $trans_type1 = "-";
		   global $db;
		   $sql="INSERT INTO ".WITHDRAW_MASTER
					." (user_auth_id,user_name,requested_date,estimate_date,amount,details,status,withdraw_type,trans_type,amount_rec,email_to) "
					." VALUES ('".$user_id."' ,"
					." '".$user_name1."' ,"
					." '".$req_date."' ,"
					." '".$etimate_date."' ,"
					." '".$amount."' ,"
					." '".$details."' ,"
					." 0 ,"
					." '".$method."' ,"
					." '".$trans_type1."' ,"
					." '".$rec_amount."' ,"
					." '".$email_to."'"
					." )";
		    return($db->query($sql));	
	}


//---------------- DELETE a WITHDRAW based on a withdraw id -------------------------

	function Delete($withdraw_id)
	{
		global $db;
		$sql="DELETE FROM ".WITHDRAW_MASTER." WHERE ww_id=".$withdraw_id;
		return($db->query($sql));
	}
//-----------------------------------------------------------------------------------
	
	
	
// -------------- SELECT a WITHDRAW based on a withdraw id --------------------------
   function GetWithdraw($withdraw_id)
   {
       global $db;
	   $sql= " SELECT * FROM ".WITHDRAW_MASTER." WHERE ww_id = '".$withdraw_id." '"; 
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
   }	
//-----------------------------------------------------------------------------------	
	
	
	
//---------------- UPDATE A WITHDRAW based on a withdraw id -------------------------	
	function UpdateWithdraw($post)
	{
		global $db;
		$sql="UPDATE ".WITHDRAW_MASTER
			." SET "
			." status				 ='".$post['with_status']."' ,"
			." payment_released_date ='".date('Y-m-d')."' "
			." WHERE ww_id	=".$post['ww_id'];
		return($db->query($sql));
	}
//-----------------------------------------------------------------------------------------------
	
	
	
//---- Starting of functions to INSERT WITHDRAWS TRANSACTIONS on each payment gateway table	-----


	function InsertWIthdrawInPaypal($post)
	{
		   global $db;
		   $sql="INSERT INTO ".PAYPAL_MASTER
					." (user_auth_id,user_login_id,amount,status,description,trans_type,date ) "
					." VALUES ('".$post['user_auth_id']."' ,"
					." '".$post['user_name']."' ,"
					." '".$post['amount']."' ,"
					." 1 ,"
					." '".$post['details']."' ,"
					." '".$post['trans_type']."' ,"
					." '".$post['requested_date']."' "
					." )";
	      return($db->query($sql));	
	}


	function InsertWIthdrawInMoneybooker($post)
    {
		   global $db;
		   $sql="INSERT INTO ".MONEYBOOKER_MASTER
					." (user_auth_id,user_login_id,amount,status,description,trans_type,date ) "
					." VALUES ('".$post['user_auth_id']."' ,"
					." '".$post['user_name']."' ,"
					." '".$post['amount']."' ,"
					." 1 ,"
					." '".$post['details']."' ,"
					." '".$post['trans_type']."' ,"
					." '".$post['requested_date']."' "
					." )";
	      return($db->query($sql));	
	}

		
    function InsertWIthdrawInMercadopago($post)
    {
		   global $db;
		   $sql="INSERT INTO ".MERCADOPAGO_MASTER
					." (user_auth_id,user_login_id,amount,usdAmount,status,description,trans_type,date ) "
					." VALUES ('".$post['user_auth_id']."' ,"
					." '".$post['user_name']."' ,"
					." '".$post['amount']."' ,"
					." 1 ,"
					." '".$post['details']."' ,"
					." '".$post['trans_type']."' ,"
					." '".$post['requested_date']."' "
					." )";
	      return($db->query($sql));	
	}

	  
    function InsertWIthdrawInDineromail($post)
    {
		   global $db;
		   $sql="INSERT INTO ".DINEROMAIL_MASTER
					." (user_auth_id,user_login_id,amount,usdAmount,status,description,trans_type,date ) "
					." VALUES ('".$post['user_auth_id']."' ,"
					." '".$post['user_name']."' ,"
					." '".$post['amount']."' ,"
					." 1 ,"
					." '".$post['details']."' ,"
					." '".$post['trans_type']."' ,"
					." '".$post['requested_date']."' "
					." )";
	      return($db->query($sql));	
	}

	
    function InsertWIthdrawInNeteller($post)
    {
		   global $db;
		   $sql="INSERT INTO ".NETELLER_MASTER
					." (user_auth_id,user_login_id,amount,status,description,trans_type,date ) "
					." VALUES ('".$post['user_auth_id']."' ,"
					." '".$post['user_name']."' ,"
					." '".$post['amount']."' ,"
					." 1 ,"
					." '".$post['details']."' ,"
					." '".$post['trans_type']."' ,"
					." '".$post['requested_date']."' "
					." )";
	      return($db->query($sql));	
    }
 	
// --------- End of insert withdraw functions ---------------------------------------------------



// ---- Insert earning deposits in the master table site_earning_deposite -----------------------
	
	function Insert_Earning_depost($user_auth_id,$user_login_id,$deposited_money,$paid_money,$earning,$payment_gateway)
    {
           global $db;
		   $sql="INSERT INTO ".SITE_EARNING_DEPOSITE
					." (user_auth_id,user_login_id,deposited_money,paid_money,earning,payment_gateway,deposited_date) "
					." VALUES ('".$user_auth_id."' ,"
					." '".$user_login_id."' ,"
					." '".$deposited_money."' ,"
					." '".$paid_money."' ,"
					." '".$earning."' ,"
					." '".$payment_gateway."' ,"
					." '".date('Y-m-d H:i:s')."' "
					." )";
			return($db->query($sql));	
	}	
//------------------------------------------------------------------------------------------------
	

// ----- Start of functions to show all the pending deposits for each payment gateway ------------


// PAYPAL ----------------------------------------------------------------------------------

	function ViewPendingRequestsPaypal()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".PAYPAL_PENDING_DEPOSITE ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}

		$sql= " SELECT * FROM ".PAYPAL_PENDING_DEPOSITE." ORDER BY status ASC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}	
	
	
	function GetPendingPaypal($withdraw_id)
	{
		   global $db;
		   $sql= " SELECT * FROM ".PAYPAL_PENDING_DEPOSITE." WHERE pk_id = '".$withdraw_id." '";
		   $db->query($sql);
		   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}
    	
	
	function UpdatePendingPaypal($post)
	{
		global $db;
		$sql="UPDATE ".PAYPAL_PENDING_DEPOSITE
			." SET "
			." status				 ='".$post['with_status']."' "
			." WHERE pk_id		     =".$post['pk_id'];
		return($db->query($sql));
	}
		
		
// MONEYBOOKER--------------------------------------------------------------------------------
		
		
	function ViewPendingRequestsMB()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".MONEYBOOKER_PENDING_DEPOSITE ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}

		$sql= " SELECT * FROM ".MONEYBOOKER_PENDING_DEPOSITE." ORDER BY status ASC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}	
	
	
	function GetPendingMoneyBooker($withdraw_id)
	{
		   global $db;
		   $sql= " SELECT * FROM ".MONEYBOOKER_PENDING_DEPOSITE." WHERE pk_id = '".$withdraw_id." '";
		   $db->query($sql);
		   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}
    	
	
	function UpdatePendingMoneyBooker($post)
	{
		global $db;
		$sql="UPDATE ".MONEYBOOKER_PENDING_DEPOSITE
			." SET "
			." status				 ='".$post['with_status']."' "
			." WHERE pk_id		     =".$post['pk_id'];
		return($db->query($sql));		
	}	

	
// MERCADOPAGO--------------------------------------------------------------------------------		
		
		
	function ViewPendingRequestsMP()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".MERCADOPAGO_PENDING_DEPOSITE ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}

		$sql= " SELECT * FROM ".MERCADOPAGO_PENDING_DEPOSITE." ORDER BY status ASC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}	
	
	
	function GetPendingMP($withdraw_id)
	{
		   global $db;
		   $sql= " SELECT * FROM ".MERCADOPAGO_PENDING_DEPOSITE." WHERE pk_id = '".$withdraw_id." '";
		   $db->query($sql);
		   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}
    	
	
	function UpdatePendingMP($post)
	{
		global $db;
		$sql="UPDATE ".MERCADOPAGO_PENDING_DEPOSITE
			." SET "
			." status				 ='".$post['with_status']."' "
			." WHERE pk_id		     =".$post['pk_id'];
		return($db->query($sql));
	}
			
		
		
// DINEROMAIL --------------------------------------------------------------------------------				
		
		
	function ViewPendingRequestsDineroMail()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".DINEROMAIL_PENDING_DEPOSITE ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}

		$sql= " SELECT * FROM ".DINEROMAIL_PENDING_DEPOSITE." ORDER BY status ASC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}	
	
	
	function GetPendingDineroMail($withdraw_id)
	{
		   global $db;
		   $sql= " SELECT * FROM ".DINEROMAIL_PENDING_DEPOSITE." WHERE pk_id = '".$withdraw_id." '";
		   $db->query($sql);
		   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}
    	
	
	function UpdatePendingDineroMail($post)
	{
		global $db;
		$sql="UPDATE ".DINEROMAIL_PENDING_DEPOSITE
			." SET "
			." status				 ='".$post['with_status']."' "
			." WHERE pk_id		     =".$post['pk_id'];
		return($db->query($sql));
	}

	
		
// NETELLER -------------------------------------------------------------------------------------------


	function ViewPendingRequestsNeteller()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".NETELLER_PENDING_DEPOSITE ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}

		$sql= " SELECT * FROM ".NETELLER_PENDING_DEPOSITE." ORDER BY status ASC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}	
	
	
	function GetPendingNeteller($withdraw_id)
	{
		   global $db;
		   $sql= " SELECT * FROM ".NETELLER_PENDING_DEPOSITE." WHERE pk_id = '".$withdraw_id." '";
		   $db->query($sql);
		   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}
    	
	
	function UpdatePendingNeteller($post)
	{
		global $db;
		$sql="UPDATE ".NETELLER_PENDING_DEPOSITE
			." SET "
			." status				 ='".$post['with_status']."' "
			." WHERE pk_id		     =".$post['pk_id'];
		return($db->query($sql));
	}
		
				
// ---------------- End of Functions for pending deposite managements ------------------------------------
//



// This function need to be analyzed... why just for moneybooker..?? why just here??
		
	function getMB($transaction_id)
    {
       global $db;
	   $sql= " SELECT * FROM " . MONEYBOOKER_MASTER . " WHERE transaction_id = '".$transaction_id."'";
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}	
	

// Funciones que graban y retornan el ultimo nro de factura mas 1 (secuencial) RFG 23-10-2017

	function Graba_Comprobante($user_login_id,$neto_pagado,$fecha_factura)
	{
		global $db;
	    $sql="INSERT INTO ".INVOICE_NUMBERS." (User_login_id,NetoPagado,FechaFactura) "
					." VALUES ('".$user_login_id."' ,"
					." '".$NetoPagado."' ,"
					." '".$FechaFactura."'"
					." )";
	    return($db->query($sql));
	}
	
	
	function Sig_Comprobante()
	{
		global $db;
	    $sql="SELECT Numero FROM ".INVOICE_NUMBERS.";";
	    return($db->query($sql));
    }
	
}	
?>
