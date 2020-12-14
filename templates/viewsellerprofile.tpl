     <!-- ==============================================
	 Header
	 =============================================== -->	 
<header class="header-freelancer">
  <div class="container">
    <div class="content">
      <div class="row">
        <div class="col-lg-12">

          {if $seller_logo != ''}
          <img src="{$img_path}thumb_{$seller_logo}" class="img-thumbnail img-responsive revealOnScroll" data-animation="fadeInDown" data-timeout="200" alt="">
          </p>
          {/if} {if $seller_logo == ''}
          <img src="{$img_path}default.jpg" class="img-thumbnail img-responsive revealOnScroll" data-animation="fadeInDown" data-timeout="200" alt="">
          </p>
          {/if}


          <h1 class="revealOnScroll" data-animation="bounceIn" data-timeout="200">{$user_name1}</h1>
          <p class="revealOnScroll" data-animation="fadeInUp" data-timeout="400"><i class="fa fa-map-marker"></i> {$location}</p>
          <a href="{$Site_Root}contact_{$user_name1}.html" class="kafe-btn kafe-btn-mint-small revealOnScroll" data-animation="fadeInUp" data-timeout="400"><i class="fa fa-align-left"></i> {$lang.Contact_Page}</a>
        </div>
        <!-- /.col-lg-12 -->
      </div>
      <!-- /.row -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.container -->
</header>
<!-- /header -->


     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
      <!-- ==============================================
	  Overview Section
	  =============================================== -->

 <section class="overview" id="overview">
  <div class="container">
    <div class="row">





      <div id="sidebar" class="col-lg-4">
        <div class="list">
          <div class="list-group">

            <a href="{$Site_Root}seller_profile_{$user_name1}.html" class="list-group-item active cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;Overview
            </a>
            <a href="{$Site_Root}seller_portfoilo_{$user_name1}.html" class="list-group-item cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;Portfolio
            </a>
            <a href="{$Site_Root}{$user_name1}_feedback.html" class="list-group-item cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;Reviews
            </a>

          </div>
          <!-- ./.list-group -->
        </div>
        <!-- ./.list -->
      </div>
      <!-- ./.col-lg-4 -->




      <div class="col-lg-8 white-2">
        <div class="about">
          <h3>{$lang.Service_Desc}:</h3>
          <div class="col-lg-12 top-sec">
            <p>
              </strong>
              {if $seller_description != NULL} {$seller_description} {else} {$lang.Service_Desc_Msg} {/if}
            </p>
            {$industries}
          </div>
          <div class="row bottom-sec">
{if $membership_id !=0}
            <div class="col-lg-12 white-2">
              <div class="col-lg-12">
                <hr class="small-hr">
              </div>
              <div class="col-lg-12">
                <img src="{$Templates_Image}vip_member.gif" border="0" />&nbsp;&nbsp;<strong>{$user} {$lang.Text}.</strong>
              </div>
            </div>
{/if}


          </div>
          <div class="row bottom-sec">
            <div class="col-lg-12">
              <div class="col-lg-12">
                <hr class="small-hr">
              </div>
              
              
              
              <!-- /.col-lg-12 -->
              <div class="col-xs-5 col-md-5">
                <h5> {$lang.Location}:</h5>
                <p><i class="fa fa-map-marker"></i> {$location}</p>
              </div>
              <!-- /.col-lg-2 -->
              <!-- /.col-lg-2 -->
              <div class="col-xs-4 col-md-4">
                <h5> {$lang.Earn_Reported} </h5>
                <p>{if $earn_by_site == 0.00} {$lang_common.Curreny}&nbsp;{$earn_by_site} {else} {$lang_common.Curreny}&nbsp;{$earn_by_site} {/if}
                </p>
              </div>

              <div class="col-xs-3 col-md-3">
                <h5>{$lang.Employees}</h5>
                <p>{if $mem_employes != ""}{$mem_employes} {else} Unknown {/if}</p>
              </div>
            </div>
            
            
            

            <div class="col-xs-12 col-md-12">
              <!-- /.col-lg-2 -->
              <div class="col-xs-4 col-md-4">
                <h5> {$lang.Skill_Rating}</h5>
                <p>
                  {if $skill_count != 0}
                  <img src="{$Templates_Image}{$avg_rating|intval}.gif" width="120">
                  <Br>
                  <strong>{$avg_rating|string_format:"%.2f"}</strong> {$skill_count} {$lang.Skill_Msg} {else} No rating yet {/if}
                </p>
              </div>
              <div class="col-xs-8 col-md-8">
                <h5> {$lang.Service_Rating}</h5>
                <p>
                  {if $rating == 0.00} {$lang.No_Feedback} {else}
                  <img src="{$Templates_Image}{$rating|intval}.gif" width="120">&nbsp;<strong>{$rating}</strong>&nbsp;<a href="{$user}_feedback.html" class="footerlink">({$ave_count} reviews)</a> {/if}
                </p>
              </div>
            </div>
            <!-- /.col-lg-12 -->

            <div class="col-lg-12">

