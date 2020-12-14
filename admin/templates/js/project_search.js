// JavaScript Document
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

function Edit_Click(proid)
{
	with(document.frmSearchProject)
	{
		project_id.value	= proid;
		Action.value		= 'Edit';
		submit();
	}
}

//====================================================================================================
//	Function Name	:	Delete_Click()
//----------------------------------------------------------------------------------------------------
function Delete_Click(catId)
{
	with(document.frmSearchProject)
	{
		if(confirm('Are you sure you want to delete Project?'))
		{
			project_id.value 	= catId;
			Action.value	= 'Delete';
			submit();
		}
	}
}

//====================================================================================================
//	Function Name	:	DeleteChecked_Click()
//----------------------------------------------------------------------------------------------------
function DeleteChecked_Click()
{
	with(document.frmSearchProject)
	{
		var flg=false;

		if(document.all['cat_prod[]'].length)
		{
			for(i=0; i < document.all['cat_prod[]'].length; i++)
			{
				if(document.all['cat_prod[]'][i].checked)
					flg = true;
			}
		}
		else
		{
			if(document.all['cat_prod[]'].checked)
				flg = true;
		}

		if(!flg)
		{
			alert('Please select the record you want to delete.');
			return false;
		}
			
		if(confirm('Are you sure you want to delete selected Projects?'))
		{
			Action.value 	= 'DeleteSelected';
			submit();
		}
	}
}