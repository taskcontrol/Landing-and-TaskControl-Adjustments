<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">
	<form name="frmNewsletter" action="{$smarty.server.PHP_SELF}" method="post" >
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Newletter Management [ {$Action} ]</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td align="center"><strong>{$Action} News.</strong></td>
				</tr>
				<tr><td height="2"></td></tr>
				<tr><td height="2"></td></tr>
			</table>
			<table border="0" cellpadding="1" cellspacing="2" width="75%">
			{if $Action=='Edit'}
			    <tr>
					<td class="fieldlabelRight" valign="top" width="30%">News Title :</td>
					<td class="fieldLabelLeft">
						<input type="text" name="news_title" value="{$title}"size="40" maxlength="50" class="textbox"></td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">News Description :</td>
					<td class="fieldLabelLeft"><textarea name="new_desc" cols="50" rows="5">{$desc}</textarea></td>
				</tr>
			{else}
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">News Title :</td>
					<td class="fieldLabelLeft">
						<input type="text" name="en_news_title" size="40" maxlength="50" class="textbox"></td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">News Description :</td>
					<td class="fieldLabelLeft"><textarea name="en_news_desc" cols="50" rows="5"></textarea></td>
				</tr>
			{/if}
			   	<tr>
				  <td colspan="2" align="center">&nbsp;
							<input type="submit" name="Submit" value="Save" class="stdButton" onClick="javascript: return Validate_Form(document.frmNewsletter);" tabindex="4">
				    &nbsp;&nbsp;&nbsp;
				    <input type="submit" name="Submit2" value="Cancel" class="stdButton" /></td>
				</tr>
			</table>	
			<br>
			<input type="hidden" name="Action" value="{$Action}"/>
			<input type="hidden" name="news_id" value="{$news_id}" />
			<br>
		</td>
	</tr>
	</form>
</table>