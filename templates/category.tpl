  <!-- ==============================================
	 Header
	 =============================================== -->	 

<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
         <h4>{$lang.Project_Listing}</h4>
            <h1 class="revealOnScroll" data-animation="fadeInDown">Category: {$Dsce_Cats}</h1>
            
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->



<div class="col-lg-12 white" style="background:#fff;">

 {if $rscntpro > 0}
 
{section name=ProList loop=$rscntpro}

    <div class="job">	
      <div class="row top-sec">
	<div class="col-lg-12">
	      <!--<div class="col-lg-2 col-xs-12">
		<a href="freelancer.html">
		<img class="img-responsive" src="img/users/1.png" alt="">
		</a>
	      </div>--><!-- /.col-lg-2 -->
	    <div class="col-lg-10 col-xs-12"> 
	      <h4>
		<a href="project_{$view_project[ProList].id}_{$view_project[ProList].clear_title}.html"><strong>{$view_project[ProList].title|stripslashes}</strong></a> &nbsp;{if $view_project[ProList].urgent_project == 1} <strong><font color="#BA0403">(Urgent)</font></strong> {else} &nbsp; {/if}
	      </h4>
	      {if $view_project[ProList].premium_project == 1}
		<img src="{$Templates_Image}premium_project.gif" border="0" title="Premium Project" style="width: 21px;height: 21px;margin: 0px 10px 0 0;float: left;padding: 0;" /> 
		{elseif $view_project[ProList].membership_id != 0}
		<img src="{$Templates_Image}vip_member.gif" border="0" title="Project Posted By VIP Member"  style="width: 21px;height: 21px;margin: 0px 10px 0 0;float: left;padding: 0;" /> 
            {/if}
            <h5>
	      <a href="seller_profile_{$view_project[ProList].project_posted_by}.html">{$view_project[ProList].project_posted_by}</a>
            </h5>
	  </div><!-- /.col-lg-10 -->
	</div><!-- /.col-lg-12 -->
      </div><!-- /.row -->
		<div class="row mid-sec">			 
		  <div class="col-lg-12">			 
		    <div class="col-lg-12">
			<hr class="small-hr">
			<p>{$view_project[ProList].dec}</p>
			
			{$view_project[ProList].category}
			<!--<span class="label label-success">HTML 5</span>
			<span class="label label-success">CSS3</span>
			<span class="label label-success">PHP 5.4</span>
			<span class="label label-success">Mysql</span>
			<span class="label label-success">Bootstrap</span>-->
		   </div><!-- /.col-lg-12 -->
		   </div><!-- /.col-lg-12 -->
		  </div><!-- /.row -->
		  
		  <div class="row bottom-sec">
		   <div class="col-lg-12">
			
			<div class="col-lg-12">
			 <hr class="small-hr">
			</div> 
			
			<div class="col-lg-2">
			 <h5> {$lang.Started} </h5>
			 <p>{$view_project[ProList].project_posted_date}</p>
			</div>
			<div class="col-lg-2">
			 <h5> {$lang.Average} </h5>
			 <p>{if $view_project[ProList].bid == 0} {$lang_common.Curreny}&nbsp;0.00 {else} {$lang_common.Curreny}&nbsp;{$view_project[ProList].Ave_Bid1} {/if} </p>
			</div>
			<div class="col-lg-2">
			 <h5> {$lang.Bids} </h5>
			 <p>{$view_project[ProList].bid}</p>
			</div>
			<div class="col-lg-2">
			 <h5> {$lang.Status} </h5>
			 <p>
			 {if $view_project[ProList].project_status == 1}<img src="{$Templates_Image}bopen.jpg" border="0" title="Project Open" /> Open{/if} 
			 {if $view_project[ProList].project_status == 2}<img src="{$Templates_Image}bpre.jpg" border="0" title="Project Freezed" /> Freezed{/if} 
			 {if $view_project[ProList].project_status == 3}<img src="{$Templates_Image}bclose.jpg" border="0" title="Project Closed For Bidding" /> Closed For Bidding{/if} 
			 {if $view_project[ProList].project_status == 5}<img src="{$Templates_Image}close.jpg" border="0" title="Project Closed" /> Closed{/if} 
			 {if $view_project[ProList].project_status == 7}<img src="{$Templates_Image}close.jpg" border="0" title="Project Closed" /> Closed{/if}</p>
			</div>
			<!--<div class="col-lg-4">
			 <a href="jobpost.html" class="kafe-btn kafe-btn-mint-small"><i class="fa fa-align-left"></i> Send Proposal</a>
			</div>-->
			
		   </div><!-- /.col-lg-12 -->
		  </div><!-- /.row -->
		  
		  
		  <div class="col-lg-12" style="text-align:center;">
		    <br>{$Page_Link}</br>
		  </div>
		  
		  
		 </div><!-- /.job -->
		 
		 

		  
		  
{/section}

{else}
<p>
  <center>
  <h5>{$lang.No_Project_Text}</h5>
  </center>
</p>
<!-- <p>&nbsp;</p> -->
{/if}

<p>&nbsp;</p><p><hr></p><p>&nbsp;</p>
 </div>












