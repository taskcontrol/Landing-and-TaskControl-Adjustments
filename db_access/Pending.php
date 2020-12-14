<?
class Pending
{
	function Pending()
	{}


	
// Paypal
	
	function All_paypal_Pending()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".PAYPAL_PENDING_DEPOSITE." WHERE status='0' " ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
		$sql= " SELECT * FROM ".PAYPAL_PENDING_DEPOSITE." WHERE status='0' ORDER BY pk_id DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}
	
    function GetPending_Request($pending_id)
    {
       global $db;
	   $sql= " SELECT * FROM ".PAYPAL_PENDING_DEPOSITE." WHERE pk_id = '".$pending_id." '";
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
     }

	function Delete($pending_id)
	{
		global $db;
		
		$sql="DELETE FROM ".PAYPAL_PENDING_DEPOSITE
			." WHERE pk_id=".$pending_id;
		return($db->query($sql));
	}


	function InsertPendingInPaypal($post,$desc)
	{
		$trans_type = "-";
		global $db;
		$sql="INSERT INTO ".PAYPAL_MASTER
				." (user_auth_id,user_login_id,amount,status,description,trans_type,date ) "
				." VALUES ('".$post['user_auth_id']."' ,"
				." '".$post['user_name']."' ,"
				." '".$post['amount']."' ,"
				." 1 ,"
				." '".addslashes($desc)."' ,"
				." '".$trans_type."' ,"
				." '".date('Y-m-d H:i:s')."' "
				." )";
		return($db->query($sql));	
	}


	function InsertInPaypalPending($post,$desc)
	{
		$trans_type = "-";
		global $db;
		$sql="INSERT INTO ".PAYPAL_PENDING_DEPOSITE
				." (pk_id,user_auth_id,user_login_id,amount,status,description,pending_date ) "
				." VALUES ('".$post['user_auth_id']."' ,"
				." '".$post['user_name']."' ,"
				." '".$post['amount']."' ,"
				." 1 ,"
				." '".addslashes($desc)."' ,"
				." '".$trans_type."' ,"
				." '".date('Y-m-d H:i:s')."' "
				." )";
		return($db->query($sql));	
	}






// MoneyBooker

        function InsertPendingInMoneybooker($post,$desc)
	{
		$trans_type = "+";
		global $db;
		$sql="INSERT INTO ".MONEYBOOKER_MASTER
				." (user_auth_id,user_login_id,amount,status,description,trans_type,date ) "
				." VALUES ('".$post['user_auth_id']."' ,"
				." '".$post['user_name']."' ,"
				." '".$post['amount']."' ,"
				." 1 ,"
				." '".addslashes($desc)."' ,"
				." '".$trans_type."' ,"
				." '".date('Y-m-d H:i:s')."' "
				." )";
		return($db->query($sql));	
	}

	function All_moneybooker_Pending()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".MONEYBOOKER_PENDING_DEPOSITE." WHERE status='0' " ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
		$sql= " SELECT * FROM ".MONEYBOOKER_PENDING_DEPOSITE." WHERE status='0' ORDER BY mpd_id DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}

       function GetPending_Request_Money($pending_id)
       {
       global $db;
	   $sql= " SELECT * FROM ".MONEYBOOKER_PENDING_DEPOSITE." WHERE mpd_id = '".$pending_id." '";
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
        }

        function Delete_Moneybooker($pending_id)
        {
  	  global $db;
	  $sql="DELETE FROM ".MONEYBOOKER_PENDING_DEPOSITE ." WHERE mpd_id=".$pending_id;
	  return($db->query($sql));
         }


	
########### Desde aqui comienzan las funciones de Mercadopago (copias de las de arriba pero ligeramente modificadas)

       function All_mercadopago_Pending()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".MERCADOPAGO_PENDING_DEPOSITE." WHERE status='0' " ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}
		$sql= " SELECT * FROM ".MERCADOPAGO_PENDING_DEPOSITE." WHERE status='0' ORDER BY pk_id DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}

       function GetPending_Request_MercadoPago($pending_id)
       {
	   global $db;
	   $sql= " SELECT * FROM ".MERCADOPAGO_PENDING_DEPOSITE." WHERE pk_id = '".$pending_id." '";
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
       }
	
       function Delete_MercadoPago($pending_id)
       {
			global $db;
			$sql="DELETE FROM ".MERCADOPAGO_PENDING_DEPOSITE ." WHERE pk_id=".$pending_id;
			return($db->query($sql));
       }
	
