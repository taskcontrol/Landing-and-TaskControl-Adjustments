function show_FullPay()
{
  
  $('#fullpay').css("display","block");
  $('#partialpay').css("display","none");
  $('#partialpay_Complete').css("display","none");
  
// 	document.getElementById('fullpay').style.visibility = 'visible';
// 	document.getElementById('fullpay').style.display = '';
// 	
// 	document.getElementById('partialpay').style.visibility = 'hidden';
// 	document.getElementById('partialpay').style.display = 'none';
// 
// 	document.getElementById('partialpay_Complete').style.visibility = 'hidden';
// 	document.getElementById('partialpay_Complete').style.display = 'none';
	
}

function show_PartialPay()
{
  
  $('#fullpay').css("display","none");
  $('#partialpay').css("display","block");
  $('#partialpay_Complete').css("display","none");
  
  
// 	document.getElementById('fullpay').style.visibility = 'hidden';
// 	document.getElementById('fullpay').style.display = 'none';
// 	
// 	document.getElementById('partialpay').style.visibility = 'visible';
// 	document.getElementById('partialpay').style.display = '';
// 
// 	document.getElementById('partialpay_Complete').style.visibility = 'hidden';
// 	document.getElementById('partialpay_Complete').style.display = 'none';
	
}

function show_PartialCompletePay()
{
  
  $('#fullpay').css("display","none");
  $('#partialpay').css("display","none");
  $('#partialpay_Complete').css("display","block");
  
// 	document.getElementById('fullpay').style.visibility = 'hidden';
// 	document.getElementById('fullpay').style.display = 'none';
// 	
// 	document.getElementById('partialpay').style.visibility = 'hidden';
// 	document.getElementById('partialpay').style.display = 'none';
// 
// 	document.getElementById('partialpay_Complete').style.visibility = 'visible';
// 	document.getElementById('partialpay_Complete').style.display = '';
	
}

// JavaScript Document
function Check_Details(frm)
{
	with(frm)
	{
		p = 0;
		x = 0;
		for(p=0; p<payment.length; p++)
		{
			if(payment[p].checked == true)
			{
				reason = payment[p].value;
				x = x +1;
				break;
			}
		}
		if(x == 0)
		{
			alert("Select Payment Type First");
			return false;
		}
		////////if full payment
		if(reason == 1)
		{
			if(project_list.value == 0)
			{
				alert("Please select project");
				return false;
			}
		}

		////////if partial payment
		if(reason == 2)
		{
			//alert(parseFloat(remaing_amount.value));
			remain = remaing_amount.value.replace(/,/, "");
			
			if(project_listing.value == 0)
			{
				alert("Please select project");
				return false;
			}
			if(!IsEmpty(send_amount_partially, "Please Enter Amount"))
			{
				return false;
			}
			if(parseFloat(send_amount_partially.value) >= parseFloat(max_amount.value))
			{
				alert("You can not send full amount $ " + max_amount.value + " or more than that");
				return false;
			}
			else if(parseFloat(send_amount_partially.value) >= parseFloat(remain))
			{
				alert("You can not send more then $ " + remaing_amount.value );
				return false;
			}
		}
		
		////////if full partial payment
		if(reason == 3)
		{
			if(project_lists.value == 0)
			{
				alert("Please select project");
				return false;
			}
		}

		
		return true;
	}
}
/*
############################
*/
function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      oldonload();
      func();
    }
  }
}

function prepareInputsForHints() 
{
	var inputs = document.getElementsByTagName("input");
	for (var i=0; i<inputs.length; i++)
	{

		// test to see if the hint span exists first
		if (inputs[i].parentNode.getElementsByTagName("span")[0]) 
		{
			// the span exists!  on focus, show the hint
			inputs[i].onfocus = function () 
			{
				this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
			}
			// when the cursor moves away from the field, hide the hint
			inputs[i].onblur = function () 
			{
				this.parentNode.getElementsByTagName("span")[0].style.display = "none";
			}
		}
	}
	var textarea = document.getElementsByTagName("textarea");
	for (var i=0; i<textarea.length; i++)
	{

		// test to see if the hint span exists first
		if (textarea[i].parentNode.getElementsByTagName("span")[0]) 
		{
			// the span exists!  on focus, show the hint
			textarea[i].onfocus = function () 
			{
				this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
			}
			// when the cursor moves away from the field, hide the hint
			textarea[i].onblur = function () 
			{
				this.parentNode.getElementsByTagName("span")[0].style.display = "none";
			}
		}
	}
	
	// repeat the same tests as above for selects
	var selects = document.getElementsByTagName("select");
	for (var k=0; k<selects.length; k++)
	{
		if (selects[k].parentNode.getElementsByTagName("span")[0]) 
		{
			selects[k].onfocus = function () 
			{
				this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
			}
			selects[k].onblur = function () 
			{
				this.parentNode.getElementsByTagName("span")[0].style.display = "none";
			}
		}
	}

}
//addLoadEvent(prepareInputsForHints);

