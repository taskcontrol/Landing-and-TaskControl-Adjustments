<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" >

	<form name="frmPendingMoney" action="{$smarty.server.PHP_SELF}" method="post" >

	<tr>

		<td valign="top">

			<table border="0" cellpadding="0" cellspacing="0" width="100%">

				<tr>

					<td class="pagetitle" width="49%" height="25">Pending Requests Management (On DineroMail) </td>

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

						Manage Pending Requests. Edit/Delete Pending Requests.

					<div align="right">Page Size:

					  <select name="page_size" onChange="JavaScript: document.frmPendingMoney.submit();">

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

					<td colspan="6" class="varnormal"><font color="#9D0027">Red Indicates Deposite money Requested (Pending)</font></td>

				</tr>

				<tr>

					<td colspan="6" class="varnormal"><font color="#339900">Green Indicates Deposite money Relieved</font></td>

				</tr>

				<tr>

				    <td>&nbsp;</td>

				</tr>

				<tr>

					<td width="19%" class="headTitle" align="center">Name </td>

					<td width="19%" class="headTitle" align="center">Amount </td>

					<td width="19%" class="headTitle" align="center">Requested Date</td>

					<td width="19%" class="headTitle" align="center">Status</td>

					<td width="19%" class="headTitle" align="center">Action</td>

				</tr>

			{section name=pending_money loop=$Loop}

				<tr class="{cycle values='list_A, list_B'}">

					<td class="bodytextblack">

					{if $pending[pending_money].status == 0}

							&nbsp;<font color="#9D0027">

					{else}

						&nbsp;<font color="#339900">

					{/if}&nbsp;{$pending[pending_money].user_login_id}</td>

					<td class="bodytextblack">

					{if $pending[pending_money].status == 0}

						&nbsp;<font color="#9D0027">

					{else}

						&nbsp;<font color="#339900">

					{/if}&nbsp;{$Curreny}&nbsp;{$pending[pending_money].amount}</td>

					<td class="bodytextblack">

					{if $pending[pending_money].status == 0}

						&nbsp;<font color="#9D0027">

					{else}

						&nbsp;<font color="#339900">

					{/if}&nbsp;{$pending[pending_money].pending_date}</td>

					<td class="bodytextblack">

					{if $pending[pending_money].status == 0}

						&nbsp;<font color="#9D0027">&nbsp;Requested (Pending)

					{else}

						&nbsp;<font color="#339900">&nbsp;Relived

					{/if}

					</td>

				    <td align="center">

						<img src="{$Templates_Image}edit.gif" 	class="imgAction" title="Edit" onClick="JavaScript: Edit_Click('{$pending[pending_money].id}');">&nbsp;&nbsp;

					</td>	

				</tr>

			{/section}

			</table>

			{*if $smarty.section.pending_money.total > 1*}

			<!--<table border="0" cellpadding="1" cellspacing="1" width="95%">

				<tr>

					<td class="bodytextblack">

						<img src="{$Templates_Image}arrow_ltr.png"> 

						<a href="JavaScript: CheckUncheck_Click(document.all['cat_prod[]'], true);" onMouseMove="window.status='Check All';" onMouseOut="window.status='';" class="actionLink">Check All</a> / 

						<a href="JavaScript: CheckUncheck_Click(document.all['cat_prod[]'], false);" onMouseMove="window.status='Uncheck All';" onMouseOut="window.status='';" class="actionLink">Uncheck All</a>  &nbsp;&nbsp;

						With selected

						<img src="{$Templates_Image}delete.gif" class="imgAction" title="Delete" onClick="JavaScript: DeleteChecked_Click('{$pending[pending_money].id}');">

					</td>

				</tr>

			</table>-->

			{*/if*}

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