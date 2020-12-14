<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Private_Message</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->



<script language="lang.javascript">
	var JS_English_Msg		 = '{$JS_English_Msg}';
</script>
<form method="post" action="{$smarty.server.PHP_SELF}" name="frmprivatemsg" enctype="multipart/form-data">
{if $smarty.session.User_Name == ''}
<table width="100%" bgcolor="#FFFFFF" border="0" align="center">
	<tr>
		<td>
			<table width="90%" border="0" align="center">
				<tr>
					<td align="center" class="successMsg">{$lang.Private_Message1}</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3" align="center">					
					<input class="login_txt style5" type="submit" id="btnbg" name="Submit" value="{$lang.Button_Close}" onclick="javascript : window.close();"/></td>
				</tr>
			</table>	
		</td>
	</tr>
</table>
{else}
   {if $smarty.session.User_Name == $project_creator}
	<table width="100%" bgcolor="#FFFFFF" border="0" align="center">
		<tr>
			<td>
				<table width="90%" border="0" align="center">
					<tr>
						<td align="center" class="successMsg">{$lang.Private_Message}</td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="3" align="center">							
						<input class="login_txt style5" type="submit" id="btnbg" name="Submit" value="{$lang.Button_Close}" onclick="javascript : window.close();"/></td>
					</tr>
				</table>	
			</td>
		</tr>
	</table>
	{else}
	   {if $m1}
		<table width="100%" bgcolor="#FFFFFF" border="0" align="center">
			<tr>
				<td>
					<table width="90%" border="0" align="center">
						<tr>
							<td align="center" class="successMsg">{$lang.m1}</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3" align="center">							
							<input class="login_txt style5" type="submit" id="btnbg" name="Submit" value="{$lang.Button_Close}" onclick="javascript : window.close();"/></td>
						</tr>
					</table>	
				</td>
			</tr>
		</table>
		{else}
		<table width="100%" bgcolor="#FFFFFF"  border="0" align="center">
			<tr>
				<td>
					<table width="90%" border="0" align="center">
						<tr>
							<td class="bodytext" colspan="2">{$lang.Msg_Between} <strong><a href="#" onclick="Javascript : popup_window_link('buyer_profile_{$project_creator}.html')" class="footerlinkcommon2">{$project_creator}</a> </strong> {$lang.And} <strong> <a href="#" onclick="Javascript : popup_window_link('seller_profile_{$user_name}.html')" class="footerlinkcommon2">{$user_name}</a> </strong> {$lang.On_Project} <a href="#" onclick="Javascript : popup_window_link('project_{$project_id}.html')" class="footerlinkcommon2"><strong>{$title}</strong></a> </td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td class="bodytext">{$lang.Important2}</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td class="bodytextblack" colspan="2"><strong>  {$lang.Project_Message} : &nbsp;&nbsp;<a href="#" onclick="Javascript : popup_window_link('buyer_profile_{$project_creator}.html')" class="footerlinkcommon2">{$project_creator}</a></strong></td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td class="bodytextblack" colspan="2"><strong>{$lang.Post_Message}</strong> <strong> : &nbsp;&nbsp;</strong></td>
						</tr>
						<tr>
							<td>
								<table cellpadding="3" cellspacing="4" border="0" width="62%" class="english">
									<tr>
										<td width="51%" class="bodytextblack"><textarea name="en_message_desc" class="textbox" cols="80" rows="7"></textarea></td>
									</tr>
							  </table>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="bodytextblack"><strong>{$lang.Attached_document} : </strong></td>
						</tr>
						<tr>
							<td class="bodytextblack"><input type="file" name="attch_file"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
					<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
						   <td width="49%" align="left" class="bodytextblack"><input type="submit" name="Submit" value="{$lang.Button_Post}" class="Button" onclick="Javascript: return Check_Details(this.form);"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
					{if $Loop > 0 }
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<table width="90%" border="0" cellpadding="0" cellspacing="0" align="center">
						<tr bgcolor="#537AB1">
							<td width="33%" height="20" align="center" class="bodytextwhite"><strong>{$lang.Author}</strong></td>
							<td class="bodytextwhite" align="center" width="51%" ><strong>{$lang.Message}</strong></td>
							<td class="bodytextwhite" align="center" width="16%" >&nbsp;</td>
						</tr>
						{section name=privatemsg loop=$Loop}
							<tr class="{cycle values='list_A, list_B'}">
								<td align="left" class="bodytextblack" width="33%" height="20" valign="top"><strong>{$lang.User}:</strong>
								  {if $arr_private_msg[privatemsg].sender_login_id == $project_creator}
				                      <a href="#" onclick="Javascript : popup_window_link('buyer_profile_{$arr_private_msg[privatemsg].sender_login_id}.html')" class="footerlinkcommon2"> {$arr_private_msg[privatemsg].sender_login_id}</a>
								  {else}	
										  <a href="#" onclick="Javascript : popup_window_link('seller_profile_{$arr_private_msg[privatemsg].sender_login_id}.html')" class="footerlinkcommon2"> {$arr_private_msg[privatemsg].sender_login_id}</a>
								  {/if}	  
								<br>
								<br>
							  {$lang.Date_posted} : {$arr_private_msg[privatemsg].date}</td>
							  <td class="bodytextblack" width="51%" align="justify">{$arr_private_msg[privatemsg].msg_dec}<br><br>
								{if $arr_private_msg[privatemsg].file1}<strong>{$Attached_file} : </strong><a href="Javascript: Download_File('{$arr_private_msg[privatemsg].file}','Private_Message');" class="footerlinkcommon2"> {$arr_private_msg[privatemsg].file1}</a>
								{/if}								</td>
								<td align="center" class="bodytextblack" width="16%" valign="bottom">&nbsp;<br><img src="{$Templates_Image}report.gif" onClick="JavaScript: ReportViolation_Click(document.frmprivatemsg,'{$arr_private_msg[privatemsg].sender_login_id}');"/></td>
						   </tr>
						{/section}
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
						   <td colspan="3" align="center" class="bodytextblack">						   
						   <input class="login_txt style5" type="submit" id="btnbg" name="Submit" value="{$lang.Button_Close}" onclick="javascript : return back1({$id});"/></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
					</table>
					{/if}
				</td>
			</tr>
		</table>
		{/if}
	{/if}	
{/if}
<input type="hidden" name="Action"/>
<input type="hidden" name="project_id" value="{$project_id}" />
<input type="hidden" name="project_creator" value="{$project_creator}" />
<input type="hidden" name="title" value="{$title}" />
<input type="hidden" name="id" value="{$id}" />
</form>