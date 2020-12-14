<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

  <tr>

    <td background="{$Templates_Image}img_bg.gif" align="center">

		<div id="shademenu" class="shadetabs" align="center">

			<ul>

			<li><a href="#" rel="dropmenu1" rev="testfield">Home</a></li>

			<li><a href="#" rel="dropmenu2">Management</a></li>

			<li><a href="#" rel="dropmenu3">Settings</a></li>

			<li><a href="#" rel="dropmenu4">Email</a></li>

			<li><a href="#" rel="dropmenu5">Website Management</a></li>

			<li><a href="project_list.php">Project Listing</a></li>

			<li><a href="#" rel="dropmenu7">Payment Gateway</a></li>

			<li><a href="#" rel="dropmenu8">Withdraw</a></li>

			</ul>

		</div>

	</td>

  </tr>

  <tr>

    <td background="{$Templates_Image}img_bg.gif" align="center">

		<div id="shademenu1" class="shadetabs1" align="center">

			<ul>

				<!--li><a href="#" rel="dropmenu2_1" rev="testfield">Test</a></li-->

				<li><a href="#" rel="dropmenu9">Manage Users</a></li>

				<li><a href="membership.php">Membership</a></li>

				<li><a href="#" rel="dropmenu10">Search</a></li>

				<li><a href="violation.php">Report Violation</a></li>

				<li><a href="#" rel="dropmenu11">Reporting</a></li>

				<li><a href="subadmin.php">SubAdmin </a></li>

				<li><a href="contact_us.php">Contact Us </a></li>

				<li><a href="#" rel="dropmenu12">New Check</a></li>

				<li><a href="#" rel="dropmenu6">Pending Request</a></li>

			</ul>

		</div>

	</td>

  </tr>

</table>





<!--

drop down menu for first row starts here 

-->

<!--drop down menu -->                                                

<div id="dropmenu1" class="dropmenudiv" style="width: 150px;">

<a href="index.php">Home</a>

<a href="changepass.php">Change Password</a>

<a href="logout.php">Logout</a>

</div>



<!--drop down menu -->                                                

<div id="dropmenu2" class="dropmenudiv" style="width: 150px;">

<a href="category.php?cat_parent_id=0">Category</a>
<a href="country.php">Country</a>

<a href="industry.php">Industry</a>

<a href="dev_cost.php">Development Cost</a>

<a href="execution_time.php">Execution Time</a>

<a href="year_experience.php">Experience</a>

<a href="badword.php">Bannedword</a>

<a href="condition.php">Registration Conditions</a>

<a href="../blog/wp-login.php?action=login">Wordpress</a>

</div>



<!--drop down menu -->                                                

<div id="dropmenu3" class="dropmenudiv" style="width: 150px;">

<a href="member_settings.php">Premium and Common Membership</a>

</div>





<!--drop down menu -->                                                

<div id="dropmenu4" class="dropmenudiv" style="width: 150px;">

<a href="emailconfig.php">Email Configuration</a>

<a href="email_managment.php">Email Management</a>

<a href="email_newsletter.php">Email Newsletter</a>

<!--a href="email_templates.php">Email Templates</a-->

</div>



<!--drop down menu -->                                                

<div id="dropmenu5" class="dropmenudiv" style="width: 150px;">

<a href="home_page.php">Home Page</a>

<a href="page.php">Other HP Pages</a>

<a href="siteconfig.php">Website Config</a>

<a href="google_code.php">Google Ad Code</a>

<a href="newsletter.php">Newsletter</a>

<!--<a href="dbbackup.php">Backup</a>

--></div>



<!--drop down menu -->                                                

<div id="dropmenu7" class="dropmenudiv" style="width: 150px;">

<a href="paypal.php">Paypal</a>

<a href="moneybooker.php">MoneyBooker</a>

<a href="dineromail.php">DineroMail</a>

<a href="mercadopago.php">MercadoPago</a>

<a href="neteller.php">Neteller</a>

</div>



<!--drop down menu -->                                                

<div id="dropmenu8" class="dropmenudiv" style="width: 150px;">

<a href="withdraw_paypal.php">Paypal</a>

<a href="withdraw_moneybooker.php">Moneybooker</a>

<a href="withdraw_dineromail.php">DineroMail</a>

<a href="withdraw_mercadopago.php">MercadoPago</a>

<a href="withdraw_neteller.php">Neteller</a>

</div>



<!--

drop down menu for first row ends here 

-->





<!--

drop down menu for second row starts here 

-->

<!--drop down menu -->                                                

<div id="dropmenu9" class="dropmenudiv" style="width: 150px;">

	<a href="users.php">All User</a>

	<a href="vip_members.php">VIP Members</a>

	<a href="special_members.php">Special Members</a>

	<a href="normal_members.php">Normal Members</a>

</div>



<div id="dropmenu10" class="dropmenudiv" style="width: 150px;">

	<a href="project_search.php">Project</a>

	<a href="protfolio_search.php">Protfolio</a>

	<a href="user_search.php">User</a>

</div>



<div id="dropmenu11" class="dropmenudiv" style="width: 150px;">

	<a href="escrow.php">Released Escrow Payments</a>

	<a href="escrow_pending.php">Pending Escrow Payments</a>

	<a href="user_account.php">User Account</a>

</div>



<div id="dropmenu6" class="dropmenudiv" style="width: 150px;">

	<a href="paypal_pending_request.php">Paypal</a>

	<a href="moneybooker_pending_request.php">Moneybooker</a>

        <a href="dineromail_pending_request.php">DineroMail</a>

        <a href="mercadopago_pending_request.php">MercadoPago</a>

        <a href="neteller_pending_request.php">Neteller</a>

</div>



<div id="dropmenu12" class="dropmenudiv" style="width: 150px;">

	<a href="new_bids.php">New Bids </a>

	<a href="new_pms.php">New PM</a>

</div>





<!--

drop down menu for second row ends here 

-->



<script type="text/javascript">

//tabdropdown.initializetabmenu("tab_menu_id", optional_selected_tab_number)

//ie: tabdropdown.initializetabmenu("tab_menu_id", 2)

tabdropdown.initializetabmenu("shademenu")

tabdropdown.initializetabmenu("shademenu1")



</script>

