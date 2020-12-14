
<form name="frmproject" method="post" action="{$smarty.server.PHP_SELF}">
<header class="header-jobpost">
  <div class="container">
    <div class="content">
      <h4>{$lang.Project_Name}:</h4>
      <h1 class="revealOnScroll" data-animation="fadeInDown">
            {$project_title|stripslashes}</h1>
            <h4>by <a href="buyer_profile_{$project_posted_by}.html" target="_blank" style="color:#fff;">{$project_posted_by}</a></h4>
      <div class="row">
        <div class="col-lg-4 col-lg-offset-8 col-md-4 col-md-offset-8 col-sm-6 col-xs-12 animations fade-left d2">
          {if $smarty.session.User_Id == $user_id}
          <a href="place_bid_{$project_id}_{$clear_title}.html" class="kafe-btn kafe-btn-mint full-width revealOnScroll" data-animation="bounceIn" data-timeout="400" onClick="Javascript: return chk_user('{$smarty.session.User_Id}');"><i class="fa fa-star"></i> <font size="2">{$lang.Place_Bid}</font></a> {else}
          <a href="award_project_{$project_id}_{$clear_title}.html" class="kafe-btn kafe-btn-mint full-width revealOnScroll" data-animation="bounceIn" data-timeout="400"><i class="fa fa-star"></i> <font size="2">{$lang.Award_Project}</font></a> {/if}
        </div>
        <!-- /.col-lg-3 -->
      </div>
      <!-- /.row -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.container -->
