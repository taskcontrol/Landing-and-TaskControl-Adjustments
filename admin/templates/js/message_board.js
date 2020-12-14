// JavaScript Document
function Delete_Click(catId)
{
	with(document.frmmsgProject)
	{
		if(confirm('Are you sure you want to delete Message Board?'))
		{
			message_id.value 	= catId;
			Action.value	= 'Delete';
			submit();
		}
	}
}
function Edit_Click(catId)
{
	with(document.frmmsgProject)
	{
			message_id.value 	= catId;
			Action.value	= 'Edit';
			submit();
	}
}
