<script language="javascript">
	var JS_Email		 = '{$lang.JS_Email}';
	var JS_violation	 = '{$lang.JS_violation}';
	var JS_Person		 = '{$lang.JS_Person}';
	var JS_Url			 = '{$lang.JS_Url}';
	var JS_En_Violation	 = '{$lang.JS_En_Violation}';
	var JS_Url_Text		 = '{$lang.JS_Url_Text}';
</script>
<div id="list_head">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div>

							<span class="style9"><font color=black>{$lang.Report_Violation}</font></span>
</div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
					
					<div style="  clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>

<form method="post" action="{$smarty.server.PHP_SELF}" name="frmViolation">
<table width="80%" align="center" cellpadding="0" cellpadding="0" >
   	<tr>
	    <td align="justify" class="bodytextblack" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>{$lang.Report_Violation_Text}</strong></td>
	</tr>
	<tr>
	   <td colspan="2">&nbsp;</td>
   </tr>
	<tr>
		<td width="50%">
		<table cellpadding="0" cellspacing="0" width="55%" style="margin-left:20px;" >
		 		<tr class="style3">
						<td width="24%">&nbsp;{$lang.Your_Name} :</td>
						<td width="20%" colspan="3">&nbsp;</td>
						
						<td></td>
						<td height="26" style="background-color:#FFFFFF;"><input name="your_name"  type="text" style="border:1px solid #ABABAB; padding:3px; border-radius: 2px;" tabindex="1" size="25" /></td>
						<td ></td>
						<td>&nbsp;<strong class="optional">({$lang.Option})</strong></td>

			</tr>
				
				
				<tr><td height="6"></td></tr>
				
				<tr class="style3">
						<td width="24%">&nbsp;{$lang.Your_Email} :</td>
						<td width="19%" colspan="3">&nbsp;</td>
						
						<td></td>
						<td height="26" style="background-color:#FFFFFF;"><input name="your_email"  type="text" style="border:1px solid #ABABAB; padding:3px; border-radius: 2px;" tabindex="2" size="25" /></td>
						<td ></td>
						<td>&nbsp;<strong class="optional">({$lang.Option})</strong></td>
				</tr>
				
				
				<tr><td height="6"></td></tr>
				
				<tr class="style3">
						<td width="32%">&nbsp;{$lang.Your_Username} :</td>
						<td width="19%" colspan="3">&nbsp;</td>
						
						<td></td>
						<td height="26" style="background-color:#FFFFFF;"><input name="your_username"  type="text" style="border:1px solid #ABABAB; padding:3px; border-radius: 2px;" tabindex="3" size="25" /></td>
						<td ></td>
						<td>&nbsp;<strong class="optional">({$lang.Option})</strong></td>
			</tr>
		  </table>
			<table style="margin-left:20px;">	
				
				<tr><td height="6"></td></tr>
				
				<tr class="style3">
					<td width="46%">{$lang.Violation} : </td>
					<td>&nbsp;&nbsp;&nbsp;
					<select name="violation_list" style="border:1px solid #ABABAB; padding:3px; border-radius: 2px; width:185px;" tabindex="4">
							<option value="0" >(Please select violation)</option>
							{$violation_list}
					</select>	</td>
				</tr>
			</table>
			<table cellpadding="0" cellspacing="0" width="48%" style="margin-left:20px;">
				<tr><td height="6"></td></tr>
				
				<tr class="style3">
						<td width="75%">&nbsp;{$lang.Other_person_Username} :</td>
						<td width="20%"></td>
						
						<td></td>
						<td height="20" style="background-color:#FFFFFF;"><input name="other_person_name"  type="text" style="border:1px solid #ABABAB; padding:3px; border-radius: 2px;" tabindex="5" size="25" /></td>
						<td ></td>
						<td></td>
				</tr>
				
				<tr><td height="6"></td></tr>
				
				<tr class="style3">
						<td>&nbsp;{$lang.URL} :</td>
						<td></td>
						
						<td></td>
						<td height="26" style="background-color:#FFFFFF;"><input name="url"  type="text" style="border:1px solid #ABABAB; padding:3px; border-radius: 2px;" tabindex="6" size="25" /></td>
						<td ></td>
						<td></td>
				</tr>
			</table>
			<table>
				
				<tr><td height="6"></td></tr>
				
				<tr class="style3">
						<td width="24%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$lang.Violation_Details} :</td>
						<td width="19%" colspan="3">&nbsp;</td>
						
						
			</tr>
				<tr>
				
				<tr><td height="6"></td></tr>
				
				<tr>
					<td colspan="2">
						<table cellpadding="3" cellspacing="4" border="0" width="88%" class="english">
							<tr>
								<td class="bodytextblack"> <textarea name="en_violation_details" class="textbox" cols="90" rows="10" style="border:1px solid #ABABAB; padding:3px; border-radius: 2px;"></textarea></td>
							</tr>
							<tr>
								<td align="right">
								<br>
								<input id="btnbg" type="submit" name="Submit" value="{$lang.Violation_Send}" class="login_txt style5" onClick="javascript: return Check_Details_Violation(document.frmViolation);"></td>
							</tr>
					  </table>
					</td>
				</tr>
				
		</table>
			
		</td>
		{if $Loop != ''}
		<td width="25%" valign="top" class="bodytextblack" bgColor="#F9FAFC" >
			<table width="100%" align="center" cellpadding="0" cellspacing="0" >
				{section name=contact loop=$Loop} 
				<tr align="center">
					<td colspan="2" align="left" class="bodytextblack1">&nbsp;<strong>Division {$arr_contact[contact].contact_country}</strong></td>
				</tr>
				<tr align="center">
					<td class="bodytextblack1" align="left" width="22%">&nbsp;Phone : </td>
					<td class="bodytextblack1" align="left" width="78%">
						{$arr_contact[contact].phone}					</td>
				</tr>
				<tr align="center">	
					<td class="bodytextblack1" align="left" width="22%" >&nbsp;Fax :</td>
					<td class="bodytextblack1" align="left" width="78%">
						{$arr_contact[contact].fax}					</td>
				</tr>
				<tr>
				    <td colspan="2">&nbsp;</td>
				</tr>
				{/section}
			</table>
		</td>
		{/if}
	</tr>
</table>
<input type="hidden" name="Action" value="Send">
</form>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
	<div id="more_link">
		
	</div>
</div>