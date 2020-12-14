// JavaScript Document

var passwordCheckMsg = 'Password should contain at least 2 lowercase letters, 2 caps letters, 2 digits and 2 special symbols (!@#$%^&*, etc)';

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


function checkNewPass(passvalue){
  if(!isOkPass($("#new_password1").val()).result){
    alert(isOkPass(passvalue).error);
    return false;
  }

}




function Form_Submit(frm)

{

	with(frm)

    {

      
		if(!isOkPass(new_password1.value).result){
		  alert(isOkPass(new_password1.value).error);
		  return false;
		}
		
		if(!IsEmpty(old_password, JS_Old_Password))

		{

			return false;

		}

		if(!IsEmpty(new_password1, JS_New_Password))

		{

			return false;

		}

		if(new_password1.value != new_password2.value)

		{
            new_password2.focus();
			alert(JS_Confirm_Password);

			return false;

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



}

//addLoadEvent(prepareInputsForHints);



