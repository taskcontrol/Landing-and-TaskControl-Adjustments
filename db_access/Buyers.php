<?
class Buyers
{
	function Buyers()
	{}

        ###########################################################################################
	# Function		: GetBuyerDetails($buyer_id)
	# Purpose		: This function is used to check wheather table has entry exist for this user id or not
	# Return		: 0 or 1 depending on condition
	# Used At 		: editbuyerprofile.php
	# Parameters	
	# 1. $buyer_id =>  user id
	############################################################################################
	function GetBuyerDetails($buyer_id)
	{  
	 	global $db;
	    $sql =  "SELECT * FROM ". PROFILE_MASTER
            . 	" WHERE user_auth_id  = '". $buyer_id. "' ";
		$db->query($sql);

	    if($db->num_rows() > 0)
	    {
			return 0;
	    }
	    return 1;
	}
	
	############################################################################################
	# Function		: Insert($post,$it_buyers_slogan,$it_buyers_description,$en_buyers_slogan,$en_buyers_description)
	# Purpose		: This function is used to insert data in table
	# Return		: none
	# Used At 		: 
	# Parameters	
	# 1. $post =>  array of post
	# 2. $it_buyers_slogan =>  buyer slogan in italian
	# 3. $it_buyers_description =>  buyer description in italian
	# 4. $en_buyers_slogan =>  buyer slogan in english
	# 5. $en_buyers_description =>  buyer description in english
	############################################################################################
	function Insert($post,$en_buyers_slogan,$en_buyers_description)
	{
	   global $db;
		$sql="INSERT INTO ".PROFILE_MASTER
			." (user_auth_id,buyers_slogan,buyers_description,buyers_profile_status) "
			." VALUES ('".$post['User_Id']."' ,"
			." '".$en_buyers_slogan."' ,"
			." '".$en_buyers_description."' ,"
			." '1'"
			." )";
		return($db->query($sql));	
	}
	############################################################################################
	# Function		: Insert_Extend_Project($post)
	# Purpose		: This function is used to 
	# Return		: none
	# Used At 		: 
	# Parameters	
	# 1. $post =>  array of post
	############################################################################################
	function Insert_Extend_Project($post)
	{
	   global $db;
		$sql="INSERT INTO ".PROJECT_EXTEND_MASTER
			." (project_id,buyers_slogan,buyers_description,buyers_profile_status) "
			." VALUES ('".$post['User_Id']."' ,"
			." '".$en_buyers_slogan."' ,"
			." '".$en_buyers_description."' ,"
			." '1'"
			." )";
		return($db->query($sql));	
	}
	############################################################################################
	# Function		: Update($post,$it_buyers_slogan,$it_buyers_description,$en_buyers_slogan,$en_buyers_description)
	# Purpose		: This function is used to update data in table
	# Return		: none
	# Used At 		: 
	# Parameters	
	# 1. $post =>  array of post
	# 2. $it_buyers_slogan =>  buyer slogan in italian
	# 3. $it_buyers_description =>  buyer description in italian
	# 4. $en_buyers_slogan =>  buyer slogan in english
	# 5. $en_buyers_description =>  buyer description in english
	############################################################################################
	function Update($post,$en_buyers_slogan,$en_buyers_description)
	{
	   global $db;
		$sql="UPDATE ".PROFILE_MASTER
		    ." SET "
			." buyers_slogan = '".$en_buyers_slogan."',"
			." buyers_description = '".$en_buyers_description."',"
			." buyers_profile_status = '1' "
		    ." WHERE user_auth_id ='".$post['User_Id']."'"; 
		return($db->query($sql));
	}
	############################################################################################
	# Function		: GetDetail($Id)
	# Purpose		: This function is used to get data of user from table
	# Return		: object
	# Used At 		: editbuyerprofile.php
	# Parameters	
	# 1. $userid =>  user id
	############################################################################################
	function GetDetail($Id)
	{
         global $db1;
		 $sql = "SELECT * FROM ".PROFILE_MASTER
		        ." WHERE user_auth_id = '".$Id."' ";
		 $db1->query($sql);		
		 return ($db1->fetch_object(MYSQL_FETCH_SINGLE));
    }
	############################################################################################
	# Function		: GetUserDetails($userid)
	# Purpose		: This function is used to get data of user
	# Return		: none
	# Used At 		: viewbuyerprofile.php,viewsellerprofile.php
	# Parameters	
	# 1. $userid =>  user id
	############################################################################################
	function GetUserDetails($userid)
	{

		global $db;
		$sql = " SELECT * FROM ".MEMBER_MASTER." AS MM"
		      ." LEFT JOIN ".COUNTRY_MASTER." AS CM ON MM.mem_country = CM.country_id"
			  ." LEFT JOIN ".PROFILE_MASTER." AS PM ON MM.user_auth_id = PM.user_auth_id"
			  ." LEFT JOIN ".YEAR_EXPERIENCE." AS YE ON PM.seller_exp = YE.year_expe_id"
			  ." WHERE MM.user_auth_id  = '".md5($userid)."'";
      	$db->query($sql);
	}
	############################################################################################
	# Function		: ViewAll_Project_User($post_by_id)
	# Purpose		: This function is used to list all project posted by user
	# Return		: none
	# Used At 		: 
	# Parameters	
	# 1. $post_by_id =>  user id
	############################################################################################
	function ViewAll_Project_User($post_by_id)
	{
	  	 global $db;
		 $sql = "SELECT * FROM ".PROJECT_MASTER
		        ." WHERE auth_id_of_post_by = '".$post_by_id."' ORDER BY project_post_time DESC";
		 $db->query($sql);		
	}
	############################################################################################
	# Function		: ViewAll_Project_User_Open($post_by_id)
	# Purpose		: This function is used to get data of project posted by user
	# Return		: none
	# Used At 		: account.php
	# Parameters	
	# 1. $post_by_id =>  user id
	############################################################################################
	function ViewAll_Project_User_Open($post_by_id)
	{
	  	 global $db;
		 $sql = "SELECT * FROM ".PROJECT_MASTER
		        ." WHERE auth_id_of_post_by = '".$post_by_id."' AND ( project_status = 1 OR project_status = 5 ) "
				." ORDER BY premium_project DESC,project_post_time DESC";
		 $db->query($sql);		
	}
	############################################################################################
	# Function		: ViewAll_buyer_rating()
	# Purpose		: This function is used to get data of project posted by user
	# Return		: none
	# Used At 		: buyer_feedback.php
	# Parameters	
	# 1. $post_by_id =>  user id
	############################################################################################
	function ViewAll_Buyer_Rating($user)
	{
	  	 global $db1;
		 $sql = "SELECT * FROM ".BUYER_RATING_MASTER. " AS BRM "
		        ." LEFT JOIN ".PROJECT_MASTER." AS PM ON BRM.project_id = PM.project_id "
		        ." WHERE BRM.rating_to_user = '".$user."' ";
		 $db1->query($sql);		
	}
	
