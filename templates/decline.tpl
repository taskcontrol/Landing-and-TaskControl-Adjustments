<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Decline</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->



<div id="list_head">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
							<span class="style9"><font color=black>{$project_title|stripslashes}</font></span>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
					
					<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
<form name="frmdecline" method="post" action="{$smarty.server.PHP_SELF}">
<table width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="70%"></td>
		<td height="50" width="30%" align="right">
			<table border="0" cellpadding="0" cellspacing="0" style="margin-right:25px;">
				<tr>
					
					<td>
					{if $smarty.session.User_Id != $user_id}
						<a href="place_bid_{$project_id}_{$clear_title}.html" class="footerlinkcommon2" onClick="Javascript: return chk_user('{$smarty.session.User_Id}');"><font size="2">{$lang.Place_Bid}</font></a>
					{else} 
						<a href="award_project_{$project_id}_{$clear_title}.html" class="footerlinkcommon2"><font size="2">{$lang.Award_Project}</font></a>
					{/if}
					</td>
					
				</tr>
			</table>
		</td>
	</tr>
	
	
	<tr>
		<td valign="top">
			<table cellpadding="3" cellspacing="4" border="0" width="100%">
				<tr>
					<td width="25%" class=""><strong>{$lang.Project_Name} : </strong></td>
					<td  class="bodytext">{$project_title|stripslashes}</td>
				</tr>
				<tr>
					<td width="25%" class=""><strong>{$lang.Status} : </strong></td>
					<td class="bodytext" colspan="2">
						{if $project_status == 1}{$lang.Open_for_bidding}{/if}
						{if $project_status == 2}{$langFreezed}<strong>&nbsp;&nbsp;(Awarded to {$project_post_to})</strong>{/if}
						{if $project_status == 3}{$Close_for_Bidding}<strong>&nbsp;&nbsp;(Bid win by {$project_post_to})</strong>{/if}
						{if $project_status == 4}{$Closed_Manually}<strong>&nbsp;&nbsp;(By Buyer itself)</strong>{/if}
						{if $project_status == 5}{$Closed}<strong>&nbsp;&nbsp;(Awarding to this project is left by {$project_posted_by})</strong>{/if}
						{if $project_status == 7}{$Closed}<strong>&nbsp;&nbsp;(Awarding to this project is left by {$project_posted_by})</strong>{/if}
					</td>
				</tr>
				<tr>
					<td class="" valign="top"><strong>{$lang.Posted_by} : </strong></td>
				    <td class="bodytext" colspan="2" valign="top">
					  {if $membership_id != 0}
					   <img src="{$Templates_Image}vip_member.gif" border="0"/>
					  {/if}
					  <a href="buyer_profile_{$project_posted_by}.html" target="_blank" class="footerlinkcommon2">{$project_posted_by}</a>
					  &nbsp;<a href="#" onclick="JavaScript: popupWindowURL('private_message.php?project_id={$project_id}&id=1&pop_up=true','','600','500','','true','true');"><img src="{$Templates_Image}btn_pm.gif" border="0"/></a>
					  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				     {if $ave_rating == 0.00}
					     ({$lang.NO_Feddback})
					   {else}	 
					   <img src="{$Templates_Image}{$ave_rating|intval}.gif" width="120">&nbsp;&nbsp;&nbsp;<a href="{$project_posted_by}_buyer_feedback.html" class="footerlink">({$lang.reviews} reviews)</a>
					  {/if}					  </td>
				</tr>
				{if $premium_project == 1}
				<tr>
					<td class="" valign="top"><strong>{$lang.Project_Stat} : </strong></td>
					<td class="" align="justify" colspan="2">{$lang.Premium_Project}</td>
				</tr>
				{/if}
				<tr>
					<td class="" valign="top"><strong>{$lang.Description} : </strong></td>
					<td class="bodytext" align="justify" colspan="2">{$project_description|wordwrap:50:"\n":true}</td>
				</tr>
				<tr>
					<td valign="top" class=""><strong>{$lang.Related_Files} : </strong></td>
				    <td class="bodytext" align="justify" colspan="2">
					{if $project_file_1}
						<a href="Javascript: Download_File('{$download_project_file_1}','Project');" class="footerlinkcommon2">{$project_file_1}</a>
					{/if}
					{if $project_file_2}
					<BR>
						<a href="Javascript: Download_File('{$download_project_file_2}','Project');" class="footerlinkcommon2">{$project_file_2}</a>
					{/if}
					{if $project_file_3}
					<BR>
					  <a href="Javascript: Download_File('{$download_project_file_3}','Project');" class="footerlinkcommon2">{$project_file_3}</a>
					{/if}
					{if $project_file_1 == '' and $project_file_2 == '' and $project_file_3 == ''}
						{$lang.No_upload}
					{/if}					</td>
				</tr>
				<tr>
					<td class="" valign="top"><strong>{$lang.Budget1} : </strong></td>
					<td class="bodytext" align="justify" colspan="2">{$project_budget}</td>
				</tr>
				<tr>
					<td class="" valign="top"><strong>{$lang.Required_Skills} : </strong></td>
					<td class="bodytext" align="justify" colspan="2">{$categories}</td>
				</tr>
				<tr>
					<td class="" valign="top"><strong>{$lang.Posted_Date} : </strong></td>
					<td class="bodytext" align="justify" colspan="2">{$project_posted_date}</td>
				</tr>
				<tr>
					<td class="" valign="top"><strong>{$lang.Days_Of_Bidding} : </strong></td>
					<td class="bodytext" align="justify" colspan="2">
					{if $project_days_open < 0}
						{$lang.Project_Closed_Bidding}
					{else}
						{$project_days_open} {$lang.Days_remaining} 
							{if $project_days_open == 1} 
								<font color="#FF0000">({$lang.Last_day_for_bidding})</font>
							{/if}
					{/if}</td>
				</tr>
				{if $additionalcnt > 0}
				<tr>
					<td class="" valign="top" colspan="3"><strong>{$lang.Additional_Information} : </strong></td>
				</tr>
				{section name=addinfo loop=$additionalcnt}
				<tr>
					<td class="bodytext" colspan="3"><strong>{$lang.Submitted_On}</strong>&nbsp;{$arr_additional[addinfo].Date_add}</td>
				</tr>
				{if $arr_additional[addinfo].filename}
				<tr>
					<td align="justify" class="" colspan="3"><strong>{$lang.Additional_File} :</strong>&nbsp;<a href="Javascript: Download_File('{$arr_additional[addinfo].filename1}','Project');" class="footerlinkcommon2">{$arr_additional[addinfo].filename}</a></td>
				</tr>
				{/if}
				<tr>	
					<td class="bodytext" colspan="3">{$arr_additional[addinfo].Desc}</td>
				</tr>
				{/section}
				{/if}
		  </table>
	  </td>
	  <td width="20%" valign="top" bgcolor="#F9FAFC">
	     <table width="100%" align="center" cellpadding="0" cellspacing="0">
		     <tr>
			     <td class="1" align="center"> 
			     <font size="2"><strong>{$lang.Related_Projects}</strong></font>
				 </td>
			 </tr>
			 <tr>
			     <td>&nbsp;</td>
			 </tr>
			 
			 {if $Related_Loop != ''}
			 {section name=related_project loop=$Related_Loop} 
			 <tr align="center" >
				 <td class="1" align="center">
										   
						 {if $arr_related_project[related_project].project_id != $project_id}
						 	  <ul style="margin-left:15px;"><li><a href="project_{$arr_related_project[related_project].project_id}_{$arr_related_project[related_project].clear_title}.html" class="footerlinkcommon23">{$arr_related_project[related_project].project_title|stripslashes}</a></li> </ul>
						 {/if} 	
				 </td>
			 </tr>
			 {/section}
			 {else}
			 	<tr>
					<td align="center" class="successMsg">{$lang.No_Related}</td>
    			</tr>
			 {/if}
			 <tr align="center">
			 	<td align="center">{$google_adsense_code_125}</td>
			</tr>
		</table>
	  </td>
	</tr>
