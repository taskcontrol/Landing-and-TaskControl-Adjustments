<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" >
	<form name="frmNewsletter" action="{$smarty.server.PHP_SELF}" method="post" >
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">MemberShip Management </td>
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
						Manage Newletter. Add/Edit/Delete Newletter.
					<div align="right">Page Size:
					  <select name="page_size" onChange="JavaScript: document.frmNewsletter.submit();">
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
					<td colspan="6" align="right"><a class="actionLink" href="{$smarty.server.PHP_SELF}?Action=Add"><img src="{$Templates_Image}add.gif" class="imgAction" title="Add" border="0" /></a></td>
				</tr>
				<!--<tr>
				   <td colspan="6" align="right"><a href="Javascript: Order_Click()" class="actionLink">Manage Order</a>
				   </td> 
				</tr>	-->
				<tr>
					<td width="5%" class="headTitle"></td>
					<td class="headTitle" align="center">News Title </td>
					<td class="headTitle" align="center">News Description</td>
					<td class="headTitle" width="23%" align="center">Action</td>
				</tr>
				{section name=news loop=$Loop}
				<tr class="{cycle values='list_A, list_B'}">
					<td width="5%"><input class="stdCheckBox" type="checkbox" name="cat_prod[]" value="{$newsletter[news].id}" align="middle"></td>
					<td class="bodytextblack" align="center">&nbsp;{$newsletter[news].title}</td>
					<td class="bodytextblack" align="center">&nbsp;{$newsletter[news].desc|truncate:100} </td>
					<td align="center">
						<img src="{$Templates_Image}edit.gif" class="imgAction" title="Edit" onClick="JavaScript: Edit_Click('{$newsletter[news].id}');">&nbsp;&nbsp;
					  	<img src="{$Templates_Image}delete.gif" class="imgAction" title="Delete" onClick="JavaScript: Delete_Click('{$newsletter[news].id}');">&nbsp;&nbsp;
					</td>	
				</tr>
			{/section}
			</table>
			{if $smarty.section.news.total > 1}
			<table border="0" cellpadding="1" cellspacing="1" width="95%">
				<tr>
					<td class="bodytextblack">
						<img src="{$Templates_Image}arrow_ltr.png"> 
						<a href="JavaScript: CheckUncheck_Click(document.all['cat_prod[]'], true);" onMouseMove="window.status='Check All';" onMouseOut="window.status='';" class="actionLink">Check All</a> / 
						<a href="JavaScript: CheckUncheck_Click(document.all['cat_prod[]'], false);" onMouseMove="window.status='Uncheck All';" onMouseOut="window.status='';" class="actionLink">Uncheck All</a>  &nbsp;&nbsp;
						With selected
						<img src="{$Templates_Image}delete.gif" class="imgAction" title="Delete" onClick="JavaScript: DeleteChecked_Click('{$newsletter[news].id}');">
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
	<input type="hidden" name="news_id" />
	<input type="hidden" name="status" />

	</form>
</table>