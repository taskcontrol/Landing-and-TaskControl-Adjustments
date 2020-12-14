<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Confirm Subscription</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->


<section class="blogpage jobpost plans">
	<div class="container text-left">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 white-blogpage" id="list_head">			
				<div style=" clear:both;">
					<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b>
					<div class="contentf"><div>
						<form name="frmmembership_confirm" method="post">
							<div class="alert alert-warning">
								{$msg_confirm} <strong> {$membership_name} </strong>{$lang.msg_confirm1}
							</div>
							<table width="100%" bgcolor="#ffffff" border="0" align="center">
								<td colspan="3" align="center" class="successMsg" height="15">
									<p><strong><u>You Accept:</u></strong></p>
								</td>
								<tr>
									<td colspan="5" align="left" class="successMsg" height="40">
								        <h6>&nbsp; a- Renewal will occur automatically providing you have funds in your Wallet.<br>
							            &nbsp; b- We do not refunds for unused service subscription time.<br>
							            &nbsp; c- We do not offer plans downgrades.<br>
							            &nbsp; d- Plan Prices don't include fees or charges for Payment Processors.<br>
							            &nbsp; e- Other charges may be applied for non-USD Paypal accounts.<br>
							            &nbsp; f- All prices expressed in US Dollars. Taxes are not included.<br>
							            &nbsp; g- Should you note constant perfomance degradation,<br>
							            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; we encourage to upgrade to the next higher plan.<br>
							            &nbsp; h- Should you have any doubt, please check our <strong>FAQ & TOS.</strong>
									    </h6><br>
							        </td>
								</tr>
							</table>
							<div class="membership-buttons-container">
								<div class="col-xs-12 membership-buttons">
									<input type="submit" name="Submit1" value="{$lang.Button_Submit}" class="form-btn">
								</div>
								<div class="col-xs-12 membership-buttons">
									<input type="submit" name="Submit2" value="{$lang.Button_Cancel}" class="form-btn">
								</div>
							</div>
							<input type="hidden" name="membership_id" value="{$membership_id}">
						</form>
					</div>
				</div>
				<b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b>
				</div>
				<div id="more_link">
				</div>
			</div>
		</div>
	</div>
</section>

<p>&nbsp;</p>