</table>
<table cellpadding="0" cellspacing="0" border="0" width="95%" align="center">
	<tr>
		<td height="10"></td>
	</tr>
	<tr>
		<td colspan="7" class="" valign="top">&nbsp;&nbsp;<strong>{$lang.Reminder} : </strong></td>
	</tr>
	<tr>
		<td height="10"></td>
	</tr>
	<tr>
		<td colspan="7" class="bodytext" valign="top">&nbsp;&nbsp;{$lang.Bid_Note1}</td>
	</tr>
	<tr>
		<td height="10"></td>
	</tr>
	<tr height="30" valign="top" bgcolor="#537AB1">
		<td width="15%" class="1">&nbsp;<a href="project_{$project_id}_{$clear_title}.html#bid_list" class="bodytextwhite"><strong>{$lang.Bids_Received} ({$count}) </strong></a></td>
		<td width="1%" class="1">&nbsp;</td>
		<td width="10%" class="1">&nbsp;<a href="shortlist_{$project_id}_{$clear_title}.html#short_list" class="bodytextwhite"><strong>{$lang.Shortlist}({$shortlistcnt}) </strong></a></td>
		<td width="1%" class="1">&nbsp;</td>
		<td width="15%" class="1">&nbsp;<a href="decline_{$project_id}_{$clear_title}.html#decline_list" class="bodytextwhite"><strong>{$lang.Decline_Bid}({$declinecnt})</strong></a></td>
		<td width="23%" class="1">&nbsp;{$lang.Average_bid_amount}: {if $count != 0}<strong>{$lang.Curreny}{$Bid}</strong>{else}<strong>{$lang.Curreny}0.00</strong>{/if}</td>
		<td width="23%" class="1">{$lang.Average_delivery_time}: {if $count != 0}<strong>{$Time} {$lang.Day}</strong>{else}<strong>0 {$lang.Day}</strong>{/if}</td>
	</tr>
	<tr bgcolor="#D5D5D5">
		<td colspan="7" class="1">&nbsp;
		<a href="post_project.php" class="footerlinkcommon23" onClick="Javascript: return chk_user('{$smarty.session.User_Id}');"><strong>{$lang.Posted_Project}</strong></a> | <a href="#bid_list" onclick="JavaScript: popupWindowURL('send_project.php?project_id={$project_id}&pop_up=true','','900','500','','true','true');" class="footerlinkcommon23">
