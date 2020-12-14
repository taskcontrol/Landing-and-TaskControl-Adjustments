function Check_Details(frmSignup)

{

	with(frmSignup)

	{

		if(!IsEmpty(user_id, JS_User_ID))

		{

			return false;

		}

		else if ((user_id.value.length < 3) || (user_id.value.length > 16) )

		{

			alert(JS_Check_User_Login);

			user_id.focus();

			return (false);

		}

		if(!isNaN(user_id.value)) 

		   { 

			 alert(JS_Check_User_Lenght); 

			 user_id.focus();

			 return (false); 

		   }



		var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-";

		var checkStr = user_id.value;

		var allValid = true;

		for (i = 0;  i < checkStr.length;  i++)

		{

			ch = checkStr.charAt(i);

			for (j = 0;  j < checkOK.length;  j++)

			  if (ch == checkOK.charAt(j))

				break;

			if (j == checkOK.length)

			{

			  allValid = false;

			  break;

			}

		}   

		if (!allValid)

		{

			alert (JS_Check_Special_Cha);

			user_id.focus();

			return false;

		}   

		if(!IsEmpty(password, JS_Passwd))

		{

			return false;

		}

function isOkPass(p){
    var anUpperCase = /[A-Z]/;
    var aLowerCase = /[a-z]/; 
    var aNumber = /[0-9]/;
    var aSpecial = /[!|@|#|$|%|^|&|*|(|)|-|_]/;
    var obj = {};
    obj.result = true;

    if(p.length < 5){
        obj.result=false;
        obj.error="Password must be at least 5 characters long"
        return obj;
    }

    var numUpper = 0;
    var numLower = 0;
    var numNums = 0;
    var numSpecials = 0;
    for(var i=0; i<p.length; i++){
        if(anUpperCase.test(p[i]))
            numUpper++;
        else if(aLowerCase.test(p[i]))
            numLower++;
        else if(aNumber.test(p[i]))
            numNums++;
        else if(aSpecial.test(p[i]))
            numSpecials++;
    }

    if(numUpper < 2 || numLower < 2 || numNums < 2 || numSpecials <2){
        obj.result=false;
        obj.error=passwordCheckMsg;
        return obj;
    }
    return obj;
}

		if(!isOkPass(password.value).result){
		  alert(isOkPass(password.value).error);
		  return false;
		}


		if(!IsEmpty(password_retype, JS_Re_Passwd))

		{

			return false;

		}
		


		if(password.value != password_retype.value)

		{

			alert(JS_Confirm);

			return false;

		}

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

		var checkOK_Phone = "0123456789- ";

		var checkStr_Phone = mem_phone.value;

		var allValid_Phone = true;

		for (i = 0;  i < checkStr_Phone.length;  i++)

		{

			ch = checkStr_Phone.charAt(i);

			for (j = 0;  j < checkOK_Phone.length;  j++)

			  if (ch == checkOK_Phone.charAt(j))

				break;

			if (j == checkOK_Phone.length)

			{

			  allValid_Phone = false;

			  break;

			}

		}   

		if (!allValid_Phone)

		{

			alert (JS_Valid_Phone);

			mem_phone.focus();

			return false;

		}   

		if(mem_mobile.value != '')

		{

			var checkOK_Mobile = "0123456789- ";

			var checkStr_Mobile = mem_mobile.value;

			var allValid_Mobile = true;

			for (i = 0;  i < checkStr_Mobile.length;  i++)

			{

				ch = checkStr_Mobile.charAt(i);

				for (j = 0;  j < checkOK_Mobile.length;  j++)

				  if (ch == checkOK_Mobile.charAt(j))

					break;

				if (j == checkOK_Mobile.length)

				{

				  allValid_Mobile = false;

				  break;

				}

			}   

			if (!allValid_Mobile)

			{

				alert (JS_Valid_Mobile);

				mem_mobile.focus();

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

		if(!IsEmpty(mem_zipcode, JS_Zipcode))

		{

			return false;

		}


		if(mem_country.value == 0)

		{

			alert(JS_Country); 

			return false;

		}


		if(!IsEmail(mem_email, JS_Valid_Mail))

		{

			return false;

		}


  	    if(mem_emp.value == 0)

		{

			alert(JS_Employee); 

			return false;

		}
		

/*		if(check_buyer.checked == false && check_seller.checked == false)

		{

			alert(JS_Role);	

			return false;

		}

*/		

		

		x = 1;

		
		

		if(x == 0)

		{

			alert(JS_Areas);

			return false;

		}

		

		if(agree.checked == false )

		{

			alert(JS_Terms);

			return false;

		}

		return true;

	}
return true;
}





function View_Terms()

{

	popupWindowURL('page.php?pid=19&pop_up=true','','900','500','','true','true');	

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

			if(inputs[i].name == "user_id")

			{

				inputs[i].onblur = function () 

				{

					showUserID(document.frmSignupSignup.user_id.value);

					this.parentNode.getElementsByTagName("span")[0].style.display = "none";

				}

			}

			else if(inputs[i].name == "mem_email")

			{

				inputs[i].onblur = function () 

				{

					if(!IsEmail(document.mem_email, JS_Valid_Mail))

					{

						return false;

					}

					showUserEmail(document.mem_email.value)

					this.parentNode.getElementsByTagName("span")[0].style.display = "none";

				}

			}

			

			else

			{

				inputs[i].onblur = function () 

				{

					this.parentNode.getElementsByTagName("span")[0].style.display = "none";

				}

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
