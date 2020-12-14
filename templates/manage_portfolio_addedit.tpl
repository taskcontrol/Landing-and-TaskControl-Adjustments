<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Manage Your Portfolio(s)</h1>
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
	var JS_En_Title		 	 = '{$lang.JS_En_Title}';
	var JS_En_Desc			 = '{$lang.JS_En_Desc}';
	var JS_Image			 = '{$lang.JS_Image}';
	var JS_Image_Desc		 = '{$lang.JS_Image_Desc}';
	var JS_Cate			 = '{$lang.JS_Cate}';
	var JS_Cate_Max			 = '{$lang.JS_Cate_Max}';
	var JS_Image_Del		 = '{$lang.JS_Image_Del}';
	
	addLoadEvent(prepareInputsForHints);
</script>
<div id="list_head">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>

							<span class="style9"><font color=black>{if $flag == 1}
													{$lang.Add_Portfolio}
												{/if}	
												{if $flag == 0}
													{$lang.Update_Portfolio}
												{/if}	</font></span>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
					
<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>

<form method="post" action="{$smarty.server.PHP_SELF}" name="frmeditSeller" enctype="multipart/form-data">
<table width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="0">
	
	<tr>
		<td>
			<table width="95%" border="0" align="center">
				<tr>
					<td align="center" class="successMsg" colspan="2">{$ERROR}</td>
				</tr>     
				<tr>
					<td>
						<table cellpadding="3" cellspacing="4" border="0" width="98%">
							
							<tr>
								<td width="51%" class="bodytextblack">{$lang.Title_En} :</td>
							</tr>
							<tr><td height="3"></td></tr>
							<tr>		
									<td width="49%">
									 <table cellpadding="0" cellspacing="0" border="0">
									   <tr>
										 <td></td>
											<td height="26" style="background-color:#FFFFFF;"><input name="en_seller_title" value="{$en_seller_title}"  type="text"style="border:1px solid #000000;" size="110" maxLength="50" /></td>
											<td></td>
											<td></td>
									   </tr>
									   </table>
									</td>
								
							</tr>
							<tr><td height="3"></td></tr>
							
							<tr>
							  <td class="bodytextblack"> {$lang.Description_En} :<br><br />
								<textarea name="en_seller_description" class="textbox" cols="90" rows="10">{$en_seller_description}</textarea></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="95%" border="0" align="center">
				<tr>
				  <td class="bodytextblack">{$lang.Indu_sample} :<br /><br>
						<select name="industry" class="textbox">
							{$Industry_List}
						</select>				</td>
					<td class="bodytextblack">{$lang.Exe_time} :<br /><br />
					<select name="exe" class="textbox">
							{$Execution_List}
						</select>					</td>
				</tr>
				<tr>
					<td height="20"></td>
				</tr>
				<tr>
				  <td class="bodytextblack">{$lang.Dev_cost} :<br /><br />
					<select name="dev" class="textbox">
							{$Development_List}
					</select>				</td>
					<td class="bodytextblack">{$lang.Sample_File} :<br /><br />
					<input type="file" name="sample_file" class="textbox">
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>{if $sample_file != NULL}
						  <img src="{$path}{$sample_file}" height="100" width="100"/>
								  <BR />
							    <a href="Javascript: Delete_Image('{$User_Id}','{$pro_id}')" class="footerlink" >{$lang.Remove_Link}</a>
					{/if}</td>
				</tr>
			</table>
			<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
				<tr>
					<td colspan="2" class="bodytextblack"><strong>{$lang.Cat_note}</strong></td>
				</tr>
				<tr>
					<td height="20"></td>
				</tr>
				{assign var="col" value=2}
				{section name=prod loop=$Loop}
				{if $smarty.section.prod.iteration|mod:$col==1}
				<tr>
				{/if}
					<td valign="top" width="50%" class="bodytextblack" align="left">
					<input class="stdCheckBox" type="checkbox" name="cat_prod[]" id="cat_prod[]" value="{$catid[prod]}" {if $catid[prod]|in_array:$arr_categories}checked{/if} >&nbsp;{$catname[prod]}
					<span id="ExpandShow_{$smarty.section.prod.index}" style="visibility:visible;">
						(<a href="javascript: show_Resume('{$smarty.section.prod.index}')" class="footerlink">{$lang.More_specific}</a>)
					</span>
					<span id="ExpandHide_{$smarty.section.prod.index}" style="visibility:hidden;display:none;">
						(<a href="javascript: hide_Resume('{$smarty.section.prod.index}')" class="footerlink">{$lang.More_specific}</a>)
					</span>
					<span id="subcat_{$smarty.section.prod.index}" style="visibility:hidden;display:none;">
						<table width="85%" align="center" style="margin-left:10px;">
							{foreach name=subcategory from=$sub_cat[prod] item=subcategory}
							<tr>
								<td class="bodytextblack"><input class="stdCheckBox" type="checkbox" name="cat_prod[]" value="{$subcategory->cat_id}"  {if $subcategory->cat_id|in_array:$arr_categories}checked{/if} />&nbsp;{$subcategory->cat_name}</td>
							</tr>
							{/foreach}
						</table>
						</span>
					</td>
				{if $smarty.section.prod.iteration|mod:$col==0}
				</tr>
				{/if}
				{/section}
				<tr>
					<td height="20"></td>
				</tr>
				<tr>
				   <td align="right" class="bodytextblack" colspan="2">				   
				   <input id="btnbg2" type="submit" name="Submit" value="{$lang.Save_Portfolio}" class="login_txt style5" onClick="Javascript: return Check_Details(this.form);">
				   </td>
				</tr>
			</table>
		</td>
	</tr>
</table>		
<input type="hidden" name="Action" value="{$Action}">
<input type="hidden" name="User_Id" value="{$User_Id}">
<input type="hidden" name="pro_id" value="{$pro_id}"/>
<input type="hidden" name="image" value="{$sample_file}" />
</form>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
					<div id="more_link">
						
						
						
					</div>
				</div>