<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">

	<form name="frmProList" action="{$A_Action}" method="post" enctype="multipart/form-data">

	<tr>

		<td valign="top">

			<table border="0" cellpadding="0" cellspacing="0" width="100%">

				<tr>

					<td class="pagetitle" width="49%" height="25">Project Management [ {$Action} ] </td>

				</tr>

			</table>

		</td>

	</tr>

	<tr>

	   <td>&nbsp;</td>

	</tr>

	<tr>

		<td valign="top">

			<table border="0" cellpadding="0" cellspacing="0" width="100%">

				<tr>

					<td align="center"><strong>{$Action} Project.</strong></td>

				</tr>

			</table>

		</td>

	</tr>

	<tr>

	  <td height="205" align="center" valign="top">

			<table border="0" cellpadding="1" cellspacing="2" width="95%">

				<tr><td height="5"></td></tr>

				<tr><td height="5"></td></tr>

			</table>

			<table border="0" cellpadding="1" cellspacing="2" width="95%">

				<tr>

					<td class="fieldlabelRight2" valign="top" >Project Title :</td>

				</tr>

				<tr>	

					<td class="fieldlabelRight2">

					<input type="text" name="title" class="textbox" value="{$title|stripslashes}"  size="60"/>

					</td>

				</tr>

				<tr>

					<td class="fieldlabelRight2" valign="top">Project Description : </td>

				</tr>

				<tr>	

					<td class="fieldlabelRight2">	

						<textarea name="desc" cols="100" rows="10" class="textbox">{$desc}</textarea>

					</td>

				</tr>

			</table>

	  </td>

	</tr>

	<tr>

		<td height="53" align="center" valign="top">

			<table border="0" cellpadding="1" cellspacing="2" width="95%">

				<tr>

					<td class="fieldlabelRight2" valign="top" colspan="2">Categories: You can make up to 5 selections: </td>

				</tr>

				{assign var="col" value=2}

				{section name=prod loop=$Loop}

				{if $smarty.section.prod.iteration|mod:$col==1}

				<tr>

				{/if}

					<td valign="top" width="50%" align="left" class="fieldLabelLeft2">

					<input class="stdCheckBox" type="checkbox" name="cat_prod[]" id="cat_prod[]" value="{$catid[prod]}" {if $catid[prod]|in_array:$arr_categories}checked{/if} >

					&nbsp;{$catname[prod]}

					<span id="ExpandShow_{$smarty.section.prod.index}" style="visibility:visible;">

						(<a href="javascript: show_Resume('{$smarty.section.prod.index}')" class="actionlink">More Specific</a>)		</span>

					<span id="ExpandHide_{$smarty.section.prod.index}" style="visibility:hidden;display:none;">

						(<a href="javascript: hide_Resume('{$smarty.section.prod.index}')" class="actionlink">More Specific</a>)		</span>

					

						<span id="subcat_{$smarty.section.prod.index}" style="visibility:hidden;display:none;">

						<table width="85%" align="center">

							{foreach name=subcategory from=$sub_cat[prod] item=subcategory}

							<tr>

								<td class="bodytextblack"><input class="stdCheckBox" type="checkbox" name="cat_prod[]" value="{$subcategory->cat_id}"  {if $subcategory->cat_id|in_array:$arr_categories}checked{/if} />{$subcategory->en_cat_name}</td>

							</tr>

							{/foreach}

						</table>

					  </span>		</td>

				{if $smarty.section.prod.iteration|mod:$col==0}	</tr>

				{/if}

				{/section}

			</table>

	  </td>

	</tr>

	<tr>

	   <td align="center" valign="top">

	      <table border="0" cellpadding="1" cellspacing="2" width="95%">

		     <tr>

				<td class="fieldlabelRight2" valign="top" colspan="2">Upload files relevant to the project : </td>

			 </tr>

			 <tr>

		 		<td width="25%" class="fieldlabelRight2">

					  <input type="file" name="project_file_1" />

				</td>

				{if $project_file_1 != ''}

				<td class="fieldlabelRight2">	  

					 {$imgpath}{$project_file_1}

				</td>

                {/if}

			</tr>	

			 <tr>

				<td class="fieldlabelRight2">

					 <input type="file" name="project_file_2" />

				</td>	 

			 	{if $project_file_2 != ''}

				<td class="fieldlabelRight2">	  

					 {$imgpath}{$project_file_2}

				</td> 

                {/if}

			  </tr>	

			  <tr>

				<td class="fieldlabelRight2">

					<input type="file" name="project_file_3" />

				</td>

			  {if $project_file_3!= ''}

				<td class="fieldlabelRight2">		

					{$imgpath}{$project_file_3}

				</td>

			 {/if}

			 </tr>



		  </table>

	   </td>

	</tr>

	<tr>

	  <td align="center" valign="top">

			<table border="0" cellpadding="1" cellspacing="2" width="95%">

				<tr>

					<td class="fieldlabelRight2"><strong>Budget Range :</strong></td>

					<td class="fieldlabelRight2"><strong>Days open for bidding :</strong></td>

				</tr>

			    <tr>

					<td class="fieldlabelRight2" valign="top" width="50%">

						<select name="dev" class="textbox">

						  <option value="0">( Please choose budget )</option>

							{$Development_List}

						</select> 	

					<td class="fieldlabelRight2" valign="top">

						<select name="bidding" class="textbox">

						  <option value="0">-----</option>

							{$Bidding_List}

						</select>	

					</td>

				</tr>

			</table>

	  </td>

	</tr>

	<tr>

	  <td align="center" valign="top">

			<table border="0" cellpadding="1" cellspacing="2" width="95%">

				<tr>

					<td class="fieldlabelRight2" colspan="2"><strong>Additional Options :</strong></td>

				</tr>

			    <tr>

					<td class="fieldlabelRight2" valign="top" colspan="2">

						<input type="checkbox" name="project_options1" value="1" {$option1}/> &nbsp;

						   Hide projects bids from other users. To view bids project creator must login.

					</td>

				</tr>

				<tr>

				    <td class="fieldlabelRight2" valign="top" colspan="2">

					   <input type="checkbox" name="project_options2" value="1" {$option2}/ > &nbsp;

						   Allow only premium members to bid on my project.

					</td>

				</tr>

				<tr>

				    <td class="fieldlabelRight2" valign="top" colspan="2">

					   <input type="checkbox" name="premium_project" value="1" {$option3}/ > &nbsp;

						   Set Project As a Premium Project.

					</td>

				</tr>

			</table>

	  </td>

	</tr>

	

	<tr>

		<td  align="right" colspan="2">

			<input type="submit" name="Submit" value="Update" class="button" onclick="javascript: Javascript: return Check_Details(this.form);">

			<input type="submit" name="Submit" value="Cancel" class="button">

		</td>

	</tr>

	<input type="hidden" name="Action" value="{$Action}" />

	<input type="hidden" name="project_id" value="{$project_id}" />

	<input type="hidden" name="image1" value="{$project_file_1}" />

	<input type="hidden" name="image2" value="{$project_file_2}" />

	<input type="hidden" name="image3" value="{$project_file_3}" />



	</form>

	</table>

