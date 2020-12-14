<?php

##  DAEMON DE RENOVACION DE PLANES DE SUBSCRIPCION (corre daily a las 0:00 hs)
##  Funciona asi: 
##  Recorre cada usuario que tenga un plan activo y para cada uno de ellos:

##  Si ES la fecha de expiracion de su plan y tiene fondos suficientes, 
##  renueva el plan (suma 30 dias), registra transaccion de renovacion, deduce el monto de su wallet y manda mail avisando al usuario de la renovacion y sale
##  Si NO TIENE fondos suficientes, manda mail diciendo que se dara de baja su servidor SOON debera actuar ya!, lo marca expired=1 y sale
##  (acordarse de exportar las bases de mysql diariamente y rotarlas cada 7 dias por ejemplo)
   
##  Si la fecha de expiracion es <= NOTICE_DAYS_IN_ADVANCE dias, Y NO TIENE fondos suficientes para la renovacion, 
##  manda el mail avisando que no olvide recargar fondos para que su plan no expire y sale.

##  Si TIENE FONDOS suficientes para la renovacion, sale (no necesita hacer nada, tiene fondos para renovar)
##  Si la fecha de exiracion es mayor a NOTICE_DAYS_IN_ADVANCE dias, sale (no necesita hacer nada).
##  RFG 1-10-2017

define('IN_SITE', true);
define('NOTICE_DAYS_IN_ADVANCE', 10); ## Con cuantos dias de anticipacion se le envian mails de alerta de renewal

include("/var/www/taskcontrol.net/web/includes/cronbcommon.php");

 ## print "luego del include de cronbcommon";

## include("/var/www/taskcontrol.net/web/includes/functions.php");

##  print "luego del include de functions";

include("/var/www/taskcontrol.net/web/db_access/Cronjobs.php");

##  print "luego del include Cronjobs";

include("/var/www/taskcontrol.net/web/db_access/Email.php");

##  print "luego del include Email";

include("/var/www/taskcontrol.net/web/db_access/Member.php");

##  print "luego del include de Member.php";

include("/var/www/taskcontrol.net/web/db_access/Payment.php");

##  print "luego del include de payment.php";

include("/var/www/taskcontrol.net/web/db_access/Pdf_Send.php");

## print "luego del ultimo include (Pdf_Send.php)";


$cron    = new Cronjobs();
$emails  = new Email();
$member  = new Member();
$pays    = new Payment();

$logStr = "";
$logFd = fopen("/var/www/taskcontrol.net/web/cronjobs/renewal_daemon_log.txt", "a");

fwrite($logFd, "------------------------------------\n");
$logStr = "Renewal Check Daemon Started";
fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[renewals_check.php] $logStr\n");

$cron->Membership_Active();   // Obtiene los datos de todos los usuarios q estan subscriptos a algun plan

$today_date = date('Y-m-d');

##  print "paso 2 antes del ciclo";

