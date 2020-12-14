<?
class Contact_Us
{
	function Contact_Us()
	{}
	
   #===============================================================================================
   # This function is used for listingss
   # Admin Side
   #===============================================================================================   

	function ViewAll()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".CONTACT_US_MASTER;
		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}

		$sql= " SELECT * FROM ".CONTACT_US_MASTER ." ORDER BY disp_order ASC "
			." LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}
	
   #===============================================================================================
   # This function is used for adding
   # Admin Side
   #===============================================================================================   
	
	function Insert($post)
	{
		global $db;
		$sql="INSERT INTO ".CONTACT_US_MASTER
			." (contact_country,phone,fax) "
			." VALUES ('".$post['country_name']."' , "
			." '".$post['country_phone']."' ,"
			." '".$post['country_fax']."' "
			." )";
		$db->query($sql);
	}
   #===============================================================================================
   # This function is used for getting country details 
   # User Side & Admin Side
   #===============================================================================================   

	function GetContact($contact_id)
	{
		global $db;
		$sql="SELECT * FROM ".CONTACT_US_MASTER
			." WHERE contact_id=".$contact_id;
		$db->query($sql);
		return($db->fetch_object(MYSQL_FETCH_SINGLE));
	}
   #===============================================================================================
   # This function is used for updateing country details for particular Country Id
   # Admin Side
   #===============================================================================================   

	function Update($post)
	{
		global $db;
		$sql="UPDATE ".CONTACT_US_MASTER
			." SET contact_country	='".$post['country_name']."' ,"
			." phone				='".$post['country_phone']."' ,"
			." fax					='".$post['country_fax']."' "
			." WHERE contact_id 	=".$post['contact_id'];
		return($db->query($sql));
	}
	
   #===============================================================================================
   # This function is used for deleting country details for particular Country Id
   # Admin Side
   #===============================================================================================   
	function Delete($contact_id)
	{
		global $db;
		$sql="DELETE FROM ".CONTACT_US_MASTER
			." WHERE contact_id=".$contact_id;
		return($db->query($sql));
	}
	
   #===============================================================================================
   # This function is used for deleting country details for particular Country Id
   # Admin Side
   #===============================================================================================   
	function DisplayOrder_Contact($contact_id, $display_order)
	{
		global $db;
		$sql = " UPDATE ". CONTACT_US_MASTER
			.  " SET disp_order 	= '". $display_order. "' "
			.  " WHERE contact_id	= '". $contact_id. "' ";
		$db->query($sql);
		return ($db->affected_rows());
	}
	
   #===============================================================================================
   # This function is used for deleting country details for particular Country Id
   # Admin Side
   #===============================================================================================     
	function View_Development_Order()
	{
		global $db;
		$sql= "SELECT * FROM ".CONTACT_US_MASTER
	 		  ." ORDER BY disp_order ASC  ";
		$db->query($sql);
	}	

}
?>