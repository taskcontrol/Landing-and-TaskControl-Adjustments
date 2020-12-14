function Add_Click(parentId)
{
	with(document.frmCategory)
	{
		Action.value = 'Add';
		cat_parent_id.value = parentId;
		submit();
	}
}

//====================================================================================================
//	Function Name	:	Validate_Form
//----------------------------------------------------------------------------------------------------
function Validate_Form_SubCat(frm)
{
	with(frm)
    {	
		
		if(Action.value == 'Add')
		{
			if(!IsEmpty(en_cat_name, 'Please enter Category name.'))
			{
				return false;
			}
		}
		if(Action.value == 'Edit')
		{
			if(!IsEmpty(cat_name, 'Please enter Designer name.'))
			{
				return false;
			}
		}
		
		
		return true;

	}
}

function Order_Click(catId)
{
	with(document.frmCategory)
	{
		cat_parent_id.value = catId;
		Action.value = 'Order';
		submit();
	}
}

function Button_Click(btn)
{
	with(document.frmCategory)
	{
		Submit.value = btn.value;
		for(i=0; i<category.length; i++)
			display_order.value += category[i].value + ':';
		submit();
	}
}
function UpDown_Click(direction)
{
	var list = document.frmCategory.category;
	var tmpVal;
	var tmpText;

	if(list.selectedIndex==-1)
	{
		alert("Select the page you want to move.");
		return;
	}

	if(!list.length) return;
	
	if(direction==1)
	{
		if(list.selectedIndex == list.length-1) return;
	}
	else
		if(list.selectedIndex == 0) return;

	tmpVal 	= list.options[list.selectedIndex+direction].value;
	tmpText	= list.options[list.selectedIndex+direction].text;

	list.options[list.selectedIndex+direction].value 	= list.options[list.selectedIndex].value;
	list.options[list.selectedIndex+direction].text 	= list.options[list.selectedIndex].text;

	list.options[list.selectedIndex].value 	= tmpVal;
	list.options[list.selectedIndex].text 	= tmpText;

	list.selectedIndex += direction;
}


//====================================================================================================
//	Function Name	:	Edit_Click()
//----------------------------------------------------------------------------------------------------

function Edit_Click(catId)
{
	with(document.frmCategory)
	{
		cat_id.value	= catId;
		Action.value	= 'Edit';
		submit();
	}
}
//====================================================================================================
//	Function Name	:	Delete_Click()
//----------------------------------------------------------------------------------------------------
function Delete_Click(catId,parentId)
{
	with(document.frmCategory)
	{
		if(confirm('Are you sure you want to delete category?'))
		{
			cat_id.value 	= catId;
			Action.value	= 'Delete';
			cat_parent_id.value = parentId;
			submit();
		}
	}
}

//====================================================================================================
//	Function Name	:	DeleteChecked_Click()
//----------------------------------------------------------------------------------------------------
function DeleteChecked_Click(parentId)
{
	with(document.frmCategory)
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
			
		if(confirm('Are you sure you want to delete selected categories?'))
		{
			Action.value 	= 'DeleteSelected';
			cat_parent_id.value = parentId;
			submit();
		}
	}
}
//====================================================================================================
//	Function Name	:	ToggleStatus_Click()
//----------------------------------------------------------------------------------------------------
function ToggleStatus_Click(catId,state)
{
	 with(document.frmCategory)
	 {
		 cat_id.value	= catId;
		 status.value 	= state;
		 Action.value	= 'ChangeStatus';
		 submit();
	 }
}
