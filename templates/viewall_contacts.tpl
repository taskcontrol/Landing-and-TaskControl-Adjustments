 <div id="list_head">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
<span class="style9"><font color=black>{$lang.View_All_Contact} {$sender_name}</font></span>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>

					<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
 <table width="100%" bgcolor="#FFFFFF" border="0" align="center">
    <!--<tr>
	    <td colspan="2" class="bodytextblack"><strong>{$lang.View_All_Contact} {$sender_name}</strong></td>
	</tr>-->
	<tr>
		<td colspan="2">&nbsp;</td>	  
	</tr>
	<tr>
		<td colspan="2">
			<table width="100%" bgcolor="#FFFFFF" border="0" cellpadding="0" cellspacing="0">
				<tr bgcolor="#4D8CBA">
					<td class="bodytextwhite" align="center" width="20%" height="20"><strong>{$lang.Project_Service}</strong></td>
					<td class="bodytextwhite" align="center" width="30%" ><strong>{$lang.Project_Service_Description}</strong></td>
					<td class="bodytextwhite" align="center" width="20%" ><strong>{$lang.Uploaded_File}</strong></td>
					<td class="bodytextwhite" align="center" width="20%" ><strong>{$lang.Date}</strong></td>
				</tr>
				{section name=contact_details loop=$Loop}
				   	<tr class="{cycle values='list_A, list_B'}">
				      	<td align="center" class="bodytextblack" width="20%" height="20" valign="top">{$acontact[contact_details].Project_Service|wordwrap:25:"\n":true}</td>
						<td align="center" class="bodytextblack" width="30%" valign="top">&nbsp;{$acontact[contact_details].Project_Service_Description|wordwrap:50:"\n":true}</td>
						<td align="center" class="bodytextblack" width="20%">
						{if $acontact[contact_details].Image_file!= ''}
						<a href="Javascript: Download_File('{$acontact[contact_details].Image_file}','Contact');" class="footerLink">{$acontact[contact_details].file1}</a>
						{else}
							{$lang.No_File_uploaded}.
						{/if}
						</td>
						<td align="center" class="bodytextblack" width="20%" valign="top">{$acontact[contact_details].date}</td>
					</tr>
				{/section}
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>	  
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" name="Submit" value="{$lang.Button_Close}" class="login_txt style5" onclick="javascript : window.close();"></td>	  
	</tr>
</table>
 </div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>

</div>
					
					<div id="more_link">
						
						
						
					</div>
				</div>