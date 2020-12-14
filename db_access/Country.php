<?

class Country
{
	function Country()
	{
	    
	}
	
   #===============================================================================================
   # This function is used for listingss
   # Admin Side
   #===============================================================================================   

	function ViewAll()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".COUNTRY_MASTER;
		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();
		
		//echo "ps : " . $_SESSION['page_size'] . " -- tot :" . $_SESSION['total_record'];

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}

		$sql= " SELECT * FROM ".COUNTRY_MASTER." ORDER BY disp_order ASC "
			." LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		//echo $sql; 
		$db->query($sql);
	}
	
   #===============================================================================================
   # This function is used for adding
   # Admin Side
   #===============================================================================================   
	
	function Insert($post)
	{
		global $db;
		$sql="INSERT INTO ".COUNTRY_MASTER
			." (country_name) "
			." VALUES ('".$post['en_country_name']."' "
			." )";
		$db->query($sql);
	}
   #===============================================================================================
   # This function is used for getting country details 
   # User Side & Admin Side
   #===============================================================================================   

	function GetCountry($country_id)
	{
		
		global $db;
		$sql="SELECT * FROM ".COUNTRY_MASTER
			." WHERE country_id=".$country_id;
		$db->query($sql);
		return($db->fetch_object(MYSQL_FETCH_SINGLE));
	}
   #===============================================================================================
   # This function is used for updateing country details for particular Country Id
   # Admin Side
   #===============================================================================================   

	function UpdateCategory($post)
	{
		global $db;
		$sql="UPDATE ".COUNTRY_MASTER
			." SET country_name		='".$post['country_name']."' "
			." WHERE country_id		=".$post['country_id'];
		return($db->query($sql));
	}
	
   #===============================================================================================
   # This function is used for deleting country details for particular Country Id
   # Admin Side
   #===============================================================================================   
	function Delete($country_id)
	{
		global $db;
		$sql="DELETE FROM ".COUNTRY_MASTER
			." WHERE country_id=".$country_id;
		return($db->query($sql));
		
		
	}

	################################################################################################################
	# Function		: GetCountryList()
	# Purpose		: This function is used for getting country details 
	# Return		: none
	# Used At 		: lots of files at both user and admin side
	# Parameters: 
	################################################################################################################

	function GetCountryList()
	{
		global $db;
		$sql= " SELECT * FROM ".COUNTRY_MASTER
			. " ORDER BY country_name ";
		$db->query($sql);
	}
   #===============================================================================================
   # This function is used for getting country name
   # User Side & Admin Side
   #=============================================================================================== 
	function GetCountryName($country_id)
	{
		global $db1;
		$sql="SELECT * FROM ".COUNTRY_MASTER
			." WHERE country_id=".$country_id;
		$db1->query($sql);
		$db1->next_record();
		return ( $db1->f("country_name") );
	}
	function DisplayOrder_Country($country_id, $display_order)
	{
		global $db;
		$sql = " UPDATE ". COUNTRY_MASTER
			.  " SET disp_order 	= '". $display_order. "' "
			.  " WHERE country_id	= '". $country_id. "' ";
		$db->query($sql);
		return ($db->affected_rows());
	}
       
	function View_Country_Order()
	{
		global $db;
		$sql= "SELECT * FROM ".COUNTRY_MASTER
	 		  ." ORDER BY disp_order ASC  ";
		$db->query($sql);
	}	
}
?>