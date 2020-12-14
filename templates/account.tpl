<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.My_Account}</h1>
            <!--<p>New Here? Create Your Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->


<section class="overview" id="overview">
  <div class="container">
    <div class="row">


      <div id="sidebar" class="col-lg-4">
        <div class="list">
          <div class="list-group">
          
          <a href="deposit.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Payments}</a>  

         <a href="membership.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;Buy a Plan</a>

	       <!-- <a href="buystorage.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Buy_Storage}</a> -->

         <a href="transcation.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;Transactions History</a>

         <a href="edit_userinfo.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Edit_Acc_Info}</a>

         <a href="changepasswd.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Change_Pass}</a>

         <a href="http://{$Mem_Company}.taskcontrol.net" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;TaskControl Login</a>
	   
		</div>
		      <!-- ./.list-group -->
        </div>
           <!-- ./.list -->
      </div>
      <!-- ./.col-lg-4 -->
      
      
       <div class="col-lg-8 white-2">
           {include file="$T_Balance"}
       <div class="about"> 
       
       
          <!--   <div class="col-lg-12 top-sec"> -->
		  <!--  <h4>You buy <strong>{$Membership_Name}</strong> plan at <strong>{$Buy_Date}</strong> that will expires on <strong>{$Finished_Date}</strong>.</h4>  -->
		  <!-- </div> -->
        
	  <p>&nbsp;</p>
		     <p><h3><a href="invite.php" style="color:#000;text-decoration:underline;">{$lang.Invite_TAC}</a></h3></p>
          <p>&nbsp;</p>
          
          </div>
          
          
          
          
          </div>
          
          
          
      </div>
      
      </div>
      </section>
      
      
      <p>&nbsp;</p>
