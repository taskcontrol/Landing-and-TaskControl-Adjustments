<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" >
	<form name="frmPrivateMsg" action="{$smarty.server.PHP_SELF}" method="post" >
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Private Messages On {$pro_name}</td>
				</tr>
				<tr>
				    <td>&nbsp;</td>
				</tr>
				<tr><td class="successMsg" align="center">&nbsp;{$SuccMsg}</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr><td>&nbsp;</td></tr>
				<tr><td height="2"></td></tr>
			</table>
			<br>
			{if $Loop >0}
			<table border="0" cellpadding="1" cellspacing="1" width="95%">
				<tr>
					<!--<td width="3%" class="headTitle">&nbsp;</td>-->
					<td width="8%" align="center" class="headTitle">Form</td>
					<td width="8%" align="center" class="headTitle">To </td>
					<td width="30%" class="headTitle" align="center">Description</td>
					<td width="10%" align="center" class="headTitle">Date</td>
					<td class="headTitle" width="10%" align="center">Action</td>
				</tr>
				{section name=msg loop=$Loop}
				<tr class="{cycle values='list_A, list_B'}">
				  	<td class="bodytextblack" align="center" height="10">&nbsp;
					{if $amsg[msg].sender_login_id == $amsg[msg].project_posted_by}
					<a href="users.php?Action=Edit&user_auth_id={$amsg[msg].sender_auth_id}" class="actionLink" target="_blank">
					{/if}
					{if $amsg[msg].sender_login_id == $amsg[msg].project_post_to}
					<a href="users.php?Action=Edit&user_auth_id={$amsg[msg].sender_auth_id}" class="actionLink" target="_blank">
					{/if}
					{$amsg[msg].sender_login_id}</a>
					</td>
					<td class="bodytextblack" align="center">&nbsp;
					{if $amsg[msg].recevier_login_id == $amsg[msg].project_posted_by}
					<a href="users.php?Action=Edit&user_auth_id={$amsg[msg].recevier_auth_id}" class="actionLink" target="_blank">
					{/if}
					{if $amsg[msg].recevier_login_id == $amsg[msg].project_post_to}
					<a href="users.php?Action=Edit&user_auth_id={$amsg[msg].recevier_auth_id}" class="actionLink" target="_blank">
					{/if}{$amsg[msg].recevier_login_id}</a></td>
					<!--<td class="bodytextblack" align="left">&nbsp;{$amsg[msg].dec}</td>-->
					<td class="bodytextblack" align="justify">
						<table border="0" cellpadding="1" cellspacing="1" width="95%" align="center">
							<tr>
								<td class="bodytextblack" align="justify">&nbsp;{$amsg[msg].dec|wordwrap:50:"\n":true}</td>
							</tr>
						</table>
					</td>
					<td class="bodytextblack" align="center">&nbsp;{$amsg[msg].date}</td>
					<td class="bodytextblack" align="center" valign="top">
						<img src="{$Templates_Image}edit.gif" class="imgAction" title="Edit" onClick="JavaScript: Edit_Click('{$amsg[msg].id}');">
						<img src="{$Templates_Image}delete.gif" class="imgAction" title="Delete" onClick="JavaScript: Delete_Click('{$amsg[msg].id}');">
					</td>
				</tr>
			{/section}
			</table>
			{else}
			 <table border="0" cellpadding="1" cellspacing="1" width="95%">
				<tr>
					<td class="successMsg" align="center">&nbsp;No one send private message on this project still....</td>
				</tr>
			</table>
			{/if}
			<table border="0" cellpadding="1" cellspacing="1" width="95%">
			<tr>
			    <td colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" align="right"><input type="submit" name="Submit" value="Back" class="stdButton"></td>
			</tr>
			</table>
			<!--{if $smarty.section.frmviewbid.total > 1}
			<table border="0" cellpadding="1" cellspacing="1" width="95%">
				<tr>
					<td class="bodytextblack">
						<img src="{$Templates_Image}arrow_ltr.png"> 
						<a href="JavaScript: CheckUncheck_Click(document.all['cat_prod[]'], true);" onMouseMove="window.status='Check All';" onMouseOut="window.status='';" class="actionLink">Check All</a> / 
						<a href="JavaScript: CheckUncheck_Click(document.all['cat_prod[]'], false);" onMouseMove="window.status='Uncheck All';" onMouseOut="window.status='';" class="actionLink">Uncheck All</a>  &nbsp;&nbsp;
						With selected
						<img src="{$Templates_Image}delete.gif" class="imgAction" title="Delete" onClick="JavaScript: DeleteChecked_Click('{$abid[frmviewbid].id}');">
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
			{/if}-->
			<br><br>
		</td>
	</tr>
	<input type="hidden" name="Action" />
	<input type="hidden" name="project_id" value="{$project_id}" />
	<input type="hidden" name="pm_id" />
	</form>
</table>