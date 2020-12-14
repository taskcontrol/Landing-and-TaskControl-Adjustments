<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">
            {if $User_Id != $Recevier_id and $msg!= TRUE}
							{$lang.Re_Post_Project}
							{/if}</h1>
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
	var JS_Cats		 = '{$lang.JS_Cats}';
	var JS_en_title	 = '{$lang.JS_en_title}';
	var JS_en_dec	 = '{$lang.JS_en_dec}';
	var JS_Bid		 = '{$lang.JS_Bid}';
	var JS_Dev		 = '{$lang.JS_Dev}';
	var JS_Term		 = '{$lang.JS_Term}';
	addLoadEvent(prepareInputsForHints);
</script>



<section class="folio" id="folio" style="background:#fff;">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
  <form method="post" action="{$smarty.server.PHP_SELF}" name="frmrepublishpostproject" enctype="multipart/form-data">
  {if $User_Id != $Recevier_id and $msg!= TRUE}

  {if $ERROR} <h3>{$ERROR}</h3><br><br>{/if}

  {include file="$T_Balance"}
  <br><br>
  
  {$lang.Note1} <a href="Javascript: View_Terms1()" class="footerlink"><strong>{$lang.Project_Guidelines}</strong></a> {$lang.Note2}.
  <br>
  {$lang.post_note_1}
  <br><br>

  
  <input placeholder="{$lang.Project_Title}" name="en_project_title" value="{$en_project_title}"  type="text" size="110" maxLength="50" />
  <br><br>
  {$lang.Project_Dec} <a href="Javascript: View_Terms()" class="footerlink">{$lang.Term}.</a>
  <br>
  <textarea name="en_project_description" class="textbox" cols="90" rows="10" >{$en_project_description}</textarea>
  <br><Br>
<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td colspan="2" class="bodytextblack"><strong>{$lang.Cats}</strong></td>
	</tr>
	<tr>
	    <td colspan="2">&nbsp;</td>
	</tr>
 {assign var="col" value=2}
	{section name=prod loop=$Loop}
	{if $smarty.section.prod.iteration|mod:$col==1}
	<tr>
	{/if}
  
	<td valign="top" width="50%" class="bodytextblack" align="left">
		<input class="stdCheckBox" type="checkbox" name="cat_prod[]" id="cat_prod[]" value="{$catid[prod]}" {if $catid[prod]|in_array:$arr_categories}checked{/if} >
		&nbsp;{$catname[prod]}
		<span id="ExpandShow_{$smarty.section.prod.index}" style="visibility:visible;">
			(<a href="javascript: show_Resume('{$smarty.section.prod.index}')" class="footerlink">{$lang.More_specific}</a>)		</span>
		<span id="ExpandHide_{$smarty.section.prod.index}" style="visibility:hidden;display:none;">
			(<a href="javascript: hide_Resume('{$smarty.section.prod.index}')" class="footerlink">{$More_specific}</a>)		</span>
		
			<span id="subcat_{$smarty.section.prod.index}" style="visibility:hidden;display:none;">
			<table width="85%" align="center" style="margin-left:10px;">
				{foreach name=subcategory from=$sub_cat[prod] item=subcategory}
				<tr>
					<td class="bodytextblack"><input class="stdCheckBox" type="checkbox" name="cat_prod[]" value="{$subcategory->cat_id}"  {if $subcategory->cat_id|in_array:$arr_categories}checked{/if} />&nbsp;&nbsp;{$subcategory->cat_name}</td>
				</tr>
				{/foreach}
			</table>
			</span>		</td>
	{if $smarty.section.prod.iteration|mod:$col==0}	</tr>
	{/if}
	{/section}
	
	</table>
  <br><br>
  {$lang.Upload_Img} : ({$lang.File_1})<br>
  {if $project_file_1}<input class="textbox" type="checkbox" name="file_1" value="1" id="file_1" {$unchecked} onclick="javascript: show_file(this.value)" >
			 	{$project_file_1}&nbsp;&nbsp;({$lang.Cheak_Here}){/if}
			 	</p>{if $project_file_2}
			 	<input class="textbox" type="checkbox" name="file_2" value="1" id="file_2" {$unchecked} onclick="javascript: show_file(this.value)" >
				 {$project_file_2}&nbsp;&nbsp;({$lang.Cheak_Here}){/if}
			 	</p>{if $project_file_3}
				 <input class="textbox" type="checkbox" name="file_3" value="1" id="file_3" {$unchecked} onclick="javascript: show_file(this.value)" >
				 {$project_file_3}&nbsp;&nbsp;({$lang.Cheak_Here}){/if}
				 <input type="hidden" name="file_name1" value="{$project_file_11}" />	
				 <input type="hidden" name="file_name2" value="{$project_file_21}" />
				 <input type="hidden" name="file_name3" value="{$project_file_31}" />
  
  
  
  
  <div id="File_Hide_Details"  style="visibility:'visible':'hidden';display:'block':'none';">
					  <input type="file" name="project_file_1" tabindex="3"/>
					  </div></p>
					  <p>
						<div id="File_Hide_Details1"  style="visibility:'visible':'hidden';display:'block':'none';">
						<input type="file" name="project_file_2" tabindex="4"/>
					  </div></p>
					  <p>
						 <div id="File_Hide_Details2" style="visibility:'visible':'hidden';display:'block':'none';">
						<input type="file" name="project_file_3" tabindex="5"/>
		
					 </div></p>
					 