       function InsertPendingInMercadoPago($post,$desc)
       {
		$trans_type = "+";
		global $db;
		$sql="INSERT INTO ".MERCADOPAGO_MASTER
				." (user_auth_id,user_login_id,amount,usdAmount,currency_id,status,description,trans_type,date ) "
				." VALUES ('".$post['user_auth_id']."' ,"
				." '".$post['user_name']."' ,"
				." '".$post['amount']."' ,"
				." '".$post['usdAmount']."' ,"
				." '".$post['currency_id']."' ,"
				." 1 ,"
				." '".addslashes($desc)."' ,"
				." '".$trans_type."' ,"
				." '".date('Y-m-d H:i:s')."' "
				." )";
		return($db->query($sql));	
      }
	  

	  
########### Desde aqui comienzan las funciones de DineroMail (copias de las de arriba pero ligeramente modificadas)

       function All_dineromail_Pending()
	{
            global $db;
            $sql="SELECT count(*) as cnt FROM ".DINEROMAIL_PENDING_DEPOSITE." WHERE status='0' " ;
    
            $db->query($sql);
            $db->next_record();
            $_SESSION['total_record'] = $db->f("cnt") ;
            $db->free();
    
            # Reset the start record if required
            if($_SESSION['page_size'] >= $_SESSION['total_record'])
            {
                $_SESSION['start_record'] = 0;
            }
            $sql= " SELECT * FROM ".DINEROMAIL_PENDING_DEPOSITE." WHERE status='0' ORDER BY pk_id DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
            $db->query($sql);
	}

       function GetPending_Request_DineroMail($pending_id)
       {
           global $db;
           $sql= " SELECT * FROM ".DINEROMAIL_PENDING_DEPOSITE." WHERE pk_id = '".$pending_id." '";
           $db->query($sql);
           return ($db->fetch_object(MYSQL_FETCH_SINGLE));
       }
	
       function Delete_DineroMail($pending_id)
       {
			global $db;
			$sql="DELETE FROM ".DINEROMAIL_PENDING_DEPOSITE ." WHERE pk_id=".$pending_id;
			return($db->query($sql));
       }
	
       function InsertPendingInDineroMail($post,$desc)
       {
            $trans_type = "+";
            global $db;
            $sql="INSERT INTO ".DINEROMAIL_MASTER
                    ." (user_auth_id,user_login_id,amount,usdAmount,currency_id,status,description,trans_type,date ) "
                    ." VALUES ('".$post['user_auth_id']."' ,"
                    ." '".$post['user_name']."' ,"
                    ." '".$post['amount']."' ,"
                    ." '".$post['usdAmount']."' ,"
                    ." '".$post['currency_id']."' ,"
                    ." 1 ,"
                    ." '".addslashes($desc)."' ,"
                    ." '".$trans_type."' ,"
                    ." '".date('Y-m-d H:i:s')."' "
                    ." )";
            return($db->query($sql));	
      }
      
      

      
########### Desde aqui comienzan las funciones de Neteller (copias de las de arriba pero ligeramente modificadas)

       function All_neteller_Pending()
	{
            global $db;
            $sql="SELECT count(*) as cnt FROM ".NETELLER_PENDING_DEPOSITE." WHERE status='0' " ;
    
            $db->query($sql);
            $db->next_record();
            $_SESSION['total_record'] = $db->f("cnt") ;
            $db->free();
    
            # Reset the start record if required
            if($_SESSION['page_size'] >= $_SESSION['total_record'])
            {
                $_SESSION['start_record'] = 0;
            }
            $sql= " SELECT * FROM ".NETELLER_PENDING_DEPOSITE." WHERE status='0' ORDER BY pk_id DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
            $db->query($sql);
	}




       function GetPending_Request_Neteller($pending_id)
       {
           global $db;
           $sql= " SELECT * FROM ".NETELLER_PENDING_DEPOSITE." WHERE pk_id = '".$pending_id." '";
           $db->query($sql);
           return ($db->fetch_object(MYSQL_FETCH_SINGLE));
       }



	
       function Delete_Neteller($pending_id)
       {
			global $db;
			$sql="DELETE FROM ".NETELLER_PENDING_DEPOSITE ." WHERE pk_id=".$pending_id;
			return($db->query($sql));
       }


	
       function InsertPendingInNeteller($post,$desc)
       {
            $trans_type = "+";
            global $db;
            $sql="INSERT INTO ".NETELLER_MASTER
                    ." (user_auth_id,user_login_id,amount,usdAmount,currency_id,status,description,trans_type,date ) "
                    ." VALUES ('".$post['user_auth_id']."' ,"
                    ." '".$post['user_name']."' ,"
                    ." '".$post['amount']."' ,"
                    ." '".$post['usdAmount']."' ,"
                    ." '".$post['currency_id']."' ,"
                    ." 1 ,"
                    ." '".addslashes($desc)."' ,"
                    ." '".$trans_type."' ,"
                    ." '".date('Y-m-d H:i:s')."' "
                    ." )";
            return($db->query($sql));	
      }
     
}
?>