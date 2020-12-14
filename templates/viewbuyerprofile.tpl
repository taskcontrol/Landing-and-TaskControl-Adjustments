<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
         <h4>Buyer Profile for</h4>
            <h1 class="revealOnScroll" data-animation="fadeInDown">
{$user}
<!-- 	      {if $user_name == 1} {$view_buyer_msg} {/if} -->

            </h1>
<!--             <h4>{if $user_name == 0}{$Slogan}{/if}</h4> -->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>



 <section class="overview" id="overview">
  <div class="container" style="background:#fff;">
    <div class="row">
  <div class="col-lg-2">&nbsp;</div>
  <div class="col-lg-8">

  <div class="about">

   {if $user_name == 1} {$view_buyer_msg} {/if}

   
   {if $user_name == 0}
   <div class="col-lg-4">
    <h5>{$lang.Location}</h5>
    <p>{$Location1}</p>
   </div>
   {if $emply!= ''}
   <div class="col-lg-4">
    <h5>{$lang.Employees}</h5>
    <p>{$emply}</p>
   </div>
   {/if}
<!--     <div class="col-lg-4">
    <h5>Organization</h5>
    <p>{$lang.organization}</p>
   </div>-->
   {if $website!= ''}
   <div class="col-lg-4">
    <h5>Web Site</h5>
    <p>{$website}</p>
   </div>
   {/if}
   
<!--   <div class="col-lg-4">
    <h5>{$lang.Buyer_Quick_Link}</h5>
    <p>{$lang.Main_Page}</p>
   </div>-->
   
   
<!--   <div class="col-lg-4">
    <h5>{$lang.Buyer_Quick_Link}</h5>
    <p><a target="_blank" href="{$Site_Root}buyer_profile_{$user}.html" class="footerlinkcommon23">&nbsp;{$Site_Root}buyer_profile_{$user}.html</a></p>
   </div>-->
<div class="col-lg-12">
  <h5>{$lang.Description1} </h5>
  <p>
    {if $Desc != ''} {$Desc|wordwrap:135:"\n":true} {else} {$lang.Msg_Desc} {/if}
  </p>
</div>

   {/if}

   <div class="col-lg-12">
   {if $Loop}

   Feedback Summary | <a href="{$user}_buyer_feedback.html" class="footerlinkcommon23"> <strong>Viewall</strong></a>

   {section name=rating loop=$Loop}		
<div class="col-lg-12">
  <div class="col-lg-12">
    <hr>
  </div>
   <div class="col-xs-3 col-md-3">
    <h5>&nbsp;</h5>
      <a href="project_{$arating[rating].project_id}.html" class="footerlink">
	{$arating[rating].project_title}
      </a>&nbsp;
      <img src="{$Templates_Image}{$arating[rating].rating|intval}.gif" width="120">
   </div>

   <div class="col-xs-3 col-md-3">
   <h5>Date</h5>
   {$arating[rating].date_time}
   </div>
   <div class="col-xs-3 col-md-3">
   <h5>Rating</h5>
      <a href="seller_profile_{$arating[rating].rating_by_user}.html" style="color:#000;">
	{$arating[rating].rating_by_user}
      </a>
      {if $arating[rating].count != ''} 
	<a href="{$arating[rating].rating_by_user}_feedback.html" style="color:#000;">({$arating[rating].count})</a>
      {else}
	<a href="{$arating[rating].rating_by_user}_feedback.html" style="color:#000;">(0)</a>
      {/if}
   </div>
   <div class="col-xs-3 col-md-3">
   <h5></h5>
    {$arating[rating].rating|string_format:"%.2f"}
   </div>
   </div>
    {/section}
   {/if}
   </div>
   
   
</div>
</div>

<div class="col-lg-2">&nbsp;</div>
</div>
</div>


<p>&nbsp;</p>















