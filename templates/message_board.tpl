<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Message board</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->

<!-- http://192.168.1.129/message_board.php?project_id=&project_creator=&id=4&pop_up=true -->

<script language="javascript">
var JS_English_Msg = '{$js}';
</script>



<section class="folio" id="folio" style="background:#fff;">
  <div class="container">
    <div class="row">
      <div class="job">	
      
      <form method="post" action="{$smarty.server.PHP_SELF}" name="frmmsgboard">
	{if $smarty.session.User_Name == ''}
	<div class="col-lg-12">
      {$msg_board}
      </div>
      {else}
      <div class="col-lg-12" style="text-align:left;">
	<p>
	  <strong>{$lang.Message_Project} : <a href="#" onclick="Javascript : popup_window_link('project_{$project_id}.html')" class="footerlinkcommon2">{$title|stripslashes}</a> </strong>
	</p>
	<p>
	  <strong>{$lang.Important1}</strong> {$lang.msg_board1} <strong>{$lang.Manually} </strong>{$lang.msg_board2}.
	</p>
	<p>&nbsp;</p>
	<p>
	  <strong> {$lang.Project_creator} : &nbsp;&nbsp;<a href="#" onclick="Javascript : popup_window_link('buyer_profile_{$project_creator}.html')" class="footerlinkcommon2">{$project_creator}</a></strong>
	</p>
	<p>&nbsp;</p>
	<p>
	  <strong>{$lang.Post_Message}</strong> <strong> : &nbsp;&nbsp;</strong>
	</p>

	<p>
	  <textarea name="en_message_desc" class="form-control" cols="80" rows="7"></textarea>
	</p>
	<p>
	<div class="col-lg-12" style="text-align:center;">
	  <button type="submit" style="margin-top: 23px;padding:10px 40px;" class="btn btn-success" id="btnbg" name="Submit" value="{$lang.Button_Post}" onclick="Javascript: return Check_Details(this.form);" > {$lang.Button_Post} </button>
	</div>

<!-- 	<input class="login_txt style5" type="submit" id="btnbg" name="Submit" value="{$lang.Button_Post}" onclick="Javascript: return Check_Details(this.form);" /> -->
	</p>


      </div>

      <p>&nbsp;</p>

        {if $Loop > 0 }
       <div class="col-xs-12 col-md-12 col-lg-12 bg-primary" style="padding:4px;" style="text-align:left;">

	<div class="col-xs-3 col-md-3 col-lg-3" style="text-align:left;">
	<p><b>{$lang.Author}</p></b>
	</div>

       <div class="col-xs-7 col-md-7 col-lg-7" style="text-align:left;">
	<p><b>{$lang.Message}</p></b>
	</div>

	<div class="col-xs-2 col-md-2 col-lg-2" style="text-align:left;">

	</div>
       </div>

       {section name=msg loop=$Loop}
	  <div class="col-xs-12 col-md-12 col-lg-12" style="padding: 12px 0;">
	    <div class="col-xs-3 col-md-3 col-lg-3" style="text-align:left;">
	      <strong>{$lang.User}:</strong>
	      <a href="#" onclick="Javascript : popup_window_link('seller_profile_{$arr_msg[msg].sender_login_id}.html')" class="footerlink"> {$arr_msg[msg].sender_login_id}</a>
		  <br> {$lang.Date_posted}: {$arr_msg[msg].dates}
	    </div>
	  
	    <div class="col-xs-7 col-md-7 col-lg-7" style="text-align:left;color: #888;">
	    {$arr_msg[msg].msg_dec|wordwrap:45:"\n":true}
	    </div>
	    
	    <div class="col-xs-2 col-md-2 col-lg-2" style="text-align:left;">
<!-- 	      <img src="{$Templates_Image}report.gif" onClick="JavaScript: ReportViolation_Click(document.frmmsgboard,'{$arr_msg[msg].sender_login_id}');" style="height:20px;" /> -->
 <button type="button" style="padding:10px 40px;" class="btn btn-success" value="Rules Violation"  onClick="JavaScript: ReportViolation_Click(document.frmmsgboard,'{$arr_msg[msg].sender_login_id}');"> Rules Violation </button>
 
	    </div>
	  </div>
       {/section}
       
       {/if} {/if} 
       
	<input type="hidden" name="Action" />
	<input type="hidden" name="project_id" value="{$project_id}" />
	<input type="hidden" name="project_creator" value="{$project_creator}" />
	<input type="hidden" name="title" value="{$title}" />
	<input type="hidden" name="id" value="{$id}" />
      </form>
	
      </div>
      
<p>&nbsp;</p>
    </div>
  </div>
</section>

<p>&nbsp;</p>








