<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" >

	<form name="frmnetellerRequest" action="{$smarty.server.PHP_SELF}" method="post" >

	<tr>

		<td valign="top">

			<table border="0" cellpadding="0" cellspacing="0" width="100%">

				<tr>

					<td class="pagetitle" width="49%" height="25">Neteller's Pending Request Management </td>

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

						Manage Neteller's Pending Request Management . Edit/Delete Withdraw Money.

					<div align="right">Page Size:

					  <select name="page_size" onChange="JavaScript: document.frmNetellerRequest.submit();">

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

					<td colspan="6" class="varnormal"><font color="#9D0027">Red Indicates Neteller's Pending Requested (Pending)</font></td>

				</tr>

				<tr>

					<td colspan="6" class="varnormal"><font color="#339900">Green Indicates Neteller's Pending Request Relieved</font></td>

				</tr>

				<tr>

				    <td>&nbsp;</td>

				</tr>

				<tr>

					<td width="5%" class="headTitle">&nbsp;</td>

					<td width="19%" class="headTitle" align="center">Name </td>

					<td width="19%" class="headTitle" align="center">Amount </td>

					<td width="19%" class="headTitle" align="center">Requested Date</td>

					<td width="19%" class="headTitle" align="center">Status</td>

					<td width="19%" class="headTitle" align="center">Action</td>

				</tr>

			{section name=pending_neteller_request loop=$Loop}

				<tr class="{cycle values='list_A, list_B'}">

					<td width="5%"><input class="stdCheckBox" type="checkbox" name="cat_prod[]" value="{$pendingmoney[pending_neteller_request].id}" align="middle"></td>

					<td class="bodytextblack">

					{if $pendingmoney[pending_neteller_request].status == 0}

							&nbsp;<font color="#9D0027">

					{else}

						&nbsp;<font color="#339900">

					{/if}&nbsp;{$pendingmoney[pending_neteller_request].user_name}</td>

					<td class="bodytextblack">

					{if $pendingmoney[pending_neteller_request].status == 0}

						&nbsp;<font color="#9D0027">

					{else}

						&nbsp;<font color="#339900">

					{/if}&nbsp;{$Curreny}&nbsp;{$pendingmoney[pending_neteller_request].amount}</td>

					<td class="bodytextblack">

					{if $pendingmoney[pending_neteller_request].status == 0}

						&nbsp;<font color="#9D0027">

					{else}

						&nbsp;<font color="#339900">

					{/if}&nbsp;{$pendingmoney[pending_neteller_request].pending_date}</td>

					{if $pendingmoney[pending_neteller_request].status == 0}

					<td class="bodytextblack">&nbsp;<font color="#9D0027">&nbsp;Requested (Pending)</td>

					{else}

					<td class="bodytextblack">&nbsp;<font color="#339900">&nbsp;Relived</td>

					{/if}

				    <td align="center">

						<img src="{$Templates_Image}edit.gif" 	class="imgAction" title="Edit" onClick="JavaScript: Edit_Click('{$pendingmoney[pending_neteller_request].id}');">&nbsp;&nbsp;

				</td>	

				</tr>

			{/section}

			</table>

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

	<input type="hidden" name="pk_id" />

	</form>

</table>