

  <!-- ==============================================
	 Header
	 =============================================== -->	 

<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Find a freelancer</h1>
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->












<section class="folio" id="folio">
	   <div class="container">
	    <div class="row">

	    <div id="" class="col-lg-12" style="background:#fff;margin-bottom:10px;margin-top:10px;text-align:center;padding:20px;">

		   <form method="GET" action="/search_seller_profiles.php">
		    <input name="search_this" placeholder="Search skill, nickname, location, company" style="width:50%;padding:10px;">
		     <input type="submit" class="btn btn-success" value="Search" style="padding:10px;">
		   </form>

	    </div>

		 <div id="sidebar" class="col-lg-4">
			<div class="list">
			 <div class="list-group"> 
			 
			  {section name=CatList loop=$Loop1}
			  
			  <a href="all_seller_profiles.php?catId={$cat_id[CatList]}" class="list-group-item cat-list">
			  <em class="fa fa-fw fa-asterisk"></em>&nbsp;&nbsp;&nbsp;{$cat_name[CatList]}
			 </a>

                      {/section}


			 </div><!-- ./list-group-->
			</div><!-- ./list--> 
		 </div><!-- ./col-lg-4-->
		 
		 <div class="col-lg-8 white-2 jobslist">
		 
		 <h3>{$catName}</h3>

		  <!--{if $total_paginas > 1}
		 <div class="page text-center" style="border:none;background:none;">
		  <ul class="pagination">
		   {if $nro_pagina > 1}<li><a href="#">«</a></li>{/if}
		   
		   {section name=foo start=1 loop=$total_paginas+1 step=1} 
			{if $nro_pagina == $smarty.section.foo.index} 
			  <li class="active"><a href="#">{$nro_pagina} <span class="sr-only">(current)</span></a></li>
			{else}
		  <li>
		    <a href="all_seller_profiles.php?catId={$catId}&page={$smarty.section.foo.index}">
		    {$smarty.section.foo.index}
		    </a>
		  </li>
		   
		   {/if} 
                      {/section} 
		   
		  {if $nro_pagina < $total_paginas} 
		   <li><a href="all_seller_profiles.php?catId={$catId}&page={$pagPosterior}">»</a></li>
		   {/if}
		  </ul>
		 </div>	
		{/if}-->
		
		
		
		{if $num_total_registros} {foreach from=$arr_seller item=freelancer name=foo}
		 <div class="job">	
		  <div class="row top-sec">
		   <div class="col-lg-12">
			<div class="col-md-2 col-sm-2 col-xs-2">
			 <a href="freelancer.html">
			  
			  
			  
			  {if $freelancer.seller_logo}
			  <img class="" src="{$img_path}thumb_{$freelancer.seller_logo}" alt="">
			  {else}
			  <img class="" src="{$img_path}default.jpg" alt="">
			  {/if}
			  
			 </a>
			</div><!-- /.col-lg-2 -->
			<div class="col-md-10 col-sm-10 col-xs-10"> 
			 <h4><a href="seller_profile_{$freelancer.login_id}.html">{$freelancer.login_id}</a></h4>
			</div><!-- /.col-lg-10 -->
			
		   </div><!-- /.col-lg-12 -->
		  </div><!-- /.row -->
		  
		  {if $freelancer.description}
		  <div class="row mid-sec">			 
		   <div class="col-xs-12 col-md-12">			 
		   <div class="col-xs-12 col-md-12">
			<hr class="small-hr">
			<p>{$freelancer.description}</p>
		   </div><!-- /.col-lg-12 -->
		   </div><!-- /.col-lg-12 -->
		  </div>
		  {/if}
		  
		  <div class="row bottom-sec">
		   <div class="col-xs-12 col-md-12">
			
			<div class="col-xs-12 col-md-12">
			 <hr class="small-hr">
			</div> 
			
			<div class="col-xs-2 col-md-2">
			 <h5> {$lang.Earning} </h5>
			 <p>{if $freelancer.earning == 0.00}{$lang_common.Curreny}&nbsp;0.00{else}{$lang_common.Curreny}&nbsp;{$freelancer.earning}{/if}</p>
			</div>
			<div class="col-xs-6 col-md-6">
			 <h5> {$lang.Location} </h5>
			 <p><i class="fa fa-map-marker"></i> {if $freelancer.location_1 != ''}{$freelancer.location}{else}{$freelancer.location_2}{/if}</p>
			</div>			
			<div class="col-xs-4 col-md-4">
			 <h5> {$lang.Rating}</h5>
			 <p>
			 {if $freelancer.rating == 0.00}
			  {$lang.No_feedback}
			    {else}
			    <img src="{$Templates_Image}{$freelancer.rating|intval}.gif" width="120">
			    &nbsp;<br>
			    <a href="{$freelancer.login_id}_feedback.html" class="footerlinkcommon2" style="float: left;">
			  ({$freelancer.reviews} reviews)</a>
			 {/if}
			<!-- <i class="fa fa-star"></i>
			 <i class="fa fa-star"></i>
			 <i class="fa fa-star"></i>
			 <i class="fa fa-star"></i>
			 <i class="fa fa-star"></i>-->
			 </p>
			</div>
			
			<div class="col-xs-12 col-md-12">
			<p class="morelinks">
			<a href="seller_profile_{$freelancer.login_id}.html" class="footerlinkcommon2">{$lang.Profile}</a> | <a href="seller_portfoilo_{$freelancer.login_id}.html" class="footerlinkcommon2">{$lang.Portfolio}</a> | <a href="{$freelancer.login_id}_feedback.html" class="footerlinkcommon2">{$lang.Feedback}</a> | <a href="contact_{$freelancer.login_id}.html" class="footerlinkcommon2" onClick="Javascript: return chk_user('{$smarty.session.User_Id}');">{$lang.Contact} {$freelancer.login_id}</a> | <a href="post_project_{$freelancer.login_id}.html" class="footerlinkcommon2" onClick="Javascript: return chk_user('{$smarty.session.User_Id}');">{$lang.Post_Project_to}{$freelancer.login_id}</a>
			</p>
			</div>
			
		   </div><!-- /.col-lg-12 -->
		  </div><!-- /.row -->
		 
		 </div><!-- /.job --> 		
			 
	{/foreach} {else}
	
	 <div class="job">	
		  <div class="row top-sec">
	{$lang.No_Seller_Text}
	 </div><!-- /.row -->
		 
		 </div><!-- /.job --> 		
	 {/if}
	
	
	
	
	 		  			  		 
		  



		{if $total_paginas > 1}
		 <div class="page text-center">
		  <ul class="pagination">
		   {if $nro_pagina > 1}<li><a href="#">«</a></li>{/if}
		   
		   {section name=foo start=1 loop=$total_paginas+1 step=1} 
			{if $nro_pagina == $smarty.section.foo.index} 
			  <li class="active"><a href="#">{$nro_pagina} <span class="sr-only">(current)</span></a></li>
			{else}
		  <li>
		    <a href="all_seller_profiles.php?catId={$catId}&page={$smarty.section.foo.index}">
		    {$smarty.section.foo.index}
		    </a>
		  </li>
		   
		   {/if} 
                      {/section} 
		   
		  {if $nro_pagina < $total_paginas} 
		   <li><a href="all_seller_profiles.php?catId={$catId}&page={$pagPosterior}">»</a></li>
		   {/if}
		  </ul><!-- /.pagination -->
		 </div><!-- /.page -->		 	  
		{/if}
		
		 </div><!-- ./col-lg-8--> 
		 
		</div><!-- ./row-->
	   </div><!-- ./container--> 
      </section><!-- End section-->
      
      <p></p>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      