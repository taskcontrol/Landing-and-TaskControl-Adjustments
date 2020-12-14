<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.User_Feedback}</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->


<script language="javascript">
	var JS_Comment	 = '{$lang.JS_Comment}';
</script>


<section class="folio" id="folio" style="background:#fff;">
  <div class="container-fluid">
      <div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
 <div class="col-md-2 col-sm-1 col-xs-1">
 &nbsp;
 </div>
 
    <div class="col-md-8 col-sm-10 col-xs-10">
      <div class="form-sign">
	<div class="form-body">
	<form action="{$smaty.server.PHP_SELF}" method="post" name="frmrating">
	
	
	<div class="form-row">
	  <div class="form-controls">
	    {$lang.Feedback_Note} <strong>{$user}</strong>
	  </div><!-- /.form-controls -->
	</div><!-- /.form-row -->
	
	
	<div class="form-row">
	  <div class="form-controls">
	    {$lang.Rating} ({$lang.Rating_Note}):
	  </div><!-- /.form-controls -->
	</div><!-- /.form-row -->
	
	
	
	<div class="form-row">
	  <div class="form-controls">
	  <select name="rating" class="textbox">
	  {$rating_List}
	</select>
	  </div><!-- /.form-controls -->
	</div><!-- /.form-row -->
	
	
	<div class="form-row">
	  <div class="form-controls">
	   <strong>{$lang.Comment} : </strong>
	  </div><!-- /.form-controls -->
	</div><!-- /.form-row -->

	<div class="form-row">
	  <div class="form-controls">
	   <textarea name="en_comm" class="textbox" cols="80" rows="10" placeholder="{$lang.Comment_Note}"></textarea>
	  </div><!-- /.form-controls -->
	</div><!-- /.form-row -->
	
	
	<div class="form-foot">
			 <div class="form-actions" style="text-align:center;">	
	   <input id="btnbg" type="submit" name="Submit" value="{$lang.Button_Rate}" class="btn btn-success" onclick="javascript : return Check_Details(this.form);" style="width:200px;">
	  </div><!-- /.form-controls -->
	</div><!-- /.form-row -->



 
 
 
 
 <input type="hidden" name="to" value="{$user}" />
<input type="hidden" name="project_id" value="{$project_id}" />
<input type="hidden" name="user_type" value="{$user_type}" />



</div>
</div>
 <div class="col-md-2 col-sm-1 col-xs-1">
 &nbsp;
 </div>
      </div></div></div>
    </div>
  </div>
</section>
</form>







