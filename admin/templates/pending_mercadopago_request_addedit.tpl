<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">
	<form name="frmPendingMoney" action="{$smarty.server.PHP_SELF}" method="post" >
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Pending Requests Management [ {$Action} ]</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td align="center"><strong>{$Action} Pending Requests Management.</strong></td>
				</tr>
				<tr><td height="2"></td></tr>
				<tr><td height="2"></td></tr>
			</table>
			<table border="0" cellpadding="1" cellspacing="2" width="75%">
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">User Name :</td>
					<td class="fieldLabelLeft">{$user_name}</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">Amount Requested for Deposite :</td>
					<td class="fieldLabelLeft"><span class="fieldlabelLeft">{$Curreny}</span>&nbsp;{$amount}</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">Pending Date :</td>
					<td class="fieldLabelLeft">{$pending_date}</td>
				</tr>
				{if $status_chk != '1'}
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">Status :</td>
					<td class="fieldLabelLeft">
						<input type="checkbox" name="with_status" value="1" class="stdCheckBox" {$with_status}>					</td>
				</tr>
				{else}
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">Status :</td>
					<td class="fieldLabelLeft">Payment Deposite Successfully.</td>
				</tr>
				{/if}
				<tr>
				  <td colspan="2" align="center">&nbsp;
				  {if $status_chk != '1'}
							<input type="submit" name="Submit" value="Save" class="stdButton">
				    &nbsp;&nbsp;&nbsp;{/if}
				    <input type="submit" name="Submit" value="Cancel" class="stdButton" />
					</td>
				</tr>
			</table>	
			<br>
			<input type="hidden" name="Action" value="{$Action}"/>
			<input type="hidden" name="pk_id" value="{$pk_id}" />
			<input type="hidden" name="user_auth_id" value="{$user_auth_id}" />
			<input type="hidden" name="user_name" value="{$user_name}" />
			<input type="hidden" name="amount" value="{$amount}" />
			<input type="hidden" name="pending_date" value="{$pending_date}" />
			<br>
		</td>
	</tr>
	</form>
</table>