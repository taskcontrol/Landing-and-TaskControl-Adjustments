<?
define('IN_SITE', 	true);
define('IN_ADMIN', 	true);
define('FPDF_FONTPATH','/var/www/taskcontrol.net/web/libs/font/');

## print "Pdf_Send 1";

include_once("/var/www/taskcontrol.net/web/includes/common.php");

## print "Pdf_Send 2";

include_once("/var/www/taskcontrol.net/web/libs/fpdf.php");

## print "Pdf_Send 3";

	function Send_Pdf($Numero,$User_ID,$Company_ID,$Company_Address,$to,$from,$Correo_Paypal,$Descripcion,$DescripAdditionals,$add_cost,$PorcDescuento,$totaldiscount,$FechaDesde,$FechaHasta,$Tax,$Importe_Plan,$Total,$Tipo)
	{

        // Toma el "date" actual
        $Hoy=strftime("%d %b %Y ");
        $Hoy1=strftime("%Y%m%d%H%M%S ");
        $POS="0001";  // Mi punto de venta (POS) en AFIP (0001 por ahora fijo)
		
	// Arma el comprobante pdf -----------------------------------------
        
        $pdf = new FPDF('P', 'pt', array(500,550));
        $pdf->SetFont('Arial','I',12);
        $pdf->AddPage();
    
        if ($Tipo == "1") { //Factura Internacional
	    
            // $pdf->Image('./images/Invoice-E.jpg',0,0,500); 
            // $pdf->Image('/var/www/taskcontrol.net/web/images/InvoiceNeutral.jpg',0,0,500);
             $pdf->Image('/var/www/taskcontrol.net/web/images/INVOICE-INTL.jpg',0,0,500);
        }
        else { //Recibo "C" para Argentina
             $pdf->Image('/var/www/taskcontrol.net/web/images/RECIBO-C.jpg',0,0,500);
        }
        
        $pdf->SetFont('Arial','I',10);


        // Parte superior derecha (fecha y nro invoice)

        // Fecha hoy
        $pdf->setXY(355,49);
        $pdf->Cell(50, 30, $FechaDesde);

        // Fecha Vencimiento Factura=Plan
        $pdf->setXY(373,64);
        $pdf->Cell(50, 30, $FechaHasta);

        // Nro de Comprobante
        $pdf->setXY(375,78);
        $pdf->Cell(50, 30, $Numero);

      
        // Parte inferior izquierda (datos del cliente)
      
        // Client ID      comentado por el momento 17-10-2019 RFG
        // $pdf->setXY(328,33);
        // $pdf->Cell(50, 30, $User_ID);
        
        // CompanyID 
         $pdf->setXY(24,114);
         $pdf->Cell(50, 30, $Company_ID);

        // Direccion del Cliente 
         $pdf->setXY(24,128);
         $pdf->Cell(50, 30, $Company_Address);

        // Email de Paypal del Cliente
        $pdf->setXY(24,142);
        $pdf->Cell(50, 30, $Correo_Paypal);


        // Detalle del Plan

        // Fecha "DESDE" del Plan Subscripto
        $pdf->setXY(320,181);
        $pdf->Cell(50, 30, $FechaDesde);

        // Fecha "HASTA" del Plan Subscripto
        $pdf->setXY(420,181);
        $pdf->Cell(50, 30, $FechaHasta);

        // Descripcion del item
        $pdf->setXY(26,203);
        $pdf->Cell(50, 30, $Descripcion);

        // Monto del Plan
        $pdf->setXY(446,203);
        $pdf->Cell(50, 30, $Importe_Plan);

        // Descripcion y monto de los items "EXTRAS"
        $pdf->setXY(26,218);
        $pdf->Cell(50, 30, "**Extras: ".$DescripAdditionals);
        $pdf->setXY(446,218);
        $pdf->Cell(50, 30, $add_cost);
        
         // Descuento y monto (en caso hubiese)
        $pdf->setXY(26,233);
        $pdf->Cell(50, 30, "Discount(%): ".$PorcDescuento);
        $pdf->setXY(449,233);
        $pdf->Cell(50, 30, number_format($totaldiscount*-1.0,2));

        if ($Total > 0.00) { 
        $Total=$Importe_Plan+$add_cost-$totaldiscount;
       
        // Impuesto
        $pdf->setXY(449,220);
        $pdf->Cell(50, 30, $Tax);

        // Total Comprobante
        $pdf->setXY(449,283);
        $pdf->Cell(50, 30, $Total);
        }

        // Lo graba en nuestro server para q el user pueda bajarlo luego si quiere

        // Formato de nombre: CompanyID-POSNNNNNNNN   MyCompany-000100000001 siendo POS de 4 digitos (0001)
        $formato=sprintf("%s-%s%s",$User_ID,$POS,$Numero);
        $filename = $formato.".pdf";
        $content = $pdf->Output($filename,'F');

        // Lo envia tambien por mail al usuario
        $subject = "TaskControl: Your Subscription Invoice"; 
        $message = "<p>Please see your Invoice in attach.<br><br>
                       Review your transactions history any time by clicking at <strong>Transaction History</strong> in your Account Area.<br>
                       Thank You!.</p>
                       <p><strong>(C)2017-2020 TaskControl SaaS Project Management Software</strong></p>";
        // a random hash will be necessary to send mixed content
        $separator = md5(time());
        // carriage return type (we use a PHP end of line constant)
        $eol = PHP_EOL;
        // encode data (puts attachment in proper format)
        $pdfdoc = $pdf->Output("", "S");
        $attachment = chunk_split(base64_encode($pdfdoc));
        // main header
        $headers  = "From: ".$from.$eol;
        $headers .= "MIME-Version: 1.0".$eol; 
        $headers .= "Content-Type: multipart/mixed; boundary=\"".$separator."\"";
        // no more headers after this, we start the body! //
        $body = "--".$separator.$eol;
        $body .= "Content-Transfer-Encoding: 7bit".$eol.$eol;
        // $body .= "This is a MIME encoded message.".$eol;

        // message
        $body .= "--".$separator.$eol;
        $body .= "Content-Type: text/html; charset=\"iso-8859-1\"".$eol;
        $body .= "Content-Transfer-Encoding: 8bit".$eol.$eol;
        $body .= $message.$eol;

        // attachment
        $body .= "--".$separator.$eol;
        $body .= "Content-Type: application/octet-stream; name=\"".$filename."\"".$eol; 
        $body .= "Content-Transfer-Encoding: base64".$eol;
        $body .= "Content-Disposition: attachment".$eol.$eol;
        $body .= $attachment.$eol;
        $body .= "--".$separator."--";

        // send message
        mail($to, $subject, $body, $headers);
        
        return 0;

 }  

## print "sale de Pdf_Send"; 

?>
