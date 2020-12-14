<?
class Newletter
{
   function Newletter()
   {
   }
   function ViewAll()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".NEWSLETTER_MASTER." ORDER BY Submitted_date DESC ";

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}

		$sql= " SELECT * FROM ".NEWSLETTER_MASTER." ORDER BY Submitted_date DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}
	
	function ViewAll_At_User()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".NEWSLETTER_MASTER." ORDER BY Submitted_date DESC ";

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['user_page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}

		$sql= " SELECT * FROM ".NEWSLETTER_MASTER." ORDER BY Submitted_date DESC LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['user_page_size'];
		$db->query($sql);
	}

   function Insert($post)
   {
       global $db;
	   $sql="INSERT INTO ".NEWSLETTER_MASTER
				." (news_title,news_description,Submitted_date ) "
				." VALUES ('".$post['en_news_title']."' ,"
				." '".$post['en_news_desc']."' ,"
				." '".date('m/d/y \a\t H:i T')."' "
				." )";
	   return($db->query($sql));	
	}	
	function Getnewsletter($newsid)
   {
       global $db;
	   $sql= " SELECT * FROM ".NEWSLETTER_MASTER." WHERE news_id = '".$newsid." '";
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}	
	
	function Selectnewsletter()
   {
       global $db;
	   $sql= " SELECT * FROM ".NEWSLETTER_MASTER;
	   $db->query($sql);
	   return ($db->fetch_object());
	}	
	
	function Update($post)
	{
		global $db;

		$sql="UPDATE ".NEWSLETTER_MASTER
			." SET news_title		='".$post['news_title']."' ,"
			." news_description		='".$post['new_desc']."' "
			." WHERE news_id		=".$post['news_id'];
		return ($db->query($sql));
	}
	function Delete($newsid)
	{
		global $db;
		
		$sql="DELETE FROM ".NEWSLETTER_MASTER
			." WHERE news_id=".$newsid;
		return($db->query($sql));
	}	
	function Update_Member_details($member_id,$transcation_id,$user_auth_id,$finished_date)
	{
		global $db;
		$sql = " UPDATE ".MEMBER_MASTER
			 . " SET membership_id 			='". $member_id."',"
			 . " membership_buy_date	 	='". date('Y-m-d')."',"
			 . " membership_finish_date		='". $finished_date."',"
			 . " transcation_id 			='". $transcation_id."'"
			 . " WHERE user_auth_id ='".$user_auth_id."'";
		return ($db->query($sql));
	}
}  
?>
