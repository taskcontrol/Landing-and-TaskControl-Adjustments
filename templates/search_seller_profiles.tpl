<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Search_Profiles}</h1>
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
  
      <div id="" class="col-lg-12" style="background:#fff;margin-bottom:10px;margin-top:10px;text-align:center;padding:20px;">

		   <form method="GET" action="/search_seller_profiles.php">
		    <input name="search_this" placeholder="Search skill, nickname, location, company" style="width:50%;padding:10px;" value="{$search_this}">
		     <input type="submit" class="btn btn-success" value="Search" style="padding:10px;">
		   </form>

	    </div>
	    
	    
    <div class="row">
<!--       <div class="col-md-12 col-sm-12 col-xs-12"> -->
	 {if $Loop > 0}
<br>

<!-- 	  <div  class="col-md-12 col-sm-12 col-xs-12"> -->
	      {section name=SellerList loop=$Loop}

	      <div  class="col-md-12 col-sm-12 col-xs-12">
		<div class="col-md-2 col-sm-2 col-xs-2 lh55">
				<h3><a href="seller_profile_{$user_login_id[SellerList]}.html">{$user_login_id[SellerList]}</a></h3>

				
		{if $seller_logo[SellerList]}<img src="{$img_path}thumb_{$seller_logo[SellerList]}" border="0" height="75" width="75">{else}<img src="/upload/Seller_Logo/default.jpg" border="0" height="75" width="75">{/if}
		
		</div>
		
		<div class="col-md-10 col-sm-10 col-xs-10 lh55">
		

	    <div  class="col-md-12 col-sm-12 col-xs-12  bg-primary" style="padding:4px;margin:4px;">
	      <div class="col-md-3 col-sm-3 col-xs-3 lh55" style="line-height: 26px;">
		{$lang.Rating}
	      </div>
	      <div class="col-md-3 col-sm-3 col-xs-3 lh55" style="line-height: 26px;">
		{$lang.Earning}
	      </div>
	      <div class="col-md-3 col-sm-3 col-xs-3 lh55" style="line-height: 26px;">
		{$lang.Location}
	      </div>
	      <div class="col-md-3 col-sm-3 col-xs-3 lh55">
		  
		</div>
	    </div>

	      <div  class="col-md-12 col-sm-12 col-xs-12">
		
		<div class="col-md-3 col-sm-3 col-xs-3 lh55" style="line-height: 26px;">
		  {if $rating[SellerList] == 0.00}{$lang.No_feedback}{else}<img src="{$Templates_Image}{$rating[SellerList]|intval}.gif" width="120"><a href="{$user_login_id[SellerList]}_feedback.html" class="footerlinkcommon2">({$reviews[SellerList]} {$lang.Review})</a>{/if}
		</div>
		<div class="col-md-3 col-sm-3 col-xs-3 lh55" style="line-height: 26px;">
		  {if $rating[SellerList] == 0.00}{$lang.No_feedback}{else}<img src="{$Templates_Image}{$rating[SellerList]|intval}.gif" width="120"><a href="{$user_login_id[SellerList]}_feedback.html" class="footerlinkcommon2">({$reviews[SellerList]} {$lang.Review})</a>{/if} 
		  {if $earning[SellerList] == 0.00}{$lang_common.Curreny}&nbsp;0.00{else}{$lang_common.Curreny}&nbsp;{$earning[SellerList]}{/if}
		</div>
		<div class="col-md-3 col-sm-3 col-xs-3 lh55" style="line-height: 26px;">
		  {if $location_1[SellerList] != ''}{$location[SellerList]}{else}{$location_2[SellerList]}{/if}
		</div>
		<div class="col-md-3 col-sm-3 col-xs-3 lh55">
		  
		</div>
	      </div>


	      </div>
	      </div>
	       <div  class="col-md-12 col-sm-12 col-xs-12">

	     	<a href="seller_profile_{$user_login_id[SellerList]}.html" class="footerlinkcommon2">{$lang.Profile}</a> | <a href="seller_portfoilo_{$user_login_id[SellerList]}.html" class="footerlinkcommon2">{$lang.Portfolio}</a> | <a href="{$user_login_id[SellerList]}_feedback.html" class="footerlinkcommon2">{$lang.Feedback}</a> | <a href="contact_{$user_login_id[SellerList]}.html" class="footerlinkcommon2">{$lang.Contact_to} {$user_login_id[SellerList]}</a> | <a href="post_project_{$user_login_id[SellerList]}.html" class="footerlinkcommon2">{$lang.Post_proj} {$user_login_id[SellerList]}</a>
	      </div>

	      <div  class="col-md-12 col-sm-12 col-xs-12">
	      <hr>
	      </div>
	  {/section}

	  
	  {else}
	  <center>
	  <p style="padding:30px 0;">
<h3>{$lang.Sorry}</h3>
</center>
</p>
	 {/if}
<!--       </div> -->
    </div>
  </div>
</section>





