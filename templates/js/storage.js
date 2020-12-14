// JavaScript Document
function check_storage(frm,loop_cnt)
{
	with(frm)
	{
		if(loop_cnt == 1)
		{
			if(elements['selected_storage[]'].checked != true)
			{
				alert(JS_Storage);
				return false;
			}
		}
		if(loop_cnt > 1)
		{
			x = 0;
			for(i=0; i < elements['selected_storage[]'].length; i++)
			{
				if(elements['selected_storage[]'][i].checked == true)
				{
					x = x + 1;
				}
			}
			if(x == 0)
			{
				alert(JS_Storage_Check);
				return false;
			}
		}
		return true;
	}
}
	