<div class="col-lg-12">
                <hr class="small-hr">
              </div>
              <!-- /.col-lg-12 -->
{if $seller_exp != ""}
              <div class="col-md-3 col-sm-3 col-xs-3">
                <h5> {$lang.Experience} </h5>
                <p>  {$seller_exp}
                </p>
              </div>
      {/if}
{if $seller_rate_per_hour != ''}
              <div class="col-md-3 col-sm-3 col-xs-3">
                <h5> {$lang.Min_Rate} </h5>
                <p>{$seller_rate_per_hour} {$lang_common.Curreny} / {$lang.Hour} </p>
              </div>
{/if}
{if $mother_lang}
              <div class="col-md-3 col-sm-3 col-xs-3">
                <h5> {$lang.Mother_Lang} </h5>
                <p>{$mother_lang}</p>
              </div>
{/if}
{if $lang_pairs}
              <div class="col-md-3 col-sm-3 col-xs-3">
                <h5> {$lang.Lang_Pairs} </h5>
                <p>{$lang_pairs}</p>
              </div>
{/if}
            </div>
            <!-- /.col-lg-12 -->
          </div>
          <!-- /.col-lg-12 -->
        </div>
        <!-- /.about -->
            {if $Listing}
        <div class="education">
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">

              <div class="col-md-4 col-sm-4 col-xs-4">
                <h4>{$lang.Skill}</h4>
              </div>
              <div class="col-md-4 col-sm-4 col-xs-4">
                <h4>{$lang.Level}</h4>
              </div>
              <div class="col-md-4 col-sm-4 col-xs-4">
                <h4>{$lang.Grade}</h4>
              </div>
              <!-- /.col-lg-3 -->
            </div>
            

              {foreach name=skills from=$Listing item=skills}
              <div class="col-md-12 col-sm-12 col-xs-12">
		<div class="col-md-4 col-sm-4 col-xs-4">
		  <h5>{$skills->skill_name}</h5>
		</div>
		<div class="col-md-4 col-sm-4 col-xs-4">
		  <img src="{$Templates_Image}{$skills->skill_rate|intval}.gif" width="120" />
		</div>
		<div class="col-md-4 col-sm-4 col-xs-4">
		  <h5>{$skills->skill_rate}</h5>
		</div>
              </div>
              {/foreach}

            
            <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
        </div>
{/if}
{if $Loop > 0 }
         <div class="education">
          <div class="row">
            <div class="col-lg-12">
             <div class="col-lg-12">
