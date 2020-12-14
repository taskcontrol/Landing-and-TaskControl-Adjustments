<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">
            {if $User_Id != $Recevier_id and $msg!= TRUE}
            {$lang.Post_Proj}
            {/if}
            </h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->

<!-- 
http://192.168.1.129/post_project_JSteiner.html 
-->


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
  <div class="container">
    <div class="row">
<!--       <div class="job"> -->
        <form method="post" action="{$smarty.server.PHP_SELF}" name="frmpostproject" enctype="multipart/form-data">
          <div class="col-lg-12"> {$msg} </div> {if $User_Id != $Recevier_id and $msg!= TRUE} {if $ERROR}
          <div class="col-lg-12"> {$ERROR} </div> {/if}
          <div class="col-lg-12"> {include file="$T_Balance"} </div>
          <div class="col-lg-12"> {$lang.Note1} <a href="Javascript: View_Terms1()" class="footerlink"><strong>{$lang.Project_Guidelines}</strong></a> {$lang.Note2}. </div>
          <div class="col-lg-12">
            <p>&nbsp;</p>
          </div>
          <div class="col-lg-12"> {$lang.post_note_1} </div>
          <div class="col-lg-12">
            <hr> </div>
          <div class="col-lg-12">
          
          
            <div class="form-row">
              <div class="form-controls">
                <input name="en_project_title" value="{$smarty.post.en_project_title}" placeholder="{$lang.Project_Title}" maxlength="50" class="form-control" type="text" size="25" style="width:50%"> 
              </div>
            </div>
            <p>&nbsp;</p>
            <div class="form-row">
              <div class="form-controls">
		{$lang.Project_Dec} <a href="Javascript: View_Terms1()" class="footerlink">{$lang.Term}.</a>
		<br>
	      <textarea name="en_project_description" placeholder=""  class="form-control" cols="96" rows="10" tabindex="2">{$smarty.post.en_project_description}</textarea>
	      </div>
            </div>
            
            
            <p>&nbsp;</p>
            
            
            <div class="form-row">
              <div class="form-controls">
		<p>{$lang.Cats}</p>
		<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
		{assign var="col" value=2}
      {section name=prod loop=$Loop}
      {if $smarty.section.prod.iteration|mod:$col==1}
      <tr>
      {/if}
	      <td valign="top" width="50%" class="bodytextblack" align="left">
	      <input class="stdCheckBox" type="checkbox" name="cat_prod[]" id="cat_prod[]" value="{$catid[prod]}" {if $catid[prod]|in_array:$arr_categories}checked{/if} >&nbsp;{$catname[prod]}
	      <span id="ExpandShow_{$smarty.section.prod.index}" style="visibility:visible;" >
		      ( <a href="javascript: show_Resume('{$smarty.section.prod.index}')" class="footerlink">{$lang.More_specific}</a> )		</span>
	      <span id="ExpandHide_{$smarty.section.prod.index}" style="visibility:hidden;display:none;">
		      ( <a href="javascript: hide_Resume('{$smarty.section.prod.index}')" class="footerlink">{$lang.More_specific}</a> )		</span>
	      
		      <span id="subcat_{$smarty.section.prod.index}" style="visibility:hidden;display:none;">
		      <table width="85%" align="center">
			      {foreach name=subcategory from=$sub_cat[prod] item=subcategory}
			      <tr>
				      <td class="bodytextblack">&nbsp;&nbsp;&nbsp;&nbsp;<input class="stdCheckBox" type="checkbox" name="cat_prod[]" value="{$subcategory->cat_id}"  {if $subcategory->cat_id|in_array:$arr_categories}checked{/if} />&nbsp;{$subcategory->cat_name}</td>
			      </tr>
			      {/foreach}
		      </table>
		      </span>		</td>
      {if $smarty.section.prod.iteration|mod:$col==0}	</tr>
      {/if}
      {/section}
    </table>


	      </div>
            </div>

            <hr>
            {$lang.Upload_Img}: ({$lang.File_1})
            <br><br>
            <input type="file" name="project_file_1" tabindex="3"/><br>
            <input type="file" name="project_file_2" tabindex="4"/><br>
            <input type="file" name="project_file_3" tabindex="5"/><br>
            <br>

            {$lang.Budget}:
            <br>
            <select name="dev" class="textbox" tabindex="6">
	      <option value="0">( {$lang.Please_Choose_Budget} )</option>
		    {$Development_List}
	    </select>
	    <br><Br>

	    {$lang.Days_Of_Bidding}:
	    <br>
	    <select name="bidding" class="textbox" tabindex="7">
	      <option value="0">-----</option>
		    {$Bidding_List}
	    </select>
	    <br><br>
	    {$lang.Addtional_Options}:
	    <br>
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

	    {$lang.Option3} {$lang.Premium_Text_1}{$Premium_Fees} {$lang.Premium_Text_2}<BR />
	    {$lang.Premium_Text_3}
	    <br>
	    <br>
	    {if $flag == 0 }
		    <input type="checkbox" name="urgent_project" value="1" tabindex="11"/>
	    {/if}
	    {if $flag == 1 }
		    <input type="checkbox" name="urgent_project" value="1" disabled="disabled" tabindex="11"/>
	    {/if}
	    {$lang.Urgent}:
	    {$lang.Urgent_text_1}{$Urgent_Fees}{$lang.Urgent_text_2}
	    <br><br>
	    <center><input type="checkbox" name="agree1" tabindex="12"> 
	    {$lang.Note} <a href="Javascript: View_Terms1()" class="footerlink"><strong>{$lang.Project_Guidelines}</strong></a>.</center>
	    <br><br>
	     <center><input id="btnbg" type="submit" name="Submit" value="{$lang.Submit}" class="btn-lg btn btn-success" onClick="Javascript: return Check_Details(this.form);" tabindex="13" style="width:200px;">
	     </center>
	     
	     <input type="hidden" name="Action" value="Add" />
			<input type="hidden" name="user_name" value="{$user_name}" />
			<input type="hidden" name="amount" value="{$amount}" />
			
			
	    
          </div>
          <div class="col-lg-12">
            <hr> </div> {/if} </form>
      </div>
<!--     </div> -->
  </div>
  </div>
</section>
      




