<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">

	<form name="frmRequest" action="{$smarty.server.PHP_SELF}" method="post" >

	<tr>

		<td valign="top">

			<table border="0" cellpadding="0" cellspacing="0" width="100%">

				<tr>

					<td class="pagetitle" width="49%" height="25">DineroMail's Pending Request [ {$Action} ]</td>

				</tr>

			</table>

		</td>

	</tr>

	<tr>

		<td valign="top" align="center">

			<table border="0" cellpadding="1" cellspacing="2" width="95%">

				<tr><td>&nbsp;</td></tr>

				<tr>

					<td align="center"><strong>{$Action} DineroMail's Pending Request.</strong></td>

				</tr>

				<tr><td height="2"></td></tr>

				<tr><td height="2"></td></tr>

			</table>

			<table border="0" cellpadding="1" cellspacing="2" width="75%">

				<tr>

					<td class="fieldlabelRight" valign="top" width="30%">User Name:</td>

					<td class="fieldLabelLeft">{$user_name}</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top" width="30%">Amount Requested:</td>

					<td class="fieldLabelLeft"><span class="fieldlabelLeft">$</span>&nbsp;{$usdAmount}</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top" width="30%">Original pay:</td>

					<td class="fieldLabelLeft"><span class="fieldlabelLeft">{$currency_id}</span>&nbsp;{$amount}</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top" width="30%">Description:</td>

					<td class="fieldLabelLeft"><span class="fieldlabelLeft">{$description}</td>

				</tr>

				<tr>

					<td class="fieldlabelRight" valign="top" width="30%">Status:</td>

					<td class="fieldLabelLeft">

						<input type="checkbox" name="with_status" value="1" class="stdCheckBox">

					</td>

				</tr>

				<tr>

				  <td colspan="2" align="center">&nbsp;

					<input type="submit" name="Submit" value="Save" class="stdButton">

				    &nbsp;&nbsp;&nbsp;

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
			<input type="hidden" name="usdAmount" value="{$usdAmount}" />
			<input type="hidden" name="currency_id" value="{$currency_id}" />
			<input type="hidden" name="description" value="{$description}" />

			<br>

		</td>

	</tr>

	</form>

</table>