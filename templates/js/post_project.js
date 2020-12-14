// JavaScript Document
function Check_Details(frm)
{
	with(frm)
	{
		if(!IsEmpty(en_project_title, JS_en_title))
		{
			return false;
		}
		if(!IsEmpty(en_project_description, JS_en_dec))
		{
			return false;
		}
		
		x = 0;
		for(i=0; i < elements['cat_prod[]'].length; i++)
		{
			if(elements['cat_prod[]'][i].checked == true)
			{
				x = x + 1;
			}
		}
		
		if(x == 0)
		{
			alert("Please Select atleast one Category");
			return false;
		}
		
		if(x > 5)
		{
			alert(JS_Cats);
			return false;
		}
		
		
		if(dev.value == 0)
		{
			alert(JS_Dev); 
			return false;
		}
		if(bidding.value == 0)
		{
			alert(JS_Bid); 
			return false;
		}
		if(agree1.checked == false )
		{
			alert(JS_Term);
			return false;
		}
		return true;
	}
}


function View_Terms()
{
	popupWindowURL('page.php?pid=2&pop_up=true','','900','500','','true','true');	
}
function View_Terms1()
{
	popupWindowURL('page.php?pid=6&pop_up=true','','900','500','','true','true');		
}

function show_Resume(ids)
{
/////show resume
	document.getElementById('subcat_'+ids).style.visibility = 'visible';
	document.getElementById('subcat_'+ids).style.display = '';

/////show hide link
	document.getElementById('ExpandHide_'+ids).style.visibility = 'visible';
	document.getElementById('ExpandHide_'+ids).style.display = '';

///// hide show link
	document.getElementById('ExpandShow_'+ids).style.visibility = 'hidden';
	document.getElementById('ExpandShow_'+ids).style.display = 'none';
	
}
function hide_Resume(ids)
{
///// hide resume
	document.getElementById('subcat_'+ids).style.visibility = 'hidden';
	document.getElementById('subcat_'+ids).style.display = 'none';

///// hide hide link 
	document.getElementById('ExpandHide_'+ids).style.visibility = 'hidden';
	document.getElementById('ExpandHide_'+ids).style.display = '';

///// show show link
	document.getElementById('ExpandShow_'+ids).style.visibility = 'visible';
	document.getElementById('ExpandShow_'+ids).style.display = '';
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
		if(inputs[i].name == 'en_project_title')
		{
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

