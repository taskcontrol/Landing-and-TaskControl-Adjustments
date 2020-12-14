function Validate_Form(frm)
{
	with(frm)
    {
		if(Action.value == 'Add')
		{
			if(!IsEmpty(en_news_title, 'Please, enter News title.'))
				{
					return false;
				}
			if(!IsEmpty(en_news_desc, "Please, enter News Description."))
				{			
					return false;
				}
		}
		if(Action.value == 'Edit')
		{
			if(!IsEmpty(news_title, 'Please enter News Title.'))
			{
				return false;
			}
			if(!IsEmpty(new_desc, 'Please enter News Description.'))
			{
				return false;
			}
		}
	  return true;
    }
}
function Edit_Click(newsid)
{
	with(document.frmNewsletter)
	{
		news_id.value	= newsid;
		Action.value	= 'Edit';
		submit();
	}
}
function Delete_Click(newsid)
{
	with(document.frmNewsletter)
	{
		if(confirm('Are you sure you want to delete News?'))
		{
			news_id.value = newsid;
			Action.value	= 'Delete';
			submit();
		}
	}
}
function DeleteChecked_Click()
{
	with(document.frmNewsletter)
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
			
		if(confirm('Are you sure you want to delete selected News?'))
		{
			Action.value 	= 'DeleteSelected';
			submit();
		}
	}
}
