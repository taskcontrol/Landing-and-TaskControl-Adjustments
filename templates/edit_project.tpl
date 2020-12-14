<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Edit project</h1>
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
	var JS_en_dec		 = '{$langJS_en_dec}';
</script>





<section class="overview" id="overview">
  <div class="container" style="background-color:#fff;">
    <div class="row">
      <div class="form-sign">
      
<form method="post" action="{$smarty.server.PHP_SELF}" name="frmeditProject" enctype="multipart/form-data">

        <div class="col-xs-12 col-md-12">
        
        <br><br>
        {if $total == $count1}
<h3>{$lang.Edit_Text1} {$total} {$lang.Times}</h3>

{else}
<b>{$lang.Edit_Text} {$count} {$lang.Times}</b>
<br><br>
<b>{$lang.Edit_Project} : </strong>&nbsp;</b><a href="project_{$id}_{$clear_title}.html" style="color:#000;">{$pro_title}</a>
<br><br>
{$lang.Edit_Details}.
<br><br>
{$lang.Desc_En} :<br>
<textarea name="en_edit_proj" class="textbox" cols="90" rows="10"></textarea>
<br>
<br>
{$lang.Project_File_Edit}
<br>
<input type="file" name="project_file">
<br><br>
<center>
 <input id="btnbg" type="submit" name="Submit" value="{$lang.Button_Submit}" class="btn btn-success" onClick="Javascript: return Check_Details(this.form);">
&nbsp;&nbsp;
  <input id="btnbg" type="submit" name="Submit" value="{$lang.Cancel1}" class="btn btn-default" onclick="Javascript: return cancel();">
  </center>
  <br>
  <input type="hidden" name="Action" value="Edit">
<input type="hidden" name="project_id" value="{$id}">
{/if}
        </form>
	</div>
      </div>
    </div>
  </div>
</section>
<p>&nbsp;</p>