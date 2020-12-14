<script language="javascript">
var JS_Fname = '{$lang.JS_Fname}';
var JS_Lname = '{$lang.JS_Lname}';
var JS_City = '{$lang.JS_City}';
var JS_ZipCode = '{$lang.JS_ZipCode}';
var JS_Zip = '{$lang.JS_Zip}';
var JS_Address = '{$lang.JS_Address}';
var JS_Phone = '{$lang.JS_Phone}';
var JS_Phone1 = '{$lang.JS_Phone1}';
var JS_Mobile = '{$lang.JS_Mobile}';
var JS_Fax = '{$lang.JS_Fax}';
var JS_Employees = '{$lang.JS_Employees}';
addLoadEvent(prepareInputsForHints);
</script>

<section class="banner-login">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <div class="container">
    <div class="row">
      <main class="main main-signup col-lg-12">
        <div class="col-lg-6 col-lg-offset-3 text-center">
          <div class="form-sign">
           <form method="post" action="{$smarty.server.PHP_SELF}" name="frmedituserinfo">
              <div class="form-head">
                <h3>Edit Account Info</h3> </div>
              <!-- /.form-head -->
              <div class="form-body"> {if $smarty.get.login_error}
                <div class="form-row">
                  <div class="form-controls" style="color: #fff;">
                    <h4>{$lang_common.Login_Error}</h4> </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->{/if} {if $ERROR}
                <div class="form-row">{$ERROR}</div> {/if} {if $sucmsg}
                <div class="form-row" style="color:#fff;">{$sucmsg}</div>
                </tr> {/if}
                <div class="form-row">
                  <div class="form-controls">
                    <input id="mem_fname" name="mem_fname" value="{$mem_fname}" placeholder="{$lang.First_Name}" required="" class="field" type="text" size="25"> </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <input name="mem_lname" value="{$mem_lname}" placeholder="{$lang.Last_Name}" required="" class="field" type="text" size="25"> </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <input name="mem_company" value="{$mem_company}" placeholder="{$lang.Company}"  class="field" type="text" size="25"> </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <input name="mem_phone" value="{$mem_phone}" placeholder="{$lang.Phone}" required="" class="field" type="text" size="25"> </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <input name="mem_mobile" value="{$mem_mobile}" placeholder="{$lang.Mobile}" class="field" type="text" size="25"> </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <input name="mem_address" value="{$mem_address}" placeholder="{$lang.Address}" required="" class="field" type="text" size="25"> </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <input name="mem_city" value="{$mem_city}" placeholder="{$lang.City}" required="" class="field" type="text" size="25"> </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <input name="mem_zip" value="{$mem_zip}" placeholder="{$lang.Zip_Postal} (e.g. 12345)" required="" class="field" type="text" size="25"> </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <input name="mem_state" value="{$mem_state}" placeholder="{$lang.State_Province}" class="field" type="text" size="25"> </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <select name="mem_country" class="field" tabindex="10" placeholder="{$lang.Country}"> {$Country_List} </select>
                  </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <input name="mem_fax_no" value="{$mem_fax_no}" placeholder="{$lang.Fax}" class="field" type="text" size="25"> </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <select name="mem_emp" class="field" tabindex="12"> 
                      <option value="">{$lang.Employees}</option>
                      {$mem_emp}
                    </select>
                  </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <input name="" value="{$mem_email}" placeholder="{$lang.Email_Address}" required="" class="field" type="text" size="25" disabled="disabled"> </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls" style="text-align:left;"> {assign var="col" value=3} {section name=prod loop=$Loop} {if $smarty.section.prod.iteration|mod:$col==1} {/if}
                    <br>
                    <input type="checkbox" name="cat_prod[]" id="{$catid[prod]}" value="{$catid[prod]}" {if $catid[prod]|in_array:$checked_cat}checked{/if}>&nbsp;
                    <label for="{$catid[prod]}" style="color:#fff;">{$catname[prod]}</label> {if $smarty.section.prod.iteration|mod:$col==0} {/if} {/section} </div>
                  <!-- /.form-controls -->
                </div>
               
               
               
                </div>  
              
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls" style="text-align:left;">
                    <div class="form-head">
                      <h4 style="color:#fff;">{$lang.Options}</h4> </div>
                    <ul>
                      <li>
                        <input type="checkbox" id="check" name="check" value="1" tabindex="15" checked="checked">
                        <label for="check" style="color:#fff;">{$lang.Notify}</label>
                        <ul style="color:#fff;">
                          <li>* {$lang.Options1}</li>
                          <li>* {$lang.Options2}</li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                  <!-- /.form-controls -->
                </div>
            
                
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls" style="text-align:left;"> {$date1} </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
              </div>
              <!-- /.form-body -->
            
			 <input type="hidden" name="Action" value="Edit">
			  
                <div class="form-foot">
                   <div class="form-actions">
		 	          <input value="{$lang.Button_Submit}" class="form-btn" type="submit" onClick="Javascript: return Check_Details(this.form);">
		 		  </div> <!-- /.form-actions -->
                </div> <!-- /.form-foot -->
			  
            </form>
          </div>
          <!-- /.form-sign -->
        </div>
        <!-- /.col-lg-6 -->
      </main>
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
</section>
<!-- /section -->


