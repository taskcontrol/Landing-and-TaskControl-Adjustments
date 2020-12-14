<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en"> 
<!--<![endif]-->
<head>
  <title>{$Site_Title}</title>
	    <!-- ==============================================
		Title and Meta Tags
		=============================================== -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		
		<meta name="title" content="{$Meta_Title}">
    	<meta name="description" content="{$Meta_Description}">
	    <meta name="keywords" content="{$Meta_Keyword}">
	    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
		
		<!-- ==============================================
		Favicons
		=============================================== --> 
<!-- 		<link rel="shortcut icon" href="img/favicons/favicon.ico"> -->
<!-- 		<link rel="apple-touch-icon" href="img/favicons/apple-touch-icon.png"> -->
<!-- 		<link rel="apple-touch-icon" sizes="72x72" href="img/favicons/apple-touch-icon-72x72.png"> -->
<!-- 		<link rel="apple-touch-icon" sizes="114x114" href="img/favicons/apple-touch-icon-114x114.png"> -->


	    <!-- ==============================================
		CSS
		=============================================== -->
        <!-- Style-->
        <link href="/templates/css/style.css" rel="stylesheet" type="text/css" />
		<!-- Vegas 2.2.1 CSS-->
        <link href="/templates/js/vegas/vegas.css" rel="stylesheet" type="text/css" />
				
				
		<!-- ==============================================
		Feauture Detection
		=============================================== -->
		<script src="/templates/js/modernizr-custom.js"></script>
		
	{section name=FileName loop=$JavaScript}
    	<script language="javascript" src="{$Templates_JS}{$JavaScript[FileName]}"></script>
	{/section}
	
	<script type="text/javascript" src="/templates/js/jquery.js"></script>
   	<script type="text/javascript" src="/templates/js/scripts.js"></script>
    	
    	
    <script src="/templates/js/jquery-1.2.6.pack.js" type="text/javascript"></script>
		 
		 
 	<script language="javascript" src="{$Templates_JS}validate.js"></script>
 	<script language="javascript" src="{$Templates_JS}functions.js"></script>
	
    <script src="/jquery.flow.1.1.min.js" type="text/javascript"></script>
    <script src="/paul.js" type="text/javascript"></script>


		<!--[if lt IE 9]>
		 <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->		
	
</head>

<body class="greybg">

<!-- ==============================================
    Navbar
=============================================== -->

  <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
       <!-- Brand and toggle get grouped for better mobile display -->
	   <a class="navbar-brand" href="/">
	    <img src="templates/images/logos/goITglobal_logo_small_shadow.png" style="height: 39px;">
	   </a>
       <input type="checkbox" id="toggle" />
	   <label for="toggle" class="toggle"></label>


       <!-- Collect the nav links, forms, and other content for toggling -->
		<ul class="menu">
		    
		{if !$smarty.session.User_Name}
		  <li><a href="signup.php">Register</a></li> 
		  <li><a href="loginuser.php">Login</a></li>
   	    {/if}
   	     <li><a href="page_3.html">FAQ</a></li>
		 <li><a href="plans.php">Plans</a></li>
		 <li><a href="mantis/">Tickets</a></li> 
		 <li><a href="page_20.html">Resellers</a></li> 
 		 <li><script type="text/javascript" src="livechat/php/app.php?widget-init.js"></script></li>
    
 
         {if $smarty.session.User_Name}
		  <li>|</li>
 		  <li><a href="account.php">My Account</a></li> 		   
		  <li><a href="logout.php">Logout</a></li>
		  <br><br><li><h4><span class="styleWelcome">{$lang_common.Welcome} {$smarty.session.User_Name} !</span></h4></li>
	      <!-- <h3><span class="styleWelcome">{$lang_common.Welcome} {$smarty.session.User_Name}!</span></h3> -->
		  <!-- <h3><li><a href="account.php">{$smarty.session.User_Name}</a></li></h3> -->
		 {/if}

      
		</ul><!-- /.ul.menu -->
		
      </div><!-- /.container -->
     </nav><!-- /.nav -->

		
<!-- section with jobs -->

  {include file="$T_Body"} 


	  </div><!-- /.container -->
	 </section><!-- /section -->
	 
					<!-- LINK AREA ENDS HERE -->
				

<!--<div>
	<ul id="m-soc7">
		<li><a class="twitter" href="http://twitter.com/goitglobal" target="_blank"><span>Twitter</span></a></li>
		<li><a class="facebook" href="https://www.facebook.com/profile.php?id=100006690315438&fref=ts" target="_blank"><span>Facebook</span></a></li>
		<li><a class="google" href="https://accounts.google.com/" target="_blank"><span>Google+</span></a></li>
		<li><a class="rss" href="rss_pages.php"><span style="border:0;">RSS</span></a></li>
	</ul>
</div>-->
						

		{include file="$T_Header"}
		<!-- BANNER AREA ENDS HERE -->
		
		<!-- CONTAINER AREA STARTS HERE -->
		
		<div id="containerbg">
			<div id="headbg">
			<div id="head_area">
			<!-- for login error
			{if $smarty.get.login_error}
			<table width="847" border="0" align="center" cellpadding="0" cellspacing="0">
			  <tr>
				<td height="23" style="font-family:Arial, Helvetica, sans-serif;font-size:13px;font-weight:bold;color:#FFFFFF;text-decoration:none;" align="center">{if $smarty.get.login_error}{$lang_common.Login_Error}{else}&nbsp;{/if}</td>
			  </tr>
			</table>
			{/if}-->
	
			
			</div>
			
			
			
      		<div class="roundedcornr_content_503187">	

	

		<!-- CONTAINER AREA ENDS HERE -->
		</div>
			
		      </div>
		    </div>
		  </div>

			</div>
			
		</div>
			
		
			
		<!-- FOOTER BG STARTS HERE -->
		{include file="$T_Footer"}
		<!-- FOOTER BG ENDS HERE -->
		
		
	</div>
	
	
	    <!-- jQuery 2.1.4 -->
     <script src="/templates/js/jQuery-2.1.4.min.js" type="text/javascript"></script>
     <!-- Bootstrap 3.3.6 JS -->
     <script src="/templates/js/bootstrap.min.js" type="text/javascript"></script>
     <!-- Waypoints JS -->
     <script src="/templates/js/waypoints.min.js" type="text/javascript"></script>
     <!-- Vegas 2.2.1 JS -->
     <script src="/templates/js/vegas/vegas.min.js"></script>
     <!-- Jquery Animate Numbers -->
     <script src="/templates/js/jquery.animateNumbers.js" type="text/javascript"></script> 
     <!-- Jquery Flexslider -->
     <script src="/templates/js/jquery.flexslider-min.js" type="text/javascript"></script>
     <!-- Kafe Flexslider -->
     <script src="/templates/js/kafe.flexslider.js" type="text/javascript"></script>
     <!-- Jquery Appear -->
	 <script  src="/templates/js/jquery.appear.js" type="text/javascript"></script>
     <!-- Kafe JS -->
     <script src="/templates/js/kafe.js" type="text/javascript"></script>
     
   	<!-- MAIN ENDS HERE -->

</body>