	###########################################################################################
	# Function		: ViewAll_buyer_rating()
	# Purpose		: This function is used to get data of project posted by user
	# Return		: none
	# Used At 		: buyer_feedback.php
	# Parameters	
	# 1. $post_by_id =>  user id
	############################################################################################
	function ViewAll_Buyer_Rating1($user)
	{
	  	 global $db1;
		 $sql = "SELECT * FROM ".BUYER_RATING_MASTER. " AS BRM "
		        ." LEFT JOIN ".PROJECT_MASTER." AS PM ON BRM.project_id = PM.project_id "
		        ." WHERE BRM.rating_to_user = '".$user."' LIMIT 0,5";
		 $db1->query($sql);		
	}
	############################################################################################
	# Function		: Average_Buyer_Rating()
	# Purpose		: This function is used to returning ave_rate
	# Return		: ave_rate
	# Used At 		: buyer_feedback.php
	############################################################################################
	function Average_Buyer_Rating($user)
	{
	  	 global $db;
		 $sql = "SELECT rating_to_user,AVG(rating) as ave_rate FROM ".BUYER_RATING_MASTER
				 ." WHERE rating_to_user ='".$user."' GROUP BY rating_to_user='".$user."' ";  
		 $db->query($sql);
		 $db->next_record();
		 return ($db->f('ave_rate'));
 	}
	############################################################################################
	# Function		: Average_Seller_Rating_Count()
	# Purpose		: This function is used to returning ave_rate
	# Return		: ave_rate
	# Used At 		: buyer_feedback.php
	############################################################################################
	function Average_Buyer_Rating_Count($user)
	{
	  	 global $db;
		 $sql = "SELECT rating_to_user,count(*) as cnt FROM ".BUYER_RATING_MASTER
				 ." WHERE rating_to_user ='".$user."' GROUP BY rating_to_user='".$user."' ";  
		 $db->query($sql);
		 $db->next_record();
		 return ($db->f('cnt'));
 	}
	
	############################################################################################
	# Function		: Update_buyer_profile($post)
	# Purpose		: This function is used to update data in table
	# Return		: none
	# Used At 		: 
	# Parameters	
	# 1. $post =>  array of post
	# 2. $it_buyers_slogan =>  buyer slogan in italian
	# 3. $it_buyers_description =>  buyer description in italian
	# 4. $en_buyers_slogan =>  buyer slogan in english
	# 5. $en_buyers_description =>  buyer description in english
	############################################################################################
	function Update_buyer_profile($post)
	{
	   global $db;
		$sql="UPDATE ".PROFILE_MASTER
		    ." SET "
			." buyers_slogan = '".$post['buyers_slogan']."',"
			." buyers_description = '".$post['buyers_description']."',"
			." buyers_profile_status = '1' "
		    ." WHERE user_auth_id ='".$post['user_auth_id']."'"; 
		return($db->query($sql));
	}
	############################################################################################
	# Function		: Insert($post)
	# Purpose		: This function is used to insert data in table
	# Return		: none
	# Used At 		: 
	# Parameters	
	# 1. $post =>  array of post
	# 2. $it_buyers_slogan =>  buyer slogan in italian
	# 3. $it_buyers_description =>  buyer description in italian
	# 4. $en_buyers_slogan =>  buyer slogan in english
	# 5. $en_buyers_description =>  buyer description in english
	############################################################################################
	function Insert_buyer_profile($post)
	{
	   global $db;
		$sql="INSERT INTO ".PROFILE_MASTER
			." (user_auth_id,buyers_slogan,buyers_description,buyers_profile_status) "
			." VALUES ('".$post['user_auth_id']."' ,"
			." '".$post['buyers_slogan']."' ,"
			." '".$post['buyers_description']."' ,"
			." '1'"
			." )";
		return($db->query($sql));	
	}
}
?>
