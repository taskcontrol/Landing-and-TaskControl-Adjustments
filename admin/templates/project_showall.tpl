<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" >
	<form name="frmProList" action="{$smarty.server.PHP_SELF}" method="post" >
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Project Management </td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td class="varnormal">
						Manage Project. Edit/Delete Project.
					<div align="right">Page Size:
					  <select name="page_size" onChange="JavaScript: document.frmProList.submit();">
							{$PageSize_List}
					  </select></div>
					</td>
				</tr>
				<tr><td height="2"></td></tr>
				<tr><td class="successMsg" align="center">&nbsp;{$succMessage}</td></tr>
				<tr><td height="2"></td></tr>
			</table>
			<br>
			<table border="0" cellpadding="1" cellspacing="1" width="95%">
				<tr>
					<td width="3%" class="headTitle">&nbsp;</td>
					<td width="10%" align="center" class="headTitle">Project Post By </td>
					<td width="10%" align="center" class="headTitle">Project Post To </td>
					<td width="15%" align="center" class="headTitle">Project Title</td>
					<td width="9%" align="center" class="headTitle">Project Status</td>
					<td width="8%" align="center" class="headTitle">Open Date</td>
					<td width="8%" align="center" class="headTitle">Closed Date</td>
					<td width="8%" class="headTitle" align="center">VIP Member(?)</td>
					<td class="headTitle" width="23%" align="center">Action</td>
				</tr>
				{section name=frmProList loop=$Loop}
				<tr class="{cycle values='list_A, list_B'}">
				  <td width="3%"><input class="stdCheckBox" type="checkbox" name="cat_prod[]" value="{$aprolist[frmProList].id}" align="middle"></td>
					<td class="bodytextblack">&nbsp;<a href="users.php?Action=Edit&user_auth_id={$aprolist[frmProList].auth_id_of_post_by}" class="actionLink" target="_blank">{$aprolist[frmProList].posted_by}</a></td>
					<td class="bodytextblack">&nbsp;<a href="users.php?Action=Edit&user_auth_id={$aprolist[frmProList].auth_id_of_post_to}" class="actionLink" target="_blank">{$aprolist[frmProList].posted_to}</a></td>
					<td class="bodytextblack">&nbsp;
						{if $aprolist[frmProList].premium_project == 1}
 						   <img src="{$Templates_Image}premium_project.gif" border="0" />{$aprolist[frmProList].title|stripslashes}
						{else}
						   {$aprolist[frmProList].title|stripslashes}
						{/if}   
	   
					</td>
					<td class="bodytextblack" align="center">&nbsp;
						{if $aprolist[frmProList].project_status == 1}Open{/if}
						{if $aprolist[frmProList].project_status == 2}Freezed{/if}
						{if $aprolist[frmProList].project_status == 3}Closed for Bidding{/if}
						{if $aprolist[frmProList].project_status == 4}Closed by buyer itself{/if}
						{if $aprolist[frmProList].project_status == 5}Closed{/if}
		 				{if $aprolist[frmProList].project_status == 7}Closed{/if}
					</td>
					<td class="bodytextblack" align="center">&nbsp;{$aprolist[frmProList].project_posted_date}</td>
					<td class="bodytextblack" align="center">&nbsp;{$aprolist[frmProList].project_closed_date}</td>
					<td class="bodytextblack" align="center">&nbsp;{if $aprolist[frmProList].membership_id != 0} VIP Member{else} X {/if}</td>
				    <td align="center">
						<a class="actionLink" href="{$smarty.server.PHP_SELF}?Action=View&project_id={$aprolist[frmProList].id}"><img src="{$Templates_Image}view.gif" class="imgAction" title="View" border="0" /></a>
						<a class="actionLink" href="{$smarty.server.PHP_SELF}?Action=Edit&project_id={$aprolist[frmProList].id}"><img src="{$Templates_Image}edit.gif" class="imgAction" title="Edit" border="0" /></a>
					  	<img src="{$Templates_Image}delete.gif" class="imgAction" title="Delete" onClick="JavaScript: Delete_Click('{$aprolist[frmProList].id}');">
						<a href="view_bid_project.php?project_id={$aprolist[frmProList].id}"><img src="{$Templates_Image}b.gif"	class="imgAction" title="Bidding on Project" border="0"></a>
						<a href="message_board.php?project_id={$aprolist[frmProList].id}"><img src="{$Templates_Image}m.gif"	class="imgAction" title="Message Board" border="0"></a>
						<a href="private_message.php?project_id={$aprolist[frmProList].id}"><img src="{$Templates_Image}p.gif"	class="imgAction" title="Private Messages" border="0"></a>
						<img src="{$Templates_Image}sendmail.gif" class="imgAction" title="Delete" onClick="JavaScript: Delete_Mail_Click('{$aprolist[frmProList].id}');">
				</tr>
			{/section}
			</table>
			{if $smarty.section.frmProList.total > 1}
			<table border="0" cellpadding="1" cellspacing="1" width="95%">
				<tr>
					<td class="bodytextblack">
						<img src="{$Templates_Image}arrow_ltr.png"> 
						<a href="JavaScript: CheckUncheck_Click(document.all['cat_prod[]'], true);" onMouseMove="window.status='Check All';" onMouseOut="window.status='';" class="actionLink">Check All</a> / 
						<a href="JavaScript: CheckUncheck_Click(document.all['cat_prod[]'], false);" onMouseMove="window.status='Uncheck All';" onMouseOut="window.status='';" class="actionLink">Uncheck All</a>  &nbsp;&nbsp;
						With selected
						<img src="{$Templates_Image}delete.gif" class="imgAction" title="Delete" onClick="JavaScript: DeleteChecked_Click('{$aprolist[frmProList].id}');">
					</td>
				</tr>
			</table>
			{/if}
			{if $Page_Link}
			<table border="0" cellpadding="2" cellspacing="2" width="95%">
				<tr>
					<td align="right">{$Page_Link}</td>
				</tr>
			</table>
			{/if}
			<br><br>
		</td>
	</tr>
	<input type="hidden" name="Action" />
	<input type="hidden" name="project_id" />
	</form>
</table>