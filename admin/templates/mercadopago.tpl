<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">

	<form name="frmSiteConfig" action="{$smarty.server.PHP_SLEF}" method="post">

	<tr>

		<td valign="top">

			<table border="0" cellpadding="0" cellspacing="0" width="100%">

				<tr>

					<td class="pagetitle" width="49%" height="25">MercadoPago Management</td>

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

					<td class="fieldlabelRight" valign="top">SandBox or Live </td>

					<td class="fieldlabelLeft">

					{if $smarty.session.Admin_Perm == 'Subadmin' }

						{$mercadopago_sendbox}

					{else}  	

						<input type="text" name="mercadopago_sendbox" class="textbox" value="{$mercadopago_sendbox}" />&nbsp;(set 1 for Sandbox and 0 for live)

					{/if}	

					</td>

				</tr>

		        <tr>

				    <td class="fieldlabelRight1" align="center" colspan="2">Data settings</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">CLIENT_ID</td>

					<td class="fieldlabelLeft">
						<input type="text" name="mercadopago_clientId" class="textbox" value="{$mercadopago_clientId}" /> (https://www.mercadopago.com/mla/herramientas/aplicaciones)
					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">CLIENT_SECRET</td>

					<td class="fieldlabelLeft">
						<input type="text" name="mercadopago_clientSecret" class="textbox" value="{$mercadopago_clientSecret}" /> (https://www.mercadopago.com/mla/herramientas/aplicaciones)
					</td>

				</tr>

				<tr>

				    <td>&nbsp;</td>

				</tr>

				<tr>

				    <td class="fieldlabelRight1" align="center" colspan="2">Details for Deposit Money On MercadoPago</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">MercadoPago Email ID </td>
					<td class="fieldlabelLeft">

					{if $smarty.session.Admin_Perm == 'Subadmin' }

						{$mercadopago_mail}

					{else}

						<input type="text" name="mercadopago_mail" class="textbox" value="{$mercadopago_mail}" />&nbsp;

					{/if}	

					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">MercadoPago Fix Amount Charge</td>

				  <td class="fieldlabelLeft">

						<input type="text" name="mercadopago_fix_amount" class="textbox" value="{$mercadopago_fix_amount}" />

					  &nbsp;{$Curreny}					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">MercadoPago Percentage </td>

					<td class="fieldlabelLeft">

						<input type="text" name="mercadopago_percentage" class="textbox" value="{$mercadopago_percentage}" />&nbsp;(in %)

					</td>

				</tr>

	            <tr>

				    <td>&nbsp;</td>

				</tr>

				<tr>

				    <td class="fieldlabelRight1" align="center" colspan="2">Details for Withdraw Money On MercadoPago</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">MercadoPago Email ID </td>

					<td class="fieldlabelLeft">

					{if $smarty.session.Admin_Perm == 'Subadmin' }

						{$mercadopago_mail}

					{else}

						{$mercadopago_mail}&nbsp;

					 {/if}	

					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">MercadoPago Fix Amount Charge</td>

				  <td class="fieldlabelLeft">

						<input type="text" name="mercadopago_fix_amount_withdraw" class="textbox" value="{$mercadopago_fix_amount_withdraw}" />&nbsp;{$Curreny}					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top">MercadoPago Percentage </td>

					<td class="fieldlabelLeft">

						<input type="text" name="mercadopago_percentage_withdraw" class="textbox" value="{$mercadopago_percentage_withdraw}" />&nbsp;(in %)

					</td>

				</tr>

				<!--<tr>

					<td class="fieldlabelRight" valign="top">MercadoPago Deposit</td>

					<td class="fieldlabelLeft">

						<input type="text" name="mercadopago_deposit" class="textbox" value="{$mercadopago_deposit}" />&nbsp;(in %)

					</td>

				</tr>-->

				<tr><td class="divider" colspan="2"></td></tr>

				<tr>

					<td align="center" colspan="2">

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