</header>
<!-- /header -->
<section class="jobpost">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 white">
        <div class="row">
          <div class="col-lg-12">
            <br>
            <p>
              {$lang.Status}: {if $project_status == 1}{$lang.Open_for_bidding}{/if} {if $project_status == 2}{$lang.Freezed}<strong>&nbsp;&nbsp;(Awarded to {$project_post_to})</strong>{/if} {if $project_status == 3}{$lang.Close_for_Bidding}<strong>&nbsp;&nbsp;(Bid win by {$project_post_to})</strong>{/if} {if $project_status == 4}{$lang.Closed_Manually}<strong>&nbsp;&nbsp;(By Buyer itself)</strong>{/if} {if $project_status == 5}{$lang.Closed}<strong>&nbsp;&nbsp;(Awarding to this Consultation is left by {$project_posted_by})</strong>{/if} {if $project_status == 7}{$lang.Closed}<strong>&nbsp;&nbsp;(Awarding to this Consultation is left by {$project_posted_by})</strong>{/if}
            </p>
            {if $project_allow_bid !=1}
            <strong><font size="3">{$lang.Vip}</font></strong> {/if}
            <hr class="small-hr">
          </div>
        </div>
        <div class="row post-top-sec">
          <div class="col-lg-2">
            <h5> {$lang.Posted_Date} </h5>
            <p>{$project_posted_date}</p>
          </div>
          <!-- /.col-lg-3 -->
          <div class="col-lg-5">
            <h5> {$lang.Days_Of_Bidding} </h5>
            <p>
              {if $project_days_open
              < 0} {$lang.Project_Closed_Bidding} {else} {$project_days_open} {$lang.Days_remaining} {if $project_days_open==1 } <font color="#FF0000">({$lang.Last_day_for_bidding})</font>
                {/if} {/if}
            </p>
          </div>
          <div class="col-lg-5">
            <h5> {$lang.Budget1} </h5>
            <p>{$project_budget}</p>
          </div>
          <!-- /.col-lg-3 -->
          <div class="col-lg-12">
            <hr class="small-hr">
          </div>
          <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row post-top-sec">
          <div class="col-lg-2">
            <h5> {$lang.Bids_Received} </h5>
            <p>
              <!-- 		    <a href="project_{$project_id}_{$clear_title}.html#bid_list" class="bodytextwhite"> -->
              {$count}
              <!-- 		    </a> -->
            </p>
          </div>
          <div class="col-lg-2">
            <h5>{$lang.Shortlist}</h5>
            <!-- 		<a href="shortlist_{$project_id}_{$clear_title}.html#short_list" class="bodytextwhite"> -->
            <p>{$shortlistcnt}</p>
            <!-- 		</a> -->
          </div>
          <div class="col-lg-2">
            <h5>{$lang.Decline_Bid}</h5>
            <p>
              <!-- 		<a href="decline_{$project_id}_{$clear_title}.html#decline_list" class="bodytextwhite"> -->
              {$declinecnt}
              <!-- 		</a> -->
            </p>
          </div>
          <div class="col-lg-2">
            <h5>Average bid</h5>
            <p>
              {if $count != 0} {$lang.Curreny}{$Bid} {else} {$lang.Curreny}0.00{/if}
            </p>
          </div>
          <div class="col-lg-4">
            <h5>{$lang.Average_delivery_time}</h5>
            <p>{if $count != 0} {$Time} {$lang.Day} {else} 0 {$lang.Day} {/if}
            </p>
          </div>
          <div class="col-lg-12">
            <hr class="small-hr">
          </div>
          <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="post-bottom-sec">
          <h4>Job Description</h4>
          <p>{$project_description|wordwrap:50:"\n":true}</p>
          <h4>{$lang.Related_Files}</h4>
          <ul class="square">
            {if $project_file_1}
            <li><a href="Javascript: Download_File('{$download_project_file_1}','Project');" class="footerlinkcommon2">{$project_file_1}</a>
            </li>
            {/if} {if $project_file_2}
            <li><a href="Javascript: Download_File('{$download_project_file_2}','Project');" class="footerlinkcommon2">{$project_file_2}</a>
            </li>
            {/if} {if $project_file_3}
            <li><a href="Javascript: Download_File('{$download_project_file_3}','Project');" class="footerlinkcommon2">{$project_file_3}</a>
            </li>
            {/if} {if $project_file_1 == '' and $project_file_2 == '' and $project_file_3 == ''}
            <li>{$lang.No_upload}</li>
            {/if}
          </ul>
          {if $additionalcnt > 0}
          <h4>{$lang.Additional_Information}</h4> {section name=addinfo loop=$additionalcnt}
          <ul class="square">
            <li>{$lang.Submitted_On}: {$arr_additional[addinfo].Date_add}</li>
            {if $arr_additional[addinfo].filename}
            <li>{$lang.Additional_File}: <a href="Javascript: Download_File('{$arr_additional[addinfo].filename1}','Project');" class="footerlinkcommon2">{$arr_additional[addinfo].filename}</a>
            </li>
            {/if}
            <li>{$arr_additional[addinfo].Desc}</li>
          </ul>
          {/section} {/if}
          <h4>{$lang.Required_Skills}: </h4> {$categories}
        </div>
        <!-- /.post-bottom-sec -->
        <br>
        <div class="post-bottom-sec">
          <h4>{$lang.Reminder}</h4> {$lang.Bid_Note1}
          <br>
          <br> <strong>{$lang.Remember}</strong>&nbsp;{$lang.Remember_Note}
        </div>
        <!-- /.post-bottom-sec -->
        <hr>
        <h4>Proposals</h4> {section name=bid loop=$Loop}
        <div class="job">
          <div class="row top-sec">
            <div class="col-lg-12">
              <!--<div class="col-lg-2 col-xs-12">
			 <a href="freelancer.html">
			  <img class="img-responsive" src="img/users/5.png" alt="">
			 </a>
			</div>-->
              <div class="col-lg-10 col-xs-12">
                <h4>
			 {if $project_post_to == $arr_Bid[bid].User_Name}
                            <img src="{$Templates_Image}winner.png" border="0" style="width:40px;" />  
                            {/if}
			 <a href="seller_profile_{$arr_Bid[bid].User_Name}.html" target="_blank" class="link">{$arr_Bid[bid].User_Name}</a>
			 
			 {if $arr_Bid[bid].Premium_Member == 0} &nbsp; {else} &nbsp;&nbsp;
			      <img src="{$Templates_Image}vip_member.png" border="0" style="width:40px;" /> 
			    {/if}
			  <a href="#bid_list" onclick="JavaScript: popupWindowURL('private_message_form_user.php?project_id={$project_id}&id=1&bid_user={$arr_Bid[bid].User_Name}&pop_up=true','','600','500','','true','true');">
                            <img src="{$Templates_Image}btn_pm.png" border="0" align="middle" style="width:40px;" />
                            </a>
                            {if $smarty.session.User_Id == $arr_Bid[bid].User_Id}
			  {if $project_status == 1}
			    <div style="float: right;">
				<strong><a href="JavaScript: Delete_Click('{$arr_Bid[bid].bid_id}');" style="font-size: 14px;color: #f00;"><img src="{$Templates_Image}cancel_btn.png" border="0" align="middle" style="width:40px;" />{$lang.Cancel_Bid}</a></strong>
			    </div>
			  {/if} {/if}
			  {if $smarty.session.User_Id == $user_id}
			    {if $arr_Bid[bid].Bid_Shortlist==1}
                            <a  style="font-size: 14px;" href="JavaScript: ToggleStatus_Click('{$arr_Bid[bid].bid_id}', '0');">{$lang.Shortlist}</a> {else} {$lang.Shortlist}
                            {/if}
			  {/if}
                            </h4>
              </div>
              <!-- /.col-lg-10 -->
            </div>
            <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
          <div class="row mid-sec">
            <div class="col-lg-12">
              <div class="col-lg-12">
                <hr class="small-hr">
                <p>{$arr_Bid[bid].Bid_Desc|wordwrap:100:"\n":true}</p>
              </div>
              <!-- /.col-lg-12 -->
            </div>
            <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
          <div class="row bottom-sec">
            <div class="col-lg-12">

              <div class="col-lg-12">
                <hr class="small-hr">
              </div>
              <div class="col-lg-4">
                <h5> {$lang.Bid_Time} </h5>
                <p>{$arr_Bid[bid].Bid_Time}</p>
              </div>
              <div class="col-lg-5">
                <h5> {$lang.location} </h5>
                <p><i class="fa fa-map-marker"></i> {$arr_Bid[bid].Location}</p>
              </div>
              <div class="col-lg-3">
                <h5> {$lang.Bid_Amount} </h5>
                <p>{$lang_common.Curreny}&nbsp;{$arr_Bid[bid].Bid_Amount}</p>
              </div>
            </div>
            <!-- /.col-lg-12 -->
            <div class="col-lg-12">
              <div class="col-lg-4">
                <h5> {$lang.feedback} </h5>
                <p>{if $arr_Bid[bid].rating == 0.00} No Feedback yet {else}
                  <img src="{$Templates_Image}{$arr_Bid[bid].rating|intval}.gif" width="120">
                  <br /> &nbsp;
                  <a href="{$arr_Bid[bid].User_Name}_feedback.html" class="link">({$arr_Bid[bid].reviews} reviews)</a> {/if}</p>
              </div>
              <div class="col-lg-8">
                <h5> {$lang.Delivery_Time} </h5>
                <p>{$arr_Bid[bid].Delivery_Time}&nbsp;{$lang.Day}</p>
              </div>
            </div>
            <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.job -->
      {/section}
        <br>
        <br>
      </div>
      <!-- /.col-lg-8 -->


      <div class="col-lg-4">
        <div class="panel user revealOnScroll" data-animation="slideInUp" data-timeout="200">
          <div class="row text-center">
            <div class="col-xs-12 user-avatar" style='height: 52px;'>
              <h4 style="top: 17px;">{$lang.Related_Projects}</h4>
            </div>
            <!-- /.col-xs-12 -->
          </div>
          <!-- /.row -->
          <div class="list-group">
            {if $Related_Loop != ''} {section name=related_project loop=$Related_Loop} {if $arr_related_project[related_project].project_id != $project_id}
            <div class="list-group-item">&nbsp;&nbsp;&nbsp;
              <a href="project_{$arr_related_project[related_project].project_id}_{$arr_related_project[related_project].clear_title}.html" class="footerlinkcommon23">{$arr_related_project[related_project].project_title|stripslashes}</a>
            </div>
            {/if} {/section} {else}
            <div class="list-group-item">&nbsp;&nbsp;&nbsp;{$lang.No_Related}</div>
            {/if}
          </div>
          <!-- /.col-lg-4 -->
        </div>
        <!-- /.row-->
      </div>
      <!-- /.container -->
</section>
<!-- /section -->
<p>&nbsp;</p>

<input type="hidden" name="Action" />
<input type="hidden" name="project_id" value="{$project_id}" />
<input type="hidden" name="status" />
<input type="hidden" name="bid_id" />

</form>