<strong>{$lang.Send_Project}</strong></a> |  <a href="#bid_list" onclick="JavaScript: popupWindowURL('message_board.php?project_id={$project_id}&project_creator={$project_posted_by}&id=1&pop_up=true','','600','500','','true','true');" class="footerlinkcommon23"><strong>{$lang.Message_Board}({$msgboardcnt})</strong></a> |  <a href="contact_{$project_posted_by}.html" class="footerlinkcommon23" onClick="Javascript: return chk_user('{$smarty.session.User_Id}');"><strong>{$lang.Contact} {$project_posted_by}</strong></a>{if $project_posted_by == $smarty.session.User_Name}| <a href="republish_post_project_{$project_id}_{$clear_title}.html" class="footerlinkcommon23"><strong>{$lang.Republish_Project}</strong></a>{/if}</td>
	</tr>
	
	<tr>
		<td colspan="7" height="1">&nbsp;</td>
	</tr>
	<tr bgcolor="#F9FAFC">
		<td class="bodytext1" colspan="7" align="justify">
		<strong>{$lang.Remember}</strong>&nbsp;{$lang.Remember_Note} 
		</td>
	</tr>
	<tr bgcolor="#F9FAFC">
	   <td colspan="7">&nbsp;</td>
	</tr>
	{if $project_allow_bid ==1}
	<tr bgcolor="#F9FAFC">
		<td colspan="7" class="" valign="top" align="center"><strong><font size="3">{$lang.Vip}</font></strong></td>
	</tr>
	{/if}
