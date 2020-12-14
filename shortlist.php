<?
define('IN_SITE', 	true);
include_once("includes/common.php");
include_once($physical_path['DB_Access']. 'Project.php');
include_once($physical_path['DB_Access']. 'Buyers.php');
include_once($physical_path['DB_Access']. 'Seller.php');
include_once($physical_path['DB_Access']. 'Email.php');

include_once($physical_path['Site_Lang'].'shortlist.php');

$project 		= new Project();
$buyer 			= new Buyers();
$seller			= new Seller();
$emails 		= new Email();

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : '');


if($Action == 'ChangeStatus')
{
	$val=$project->ToggleStatusBid($_POST['bid_id'],$_POST['status']);
	
	$ret_rec = $project->GetProjectDetails($_POST['project_id']);
	
	$clear_title = clean_url($ret_rec->project_title);
	//print $clear_title;die;
	
	header("location: shortlist_".$_POST['project_id']."_".$clear_title.".html#short_list");	
	exit();
}
if($Action=='Delete' && $_POST['bid_id'])
{
    $details = $project->Get_details_form_bidid($_POST['bid_id']);
	
	///////// to buyer
    global $mail2,$virtual_path,$physical_path;
	$mail2 = '';
	$mail2 = new htmlMimeMail();
	
	$tpl2 = new Smarty;
	$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
	
	$sendinfo = $emails->GetEmailDetails1(BID_CANCEL);
					
	$mail2->setSubject($sendinfo->email_subject);
	$mail2->setFrom($sendinfo->email_adress); 
	
	$buyer_email = GetEmailAddress($ret->auth_id_of_post_by);
	
	$tpl2->assign(array(
						"seller_link"           =>	"<a href=".$virtual_path['Site_Root']."seller_profile_".$details->bid_by_user.".html>".$details->bid_by_user."</a>",
						"project_link"          =>	"<a href=".$virtual_path['Site_Root']."project_".$details->project_id."_".clean_url($details->project_title).".html>".$details->project_title."</a>",
 						"flag"                  =>  0,  

					));
	
						
	$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
	$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
	$mail_content_reg = $tpl2->fetch("email_template:".BID_CANCEL);

	$mail_html = "<table border=0 cellpadding=0 cellspacing=0 width=75%>
					<tr>
						<td>".$mail_content_header."</td>
					</tr>
					<tr>
						<td>".stripslashes($mail_content_reg)."</td>
					</tr>
					<tr>
						<td>".$mail_content_footer."</td>
					</tr>
				</table>";

		$mail2->setHtml($mail_html);
	
	$send_to = GetEmailAddress($details->auth_id_of_post_by);
	
	$result = $mail2->send(array($send_to));
	
	/////// To Seller
	global $mail2,$virtual_path,$physical_path;
	$mail2 = '';
	$mail2 = new htmlMimeMail();
	
	$tpl2 = new Smarty;
	$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
	
	$sendinfo = $emails->GetEmailDetails1(BID_CANCEL);
					
	$mail2->setSubject($sendinfo->email_subject);
	$mail2->setFrom($sendinfo->email_adress); 
	
	$tpl2->assign(array(
						"project_link"          =>	"<a href=".$virtual_path['Site_Root']."project_".$details->project_id."_".clean_url($details->project_title).".html>".$details->project_title."</a>",
 					    "flag"					=>  1,	 
					));
	
						
	$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
	$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
	$mail_content_reg = $tpl2->fetch("email_template:".BID_CANCEL);
	
	$mail_html = "<table border=0 cellpadding=0 cellspacing=0 width=75%>
					<tr>
						<td>".$mail_content_header."</td>
					</tr>
					<tr>
						<td>".stripslashes($mail_content_reg)."</td>
					</tr>
					<tr>
						<td>".$mail_content_footer."</td>
					</tr>
				</table>";

		$mail2->setHtml($mail_html);

	
	$send_to = GetEmailAddress(md5($details->bid_by_user));
	
	$result = $mail2->send(array($send_to));
	
    $val = $seller->Delete($_POST['bid_id']);
	header("location: project_".$_POST['project_id']."_".clean_url($details->project_title).".html#short_list");
	exit();
}

		$project_exit = $project->CheckProject_Id($_GET['id']);
		$str = $_SERVER['HTTP_REFERER'];
	
		$str1 = substr(strrchr($str,'/'),1);
	
	
		if($str1 == 'post_project.php')
		{
			$navigation = '<a href=post_project.php class=footerlink>'.$lang['Post_Proj'].'</a>';
			$navigation1= '<label class=navigation>'.$lang['New_Escrow_Pay'].'</label>';
		}
		if($project_exit == 1)
		{
			$tpl->assign(array(	"T_Body"					=>	'Msg'. $config['tplEx'],
								"msg"						=>   $lang['Project_Exit'],
							   ));	
		}
		if($project_exit == 0)
		{
			$ret = $project->GetProjectDetails($_GET['id']);
			if($str1 == 'project_'.$_GET['id'].'_'.$_GET['proj_name'].'.html')
			{
		
				$navigation = '<a href=project_'.$_GET['id'].'_'.$_GET['proj_name'].'.html class=footerlink>'.stripslashes($ret->project_title).'</a>';
				$navigation1= '<a href=award_project_'.$_GET['id'].'_'.$_GET['proj_name'].'.html class=footerlink>'.$lang['Award_Project'].'</a>';
		
			}
			$tpl->assign(array(	"T_Body"					=>	'shortlist'. $config['tplEx'],
								"JavaScript"				=>	array('shortlist.js'),
								"Site_Title"				=>	stripslashes($ret->project_title)." ( ".Get_Cat_Names_Project($ret->project_category)." )",
								
								"membership_id"				=>	$ret->membership_id,
								"project_id"				=>	$ret->project_id,	
								"project_posted_by"			=>	$ret->project_posted_by,
								"project_hide"				=>	$ret->project_hide,	
								"project_allow_bid"			=>	$ret->project_allow_bid,
								"project_status"			=>	$ret->project_status, 
								"user_id"	                =>  $ret->auth_id_of_post_by,
								"project_title"				=>	$ret->project_title,
								"clear_title"				=>	clean_url($ret->project_title),	
								"project_description"		=>	stripslashes(nl2br($ret->project_description)),
								"project_file_1"			=>	substr($ret->project_file_1,25),
								"project_file_2"			=>	substr($ret->project_file_2,25),	
								"project_file_3"			=>	substr($ret->project_file_3,25),	
								"project_budget"			=>	$ret->development_title,	
								"project_posted_date"		=>	formatDate($ret->project_posted_date,'d-m-Y'),
			
								"filepath"               	=>  $virtual_path['Project'], 
			
								"project_post_to"			=>	$ret->project_post_to,	
								"project_level"				=>	$ret->project_level,	
								"project_status"			=>	$ret->project_status,	
			
								"download_project_file_1"	=>	$ret->project_file_1,
								"download_project_file_2"	=>	$ret->project_file_2,
								"download_project_file_3"	=>	$ret->project_file_3,
								"categories"				=>  Get_Cat_Names_Project($ret->project_category),
								
								"navigation"				=>	$navigation,
								"navigation1"				=>	$navigation1,
								"navigation2"				=>	$navigation2,
								));
				$ave_rating = number_format($buyer->Average_Buyer_Rating($ret->project_posted_by),2);		
	
				$tpl->assign(array(	
										"ave_rating"		  => $ave_rating,	
					));						
				$reviews =	$buyer->Average_Buyer_Rating_Count($ret->project_posted_by);	
				$tpl->assign(array(	
										"reviews"		  => $reviews,	
					));					
					
				///////  Related Project Listing......
				$cat_array = explode(",",$ret->project_category);
				$project->GetProjectByCategory123($cat_array);	
				$count_related_project = $db->num_rows();
				$i=0; 			
				
				while($db->next_record())
				{
					$arr_related_project[$i]['project_id']		     = $db->f('project_id');
					$arr_related_project[$i]['project_title']	 	 = $db->f('project_title');
					$arr_related_project[$i]['clear_title']	 	 	 = clean_url($db->f('project_title'));
					$i++;
				}
				 $tpl->assign(array(	"arr_related_project"	=>	$arr_related_project,
										"Related_Loop"		    =>	$count_related_project,	
									));	
					
			/// to calculate days remaining
			//	if $remain_days in negative than project closed and >0 than $remain_days left.
				$a = explode("-",$ret->project_posted_date);
				$date1 = date('Y-m-d ', mktime(0,0,0,$a[1],($a[2]+$ret->project_days_open),$a[0]) );
				$date2 = date('Y-m-d');
				$s = strtotime($date1)-strtotime($date2);
				$d = intval($s/86400); 
				$s -= $d*86400;
				$h = intval($s/3600);
				$s -= $h*3600;
				$m = intval($s/60); 
				$s -= $m*60;	
				$remain_days = $d;
			
				$tpl->assign(array(	"project_days_open"				=>	$remain_days,	
								));
								
								
				$shortlist = $project->Get_Bids_Shortlist($_GET['id']);	
				$shortlistcnt = $db1->num_rows();
				$i=0; 			
				
				while($db1->next_record())
				{
					$arr_Bid[$i]['bid_id']		     = $db1->f('bid_id');
					$arr_Bid[$i]['User_Name']		 = $db1->f('bid_by_user');
					$arr_Bid[$i]['User_Id']			 = md5($db1->f('bid_by_user'));
					$arr_Bid[$i]['Location']	     = ($db1->f('mem_city')!="" && $db1->f('country_name')!="")?$db1->f('mem_city').",".$db1->f('country_name'):"NA";
					$arr_Bid[$i]['Bid_Amount']	     = $db1->f('bid_amount');
					$arr_Bid[$i]['Delivery_Time']	 = $db1->f('delivery_within');
					$arr_Bid[$i]['Bid_Desc']	 	 = $db1->f('bid_desc');
					$arr_Bid[$i]['Bid_Time']	 	 = $db1->f('date_2');
					$arr_Bid[$i]['Bid_Shortlist']	 = $db1->f('shortlist');
					$arr_Bid[$i]['Bid_Decline']		 = $db1->f('decline');
					$arr_Bid[$i]['Bid_Time']	 	 = $db1->f('date_2');
					$arr_Bid[$i]['Premium_Member']	 = $db1->f('membership_id');
					$arr_Bid[$i]['reviews']			 = $seller->Average_Seller_Rating_Count($db1->f('bid_by_user'));
					$arr_Bid[$i]['rating']			 = number_format($seller->Average_Seller_Rating($db1->f('bid_by_user')),2);
					$i++;
				}	
			  
				$tpl->assign(array(	"arr_Bid"				=>	$arr_Bid,
									"Loop"				    =>	$shortlistcnt,	
								));
				
				$result = $project->Get_Bids_By_Id1($_GET['id']);		
				
				list($count,$Average_Bid,$Average_Bid_Time) = explode(",",$result);		
				
				if($count != 0)
				{
					 $Bid = number_format($Average_Bid/$count,2);
					 $Time = round($Average_Bid_Time/$count,0);
				}	 
				 $tpl->assign(array(	"Bid"				=>	$Bid,
										"Time"			    =>	$Time,	
										"count"             => 	$count,
								));
								
				$additional = $project->Get_Additional_Info($_GET['id']);
				$additionalcnt = $db->num_rows();
				$i=0; 			
				
				while($db->next_record())
				{
					$arr_additional[$i]['Desc']	 			 = $db->f('description');
					$arr_additional[$i]['filename1']		 = $db->f('filename');
					$arr_additional[$i]['filename']			 = substr($db->f('filename'),25);
					$arr_additional[$i]['Date_add']	         = $db->f('edit_date');
					$i++;
				}	
			
				$tpl->assign(array(	"arr_additional"				=>	$arr_additional,
									"additionalcnt"				    =>	$additionalcnt,	
								));		
								
				$decline = $project->Get_Bids_Decline($_GET['id']);	
				$declinecnt = $db1->num_rows();	
				
				$tpl->assign(array(	"declinecnt"				=>	$declinecnt,
								));	
				$msgboard = $project->View_Msg($_GET['id']);		
				$msgboardcnt = $db->num_rows();	
				
				$tpl->assign(array(	"msgboardcnt"				=>	$msgboardcnt,
								));		
			}											
			 #language 					
			$tpl->assign(array(	"lang"                  =>  $lang,
								"navigation"			=>	'<a href=project_'.$_GET['id'].'_'.clean_url($ret->project_title).'.html class=footerlink>'.$ret->project_title.'</a>',
								"Link"          		=>  3,	// Used for Buyer Submenu
								"Current_Page"			=>	'buyer', // Used for selection of menu
							 ));						
				 
$tpl->display('default_layout'. $config['tplEx']);
?>