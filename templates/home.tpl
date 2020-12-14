
<!-- ==============================================
    Header
=============================================== -->
	 <header id="video" class="header-two"><meta http-equiv="Content-Type" content="text/html; charset=euc-jp">
      <div class="container">
	   <div class="content">

        <div class="row">

		 <h1 class="name revealOnScroll" data-animation="fadeInDown">
	    	 <img src="templates/images/logos/logowideshadow.png">
		 </h1>

		 <p class="temp"><strong>Doing the right tasks effectively & efficiently</strong></p>
                 <!-- <h1 class="hire revealOnScroll" data-animation="fadeInUp" data-timeout="400">Keep the chaos under control</h1> -->
                 <!-- <h2 class="hire revealOnScroll" data-animation="fadeInUp" data-timeout="400">Improve your Quality Of Service Drastically</h2> -->
                 <!-- <h2 class="hire revealOnScroll" data-animation="fadeInUp" data-timeout="400">Please Note: This Site Under Temporal Maintenance</h2> -->
                 <h2 class="hire revealOnScroll" data-animation="fadeInUp" data-timeout="400"><MARQUEE>Beta Testing Saga Has Just Started!! Will you Miss It ??</MARQUEE></h2>
  
	      <div class="form-row animations scale-in d3">

	   	  <div class="radio radio-left">
		   <a href="signup.php?role=1">MORE INFO</a>
		  </div>

		  <div class="radio radio-left">
		   <a href="signup.php?role=1">REGISTER</a>
		  </div>

		  <div class="radio radio-right">
		   <a href="loginuser.php?role=0">LOGIN</a>
		  </div>

                  <br>
		  <div class="radio radio-left">
                   <li>
		   <a href="demo-english.html">OVERVIEW (English)</a>
                   </li>
                   <li>
		   <a href="demo-spanish.html">OVERVIEW (Spanish)</a>
                   </li>
		  </div>
                  </br>                 


	 	 </div><!--./form-row -->

	   </div><!--./row -->

      <!--  <div class="row">
		  <div class="col-lg-10 col-lg-offset-1 hidden-xs">
	      <div class="logos">
	       <img style="height: 50px;maring-right: 50px;" src="/templates/images/paypal-3.png">
	       <img style="height: 50px;margin-right: 50px;" src="/templates/images/LogoPayoneer.png" >
	       <img style="height: 50px;margin-right: 50px;" src="/templates/images/moneybookers-skrill-2.png" >
           <img style="height: 50px;margin-right: 50px;" src="/templates/images/neteller-small.jpg">
	       <img style="height: 50px;margin-right: 50px;" src="/templates/images/mercadoPago-4.png" />
	   	  </div>
    	  </div> <!--./col-lg-10
		</div><!--./row -->



       </div><!--./content -->
	  </div><!--./container -->
     </header><!--./header -->



     <!-- 10-8-2017 se comenta la muestra de categorias y proyectos


	 <!-- ==============================================
	 Freelance Services Section
	 ===============================================
     <section id="services" class="services">
	  <div class="container text-center">
	   <div class="row">
	    <div class="col-lg-12">
		 <h3>Browse Freelance Services</h3>
		 <hr class="mint">
<!-- 		 <p class="top-p">View over 30,000 available services by category.</p> -->
<!-- <div style="width:100%;">
<!-- 	<div style="float:left;position:relative;"> -->
<!-- 	  <span class="style7">{$lang.Security_Projects}<br /></span> -->
<!-- 	  <span class="style5"><a href="category_list.php">{$lang.See_all_cetagory}</a></span> -->
<!-- 	</div> -->


<!-- block title -->
<!--	<p class="top-p" style="text-transform: uppercase;"><!--featured projects dashboard title--><!-- {$lang.dashboard} <!-- </p> -->




<!-- <p class="top-p" style="text-transform: uppercase;"><a href="category_list.php">{$lang.See_all_cetagory}</a></p>
<!-- LIST HEAD STARTS HERE -->



<!-- 	all categories list -->

<!--

<div style="float:left;position:relative;width: 23%;">
  <ul>
    {section name=CatList loop=$Loop1}
      <li width=250 id="td_id_{$smarty.section.CatList.index}" class="borders" onmouseover="javascript: show_Category({$smarty.section.CatList.index},{$total_cat});" style="text-align: left;">
	  <ul class="nav">
	    <li><a href="" style="color: #fff;">{$cat_name[CatList]}</a></li>
	  </ul>
      </li>
    {/section}
  </ul>
</div>


{section name=ProjList loop=$Loop1}



<div style="float:left;position:relative;width: 70%;">


<div id="homepage_projects_{$smarty.section.ProjList.index}" {if $smarty.section.ProjList.index == 0}style="visibility:visible;display:block;"{else}style="visibility:hidden;display:none;"{/if}>




<!-- projects list -->

<!--

{section name=ProjListint loop=$project_count[ProjList]}



<div class="col-lg-4 col-md-4 col-sm-6">
		  <a href="project_{$view_project[ProjList][ProjListint].id}_{$view_project[ProjList][ProjListint].clear_title|stripslashes}.html" class="hover">
		   <div class="features one">
		    <span class="fa-stack fa-3x" style="background:url('templates/images/logos/emblem_border.png') no-repeat;background-size:100%;">
<!-- 			 <i class="fa fa-circle fa-stack-2x"></i> -->
<!-- 			 <i class="fa fa-code fa-stack-1x fa-inverse"></i> -->

<!--			</span><!-- /span -->
<!--			<h4>{$cat_name[ProjList]}</h4>
		   </div><!-- /.features -->
<!--		   <div class="spacer">
		   <p>
		      {if $view_project[ProjList][ProjListint].status == 1}Open{/if}
		      {if $view_project[ProjList][ProjListint].status == 2}Freezed{/if}
		      {if $view_project[ProjList][ProjListint].status == 3}Closed For Bidding{/if}
		      {if $view_project[ProjList][ProjListint].status == 4}Closed{/if}
		      {if $view_project[ProjList][ProjListint].status == 5}Closed{/if}
		      {if $view_project[ProjList][ProjListint].status == 7}Closed{/if}
		  </p>
	  {if $view_project[ProjList][ProjListint].urgent_project == 1}
	    <p><strong><font color="#BA0403">({$lang.Urgent})</font></strong></p>
	  {/if}

		  <p>
		    {$lang.Average}:
		      {if $view_project[ProjList][ProjListint].bid == 0}$0.00
			{else}$ {$view_project[ProjList][ProjListint].Ave_Bid1}
		      {/if}
		  </p>
		  <p>#{$lang.Bid}: {$view_project[ProjList][ProjListint].bid}</p>

		  <p>{$lang.Started}: {$view_project[ProjList][ProjListint].project_date}</p>
		   </div> <!-- /.spacer -->
<!--		  </a>
		</div><!-- /.col-lg-4 -->

<!--	  {sectionelse}

{/section}
</div>


<!--<form method=post action=category_list.php>
      <button type="submit" class="positive" name="Submit" value="LOGIN">
	      <img src="/viewall.png" alt=""/>
	      View All Consultations
      </button>
</form>
-->

 <!-- </div>
	 {/section}
  </div>



<!-- LIST HEAD ENDS HERE -->
