<?
// include_once($physical_path['DB_Access']. 'Cronjobs.php');
include_once("/var/www/taskcontrol.net/web/db_access/Cronjobs.php");

class Email
{
   function Email()
   {
   }
   
   
   function ViewAll()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".EMAIL_CONFIG ;

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}

		$sql= " SELECT * FROM ".EMAIL_CONFIG." LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}
   
   
   function Insert($post)
   {
       global $db;
	   $sql="INSERT INTO ".EMAIL_CONFIG
				." (email_title,email_adress ) "
				." VALUES ('".$post['title_name']."' ,"
				." '".$post['email_address']."' "
				." )";
	   return($db->query($sql));	
	}	


	function GetEmail($eid)
   {
       global $db;
	   $sql= " SELECT * FROM ".EMAIL_CONFIG." WHERE email_id = '".$eid." '";
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}	
	

	function Update($post)
	{
		global $db;

		$sql = " UPDATE ". EMAIL_CONFIG
			.  " SET email_adress 	= '". $post['mail_address']. "' ,"
			.  " email_title  		= '". $post['title']. "' "
			.  " WHERE email_id		= '". $post['email_id']. "' ";
		$db->query($sql);
		return ($db->query($sql));
	}


	function Delete($eid)
	{
		global $db;
		
		$sql="DELETE FROM ".EMAIL_CONFIG
			." WHERE email_id=".$eid;
		return($db->query($sql));
	}
	
	
	#==================================================
	#Email amnagment Function
	#==================================================
	function ViewAllEmail()
	{
		global $db;
		$sql="SELECT count(*) as cnt FROM ".EMAIL_TEMPLATE." AS ET " 
			." LEFT JOIN ".EMAIL_CONFIG." AS EC ON ET.email_id_sending = EC.email_id";

		$db->query($sql);
		$db->next_record();
		$_SESSION['total_record'] = $db->f("cnt") ;
		$db->free();

		# Reset the start record if required
		if($_SESSION['page_size'] >= $_SESSION['total_record'])
		{
			$_SESSION['start_record'] = 0;
		}

		$sql= " SELECT ET.email_id,ET.email_subject,ET.email_content,EC.email_title FROM ".EMAIL_TEMPLATE." AS ET "." LEFT JOIN ".EMAIL_CONFIG." AS EC ON ET.email_id_sending = EC.email_id LIMIT ". $_SESSION['start_record']. ", ". $_SESSION['page_size'];
		$db->query($sql);
	}


	function GetEmailDetails($eid)
   {
       global $db;
	   $sql= " SELECT * FROM ".EMAIL_TEMPLATE." WHERE email_id = '".$eid." '";
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}	
	


	function GetEmailDetails1($eid)
   {
       global $db;
	   $sql= " SELECT EC.email_adress, ET.email_subject, ET.email_content FROM ".EMAIL_TEMPLATE." AS ET "
	          ." LEFT JOIN ".EMAIL_CONFIG." AS EC ON ET.email_id_sending = EC.email_id "
	         ." WHERE ET.email_id = '".$eid." '"; 
	   $db->query($sql);
	   return ($db->fetch_object(MYSQL_FETCH_SINGLE));
	}	


	function Email_List()
	{
		global $db;
		$sql = " SELECT * FROM ".EMAIL_CONFIG
			 . " ORDER BY email_id";
		return ($db->query($sql));
	}


	function UpdateEmailTemplate($post)
	{
		global $db;

		$sql = " UPDATE ". EMAIL_TEMPLATE
			.  " SET email_subject 	='". $post['en_email_subject']. "' ,"
			//.  " it_email_subject		='".$post['it_email_subject']."' ,"
			.  " email_content			='".$post['content']."' ,"
			.  " email_id_sending		='".$post['email_send']."' "
			.  " WHERE email_id	= '".$post['email_id']. "' ";
			
		$db->query($sql);
		return ($db->query($sql));
	}



	#==================================================
	#Email Newsletter Function
	#==================================================	
	function SendNewsletter($Mail_Subject, $Mail_To_Sellers, $Mail_To_Buyers, $Mail_Areas, $Mail_Body)
	{
		$sql = " SELECT A.mem_fname, A.mem_lname, A.mem_email, A.mem_category ";
		$sql .= "FROM ". MEMBER_MASTER ." A ";
		$sql .= " WHERE 1=1 ";
		$sql .= ($Mail_To_Sellers) ? " and mem_as_seller = 1 " : " and mem_as_seller = 0";
		$sql .= ($Mail_To_Buyers) ? " and mem_as_buyer = 1 " : " and mem_as_buyer = 0 ";
		$sql .= "and ( ";

		foreach ($Mail_Areas as $key => $value) {
			$sql .= " A.mem_category like ('%" . $value . "%') OR";
		}

		$sql = substr($sql, 0, strlen($sql) - 2);
		$sql .= ")";

		global $db;
		$db->query($sql); 

		foreach ($db->fetch_object() as $key => $value) {
			#old way, insert into pipeline
			#$cron = new Cronjobs();
			#$cron->Insert_In_PipeMail($value->mem_email, 'newsletter@taskcontrol.co', $Mail_Subject, addslashes($Mail_Body));

			global $mail2;
			$mail2 = '';
			$mail2 = new htmlMimeMail();
							
			$mail2->setSubject($Mail_Subject);
			$mail2->setFrom('noreply@taskcontrol.net'); 

			$mail2->setHtml($Mail_Body);

			$result = $mail2->send(array($value->mem_email));
		}
	}
 }  
?>
