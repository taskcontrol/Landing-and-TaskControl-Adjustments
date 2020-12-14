<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.My_All_Projects}</h1>
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
	{if $succMsg}
	  {$succMsg}
	{/if}

	{if $Loop > 0}
	 <div  class="col-md-12 col-sm-12 col-xs-12 bg-primary" style="padding:4px;margin:4px;">
	      <div class="col-md-4 col-sm-4 col-xs-4">
	      <p class="p-title">{$lang.My_Buying_Activity}</p>
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

	{section name=project_name loop=$Loop}

	 <div  class="col-md-12 col-sm-12 col-xs-12">
	  <div class="col-md-4 col-sm-4 col-xs-4 lh55">
	      <a href="project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="footerlinkcommon2">{$post_project[project_name].Project_Title|stripslashes}</a>
	  </div>

	   <div class="col-md-2 col-sm-2 col-xs-2 lh55">
	   {$post_project[project_name].bid}
	   </div>

	    <div class="col-md-3 col-sm-3 col-xs-3 lh55">
		{if $post_project[project_name].project_status == 1}<strong>{$lang.Project_Open}</strong>{/if}
		{if $post_project[project_name].project_status == 2}<strong>{$lang.Project_Freezed}</strong>{/if}
		{if $post_project[project_name].project_status == 3}<strong>{$lang.Project_Close_for_Bidding} ({$Assign_to} {$post_project[project_name].project_post_to})</strong>{/if}
		{if $post_project[project_name].project_status == 4}<strong>{$lang.Project_Closed_Manually}</strong>{/if}
		{if $post_project[project_name].project_status == 5}<strong>{$lang.Project_Completed}</strong>{/if}
		{if $post_project[project_name].project_status == 6}<strong>{$lang.Project_Projoect_Finished}</strong>{/if}
	   </div>
	   
	     <div class="col-md-3 col-sm-3 col-xs-3 lh55">
		    {if $post_project[project_name].project_status == 1}
			<a href="award_project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="footerlinkcommon2">{$lang.Award_Project}</a> -
			<a href="extend_project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="footerlinkcommon2"> {$lang.Extend}</a> - 
			<a href="edit_project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="footerlinkcommon2"> {$lang.Edit}</a> - 
			<a href="close_project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="footerlinkcommon2">{$lang.Close}</a>
			{/if}
			{if $post_project[project_name].project_status == 2}
			<a href="close_project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="footerlinkcommon2">{$lang.Close}</a> - <strong>({$lang.Project_is_award_at} {$post_project[project_name].award_project_date})</strong> - <a href="reaward_project.php?id={$post_project[project_name].id}" class="footerlinkcommon2">({$lang.Reaward_Project})</a>
			{/if}
			{if $post_project[project_name].project_status == 3}
			<strong>{$lang.Only_Payment_is_left}</strong>
			<!--<a href="award_project_{$post_project[project_name].id}.html" class="footerlink">Award Project</a> -
			<a href="extend_project_{$post_project[project_name].id}.html" class="footerlink"> Extend</a> - 
			<a href="close_project_{$post_project[project_name].id}.html" class="footerlink">Close</a>-->
			{/if}
			{if $post_project[project_name].project_status == 4}
				<strong>{$lang.Close_By_Buyer_ifself}</strong>
			{/if}
			{if $post_project[project_name].project_status == 5}
				<strong>{$lang.Close}&nbsp;(<a href="award_project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="footerlinkcommon2">{$lang.Award_Project}</a>)</strong>
			{/if}
			{if $post_project[project_name].project_status == 6}
			  <strong>{$lang.Payments_given_and_Finished_Project}</strong>
			{/if}
		  </div>
	      </div>
	    {/section}

	{else}

	<center><h3>{$lang.Text4}</h3></center>
	{/if}
      </div>
    </div>
  </div>
</section>