<script language="javascript">
	var JS_Member			 = '{$lang.JS_Member}';
	var JS_Member_Check 	 = '{$lang.JS_Member_Check}';
</script>


<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Buy Plan</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header> <!-- /header -->


 <section class="blogpage jobpost plans" id="blogpage">
	  <div class="container text-left">
	   <div class="row">
		<div class="col-lg-8 col-lg-offset-2 white-blogpage">
      {if $membership_id != ''}
      {else}
  		  <h4>{$lang.Title}</h4>
		    <hr class="small-hr">
      {/if}
      
		  <form name="frmmembership" method="post">
		  {if $membership_id != ''}
		       {$lang.Message1} <strong>{$membership_name}</strong> at <strong>{$start_date}</strong> {$lang.Message2} <strong>{$end_date}</strong>.&nbsp;{$lang.Message3}
          <br>

  		{else}
		      {$lang.Membership_Msg} 
  		      <!-- <p>&nbsp;</p> -->


      {section name=mem loop=$Loop}
        <div class="col-sm-6 col-md-4 individual-plans fadeIn animated">
          {if $arr_member[mem].description[0] eq "STARTER"}
            <input type="radio" name="selected_membership[]" id="{$arr_member[mem].id}" value="{$arr_member[mem].id}" checked>
          {else}
            <input type="radio" name="selected_membership[]" id="{$arr_member[mem].id}" value="{$arr_member[mem].id}">
          {/if}
          <label for="{$arr_member[mem].id}" class="text-center">
            <div class="container-img center-block">
              {if $arr_member[mem].description[0] eq "STARTER"}
                <img src="templates/img/plans/starter.png" alt="starter">
              {elseif $arr_member[mem].description[0] eq "PROFESSIONAL"}
                <img src="templates/img/plans/professional.png" alt="professional">
              {elseif $arr_member[mem].description[0] eq "ENTERPRISE-ONE"}
                <img src="templates/img/plans/enterprise.png" alt="enterprise">
              {else}
                <p>Error in the conditional</p>
              {/if}
            </div>

            <h5 class="text-center">{$arr_member[mem].description[0]}</h5>
            <p>{$arr_member[mem].description[1]}</p>
            <p>{$arr_member[mem].description[2]}</p>
            <p>{$arr_member[mem].description[3]}</p>
            
            <!-- <div>
               <label for="{$arr_member[mem].id}">{$arr_member[mem].time}</label>
            </div>  -->
             <span class="plans-price">{$lang_common.Curreny}&nbsp;{$arr_member[mem].fees}</span>
             <small class="price-comment">(Prices per month)</small>
             <label for="{$arr_member[mem].id}" class="btn btn-block btn-choose">Choose</label>
          </label>

        </div>
      {/section}
      
        <div>
          <input style="left: 0px;margin-top: 23px;" id="btnbg2" type="submit" name="Submit" value="{$lang.Button_Submit}" class="kafe-btn kafe-btn-mint full-width" onClick="javascript: return check_membership(document.frmmembership,'{$Loop}');">
        </div>
      </form>

      <section class="plans-comparison">
        <h4>Plans Comparison</h4>
        <div class="table-responsive">

        <!-- AQUÏ COMIENZA LA TABLA -->

          <table class="table table-striped">

            <!-- AQUÍ COMIENZA LA CABECERA DE LA TABLA -->

            <thead>
              <tr> <!-- ÉSTA ETIQUETA ALMACENA LA FILA -->
                <th> </th> <!-- ÉSTAS ETIQUETAS SON LAS COLUMNAS DE UNA FILA -->
                <th>{$arr_member[0].description[0]}</th> <!-- STARTER -->
                <th>{$arr_member[1].description[0]}</th> <!-- PROFESSIONAL -->
                <th>{$arr_member[2].description[0]}</th> <!-- ENTERPRISE-ONE -->
                <!-- SI AGREGAS UN NUEVO PLAN EN LA BASE DE DATOS, DEBERÁS COPIAR Y PEGAR LA FILA DE ARRIBA Y AUMENTAR EL NÚMERO 2 Y ASÍ SUCESIVAMENTE. -->
                <!-- EJEMPLO: <th>{$arr_member[3].description[0]}</th> -->
                <!-- EJEMPLO: <th>{$arr_member[4].description[0]}</th> -->
                <!-- NO PUEDES SALTAR DEL 2 AL 4, SIEMPRE DEBE DE SER SUCESIVO -->
              </tr>
            </thead>

            <!-- AQUÍ TERMINA LA CABECERA DE LA TABLA -->

            <!-- AQUÍ COMIENZA EL CUEPOR DE LA TABLA -->

            <tbody>
              <!-- PRIMERA FILA -->
              <tr>
                <td>PMI Project Management Software</td> <!-- FEATURE -->
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td> 
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td> 
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td> 
                <!-- SI AGREGAS UN PLAN MÁS, DEBE DE AÑADÍR UNA CELDA MÁS AL FINAL EN TODAS LAS FILAS -->
                <!-- SI QUIERES QUE EL CHECKED ESTÉ GRIS USA ESTO: 
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                Y SI QUIERAS QUE SEA VERDA USA ESTE
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                -->
              </tr>
                
              <!-- SEGUNDA FILA -->
              <tr>
                <td>Agile Methodologies Oriented Features</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>

              <tr>
                <td>All-Project-Steps Document Generation</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>

              <tr>
                <td>Templates Based Emails Generation</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>
			  
			  <tr>
                <td>Contacts Management</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>
			 
			  <tr>
                <td>Project Agenda (To-Do List)</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>
 
			  <tr>
                <td>Contracts Management (Legal)</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>
			  
			  <tr>
                <td>Holidays & Absents Management (HHRR)</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>
			 
			  <tr>
                <td>Gantt Charts</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>			 
			 
			  <tr>
                <td>Bug & Tasks Management</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>	
			 
			   <tr>
                <td>Multi-Currency Billing</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>	
			  
			  <tr>
                <td>Multi-Sites/Offices Support</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>	
			  
			  <tr>
                <td>Shared Repository Management</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>	
			  
			   <tr>
                <td>Support By Tickets/Emails</td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>
			  
              <tr>
                <td>Task Timeline Management</td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>

              <tr>
                <td>Scope Control</td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>

			  <tr>
                <td>Private Emails Accounts</td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>
			  
			   <tr>
                <td>Private VideoChat Rooms</td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>
			  
			  <tr>
                <td>Capacity Planning</td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>
			  
			  <tr>
                <td>Profit&Loss Report</td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>
			  
			  <tr>
                <td>Metrics Module</td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>
			  
              <tr>
                <td>Risk Management</td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>

              <tr>
                <td>Audit Records</td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>

			  <tr>
                <td>Support by Email/Tickets/Chat 7x24</td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked false.png" alt="checked false"></td>
                <td><img src="templates/img/plans/checked true.png" alt="checked true"></td>
              </tr>
			  
            </tbody>

            <!-- AQUÍ TERMINA EL CUERPO DE LA TABLA -->

          </table>

        <!-- AQUÏ TERMINA LA TABLA -->

        </div>
      </section>

      {/if}

   <!-- {$lang.Membership_Msg}  -->

      </div>
    </div>
  </div>
</section>

<p>&nbsp;</p>
