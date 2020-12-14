// JavaScript Document
function Check_Details(frm)
{
	with(frm)
	{
		if(!IsEmpty(mem_fname, JS_Fname))
		{
			return false;
		}
		if(!IsEmpty(mem_lname, JS_Lname))
		{
			return false;
		}
		
		if(!IsEmpty(mem_phone, JS_Phone))
		{
			return false;
		}
		else if(isNaN(mem_phone.value))
		{
			alert(JS_Phone1);
			frm.mem_phone.focus;
			return false;
		}
		if(mem_mobile.value != '')
		{
			if(isNaN(mem_mobile.value))
			{
				alert(JS_Mobile);
				frm.mem_mobile.focus;
				return false;
			}
		}
		if(!IsEmpty(mem_address, JS_Address))
		{
			return false;
		}
		if(!IsEmpty(mem_city, JS_City))
		{
			return false;
		}
		
		if(!IsEmpty(mem_zip, JS_ZipCode))
		{
			return false;
		}
		else if(isNaN(mem_zip.value))
		{
			alert(JS_Zip);
			frm.mem_zip.focus;
			return false;
		}
		else if(isNaN(mem_fax_no.value))
		{
			alert(JS_Fax);
			frm.mem_fax_no.focus;
			return false;
		}
		if(mem_website.value == '')
		{
			return true;
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

