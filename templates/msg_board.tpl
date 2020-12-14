<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Message_Board}</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->

<section class="folio" id="folio" style="background:#fff;">
  <div class="container">
    <div class="row">
      <div class="job">	
	 <form name="frmaccout" method="post" action="{$smarty.server.PHP_SELF}">
	 {if $Loop1 > 0}
	 <div class="col-lg-12">
	  
	   
	    
	 {section name=project_name loop=$Loop1}
	  <div class="col-lg-9">
	    <a href="project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="footerlinkcommon2">&nbsp;{$post_project[project_name].Project_Title|stripslashes}</a>
	  </div>
	  <div class="col-lg-3">
	  
	    <a href="#" onclick="JavaScript: popupWindowURL('message_board.php?project_id={$post_project[project_name].id}&project_creator={$post_project[project_name].project_posted_by}&id=4&pop_up=true','','600','500','','true','true');" class="footerlinkcommon2">{$lang.Click_Message_Board}</a>
	  </div>
	 {/section}
	 
	 
	 {else}
	 <p>&nbsp;</p>
	 <p> {$lang.Msg}</p>
	 <p>&nbsp;</p>
	  </div>
	 {/if}
	 <input type="hidden" name="Action" /> </form>
	 <hr>
       </div>
    </div>
  </div>
</section>