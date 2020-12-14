<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Manage_Payments}</h1>
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
    <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
      
      
<div id="sidebar" class="col-lg-4">
        <div class="list">
          <div class="list-group">

            <a href="deposit.php" class="list-group-item cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Deposit_Money}
            </a>
            <a href="escrow.php" class="list-group-item cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.New_Escrow_Payment}
            </a>
            <a href="page_7.html" class="list-group-item cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.New_Escrow_Payment_About}
            </a>
	    <a href="withdraw.php" class="list-group-item cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Withdraw_Money}
            </a>
            <a href="transcation.php" class="list-group-item cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Transaction_History}
            </a>
            
          </div>
          <!-- ./.list-group -->
        </div>
        <!-- ./.list -->
</div>
      <!-- ./.col-lg-4 -->
      <div class="col-lg-8 white-2">
        {include file="$T_Balance1"}
	  <div class="col-md-12 col-sm-12 col-xs-12 bg-primary" style="padding:4px;">
	    <div class="col-md-6 col-sm-6 col-xs-6" style="text-align:center;">
	      <p>{$lang.Escrow_Out}</p>
	    </div>
	    <div class="col-md-6 col-sm-6 col-xs-6" style="text-align:center;">
	       <p>{$lang.Escrow_In}</p>
	    </div>
	  </div>
	  <div class="col-md-12 col-sm-12 col-xs-12 bg-primary" style="padding:4px;">
	    <div class="col-md-2 col-sm-2 col-xs-2">
	     <p>{$lang.User}</p>
	    </div>
	    <div class="col-md-2 col-sm-2 col-xs-2">
	     <p> {$lang.Amount_Head}</p>
	    </div>
	    <div class="col-md-2 col-sm-2 col-xs-2">
	      <p>{$lang.Others}</p>
	    </div>
	    <div class="col-md-3 col-sm-3 col-xs-3">
	      <p>{$lang.User}</p>
	    </div>
	    <div class="col-md-2 col-sm-2 col-xs-2">
	      <p>{$lang.Amount_Head}</p>
	    </div>
	  </div>
	  
	  <div class="col-md-12 col-sm-12 col-xs-12">
	  {foreach name=esc_out from=$Escrow_Out_List item=esc_out}
	  
	    <div class="col-md-2 col-sm-2 col-xs-2">
	      <p>{$esc_out->to_user_login_id}</p>
	    </div>
	    <div class="col-md-2 col-sm-2 col-xs-2">
	      <p>{$esc_out->amount}</p>
	    </div>
	    <div class="col-md-2 col-sm-2 col-xs-2">
	     <p> <a href="release_payment_{$esc_out->ep_id}.html" class="bodytextwhite">{$lang.Release_Payment} </a> </p>
	    </div>
	    {foreachelse}
	    <div class="col-md-6 col-sm-6 col-xs-6" style="text-align:center;">
	     <p> ({$lang.Text}.)</p>
	    </div>
	    {/foreach}
	    
	    
	    {foreach name=esc_in from=$Escrow_In_List item=esc_in}
	    <div class="col-md-3 col-sm-3 col-xs-3">
	     <p> {$esc_in->from_user_login_id}</p>
	    </div>
	    <div class="col-md-2 col-sm-2 col-xs-2">
	     <p> {$esc_in->amount}</p>
	    </div>
	    {foreachelse}
	    <div class="col-md-6 col-sm-6 col-xs-6" style="text-align:center;">
	     <p>({$lang.Text}.)</p>
	    </div>
	    {/foreach}
	  </div>
	  <div class="col-md-12 col-sm-12 col-xs-12">
	  <hr>
	  
	  </div>
	  
	  {if $Loop > 0}
	  
	  
	  <div class="col-md-12 col-sm-12 col-xs-12">
	    <p><strong>{$lang.Transaction}</strong> | <a href="transcation.php" class="footerlinkcommon2">{$lang.ViewAll}</a></p>
	  </div>
	  
	  
	  <div class="col-md-12 col-sm-12 col-xs-12 bg-primary" style="padding:4px;">
	    <div class="col-md-4 col-sm-4 col-xs-4">
	     <p>{$lang.Amount_Head}</p>
	    </div>
	    <div class="col-md-4 col-sm-4 col-xs-4">
	     <p> {$lang.Description}</p>
	    </div>
	    <div class="col-md-4 col-sm-4 col-xs-4">
	      <p>{$lang.Date}</p>
	    </div>
	  </div>
	  
	  {section name=trac loop=$Loop}
	  <div class="col-md-12 col-sm-12 col-xs-12">
	    <div class="col-md-2 col-sm-2 col-xs-2">
	     <p>{$atraction[trac].trans_type}&nbsp;{$lang.Curreny}&nbsp;{$atraction[trac].amount|string_format:"%.2f"}</p>
	    </div>
	    <div class="col-md-6 col-sm-6 col-xs-6">
	     <p>{$atraction[trac].description}</p>
	    </div>
	    <div class="col-md-4 col-sm-4 col-xs-4">
	      <p>{$atraction[trac].date}</p>
	    </div>
	  </div>
	  {/section}
	 {/if}
	 
	 
	 
	 {if $Loop1 > -1}
	  <div class="col-md-12 col-sm-12 col-xs-12" style="padding:4px;">
	  {$lang.Withdraw_Money}
	  </div>
	  
	  <div class="col-md-12 col-sm-12 col-xs-12 bg-primary" style="padding:4px;">
	    <div class="col-md-2 col-sm-2 col-xs-2">
	     <p>{$lang.Amount_Head}</p>
	    </div>
	    <div class="col-md-5 col-sm-5 col-xs-5">
	     <p> {$lang.Description}</p>
	    </div>
	    <div class="col-md-3 col-sm-3 col-xs-3">
	      <p>{$lang.Date}</p>
	    </div>
	    <div class="col-md-2 col-sm-2 col-xs-2">
	      <p>{$lang.Status}</p>
	    </div>
	  </div>
	  
	  
	  
	  {section name=withdrawmoney loop=$Loop1}
	  <div class="col-md-12 col-sm-12 col-xs-12">
	    <div class="col-md-1 col-sm-1 col-xs-1">
	     <p>{$awithdarw[withdrawmoney].trans_type}&nbsp;{$lang.Curreny}&nbsp;{$awithdarw[withdrawmoney].amount|string_format:"%.2f"}</p>
	    </div>
	    <div class="col-md-5 col-sm-5 col-xs-5">
	     <p>{$awithdarw[withdrawmoney].description}asdasdasd</p>
	    </div>
	    <div class="col-md-3 col-sm-3 col-xs-3">
	      <p>{$awithdarw[withdrawmoney].requested_date}</p>
	    </div>
	    <div class="col-md-3 col-sm-3 col-xs-3">
	      <p>{if $awithdarw[withdrawmoney].status == 0}{$lang.Requested}{else}{$lang.Relived}{/if}</p>
	    </div>
	  </div>
	  
	  {/section}

	  {/if}
	  
        </div>
      </div>
    </div>
  </div>
</section>