<h5>
{$lang.Portfolio_Summary} | <a href="{$Site_Root}seller_portfoilo_{$user_name1}.html" style="color:#000;text-decoration:underline;">{$lang.View_all}</a></h5>
             {section name=sellerport loop=$Loop}
             <div class="col-md-2">
                <a href="javascript:OpenImage('{$sportfolio[sellerport].sample_file}')"><img src="{$portfolio_imgpath}{$sportfolio[sellerport].sample_file}" height="125" width="125" border="0" />
                      </a>
              </div>
              <div class="col-md-3">
               <h3>{$sportfolio[sellerport].title}</h3>
              </div>
             <div class="col-md-7">
                <p>{$lang.Development_cost}: {$sportfolio[sellerport].budget}</p>
                <p>{$lang.Execution_time}: {$sportfolio[sellerport].time_spent}</p>
                <p>{$lang.Industry}: {$sportfolio[sellerport].industry}</p>
              </div>

	    <div class="col-lg-12">
	      <div class="col-lg-12">
		<br>
		 <p> <h6>{$lang.Msg} : {$sportfolio[sellerport].cats}</h6></p>
		
		<p> <h6> {$sportfolio[sellerport].desc|truncate:50} <a href="portfolio_{$sportfolio[sellerport].user_name}_{$sportfolio[sellerport].id}.html" class="footerlinkcommon2"><strong>( {$lang.More} )</strong></a></h6>
		</p>

		<hr>
		<h6>
		  <a style="color:#000;" href="javascript:OpenImage('{$sportfolio[sellerport].sample_file}')">{$lang.view_sample}</a> | 
		  <a style="color:#000;" href="contact_{$user_name1}.html" onClick="Javascript: return chk_user('{$smarty.session.User_Id}');">{$lang.Contact} {$user_name1}</a> | 
		  <a style="color:#000;" href="post_project_{$user_name1}.html" onClick="Javascript: return chk_user('{$smarty.session.User_Id}');"> {$lang.post_project} {$sportfolio[sellerport].user_name}</a>
		</h6>
		
	      </div>
	    </div>
          {/section}
            </div>
           </div>
            <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
        </div>
{/if}
        
        
        
        
        
        
        
        
        
        
{if $Loop1 > 0 }
         <div class="education">
          <div class="row">
            <div class="col-lg-12">
             <div class="col-lg-12">
<h5>
{$lang.Feedback_Summary} | <a href="{$user}_feedback.html" style="color:#000;text-decoration:underline;">{$lang.View_all}</a></h5>

             {section name=seller_rating loop=$Loop1}
             
             
             
             <div class="col-md-3">
                <a href="project_{$arating[seller_rating].project_id}_{$arating[seller_rating].project_title|stripslashes}.html" style="color:#000;">
		      {$arating[seller_rating].project_title}
		    </a>&nbsp;
	      </div>

	      <div class="col-md-2">
		    <img src="{$Templates_Image}{$arating[seller_rating].rating|intval}.gif" width="120">
              </div>

	      <div class="col-md-2">
		<p>{$lang.Time}</p>
		{$arating[seller_rating].date_time}
	      </div>
	      
	      <div class="col-md-3">
		<p>{$lang.Buyer}</p>
		<a href="buyer_profile_{$arating[seller_rating].rating_by_user}.html" style="color:#000;">{$arating[seller_rating].rating_by_user}</a> 
		
		{if $arating[seller_rating].count != ''}
                    <a href="{$arating[seller_rating].rating_by_user}_buyer_feedback.html" style="color:#000;">({$arating[seller_rating].count})</a> 
		{else}
                    <a href="{$arating[seller_rating].rating_by_user}_buyer_feedback.html" style="color:#000;">(0)</a> 
		{/if}
		
	      </div>
	      
	      <div class="col-md-2">
		<p>{$lang.Rating}</p>
		{$arating[seller_rating].rating|string_format:"%.2f"}
	      </div>

	      
	      
	      

	    <div class="col-lg-12">
	      <p>{$arating[seller_rating].dec}</p>
	    </div>
	    
	    
	    
          {/section}
            </div>
           </div>
            <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
        </div>
{/if}










        <!-- Education-->
      </div>
      <!-- /.col-lg-8 -->
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
</section>
<!-- End section-->
  
  
  <p></p>
  
  
  
  
  
  
     
     
     
     
     
     
     
     
     
     
     
     

