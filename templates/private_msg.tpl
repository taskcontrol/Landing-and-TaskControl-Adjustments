<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Private_Messages}</h1>
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
  <div class="container-fluid">
    <div class="row">
      <div class="job">	
	
	  
	  <form name="frmaccout" method="post" action="{$smarty.server.PHP_SELF}"> 
        {if $Loop > 0 }
	  <div class="col-md-12 col-sm-12 col-xs-12">
	  
	    <div class="col-md-1 col-sm-1 col-xs-1">
	    <p>&nbsp;</p>
	    </div>
	    
	    <div class="col-md-3 col-sm-3 col-xs-3">
	    <p>{$lang.Project}</p>
	    </div>
	    
	    <div class="col-md-3 col-sm-3 col-xs-3">
	    <p>{$lang.From}</p>
	    </div>
	    
	    <div class="col-md-3 col-sm-3 col-xs-3">
	    <p>{$lang.Message}</p>
	    </div>
	    
	    <div class="col-md-2 col-sm-2 col-xs-2">
	    <p>{$lang.Date}</p>
	    </div>
	  </div>

	  {section name=msg_name loop=$Loop}
	    <div class="col-md-12 col-sm-12 col-xs-12">
	      <div class="col-md-1 col-sm-1 col-xs-1">
		<input class="stdCheckBox" type="checkbox" name="cat_prod[]" value="{$arr_msg_rece[msg_name].id}" align="middle">
	      </div>
	      
	      <div class="col-md-3 col-sm-3 col-xs-3">
		<p><a href="project_{$arr_msg_rece[msg_name].project_id}_{$arr_msg_rece[msg_name].clear_title|stripslashes}.html" class="footerlinkcommon2">{$arr_msg_rece[msg_name].Project_Title}</a></p>
	      </div>
	      
	      <div class="col-md-3 col-sm-3 col-xs-3">
		<p><a href="seller_profile_{$arr_msg_rece[msg_name].Form}.html" class="footerlinkcommon2">{$arr_msg_rece[msg_name].Form}</a></p>
	      </div>
	      
	      <div class="col-md-3 col-sm-3 col-xs-3">
	      <p>
		{if $arr_msg_rece[msg_name].project_posted_by == $arr_msg_rece[msg_name].Form} <a href="#" onclick="JavaScript: popupWindowURL('private_message.php?project_id={$arr_msg_rece[msg_name].project_id}&id=4&bid_user={$arr_msg_rece[msg_name].Form}&pop_up=true','','600','500','','true','true');" class="footerlinkcommon2">{$arr_msg_rece[msg_name].Project_Description|truncate:25:"...":true}</a> {else} <a href="#" onclick="JavaScript: popupWindowURL('private_message_form_user.php?project_id={$arr_msg_rece[msg_name].project_id}&id=4&bid_user={$arr_msg_rece[msg_name].Form}&pop_up=true','','600','500','','true','true');" class="footerlinkcommon2">{$arr_msg_rece[msg_name].Project_Description|truncate:25:"...":true}</a> {/if}
	      </p>
	      </div>

	      <div class="col-md-2 col-sm-2 col-xs-2">
		{$arr_msg_rece[msg_name].date}
	      </div>

	    </div>
	  {/section}
	  
	      {if $smarty.section.msg_name.total > 0}
	    <div class="col-lg-12">
	      <img src="{$Templates_Image}arrow_ltr.gif"> <a href="JavaScript: CheckUncheck_Click(document.getElementsByName('cat_prod[]'), true);" onMouseMove="window.status='Check All';" onMouseOut="window.status='';" class="footerlinkcommon2">Check All</a> / <a href="JavaScript: CheckUncheck_Click(document.getElementsByName('cat_prod[]'), false);" onMouseMove="window.status='Uncheck All';" onMouseOut="window.status='';" class="footerlinkcommon2">Uncheck All</a> &nbsp;&nbsp; {$With_selected} <img src="{$Templates_Image}delete.gif" class="imgAction" title="Delete" onClick="JavaScript: DeleteChecked_Click();"> 
	    </div>

	      {/if}
	    <div class="col-lg-12">
	      {$Page_Link}
	    </div>

	     {else}
	     <div class="col-lg-12">
	      <p>&nbsp</p>
		<p>{$lang.Msg}</p>
	      <p>&nbsp</p>
	     </div>

	  {/if}
	   <input type="hidden" name="Action" /> </form>

      </div>
    </div>
  </div>
</section>
