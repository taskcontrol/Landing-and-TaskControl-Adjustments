<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">

	<form name="frmSiteConfig" action="{$smarty.server.PHP_SLEF}" method="post">

	<tr>

		<td valign="top">

			<table border="0" cellpadding="0" cellspacing="0" width="100%">

				<tr>

					<td class="pagetitle" width="49%" height="25">DineroMail Management</td>

				</tr>

			</table>

		</td>

	</tr>

	<tr>

		<td valign="top" align="center">

			<table border="0" cellpadding="1" cellspacing="2" width="95%">

				<tr><td>&nbsp;</td></tr>

				<tr><td height="5"></td></tr>

				<tr><td class="successMsg" align="center">{$succMessage}</td></tr>

				<tr><td height="5"></td></tr>

			</table>

			<table border="0" cellpadding="1" cellspacing="2" width="95%">
		        <tr>

				    <td class="fieldlabelRight1" align="center" colspan="2">Data settings</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">IPN Password</td>

					<td class="fieldlabelLeft">
						<input type="text" name="dineromail_ipn_password" class="textbox" value="{$dineromail_ipn_password}" />
					</td>
				</tr>
				<tr>

				    <td>&nbsp;</td>

				</tr>
				<tr>

					<td class="fieldlabelRight" valign="top">Nro de cuenta</td>

					<td class="fieldlabelLeft">
						<input type="text" name="dineromail_nro_cuenta" class="textbox" value="{$dineromail_nro_cuenta}" />
					</td>
				</tr>
				<tr>

				    <td>&nbsp;</td>

				</tr>
				<tr>

				    <td class="fieldlabelRight1" align="center" colspan="2">Details for Deposit Money On DineroMail</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">DineroMail Email ID </td>

					

					<td class="fieldlabelLeft">

					{if $smarty.session.Admin_Perm == 'Subadmin' }

						{$dineromail_mail}

					{else}

						<input type="text" name="dineromail_mail" class="textbox" value="{$dineromail_mail}" />&nbsp;

					{/if}	

					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">DineroMail Fix Amount Charge</td>

				  <td class="fieldlabelLeft">

						<input type="text" name="dineromail_fix_amount" class="textbox" value="{$dineromail_fix_amount}" />

					  &nbsp;{$Curreny}					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">DineroMail Percentage </td>

					<td class="fieldlabelLeft">

						<input type="text" name="dineromail_percentage" class="textbox" value="{$dineromail_percentage}" />&nbsp;(in %)

					</td>

				</tr>

	            <tr>

				    <td>&nbsp;</td>

				</tr>

				<tr>

				    <td class="fieldlabelRight1" align="center" colspan="2">Details for Withdraw Money On DineroMail</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">DineroMail Email ID </td>

					<td class="fieldlabelLeft">

					{if $smarty.session.Admin_Perm == 'Subadmin' }

						{$dineromail_mail}

					{else}

						{$dineromail_mail}&nbsp;

					 {/if}	

					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">DineroMail Fix Amount Charge</td>

				  <td class="fieldlabelLeft">

						<input type="text" name="dineromail_fix_amount_withdraw" class="textbox" value="{$dineromail_fix_amount_withdraw}" />&nbsp;{$Curreny}					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">DineroMail Percentage </td>

					<td class="fieldlabelLeft">

						<input type="text" name="dineromail_percentage_withdraw" class="textbox" value="{$dineromail_percentage_withdraw}" />&nbsp;(in %)

					</td>

				</tr>

				<!--<tr>

					<td class="fieldlabelRight" valign="top">DineroMail Deposit</td>

					<td class="fieldlabelLeft">

						<input type="text" name="dineromail_deposit" class="textbox" value="{$dineromail_deposit}" />&nbsp;(in %)

					</td>

				</tr>-->

				<tr><td class="divider" colspan="2"></td></tr>

				<tr>

					<td align="left" colspan="2">

						<input type="submit" name="Submit" value="Update" class="button">

						<input type="submit" name="Submit" value="Cancel" class="button">

					</td>

				</tr>

			</table>	

			<br>

		</td>

	</tr>

	</form>

</table>