</table>
<table cellpadding="0" cellspacing="0" border="0" width="95%" align="center">
	<tr bgcolor="#537AB1">
		<td width="10%" class="bodytext">&nbsp;</td>
	</tr>
	{if $project_hide == 1}
		{section name=bid loop=$Loop}
			 {if $smarty.session.User_Id == $user_id}
				 {if $arr_Bid[bid].Premium_Member == 0}
					<tr class="{cycle values='list_A style3, list_B style3'}">
				   {else}
					 <tr class="{cycle values='list_J styletr'}">
				   {/if}	
					<td colspan="6">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td width="10%" align="center" valign="bottom"><a href="#decline_list" onclick="JavaScript: popupWindowURL('private_message_form_user.php?project_id={$project_id}&id=3&bid_user={$arr_Bid[bid].User_Name}&pop_up=true','','600','500','','true','true');"><img src="{$Templates_Image}btn_pm.gif" border="0" align="middle"/></a></td>
								<td width="34%" class="">
								{if $arr_Bid[bid].Premium_Member == 0}
									<a href="buyer_profile_{$arr_Bid[bid].User_Name}.html" >{$arr_Bid[bid].User_Name}</a>
								{else}	
									<a href="buyer_profile_{$arr_Bid[bid].User_Name}.html" >{$arr_Bid[bid].User_Name}</a>&nbsp;&nbsp;<img src="{$Templates_Image}vip_member.gif" border="0"/>
								{/if}
								</td>
								<td width="13%" >{$arr_Bid[bid].Location}</td>
								<td width="10%" >{$lang_common.Curreny}&nbsp;{$arr_Bid[bid].Bid_Amount}</td>
								<td width="25%" >
								{if $arr_Bid[bid].rating == 0.00}
									No Feedback yet
								{else}									 
									<img src="{$Templates_Image}{$arr_Bid[bid].rating|intval}.gif" width="120"><br />&nbsp;<a href="{$arr_Bid[bid].User_Name}_feedback.html" class="link">({$arr_Bid[bid].reviews} reviews)</a>
								{/if}
								</td>
								<td width="10%">{$arr_Bid[bid].Delivery_Time}&nbsp;{$lang.Day}</td>
							</tr>
							<tr>
							   <td align="center" width="10%">
							   {if $smarty.session.User_Id == $user_id}
									{if $arr_Bid[bid].Bid_Decline==0}
										<a href="JavaScript: DeclineStatus_Click('{$arr_Bid[bid].bid_id}', '1');" class="link"><strong>{$lang.Ue_Decline_Bid}</strong></a>
								{/if}
								{else}
										{$lang.Ue_Decline_Bid}
								{/if}							  </td>
								<td width="34%" valign="top">&nbsp;</td>
								<td width="13%"  valign="top">{$lang.location}</td>
								<td width="10%"  valign="top">{$lang.Bid_Amount}</td>
								<td width="25%" valign="top">{$lang.feedback}</td>
								<td width="15%" valign="top">{$lang.Delivery_Time}</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="5" >{$arr_Bid[bid].Bid_Desc|wordwrap:100:"\n":true}</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="5">{$lang.Decline_Reason} :
								{if $arr_Bid[bid].reasons == 1}
									{$lang.Reason1}
								{elseif $arr_Bid[bid].reasons == 2}	
									{$lang.Reason2}
								{elseif $arr_Bid[bid].reasons == 3}	
									{$lang.Reason3}
								{elseif $arr_Bid[bid].reasons == 4}	
									{$lang.Reason4}
								{elseif $arr_Bid[bid].reasons == 5}	
									{$lang.Reason5}
								{elseif $arr_Bid[bid].reasons == 6}	
									{$lang.Reason6}{elseif $arr_Bid[bid].reasons == 7}	
									{$lang.Reason7}{elseif $arr_Bid[bid].reasons == 8}{$lang.Reason8}	
								{else}			
									{$lang.Reason0}														
								{/if}								</td>
							</tr>
							<tr>
							    <td align="center">
								{if $project_post_to == $arr_Bid[bid].User_Name}
									<img src="{$Templates_Image}winner.gif" border="0"/>
								{else}&nbsp;
								{/if}</td>
								<td colspan="5">{$lang.Bid_Time} : {$arr_Bid[bid].Bid_Time}</td>
							</tr>
							{if $smarty.session.User_Id == $arr_Bid[bid].User_Id}
								{if $project_status == 1}
								<tr>
									<td colspan="6"  align="right" valign="top">
									 <strong><a href="JavaScript: Delete_Click('{$arr_Bid[bid].bid_id}');" >Cancel Bid</a></strong> &nbsp;&nbsp;
									</td>
								</tr>
								{/if}
							{/if}	
						</table>
					</td>
				</tr>
				{assign var="count_check" value="1"}
							
							{elseif $smarty.session.User_Id == $arr_Bid[bid].User_Id}
							   {if $arr_Bid[bid].Premium_Member == 0}
							    <tr class="{cycle values='list_A style3, list_B style3'}">
							   {else}
   							    <tr class="{cycle values='list_J styletr'}">
							   {/if}
							   <td colspan="6">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td width="10%"  align="center" valign="bottom"><a href="#decline_list" onclick="JavaScript: popupWindowURL('private_message_form_user.php?project_id={$project_id}&id=3&bid_user={$arr_Bid[bid].User_Name}&pop_up=true','','600','500','','true','true');"><img src="{$Templates_Image}btn_pm.gif" border="0" align="middle"/></a></td>
								<td width="34%">
								{if $arr_Bid[bid].Premium_Member == 0}
									<a href="buyer_profile_{$arr_Bid[bid].User_Name}.html" >{$arr_Bid[bid].User_Name}</a>
								{else}	
									<a href="buyer_profile_{$arr_Bid[bid].User_Name}.html">{$arr_Bid[bid].User_Name}</a>&nbsp;&nbsp;<img src="{$Templates_Image}vip_member.gif" border="0"/>
								{/if}
								</td>
								<td width="13%">{$arr_Bid[bid].Location}</td>
								<td width="10%">{$lang_common.Curreny}&nbsp;{$arr_Bid[bid].Bid_Amount}</td>
								<td width="25%">
								{if $arr_Bid[bid].rating == 0.00}
									No Feedback yet
								{else}									 
									<img src="{$Templates_Image}{$arr_Bid[bid].rating|intval}.gif" width="120"><br />&nbsp;<a href="{$arr_Bid[bid].User_Name}_feedback.html" class="link">({$arr_Bid[bid].reviews} reviews)</a>
								{/if}
								</td>
								<td width="10%">{$arr_Bid[bid].Delivery_Time}&nbsp;{$lang.Day}</td>
							</tr>
							<tr>
							   <td align="center"  width="10%">
							   {if $smarty.session.User_Id == $user_id}
									{if $arr_Bid[bid].Bid_Decline==0}
										<a href="JavaScript: DeclineStatus_Click('{$arr_Bid[bid].bid_id}', '1');" class="link"><strong>{$lang.Ue_Decline_Bid}</a>
								{/if}
								{else}
										{$lang.Ue_Decline_Bid}
								{/if}							  </td>
								<td width="34%"  valign="top">&nbsp;</td>
								<td width="13%" valign="top">{$lang.location}</td>
								<td width="10%" valign="top">{$lang.Bid_Amount}</td>
								<td width="25%" valign="top">{$lang.feedback}</td>
								<td width="15%" valign="top">{$lang.Delivery_Time}</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="5">{$arr_Bid[bid].Bid_Desc|wordwrap:100:"\n":true}</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="5" >{$lang.Decline_Reason} :
								{if $arr_Bid[bid].reasons == 1}
									{$lang.Reason1}
								{elseif $arr_Bid[bid].reasons == 2}	
									{$lang.Reason2}
								{elseif $arr_Bid[bid].reasons == 3}	
									{$lang.Reason3}
								{elseif $arr_Bid[bid].reasons == 4}	
									{$lang.Reason4}
								{elseif $arr_Bid[bid].reasons == 5}	
									{$lang.Reason5}
								{elseif $arr_Bid[bid].reasons == 6}	
									{$lang.Reason6}{elseif $arr_Bid[bid].reasons == 7}	
									{$lang.Reason7}{elseif $arr_Bid[bid].reasons == 8}{$lang.Reason8}	
								{else}			
									{$lang.Reason0}														
								{/if}								</td>
							</tr>
							<tr>
							    <td align="center">
								{if $project_post_to == $arr_Bid[bid].User_Name}
									<img src="{$Templates_Image}winner.gif" border="0"/>
								{else}&nbsp;
								{/if}</td>
								<td colspan="5">{$lang.Bid_Time} : {$arr_Bid[bid].Bid_Time}</td>
							</tr>
							{if $smarty.session.User_Id == $arr_Bid[bid].User_Id}
								{if $project_status == 1}
								<tr>
									<td colspan="6" class="" align="right" valign="top">
									 <strong><a href="JavaScript: Delete_Click('{$arr_Bid[bid].bid_id}');" class="link" >Cancel Bid</a></strong> &nbsp;&nbsp;
									</td>
								</tr>
								{/if}
							{/if}
						</table>
					</td>
				</tr>
				{assign var="count_check" value="1"}
							{/if}
				{/section}
				{if $count_check != 1}
						<tr>
							<td width="10%" align="center">{$lang.Bid_hide}</td>
						</tr>
				{/if}
				{else}
				{section name=bid loop=$Loop}
				 {if $arr_Bid[bid].Premium_Member == 0}
							    <tr class="{cycle values='list_A style3, list_B style3'}">
							   {else}
   							    <tr class="{cycle values='list_J styletr'}">
							   {/if}	
					<td colspan="6">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td width="10%"  align="center" valign="bottom"><a href="#decline_list" onclick="JavaScript: popupWindowURL('private_message_form_user.php?project_id={$project_id}&id=3&bid_user={$arr_Bid[bid].User_Name}&pop_up=true','','600','500','','true','true');"><img src="{$Templates_Image}btn_pm.gif" border="0" align="middle"/></a></td>
								<td width="34%" >
								{if $arr_Bid[bid].Premium_Member == 0}
									<a href="buyer_profile_{$arr_Bid[bid].User_Name}.html" class="link">{$arr_Bid[bid].User_Name}</a>
								{else}	
									<a href="buyer_profile_{$arr_Bid[bid].User_Name}.html" class="link">{$arr_Bid[bid].User_Name}</a>&nbsp;&nbsp;<img src="{$Templates_Image}vip_member.gif" border="0"/>
								{/if}								</td>
								<td width="13%" >{$arr_Bid[bid].Location}</td>
								<td width="10%">{$lang_common.Curreny}&nbsp;{$arr_Bid[bid].Bid_Amount}</td>
								<td width="25%">
								{if $arr_Bid[bid].rating == 0.00}
									No Feedback yet
								{else}									 
									<img src="{$Templates_Image}{$arr_Bid[bid].rating|intval}.gif" width="120"><br />&nbsp;<a href="{$arr_Bid[bid].User_Name}_feedback.html" class="link">({$arr_Bid[bid].reviews} reviews)</a>
								{/if}								</td>
								<td width="10%" >{$arr_Bid[bid].Delivery_Time}&nbsp;{$lang.Day}</td>
							</tr>
							<tr>
							   <td align="center" width="10%">
							   {if $smarty.session.User_Id == $user_id}
									{if $arr_Bid[bid].Bid_Decline==0}
										<a href="JavaScript: DeclineStatus_Click('{$arr_Bid[bid].bid_id}', '1');" class=""><strong>{$lang.Ue_Decline_Bid}</strong></a>
								{/if}
								{else}
										{$lang.Ue_Decline_Bid}
								{/if}							  </td>
								<td width="34%" valign="top">&nbsp;</td>
								<td width="13%"  valign="top">{$lang.location}</td>
								<td width="10%" valign="top">{$lang.Bid_Amount}</td>
								<td width="25%"  valign="top">{$lang.feedback}</td>
								<td width="15%"  valign="top">{$lang.Delivery_Time}</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td colspan="5" >{$arr_Bid[bid].Bid_Desc|wordwrap:100:"\n":true}</td>
							</tr>
							<tr>
								<td align="center">
								{if $project_post_to == $arr_Bid[bid].User_Name} 
								        <img src="{$Templates_Image}winner.gif" border="0"/> {else}&nbsp;
								{/if}								</td>
								<td colspan="5" >{$lang.Decline_Reason} :
								{if $arr_Bid[bid].reasons == 1}
									{$lang.Reason1}
								{elseif $arr_Bid[bid].reasons == 2}	
									{$lang.Reason2}
								{elseif $arr_Bid[bid].reasons == 3}	
									{$lang.Reason3}
								{elseif $arr_Bid[bid].reasons == 4}	
									{$lang.Reason4}
								{elseif $arr_Bid[bid].reasons == 5}	
									{$lang.Reason5}
								{elseif $arr_Bid[bid].reasons == 6}	
									{$lang.Reason6}{elseif $arr_Bid[bid].reasons == 7}	
									{$lang.Reason7}{elseif $arr_Bid[bid].reasons == 8}{$lang.Reason8}	
								{else}			
									{$lang.Reason0}														
								{/if}								</td>
							</tr>
							<tr>
							    <td>&nbsp;</td>
								<td colspan="5" >{$lang.Bid_Time} : {$arr_Bid[bid].Bid_Time}</td>
							</tr>
							{if $smarty.session.User_Id == $arr_Bid[bid].User_Id}
								{if $project_status == 1}
								<tr>
									<td colspan="6"  align="right" valign="top">
									<strong><a href="JavaScript: Delete_Click('{$arr_Bid[bid].bid_id}');"  >Cancel Bid</a></strong>&nbsp;&nbsp;									</td>
								</tr>
								{/if}
							{/if}
						</table>
			</td>
		</tr>
		{/section}
	{/if}
</table>
<input type="hidden" name="Action" />
<input type="hidden" name="project_id" value="{$project_id}" />
<input type="hidden" name="status" />
<input type="hidden" name="bid_id" />
</form>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
	<div id="more_link">
		
	</div>
</div>
