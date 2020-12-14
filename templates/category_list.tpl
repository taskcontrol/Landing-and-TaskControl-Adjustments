  <!-- ==============================================
	 Header
	 =============================================== -->	 

 <header class="header-jobs">
      <div class="container">
	   <div class="content">
	    <div class="row">
		 <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		  <a href="loginuser.php" class="kafe-btn kafe-btn-mint full-width revealOnScroll" data-animation="bounceIn" data-timeout="400"><i class="fa fa-tags"></i> Post a Job, It’s Free!</a>
		 </div><!-- /.col-lg-3 -->
        </div><!-- /.row -->
       </div><!-- /.content -->
	  </div><!-- /.container -->
     </header><!-- /header -->


     
     
     
     
     <!-- ==============================================
	 Jobs Section
	 =============================================== -->
     <section class="jobslist">
	  <div class="container-fluid">
	   <div class="row-fluid">

<!--	    <div class="col-lg-4">
		 <div class="list">
		  <div class="list-group">-->
		  
<!--            <span class="list-group-item active cat-top"> -->
<!--             <em class="fa fa-fw fa-coffee text-white"></em>&nbsp;&nbsp;&nbsp;Categories -->
<!--             <span class="badge">200+</span> -->
<!-- 		   </span> -->
<!--	      <div class="col-lg-4">
		 <div class="list">
		  <div class="list-group">-->
<!--	    <div class="col-lg-4">
	      <div class="list">
		<div class="list-group">-->
	    {assign var="col" value=3}
	    {section name=CatList loop=$Loop}

{if $arr_cat[CatList].col==0}
  <div class="col-lg-4">
    <div class="list">
      <div class="list-group">
{/if}
		  <a href="category_{$arr_cat[CatList].id}.html" class="list-group-item cat-list">
		      <em class="fa fa-fw fa-code text-muted"></em>&nbsp;&nbsp;&nbsp;{$arr_cat[CatList].name|stripslashes}
      <!--             <span class="badge text-red-bg">50+</span> -->
<!-- 		  <span class="badge text-red-bg">{$arr_cat[CatList].col}</span> -->

		  </a>
{if $arr_cat[CatList].col==6}
      </div>
    </div>
  </div>
{/if}
	    {/section}
<!--</div>
	      </div>
	    </div>-->
	    
	    
	    
	    
<!--	    <div class="col-lg-4">
		 <div class="list">
		  <div class="list-group">-->
<!--		</div>
	      </div>
	    </div>-->
		
		
		
		
		 
	    </div><!-- /.col-lg-8 -->
	   </div><!-- /.row -->
	  </div><!-- /.container-fluid -->
     </section><!-- /section -->  	 
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     