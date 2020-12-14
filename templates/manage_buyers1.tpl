<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Buyer}</h1>
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
	 <div id="sidebar" class="col-lg-4">

        <div class="list">
          <div class="list-group">
	    <a href="buyer_profile_{$user_name}.html" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.View_Buyer}</a>
	    <a href="editbuyerprofile.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Edit_Buyer}</a> 
	    <a href="post_project.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Post_Project}</a>
	    <a href="view_myall_projects.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.View_Project}</a>
	    <a href="rating_to_seller.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Rating_to_Seller}</a>
	  </div>
	</div>

      </div>
      
      
      <div class="col-lg-8">
	  {if $succMsg}
	   <h3>{$succMsg}</h3>
	  {/if}
	  
	  {include file="$T_Balance"}
	  
	  
	  {if $Loop1>0}
	    <div  class="col-md-12 col-sm-12 col-xs-12 bg-primary" style="padding:4px;margin:4px;">
	      <div class="col-md-4 col-sm-4 col-xs-4">
	      <p class="p-title">{$lang.MY_Buying_Activity}</p>
	      </div>
	      <div class="col-md-2 col-sm-2 col-xs-2">
	      <p class="p-title">{$lang.Bids}</p>
	      </div>
	      <div class="col-md-3 col-sm-3 col-xs-3">
	      <p class="p-title">{$lang.Status}</p>
	      </div>
	      <div class="col-md-3 col-sm-3 col-xs-3">
	      <p class="p-title">{$lang.Option}</p>
	      </div>
	    </div>
	    {section name=project_name loop=$Loop1}
	    <div  class="col-md-12 col-sm-12 col-xs-12">
	      <div class="col-md-4 col-sm-4 col-xs-4 lh55">
	      <a href="project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="footerlinkcommon2">{$post_project[project_name].Project_Title|stripslashes}</a>
	      </div>
	      <div class="col-md-2 col-sm-2 col-xs-2 lh55">
	      {$post_project[project_name].bid}
	      </div>
	      <div class="col-md-3 col-sm-3 col-xs-3 lh55">
	      {if $post_project[project_name].project_status == 1}
					{$lang.Open}
				      {else if $post_project[project_name].project_status == 5}
					Frozen
				      {/if}
				      
	      </div>
	      <div class="col-md-3 col-sm-3 col-xs-3 ">
		  <a href="award_project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="btn btn-default btn-xs" style="margin:4px;">{$lang.Award_Project}</a>

		  <a href="extend_project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="btn btn-default btn-xs" style="margin:2px;"> {$lang.Extend} </a>

		  <a href="edit_project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="btn btn-default btn-xs" style="margin:2px;"> {$lang.Edit} </a>

		  <a href="close_project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="btn btn-default btn-xs" style="margin:2px;">{$lang.Close}</a>
	      </div>
	      <hr><hr><hr style="margin-bottom: 5px;">
	     </div>
	    {/section}
	  {/if}

      </div>

    </div>
  </div>
</section>
<p>&nbsp;</p>