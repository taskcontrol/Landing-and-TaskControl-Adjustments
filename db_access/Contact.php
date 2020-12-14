<?
class Contact
{
	function Contact()
	{}
	function Viewall_Contact($sender_id,$receiver_name)
	{
		global $db;
		$sql="SELECT * FROM ".CONTACT_MASTER
			." WHERE recevier_name= '".$receiver_name."' AND sender_id='".$sender_id."' ORDER BY date DESC";
		$db->query($sql);
	}
	
   	function Insert($post,$filename)
	{
		global $db;
		$sql="INSERT INTO ".CONTACT_MASTER
			." (sender_id,recevier_name,service,service_dec,image_file,budget,date) "
			." VALUES ('".$post['User_Id']."' ,"
			." '".$post['user_name']."' ,"
			." '".$post['en_service']."' ,"
			." '".$post['en_service_desc']."' ,"
			." '".$filename."' ,"
			." '".$post['dev']."' ,"
			." '".date('m/d/y \a\t H:i T')."' "
			."  )";
		$db->query($sql);
	}
	
   function Get_Contact($autuh_id)
	{
		global $db1;
		$sql="SELECT * FROM ".CONTACT_MASTER
			." WHERE recevier_name= '".$autuh_id."' GROUP BY sender_id ORDER BY sender_id ASC";
		$db1->query($sql);
	}	
	
	 function GetBudgetName($budget_id)
	{
		global $db1;
		$sql = " SELECT * FROM ".DEVELOPMENT_COST
			." WHERE development_id= '".$budget_id."' ";
		$db1->query($sql);                  
		$db1->next_record();
		return ($db1->f('development_title'));
	}	
	
}
?>