{$lang.Budget}
<br>
 <select name="dev" class="textbox" tabindex="6">
    <option value="0">( {$lang.Please_Choose_Budget} )</option>
	  {$Development_List}<span id="hinter" class="hintpostproject">{$lang.Hint_Empty_Project_Title}<span class="hint-pointer">&nbsp;</span></span>
  </select>
<br>
  <span id="hinter" class="hintprojectbugdet">{$lang.Hint_Select_Budget_Range}<span class="hint-pointer">&nbsp;</span></span>	
		  
		  <br><br>
  {$lang.Days_Of_Bidding}
  <br>
   <select name="bidding" class="textbox" tabindex="7">
	    <option value="0">-----</option>
		  {$Bidding_List}
	  </select><br><span id="hinter" class="hintpostproject">{$lang.Hint_Empty_Project_Title}<span class="hint-pointer">&nbsp;</span></span>
	  <span id="hinter" class="hintprojectbiddays">{$lang.Hint_Select_Open_Day}<span class="hint-pointer">&nbsp;</span></span>

    <br><br>
  
  {$lang.Addtional_Options}<br>
  <input type="checkbox" name="project_options1" value="1" tabindex="8"/> {$lang.Option1}
  <br>
  <input type="checkbox" name="project_options2" value="1" tabindex="9"/> {$lang.Option2}
   <br>
  
  {if $flag == 0 }
	  <input type="checkbox" name="premium_project" value="1" tabindex="10"/>
  {/if}

  {if $flag == 1 }
	  <input type="checkbox" name="premium_project" value="1" disabled="disabled" tabindex="10" />
  {/if}
  
  {$lang.Option3}
  <br><br>
  {$lang.Premium_Text_1}{$Premium_Fees} {$lang.Premium_Text_2}<BR />
  {$lang.Premium_Text_3}<br>
	{if $flag == 0 }
		<input type="checkbox" name="urgent_project" value="1" tabindex="11"/>
	{/if}
	{if $flag == 1 }
		<input type="checkbox" name="urgent_project" value="1" disabled="disabled" tabindex="11"/>
	{/if}
{$lang.Urgent}
 <br><br>
{$lang.Urgent_text_1}{$lang.Urgent_Fees}{$lang.Urgent_text_2}
 <br><br>
<input type="checkbox" name="agree1"> 
        {$lang.Note} <a href="Javascript: View_Terms()" class="footerlink"><strong>{$lang.Project_Guidelines}</strong></a>.
        
         <br><br>
         <input id="btnbg" type="submit" name="Submit" value="{$lang.Submit}" class="btn btn-success" onClick="Javascript: return Check_Details(this.form);" tabindex="11">
         
         <input type="hidden" name="Action" value="Add" />
<input type="hidden" name="user_name" value="{$user_name}" />
<input type="hidden" name="amount" value="{$amount}" />
  {/if}
  </form>

      </div>
    </div>
  </div>
</section>
