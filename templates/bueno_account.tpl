
<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.My_Account}</h1>
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
  	        <a href="membership.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Upgrade}</a>
	        <a href="transcation.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;Billing History</a>
	        <a href="edit_userinfo.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Edit_Acc_Info}</a>
	   	    <a href="changepasswd.php" class="list-group-item cat-list"><em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Change_Pass}</a>
            <br>
            <br>
            Your Service Subscription Plan <strong>{$Membership_Name}</strong> bought at <strong>{$Buy_Date}</strong> expires on <strong>{$Finished_Date}</strong>.<br>
            <br>
          <a href="invite.php" style="color:#000;text-decoration:underline;">{$lang.Invite_TAC}</a><br>
          <br>
          {$lang.Invite_TAC_Text}<br>
          </div>
	    </div>
      </div> </div>
      
     </div>
        
        </section>