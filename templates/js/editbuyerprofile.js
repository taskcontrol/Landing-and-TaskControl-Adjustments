// JavaScript Document
function Check_Details(frm)
{
	with(frm)
	{
		if(!IsEmpty(en_buyers_slogan, JS_EN_Slogan))
		{
			return false;
		}
		if(!IsEmpty(en_buyers_description, JS_EN_Desc))
		{
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

