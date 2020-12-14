<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" >
	<form name="frmCategory" action="{$A_Action}" method="post" >
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Account Management </td>
					
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
						View Account Details.
					      <div align="right">Page Size:
					  <select name="page_size" onChange="JavaScript: document.frmCategory.submit();">
							{$PageSize_List}
					  </select></div>
					</td>
				</tr>
				
			</table>
			<br>
			<input type="hidden" name="cat_id" />
			<input type="hidden" name="status" />
			<table border="0" cellpadding="1" cellspacing="1" width="95%">
				<tr>
					<td colspan="4"><strong>Total Amount In Wallet (All USERS) : {$Curreny}&nbsp;{$wallet_sum}</strong></td>
				</tr>
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4"><strong>Total Earn By Site (All USERS) : {$Curreny}&nbsp;{$earn_sum}</strong></td>
				</tr>
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4">{$navigationLink}</td>
				</tr>
				<tr>
					<td class="headTitle">Name </td>
					<td class="headTitle">Amount in Wallet</td>
					<td class="headTitle">Earn By Site</td>
					<td class="headTitle" width="31%">Action</td>
				</tr>
				{section name=Member_Account loop=$Loop}
				<tr class="{cycle values='list_A, list_B'}">
					
					<td width="28%" class="bodytextblack">{$membership_payment[Member_Account].user_login_id|stripslashes}</td>
					<td width="28%" class="bodytextblack">{$membership_payment[Member_Account].wallet_sum|stripslashes}</td>
					<td width="28%" class="bodytextblack">{$membership_payment[Member_Account].earn_by_site|stripslashes}</td>
					<td align="center">
						<a href="user_account.php?user_auth_id={$membership_payment[Member_Account].user_auth_id}" class=""><img src="{$Templates_Image}edit.gif" 	class="imgAction" title="View" border="0"></a>&nbsp;&nbsp;
					  	&nbsp;&nbsp;</td>
				</tr>
				{sectionelse}
				<tr>	
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td colspan="3" align="center" class="bodytextblack">No category inserted yet.</td>
				</tr>
				{/section}
			</table>
			{if $smarty.section.prodCat.total > 1}
			<table border="0" cellpadding="1" cellspacing="1" width="95%">
				<tr>
					<td class="bodytextblack">
						<img src="{$Templates_Image}arrow_ltr.png"> 
						<a href="JavaScript: CheckUncheck_Click(document.all['cat_prod[]'], true);" onMouseMove="window.status='Check All';" onMouseOut="window.status='';" class="actionLink">Check All</a> / 
						<a href="JavaScript: CheckUncheck_Click(document.all['cat_prod[]'], false);" onMouseMove="window.status='Uncheck All';" onMouseOut="window.status='';" class="actionLink">Uncheck All</a>  &nbsp;&nbsp;
						With selected
						<img src="{$Templates_Image}delete.gif" class="imgAction" title="Delete" onClick="JavaScript: DeleteChecked_Click('{$cat_parent_id}');">
					</td>
				</tr>
			</table>
			{/if}
						{if $Page_Link}
			<table border="0" cellpadding="2" cellspacing="2" width="95%">
				<tr>
				<td align="right">
						{$Page_Link}
				</td>
				</tr>
			</table>
			{/if}
			<br><br>
		</td>
	</tr>
	<input type="hidden" name="Action" />
	<input type="hidden" name="cat_parent_id" />
	</form>
</table>