$i=0;
while($db1->next_record())	{

	$user_details[$i]['membership_id']					= $db1->f('membership_id');
	$user_details[$i]['membership_finish_date']			= $db1->f('membership_finish_date');
	$user_details[$i]['user_auth_id']			        = $db1->f('user_auth_id');
	$user_details[$i]['user_login_id']			        = $db1->f('user_login_id');
	$user_details[$i]['mem_email']			    	    = $db1->f('mem_email');	
	$user_details[$i]['membership_buy_date']			= $db1->f('membership_buy_date');
	$user_details[$i]['wallet_sum']			    	    = $db1->f('wallet_sum');	
	$user_details[$i]['discount_percent']               = $db1->f('discount_percent');
	$user_details[$i]['plan_expired']                   = $db1->f('plan_expired');
	$user_details[$i]['additionals_cost']               = $db1->f('additionals_cost');
	$user_details[$i]['additionals_description']        = $db1->f('additionals_description');
	$user_details[$i]['earn_by_site']                   = $db1->f('earn_by_site');
	$user_details[$i]['mem_address']                    = $db1->f('mem_address');
	
    // selecciona los datos del plan del usuario actual
    $plan_details = $member->GetMember($user_details[$i]['membership_id']);

    if ( $today_date >= $user_details[$i]['membership_finish_date']) { // si finaliza su plan HOY o ya finalizo anteriormente

     // calculo descuento
     $totaldiscount= number_format(($plan_details->membership_fees+$plan_details->additionals_cost)*$user_details[$i]['discount_percent']/100.00,2); 
     
     // chequeo si tiene fondos suficientes para renovar el plan automaticamente
     if ( number_format($user_details[$i]['wallet_sum'],2) >= number_format($plan_details->membership_fees,2) + number_format($user_details[$i]['additionals_cost'],2) - $totaldiscount) { 
     
        // To check User data BEFORE renewal process
        $strtxt1="BEFORE RENEWAL User: ".$user_details[$i]['user_login_id'];
        $strtxt2=" Plan: ".$plan_details->membership_name;
        $strtxt3=" Expiring: ".$user_details[$i]['membership_finish_date'];    
        fwrite($logFd, "$strtxt1.$strtxt2.$strtxt3\n");
       
        // echo "Renueva plan (corre fecha fin + 30 dias, update wallet, registra trx, registra ganancia y manda mail de renovacion exitosa al usuario)";
       
        // echo "Pone PLAN_EXPIRED=0 por si lo tenia en 1 (expirado) de antes;
        $member->Update_Expired($user_details[$i]['user_auth_id'],0);
        
        // echo "corre fecha de finalizacion del plan";
        $finished_date = date('Y-m-d', strtotime('+30 day'));
        $member->Update_finish_date($user_details[$i]['user_auth_id'],$finished_date);
        
        // echo "updatea el wallet del usuario";
        $totaladditionals= number_format($user_details[$i]['additionals_cost'],2);
        $totaldiscount= number_format(number_format(($plan_details->membership_fees+$plan_details->additionals_cost),2)*number_format($user_details[$i]['discount_percent']/100.00,2),2); 
        $importe= number_format(number_format($plan_details->membership_fees,2) + $totaladditionals - $totaldiscount,2); // le suma los adicionales y resta el descuento si los hay
        $new_wallet1 = number_format($user_details[$i]['wallet_sum'] - $importe,2);
       	Update_wallet_sum($user_details[$i]['user_auth_id'],$new_wallet1); 
         
        // echo "Inserta esta transaccion del usuario en los movimientos del usuario (solo Paypal por ahora)";
	    $transcation_id = $member->Insert_Member_Paypal($user_details[$i]['user_auth_id'],$user_details[$i]['user_login_id'],$importe,$plan_details->membership_name); 
        
    	// echo "Inserta la trx de renovacion en la tabla member_membership_history";
        $member->Insert_History($user_details[$i]['user_auth_id'],$user_details[$i]['user_login_id'],$plan_details->membership_id,$plan_details->membership_name,$plan_details->membership_time,$importe,$finished_date);
  
        // echo "Inserta ganancia del sitio por esta renovacion automatica, en la tabla site_earning_deposit";
        $costo_droplet=number_format($plan_details->membership_time*24*$plan_details->hourly_cost,2);
        $costo_backup= number_format(($costo_droplet)*$plan_details->backup_cost/100.00,2); //backup cost 20% sobre costo del droplet
        $costo_chat=   number_format($plan_details->snapshot_cost*$plan_details->gigas_included,2); // snapshot cost 0.05 por Gigabyte del droplet
        $costo_plan=   number_format($costo_droplet+$costo_backup+$costo_chat,2);  //tomo el costo del droplet, + backup + backup del chat server
	    $earning   =   number_format($importe - ($costo_droplet+$costo_backup+$costo_chat),2);
	    $payment_gateway = "Paypal-AutoRenewal";
        $pays->Insert_Earning_depost($user_details[$i]['user_auth_id'],$user_details[$i]['user_login_id'],$importe,$costo_plan,$earning,$payment_gateway);		
        
        // echo "va a updatear la tabla member_master sumando este earning al earning actual del cliente"
        // echo "asi tenemos la ganancia total hasta el momento en este cliente"
        $sumearning= number_format($user_details[$i]['earn_by_site']+$earning,2);
	    $member->Update_Wallet_From_Renew($user_details[$i]['user_auth_id'],$sumearning);

	    // Manda Mail agradeciendo la renovacion automatica      
        ////////////////////////////////////////////////////////////////////////////
        global $mail2;
        $mail2 = '';
        $mail2 = new htmlMimeMail();
		
        $tpl2 = new Smarty;
        $tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
        $mail2->setFrom('billing@taskcontrol.net');
        $mail2->setSubject('TaskControl: Thanks for Your Renewal!');
        $tpl2->assign(array("membership" => $plan_details->membership_name,
                        "finished_date" => $finished_date,
                        "amount" => $plan_details->membership_fees,
                        "additionals" => $totaladditionals,
                        "additionals_descrip" => $additionals_descrip,
                        "totaldiscount" => $totaldiscount, 
                        "total_order" => $importe ));
    
        $plan= $plan_details->membership_name;
        $fecha_fin= $user_details[$i]['membership_finish_date'];
        $amount= number_format($plan_details->membership_fees,2);
        $add_descrip= $user_details[$i]['additionals_description'];
        $add_cost= number_format($user_details[$i]['additionals_cost'],2);
        $tot_order=$importe;
       
        $mail_content_header="<strong>Dear TaskControl Customer:</strong><br>";
        $mail_content_footer="<br><strong>Thank You<br> TaskControl Support Team<br></strong> ";
        $mail_content_reg="<br>Your Automatic Renewal for your Subscription: <br>
                         <strong>$plan</strong>, <br>
                         Amount: <strong>$amount</strong>,<br>
                         Expiring date: <strong>$fecha_fin</strong>, <br>
                         Additionals: <strong>$add_descrip</strong>, <br>
                         Additionals Cost: <strong>$add_cost</strong>, <br>
                         Discount Amount: <strong>$totaldiscount</strong>, <br>
                         **Total Order: <strong>$tot_order</strong> <br> has been registered under your account and the renewal funds has been deducted from your wallet. <br> You don't have to do nothing by now.The next renewal will be done automatically providing you have enough funds in your wallet.<br> Thanks for being part of The TaskControl Community!";

        $mail_html = "<table border=0 cellpadding=0 cellspacing=0 width=75%>
					<tr>
						<td>".$mail_content_header."</td>
					</tr>
					<tr>
						<td>".$mail_content_reg."</td>
					</tr>
					<tr>
						<td>".$mail_content_footer."</td>
					</tr>
				</table>";
    
       $mail2->setHtml($mail_html);
       $recevier = GetEmailAddress($user_details[$i]['user_auth_id']);
       $result = $mail2->send(array($recevier));


       // Ahora manda el mail con el invoice (.pdf) de esta subscripcion

	  // Le enviamos una factura (.pdf) por la renovacion a su subscripcion (es solo informativa del plan, no hay movimiento de dinero aqui)
     
           $Numero=strftime("%d%m%Y%H%M%S");
	   $User_ID=$user_details[$i]['user_login_id'];
 	   $Company_ID=$user_details[$i]['user_login_id'];
 	   $Company_Address=$user_details[$i]['mem_address'];
	   $from="billing@taskcontrol.net";
	   $to=$recevier;
	   $Descripcion=$plan_details->membership_name;
	   $DescripAdditionals=$add_descrip;
	   $PorcDescuento=number_format($user_details[$i]['discount_percent'],2);
	   $FechaDesde=strftime("%Y-%m-%d");
	   $FechaHasta=$finished_date;
	   $Tax=0.00;
	   $Importe_Plan=$amount;
	   $Total=number_format($Importe_Plan+$add_cost-$totaldiscount,2);
	   $Tipo="1"; // Factura "E" o Exportacion (los Recibo "C" (Tipo=2) son para Argentina y los ingresare y enviare manualmente por la pagina del AFIP)
	   $resultado=Send_Pdf($Numero,$User_ID,$Company_ID,$Company_Address,$to,$from,$to,$Descripcion,$DescripAdditionals,$add_cost,$PorcDescuento,$totaldiscount,$FechaDesde,$FechaHasta,$Tax,$Importe_Plan,$Total,$Tipo);

       //--------------------------- Fin Envio Invoice ----------------
       
       // Log To check User data AFTER renewal process
       $strtxt1="AFTER RENEWAL User: ".$user_details[$i]['user_login_id'];
       $strtxt2=" Plan: ".$plan_details->membership_name;
       $strtxt3=" Expiring: ".$finished_date;    
       fwrite($logFd, "$strtxt1.$strtxt2.$strtxt3\n");
    
       ////////////////////////////////////////////////////////////////////////////////////////     
   
     }
     else {
         // Si el cliente NO esta expirado aun (member_master.plan_expired = 0) entonces  le envia mail avisando
         // que su servicio se dara baja, (lo marca con member_master.plan_expired=1)
         // para poder gestionar su baja como sea necesario si no recarga y renueva en las x horas siguientes a este aviso
     
     
        if ($user_details[$i]['plan_expired'] == 0) {   // SI NO ESTA expirado AUN...
     
            // echo "Marca al usuario con el PLAN_EXPIRED=1 para darlo de baja o tener en cuenta que su plan ya esta expirado";
            $member->Update_Expired($user_details[$i]['user_auth_id'],1);
        
            global $mail2;
            $mail2 = '';
            $mail2 = new htmlMimeMail();
		
            $tpl2 = new Smarty;
            $tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
            $mail2->setFrom('billing@taskcontrol.net');
            $mail2->setSubject('TaskControl: Your Account has been deactivated!');
            $tpl2->assign(array("user" =>$user_details[$i]['user_login_id'],
                            "membership" =>$plan_details->membership_name,
                            "buy_date"=>$user_details[$i]['membership_buy_date'],
                            "finished_date" => 	$user_details[$i]['membership_finish_date'],
                            "amount" => $plan_details->membership_fees));
    
            $usuario= $user_details[$i]['user_login_id'];
            $fecha_compra= $user_details[$i]['membership_buy_date'];
            $fecha_fin= $user_details[$i]['membership_finish_date'];
            $mail_content_header="<strong>Dear TaskControl Customer:</strong>";
            $mail_content_footer="<br><strong>Thank You<br> TaskControl Support Team<br></strong> ";
            $mail_content_reg=" <br>You have bought the plan <strong>$plan_details->membership_name</strong> at <strong>$fecha_compra</strong> but that plan has already expired and there is no funds in your wallet for us to renewal so we are deactivating it.<br>To reactivate it, please: <strong>contactus@taskcontrol.co</strong> within 24 hours.<br>";

            $mail_html = "<table border=0 cellpadding=0 cellspacing=0 width=75%>
					<tr>
						<td>".$mail_content_header."</td>
					</tr>
					<tr>
						<td>".$mail_content_reg."</td>
					</tr>
					<tr>
						<td>".$mail_content_footer."</td>
					</tr>
				</table>";
    
            $mail2->setHtml($mail_html);
            $recevier = GetEmailAddress($user_details[$i]['user_auth_id']);
            $result = $mail2->send(array($recevier));
    
            // To check the User that has been deactivated
            $strtxt1="User that has been Deactivated: ".$user_details[$i]['user_login_id'];
            $strtxt2=" Plan: ".$plan_details->membership_name;
            $strtxt3=" Expiring: ".$fecha_fin;    
            fwrite($logFd, "$strtxt1.$strtxt2.$strtxt3\n");
       
       } // if not expired
       
       ////////////////////////////////////////////////////////////////////////////////////////   
     }     
}
else {  // su plan NO finaliza hoy
    
     $days_to_finish = strtotime($user_details[$i]['membership_finish_date'])- strtotime($today_date);
     $days_to_finish = round($days_to_finish/86400);
     
     if ($days_to_finish <= NOTICE_DAYS_IN_ADVANCE) { // si entro en el periodo de aviso de renovacion (NOTICE_DAYS_IN_ADVANCE)

        // calculo el descuento actual
        $totaldiscount= number_format($plan_details->total_price*($user_details[$i]['discount_percent']/100.00),2); 
         
         // chequeo si tiene fondos para la proxima renovacion
        if ($user_details[$i]['wallet_sum'] < $plan_details->total_price + $user_details[$i]['additionals_cost'] - $totaldiscount) { 
           
             // Le Enviamos mail recordandole que recargue su wallet por renovacion cercana!!
             
             global $mail2;
             $mail2 = '';
             $mail2 = new htmlMimeMail();
		
		     $tpl2 = new Smarty; 
             $tpl2->compile_dir	= $physical_path['Site_Root']. 'templates_c/';
             $mail2->setFrom('billing@taskcontrol.net');
             $mail2->setSubject('TaskControl: Plan Expiration Notice');
             
             $tpl2->assign(array("user" =>$user_details[$i]['user_login_id'],
                            "membership" =>$plan_details->membership_name,
                            "finished_date" =>$user_details[$i]['membership_finish_date'],
                            "amount" => $plan_details->membership_fees));
    
             $fecha_fin= $user_details[$i]['membership_finish_date'];
             $totaldiscount= number_format($plan_details->total_price*($user_details[$i]['discount_percent']/100.00),2); 
             $total_order= $plan_details->total_price + $user_details[$i]['additionals_cost'] - $totaldiscount;
             
             $mail_content_header="<strong>Dear TaskControl Customer:</strong>";
             $mail_content_footer="<br><strong>Thank You<br> TaskControl Support Team<br></strong> ";
             $mail_content_reg="<br><strong>TaskControl Plan Expiry Notice !</strong><br><br>We kindly reminds you that your plan <strong>$plan_details->membership_name</strong> for an amount of <strong>$total_order</strong> will be valid up to <strong>$fecha_fin</strong>.<br>Please Reload Funds to your Wallet as soon as possible to avoid service disruption.<br>";
        
             $mail_html = "<table border=0 cellpadding=0 cellspacing=0 width=75%>
					<tr>
						<td>".$mail_content_header."</td>
					</tr>
					<tr>
						<td>".$mail_content_reg."</td>
					</tr>
					<tr>
						<td>".$mail_content_footer."</td>
					</tr>
				</table>";
    
             $mail2->setHtml($mail_html);
             $recevier = GetEmailAddress($user_details[$i]['user_auth_id']);
             $result = $mail2->send(array($recevier));
    
            ////////////////////////////////////////////////////////////////////////////////////////  
            
         }
     }
}

$i++;

}

// Registra la corrida del daemon (timestamp: Renewal Daemon Executed Succesfully.) y Sale
$logStr = "";
$logStr = "Renewal Daemon Executed Succesfully";
fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[renewals_check.php] $logStr\n");
fwrite($logFd, "------------------------------------\n");
fclose($logFd);

## print "..salimos...";

?>
