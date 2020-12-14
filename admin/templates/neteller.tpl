<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">

	<form name="frmSiteConfig" action="{$smarty.server.PHP_SLEF}" method="post">

	<tr>

		<td valign="top">

			<table border="0" cellpadding="0" cellspacing="0" width="100%">

				<tr>

					<td class="pagetitle" width="49%" height="25">Neteller Management</td>

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

				    <td class="fieldlabelRight1" align="center" colspan="2">Insert</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">SandBox or Live </td>

					<td class="fieldlabelLeft">

					{if $smarty.session.Admin_Perm == 'Subadmin' }

						{$neteller_sendbox}

					{else}  	

						<input type="text" name="neteller_sendbox" class="textbox" value="{$neteller_sendbox}" />&nbsp;(set 1 for Sandbox and 0 for live)

					{/if}	

					</td>

				</tr>

				<tr>

				    <td>&nbsp;</td>

				</tr>

				<tr>

				    <td class="fieldlabelRight1" align="center" colspan="2">Details for Deposit Money On Neteller</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">Neteller Email ID </td>

					

					<td class="fieldlabelLeft">

					{if $smarty.session.Admin_Perm == 'Subadmin' }

						{$neteller_mail}

					{else}

						<input type="text" name="neteller_mail" class="textbox" value="{$neteller_mail}" />&nbsp;

					{/if}	

					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">Neteller Fix Amount Charge</td>

				  <td class="fieldlabelLeft">

						<input type="text" name="neteller_fix_amount" class="textbox" value="{$neteller_fix_amount}" />

					  &nbsp;{$Curreny}					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">Neteller Percentage </td>

					<td class="fieldlabelLeft">

						<input type="text" name="neteller_percentage" class="textbox" value="{$neteller_percentage}" />&nbsp;(in %)

					</td>

				</tr>

	            <tr>

				    <td>&nbsp;</td>

				</tr>

				<tr>

				    <td class="fieldlabelRight1" align="center" colspan="2">Details for Withdraw Money On Neteller</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">Neteller Email ID </td>

					<td class="fieldlabelLeft">

					{if $smarty.session.Admin_Perm == 'Subadmin' }

						{$neteller_mail}

					{else}

						{$neteller_mail}&nbsp;

					 {/if}	

					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">Neteller Fix Amount Charge</td>

				  <td class="fieldlabelLeft">

						<input type="text" name="neteller_fix_amount_deposit" class="textbox" value="{$neteller_fix_amount_deposit}" />&nbsp;{$Curreny}					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">Neteller Percentage </td>

					<td class="fieldlabelLeft">

						<input type="text" name="neteller_percentage_deposit" class="textbox" value="{$neteller_percentage_deposit}" />&nbsp;(in %)

					</td>

				</tr>

				<!--<tr>

					<td class="fieldlabelRight" valign="top">Neteller Deposit</td>

					<td class="fieldlabelLeft">

						<input type="text" name="neteller_deposit" class="textbox" value="{$neteller_deposit}" />&nbsp;(in %)

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