<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
         <h4>Buyer Feedback for</h4>
            <h1 class="revealOnScroll" data-animation="fadeInDown">
{$user_name}
<!-- 	      {if $user_name == 1} {$view_buyer_msg} {/if} -->

            </h1>
            <h4>{if $user_name == 0}{$Slogan}{/if}</h4>
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
    
    
    
     {if $Loop}

      <div class="jobs">	
	<div class="col-lg-12">

	  <div class="col-lg-12" style="background: none repeat scroll 0% 0% #f9f9f9;">
	    <div class="col-lg-6">
	      <h5>{$Total_Reviews}</h5>
	      <p>{$Loop}</p>
	    </div>

	    <div class="col-lg-6">
	      <h5>{$Average_Rating}</h5>
	      <p><img src="{$Templates_Image}{$ave_rating|intval}.gif" width="120">&nbsp;&nbsp;(<strong>{$ave_rating}</strong> out of 10)</p>
	    </div>
	  </div>

      {section name=rating loop=$Loop}
	  <div class="col-lg-12">
	    <hr>
	  </div>
	  <div class="col-lg-12" style="margin:10px;">
	   <div class="col-lg-3">
	      <a href="project_{$arating[rating].project_id}_{$arating[rating].clean_title}.html" class="footerlink">{$arating[rating].project_title}</a>&nbsp;<img src="{$Templates_Image}{$arating[rating].rating|intval}.gif" width="120">
	   </div>

	   <div class="col-lg-3">
	    <h5>{$Time}</h5>
	     <p> {$arating[rating].date_time}</p>
	   </div>
	   
	   <div class="col-lg-3">
	    <h5>{$Buyer}</h5>
	    <p><a href="buyer_profile_{$arating[rating].rating_by_user}.html" class="footerlink">{$arating[rating].rating_by_user}</a> {if $arating[rating].count != ''}
                    <a href="{$arating[rating].rating_by_user}_buyer_feedback.html" class="footerlink">({$arating[rating].count})</a> {else}
                    <a href="{$arating[rating].rating_by_user}_buyer_feedback.html" class="footerlink">(0)</a> {/if}
                    </p>
	   </div>
	   <div class="col-lg-3">
	   <h5>{$Rating}</h5>
	    <p>  {$arating[rating].rating|string_format:"%.2f"}</p>
	   </div>
	  </div>
	  <div class="col-lg-12">
	    <div class="col-lg-12">
	      <p>{$arating[rating].dec}</p>
	      <p>&nbsp;</p>
	    </div>
	  </div>
    {/section}
    
    </div>
      </div>
    {else}
    	<div class="jobs">	
	<div class="col-lg-12">
<p>&nbsp;</p>
	<p>{$Text1} <strong>{$user_name}</strong> {$Text2}</p>
          </div>
  </div>
    {/if}
    
    
    
    
        </div>
  </div>
</section>











