<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$smarty.session.User_Name}{$lang.Seller_Rating}</h1>
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
      <div class="col-md-12 col-sm-12 col-xs-12">
	

      
      {if $Loop_Seller >0}
      
      	<div  class="col-md-12 col-sm-12 col-xs-12 bg-primary" style="padding:4px;margin:4px;">
	      <div class="col-md-4 col-sm-4 col-xs-4">
	      <p class="p-title">{$lang.Project_Name}</p>
	      </div>
	      <div class="col-md-2 col-sm-2 col-xs-2">
	      <p class="p-title">{$lang.User_Name}</p>
	      </div>
	      <div class="col-md-3 col-sm-3 col-xs-3">
	      <p class="p-title">{$lang.User_Type}</p>
	      </div>
	      <div class="col-md-3 col-sm-3 col-xs-3">
	      <p class="p-title"></p>
	      </div>
	    </div>
	    
  {section name=ProList loop=$Loop_Seller}
      <div  class="col-md-12 col-sm-12 col-xs-12">
	      <div class="col-md-4 col-sm-4 col-xs-4 lh55">
		<a href="project_{$arating_seller[ProList].id}_{$arating_seller[ProList].clear_title}.html" class="footerlinkcommon2"><strong>{$arating_seller[ProList].Project_Title|stripslashes}</strong></a>
	      </div>
	      <div class="col-md-2 col-sm-2 col-xs-2 lh55">
		{$arating_seller[ProList].project_post_to}
	      </div>
	      <div class="col-md-3 col-sm-3 col-xs-3 lh55">
		{$lang.Buyer}
	      </div>
	      <div class="col-md-3 col-sm-3 col-xs-3 lh55">
		<a href="rating_to_user.php?project_id={$arating_seller[ProList].id}&User_type=Buyer&to={$arating_seller[ProList].project_post_to}" class="footerlinkcommon2">{$lang.Rate}</a>
	      </div>
	    </div>
       {/section}
  {else}
      <center><h4 style="padding:20px;">{$lang.Text}</h4></center>
      {/if}
      </div>
    </div>
  </div>
</section>
