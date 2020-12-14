<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown"><a href="/seller_profile_{$user_name}.html" style="color:#fff;">{$user_name}</a><p> Portfolio</p></h1>
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->
<p></p>


<section class="folio" id="folio" style="background:#fff;">
  <div class="container">
    <div class="row">
      <div class="job">	
	<div class="col-lg-12">
	
	  <div class="col-lg-12">
	    <h3>{$protfolio_title}</h3>
	  </div>

	  <div class="col-lg-12">
		  <hr>
	  </div>

	  <div class="col-lg-2">
	    <a href="javascript:OpenImage('{$sample_file}')">
	    <IMG src="{$path}{$sample_file}" width="175" border="0">
	    </a>
	  </div>
	  
	  <div class="col-lg-10">
	    <form name="frmviewprotfolio" method="post" >
	    
	      <p> <b>{$lang.Development_cost}:</b> {$budget}</p>
	      <p><b>{$lang.Execution_time}:</b> {$time_spent}</p>
	      <p><b>{$lang.Category}:</b> {$new_categories}</p>
	      <p><b>{$lang.Industry}:</b> {$industry}</p>
	      <h5><a href="javascript:OpenImage('{$sample_file}')" >{$lang.view_sample}</a> <span class="bodytextblack"> |</span> <a href="contact_{$user_name}.html"  onClick="Javascript: return chk_user('{$smarty.session.User_Id}');">{$lang.Contact} {$user_name}</a> <span class="bodytextblack"> |</span> <a href="post_project_{$user_name}.html"  onClick="Javascript: return chk_user('{$smarty.session.User_Id}');"> {$lang.post_project} {$user_name}</a></h5>
	    </form>
	  </div>
	  <div class="col-lg-12" style="margin:10px;">
	   <p><b> {$lang.Work_Done}</b></p>
	   <p>{$desc|wordwrap:135:"\n":true}</p>
	  </div>
	  
	  
	  
	  {if $smarty.session.User_Name != ''}
	  <div class="col-lg-12">
	    <hr>
	  </div>
	  <div class="col-lg-12" style="margin:10px;">
	  <p>{$lang.Please_read_the} <a href="Javascript: View_Terms()" >{$lang.Project_Guidelines} </a>{$lang.before_project}
	  </p>
<!--	  <p>
	  <input class="login_txt style5" type="submit" id="btnbg" name="Submit" value="{$lang.Button_Submit}"/>
	  </p>-->
	  <input type="hidden" name="user_name" value="{$user_name}" />
	  </div>
	  {/if}
	  
	</div>
      </div>
    </div>
  </div>
</section>




