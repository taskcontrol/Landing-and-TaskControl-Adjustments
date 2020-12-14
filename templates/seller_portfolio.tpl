<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">
	      {$lang.All_portfolio} <a href="/seller_profile_{$user_name}.html" style="color:#fff;">{$user_name}</a>
            </h1>
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>


<section class="folio" id="folio" style="background:#fff;">
  <div class="container">
    <div class="row">
    
    
    
    
    
    
    
    
    
    {section name=sellerport loop=$Loop}
    <div class="job">
<!-- 	<div class="col-md-12 col-sm-12 col-xs-12"> -->

	<div class="col-md-12 col-sm-12 col-xs-12">
	    <h3>{$sportfolio[sellerport].title}</h3>
	  </div>

	  <div class="col-md-12 col-sm-12 col-xs-12">
		  <hr>
	  </div>

	  <div class="col-md-2 col-sm-3 col-xs-4">
	    <a href="javascript:OpenImage('{$sportfolio[sellerport].sample_file}')" class="footerlink"><IMG src="{$portfolio_imgpath}{$sportfolio[sellerport].sample_file}" height="125" width="125" border="0"></a>
	  </div>
	  
	  <div class="col-md-10 col-sm-9 col-xs-8">
	    <form name="frmviewprotfolio" method="post" >

	      <p> <b> {$lang.Msg} :</b> {$sportfolio[sellerport].cats}</p>
	      <p>{$sportfolio[sellerport].desc|truncate:50} <a href="portfolio_{$sportfolio[sellerport].user_name}_{$sportfolio[sellerport].id}.html" class="footerlinkcommon2"><strong>( {$lang.More} )</strong></a></p>

	      <h5>
	      <p><a href="javascript:OpenImage('{$sportfolio[sellerport].sample_file}')" class="footerlinkcommon2">{$lang.view_sample}</a> | <a href="contact_{$sportfolio[sellerport].user_name}.html" class="footerlinkcommon2" onClick="Javascript: return chk_user('{$smarty.session.User_Id}');">{$lang.Contact} {$sportfolio[sellerport].user_name}</a> | <a href="post_project_{$sportfolio[sellerport].user_name}.html" class="footerlinkcommon2" onClick="Javascript: return chk_user('{$smarty.session.User_Id}');"> {$lang.post_project} {$sportfolio[sellerport].user_name}</a></p>

	     </h5>

	    </form>
	  </div></div>
	  <div class="col-md-12 col-sm-12 col-xs-12" style="margin:10px;">
	   <div class="col-md-4 col-sm-4 col-xs-4">
	      <h5>{$lang.Development_cost}</h5>
	      <p>{$sportfolio[sellerport].budget}</p>
	   </div>
	   <div class="col-md-4 col-sm-4 col-xs-4">
	      <h5>{$lang.Execution_time}</h5>
	      <p>{$sportfolio[sellerport].time_spent}</p>
	   </div>
	   <div class="col-md-4 col-sm-4 col-xs-4">
	      <h5>{$lang.Industry}</h5>
	      <p>{$sportfolio[sellerport].industry}</p>
	   </div>
	  </div>
	  
	  
	  
	 
	  
<!-- 	</div> -->
      </div>
      {sectionelse}
	<div class="job">	
	  <div class="col-md-12 col-sm-12 col-xs-12">
	    <div class="col-md-12 col-sm-12 col-xs-12">
	      <h3>{$lang.No_Msg}</h3>
	    </div>
	  </div>
	</div>
      {/section}

      
      
      
    </div>
  </div>
</section>

	
	
	
	
	