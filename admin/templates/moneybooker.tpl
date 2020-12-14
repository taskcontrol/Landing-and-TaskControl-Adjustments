<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">

	<form name="frmSiteConfig" action="{$smarty.server.PHP_SLEF}" method="post">

	<tr>

		<td valign="top">

			<table border="0" cellpadding="0" cellspacing="0" width="100%">

				<tr>

					<td class="pagetitle" width="49%" height="25">Moneybooker Management</td>

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
					<td class="fieldlabelRight" valign="top">Sandbox or Live</td>

					<td class="fieldlabelLeft">

					{if $smarty.session.Admin_Perm == 'Subadmin' }

						{$moneybooker_sendbox}

					{else}

						<input type="text" name="moneybooker_sendbox" class="textbox" value="{$moneybooker_sendbox}" /> (set 1 for Sandbox and 0 for live) &nbsp;

					{/if}	
 
					</td>

				</tr>


   		                <tr>

				    <td class="fieldlabelRight1" align="center" colspan="2">Data settings</td>

				</tr>



				<tr>
					<td class="fieldlabelRight" valign="top">Secret word</td>
					<td class="fieldlabelLeft">
						<input type="text" name="moneybooker_secretWord" class="textbox" value="{$moneybooker_secretWord}" /> (My Account/Developers Settings)
					</td>

				</tr>

				<tr>

				    <td>&nbsp;</td>

				</tr>

				<tr>

				    <td class="fieldlabelRight1" align="center" colspan="2">Details for Deposit Money On Moneybooker</td>

				</tr>

				
				<tr>

					<td class="fieldlabelRight" valign="top">Moneybooker Email ID </td>

					

					<td class="fieldlabelLeft">

					{if $smarty.session.Admin_Perm == 'Subadmin' }

						{$moneybooker_mail}

					{else}

						<input type="text" name="moneybooker_mail" class="textbox" value="{$moneybooker_mail}" />&nbsp;

					{/if}	

					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">Moneybooker Fix Amount Charge</td>

				  <td class="fieldlabelLeft">

						<input type="text" name="moneybooker_fix_amount_deposite" class="textbox" value="{$moneybooker_fix_amount_deposite}" />

						&nbsp;{$Curreny}</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">Moneybooker Percentage </td>

					<td class="fieldlabelLeft">

						<input type="text" name="moneybooker_percentage_deposite" class="textbox" value="{$moneybooker_percentage_deposite}" />&nbsp;(in %)

					</td>

				</tr>

	            <tr>

				    <td>&nbsp;</td>

				</tr>

				<tr>

				    <td class="fieldlabelRight1" align="center" colspan="2">Details for Withdraw Money On Moneybooker</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">Moneybooker Email ID </td>

					<td class="fieldlabelLeft">

					{if $smarty.session.Admin_Perm == 'Subadmin' }

						{$moneybooker_mail}

					{else}

						{$moneybooker_mail}&nbsp;

					 {/if}					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">Moneybooker Fix Amount Charge</td>

				  <td class="fieldlabelLeft">

						<input type="text" name="moneybooker_fix_amount_withdraw" class="textbox" value="{$moneybooker_fix_amount_withdraw}" />

					  &nbsp;{$Curreny}					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">Moneybooker Percentage </td>

					<td class="fieldlabelLeft">

						<input type="text" name="moneybooker_percentage_withdraw" class="textbox" value="{$moneybooker_percentage_withdraw}" />&nbsp;(in %)

					</td>

				</tr>

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