<?php

function smarty_function_html_pager_text($params, &$smarty){

	extract($params);

	$start 	= $start_item+1;
	$end 	= ($start_item + $per_page > $num_items ? $num_items : ($start_item + $per_page));

	echo "Showing <b>". ($start). "</b> - <b>".  $end. "</b> of <b>". $num_items. "</b>";
}
	
?>
