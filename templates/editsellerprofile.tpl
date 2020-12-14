<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Edit Seller Profile</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->




<script language="javascript">
	var JS_en_slogan		 = '{$lang.JS_en_slogan}';
	var JS_Cate			 = '{$lang.JS_Cate}';
	var JS_Skill_1			 = '{$lang.JS_Skill_1}';
	var JS_Skill_Rate_1		 = '{$lang.JS_Skill_Rate_1}';
	var JS_Image			 = '{$lang.JS_Image}';
	var JS_Indus			 = '{$lang.JS_Indus}';
	var JS_Company_Logo		 = '{$lang.JS_Company_Logo}';
	var JS_Mother_Lang		 = '{$lang.JS_Mother_Lang}';
	var JS_Lang_Pairs		 = '{$lang.JS_Lang_Pairs}';
addLoadEvent(prepareInputsForHints);	
</script>
<div id="list_head">
		<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div>
							<span class="style9"><font color=black>{$lang.Edit_Seller}</font></span>
</div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
					
					<div style=" width:819px; clear:both;">
			<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div>
<form method="post" action="{$smarty.server.PHP_SELF}" name="frmeditSeller" enctype="multipart/form-data">
<table width="100%" bgcolor="#FFFFFF" border="0" align="center">
	<tr>
		<td>
			<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
				
				{if $ERROR}
				<tr>
					<td align="center" class="successMsg" colspan="2">{$ERROR}</td>
				</tr>
				<tr>
					<td align="center" class="successMsg" colspan="2">&nbsp;</td>
				</tr>
				{/if}
				<tr>
					<td>
						<table cellpadding="3" cellspacing="4" border="0" width="98%" class="english">
							<tr>
								<td width="51%" class="bodytext">{$lang.Slogan_En} :</td>
							</tr>
							<tr><td height="3"></td></tr>
							<tr>		
									<td width="49%">
									 <table cellpadding="0" cellspacing="0" border="0">
									   <tr>
										 <td></td>
											<td height="26" style="background-color:#FFFFFF;"><input name="en_seller_slogan" value="{$en_seller_slogan}"  type="text"  style="border:1px solid #ABABAB; padding:3px; border-radius: 2px;" tabindex="1" size="110" maxLength="50" /></td>
											<td></td>
											<td></td>
									   </tr>
									   </table>
									</td>
								
							</tr>
							<tr><td height="3"></td></tr>
							
							
							<tr>
								<td class="bodytext">{$lang.Desc_En} :<br><br />
								<textarea name="en_seller_description" class="textbox" cols="90" rows="10">{$en_seller_description}</textarea></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="95%" border="0" align="center">
				<tr>
					<td width="50%" valign="top">
						<table cellpadding="3" cellspacing="4" border="0" width="98%">
							<tr>
								<td class="bodytext"><strong>{$lang.Rate_Per_Hour} </strong>&nbsp;&nbsp;
								<select name="rate_hour" class="textbox">
									{$Hourly_Rates}
								</select>
								
								<BR><br>{$lang.Rate_Note}
								</td>
							</tr>
							<tr>
								<td class="bodytext">
								<strong>{$lang.Experience}</strong>&nbsp;&nbsp;
								<select name="Experience" class="textbox">
									{$Experience_List}
								</select><BR><br>
								{$lang.Experience_Note}
								</td>
							</tr>
							<tr>
								<td class="bodytextblack"><strong>{$lang.Company_logo}</strong>
								<BR><br>
								<input type="file" class="textbox" name="company_logo">
								</td>
							</tr>
							<tr>
							   <td valign="top" colspan="2">
	  						   	  {if $seller_logo != ''}
								  <img src="{$path}{$seller_logo}" height="100" width="100"/>
								  <BR />
								  <a href="Javascript: Delete_Image('{$User_Id}')" class="footerlinkcommon2" >{$lang.Remove}</a>
								  {/if}
								  {if $seller_logo == ''}
								  
								  <img src="{$path}default.jpg" height="100" width="100"/>
								  {/if}
							   </td>
							</tr>
						</table>
					</td>
					<td width="50%">
						<table cellpadding="3" cellspacing="4" border="0" width="98%">
							<tr>
								<td width="60%" class="bodytextblack"><strong>{$lang.Skill_Title}</strong></td>
								<td width="40%" class="bodytextblack"><strong>{$lang.Skill_Level}</strong></td>
							</tr>
							<tr>
								<td class="bodytext"><input name="skill_name_1" type="text" size="30" value="{$skill_name_1}"></td>
								<td><select name="skill_rate_1">
									<option>{$Skill_Level_1}</option>
									</option>
								</select>
								<input type="hidden" name="skill_id_1" value="{$skill_id_1}" />
								</td>
							</tr>
							<tr>
								<td class="bodytext"><input name="skill_name_2" type="text" size="30" value="{$skill_name_2}"></td>
								<td><select name="skill_rate_2">
									<option>{$Skill_Level_2}</option>
									</option>
								</select>
								<input type="hidden" name="skill_id_2" value="{$skill_id_2}"/>
								</td>
							</tr>
							<tr>
								<td class="bodytext"><input name="skill_name_3" type="text" size="30" value="{$skill_name_3}"></td>
								<td><select name="skill_rate_3">
									<option>{$Skill_Level_3}</option>
									</option>
								</select>
								<input type="hidden" name="skill_id_3" value="{$skill_id_3}"/>
								</td>
							</tr>
							<tr>
								<td class="bodytext"><input name="skill_name_4" type="text" size="30" value="{$skill_name_4}"></td>
								<td><select name="skill_rate_4">
									<option>{$Skill_Level_4}</option>
									</option>
								</select>
								<input type="hidden" name="skill_id_4" value="{$skill_id_4}"/ >
								</td>
							</tr>
							<tr>
								<td class="bodytext"><input name="skill_name_5" type="text" size="30" value="{$skill_name_5}"></td>
								<td><select name="skill_rate_5">
									<option>{$Skill_Level_5}</option>
									</option>
								</select>
								<input type="hidden" name="skill_id_5" value="{$skill_id_5}"/>
								</td>
							</tr>
							<tr>
								<td class="bodytext"><input name="skill_name_6" type="text" size="30" value="{$skill_name_6}"></td>
								<td><select name="skill_rate_6">
									<option>{$Skill_Level_6}</option>
									</option>
								</select>
								<input type="hidden" name="skill_id_6" value="{$skill_id_6}" />
								</td>
							</tr>
							<tr>
								<td class="bodytext"><input name="skill_name_7" type="text" size="30" value="{$skill_name_7}"></td>
								<td><select name="skill_rate_7">
									<option>{$Skill_Level_7}</option>
									</option>
								</select>
								<input type="hidden" name="skill_id_7" value="{$skill_id_7}" />
								</td>
							</tr>
							<tr>
								<td class="bodytext"><input name="skill_name_8" type="text" size="30" value="{$skill_name_8}"></td>
								<td><select name="skill_rate_8">
									<option>{$Skill_Level_8}</option>
									</option>
								</select>
								<input type="hidden" name="skill_id_8" value="{$skill_id_8}" />
								</td>
							</tr>
							<tr>
								<td colspan="2" class="bodytextblack">{$Skill_Note_1}<BR>{$Skill_Note_2}</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="95%" border="0" align="center">
				<tr>
					<td valign="top" class="style3head"><strong>{$lang.Indu_Exp}</strong>
						<table cellpadding="3" cellspacing="4" border="0" width="100%">
						{assign var="col" value=2}
						{section name=prod loop=$Loop}
						{if $smarty.section.prod.iteration|mod:$col==1}
							<tr>
						{/if}
								<td valign="top" width="33%" class="bodytext">
								<input class="stdCheckBox" type="checkbox" name="industry_id[]" id="industry_id[]" value="{$industry_id[prod]}" {if $industry_id[prod]|in_array:$arr_industry}checked{/if}>&nbsp;{$industry_name[prod]}
								</td>
						{if $smarty.section.prod.iteration|mod:$col==0}
							</tr>
						{/if}
						{/section}
						</table>
					</td>
				</tr>
				<tr>
				  <td valign="top">
				<!--<span id="Buyer_Show" style="visibility:visible;">
				<table cellpadding="3" cellspacing="4" border="0" width="100%">
				<tr>
					<td valign="top" width="22%" class="bodytextblack" nowrap="nowrap">{$lang.Translator}</td>
						<td width="78%"><input class="textbox" type="checkbox" name="translator" value="1" onclick="javascript: show_translator()" >&nbsp;
				  </td>

				</tr>
				</table>
				</span>-->
				<!--table border="0" cellpadding="1" cellspacing="2" width="90%">
				<tr>
					<td class="fieldlabelRight1" valign="top" align="left">
						<td valign="top" width="22%" class="bodytextblack" nowrap="nowrap">{$lang.Translator}</td>
						<td width="78%">
						<span id="Buyer_Show" style="visibility:visible;"><input class="textbox" type="checkbox" name="translator" onclick="javascript: show_Buyer({$smarty.post.translator})" >&nbsp;
						</span>
						
					</td>
				</tr>
			</table-->	
			<table border="0" cellpadding="1" cellspacing="2" width="90%">
				<tr>
					<td class="fieldlabelRight1" valign="top" align="left">
						<td valign="top" width="22%" class="bodytextblack" nowrap="nowrap">{$lang.Translator}</td>
						<td width="78%"><input class="textbox" type="checkbox" name="translator" value="1" id="translator" {$checked} onclick="javascript: show_Buyer(this.value)" >&nbsp;</td>
				</tr>
			</table>	
		<div id="Buyer_Hide_Details" style="visibility:{$div_checked};display:{$div_checked_2};">
		
		
		<table cellpadding="3" cellspacing="4" border="0" width="100%">
				
				<tr class="style3">
						<td width="30%">{$lang.Mother_Lang}</td>
						<td>
						 <table cellpadding="0" cellspacing="0">
						  <tr>
							<td><img src="{$Templates_Image}txtleft.jpg" /></td>
								<td height="26" style="background-color:#FFFFFF;"><input name="mother_lang" value="{$mother_lang}" type="text" style="border:1px solid #000000;" size="25" /></td>
								<td ></td>
						  </tr>
						</table>
						</td>	
						
				</tr>
					
				<tr><td height="3"></td></tr>
				<tr>
					<td valign="top" width="22%" class="bodytextblack">{$lang.Lang_Pairs}</td>
					<td><textarea name="lang_pairs" class="textbox" cols="35" rows="5">{$lang_pairs}</textarea>&nbsp;</td>
				</tr>
				</table>
		</div>
				<!--<span id="Buyer_Show" style="visibility:visible;">
				<table cellpadding="3" cellspacing="4" border="0" width="100%">
				<tr>
					<td valign="top" width="22%" class="bodytextblack">{$lang.Mother_Lang}</td>
						<td width="78%"><input class="textbox" type="text" name="mother_lang"  value="{$mother_lang}" >&nbsp;
				  </td>

				</tr>
				<tr>
					<td valign="top" width="22%" class="bodytextblack">{$lang.Lang_Pairs}</td>
					<td><textarea name="lang_pairs" class="textbox" cols="35" rows="5">{$lang_pairs}</textarea>&nbsp;</td>
				</tr>
				</table>
				</span>
				<span id="Buyer_Hide" style="visibility:hidden;display:none;">
				<table cellpadding="3" cellspacing="4" border="0" width="100%">
				<tr>
					<td valign="top" width="22%" class="bodytextblack">{$lang.Mother_Lang}</td>
						<td width="78%"><input class="textbox" type="text" name="mother_lang"  value="{$mother_lang}" >&nbsp;
				  </td>

				</tr>
				<tr>
					<td valign="top" width="22%" class="bodytextblack">{$lang.Lang_Pairs}</td>
					<td><textarea name="lang_pairs" class="textbox" cols="35" rows="5">{$lang_pairs}</textarea>&nbsp;</td>
				</tr>
				</table>
				</span>-->
				 </td>	
				</tr>
				<tr>
				  <td valign="top">
					<table cellpadding="3" cellspacing="4" border="0" width="100%">
						<tr>
							<td align="right" class="bodytextblack">
							<input id="btnbg2" type="submit" name="Submit" value="{$lang.Button}" class="login_txt style5" onClick="Javascript: return Check_Details(this.form);" >
							 </td>
<!--									<td align="right" class="bodytextblack"><input type="submit" name="Submit" value="{$lang.Button}" class="button"> </td>
-->				</tr>
					</table>
				  </td>	
				</tr>
			</table>
		</td>	
	</tr>
</table>
<input type="hidden" name="Action" value="Edit">
<input type="hidden" name="User_Id" value="{$User_Id}">
<input type="hidden" name="img" value="{$seller_logo}"/>
</form>
</div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
					<div id="more_link">
						
						
						
					</div>
				</div>