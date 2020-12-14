<table width="858" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="217">
			<table width="208" height="170" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="{$Templates_Image}blue_bg.gif">
						<table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td>
								{assign var="cat_name" value=$smarty.session.Language_Types|cat:"_cat_name"}
								{foreach name=first_cat from=$Cat_Options_1 item=first}
								<a href="category.php?cat_id={$first->cat_id}" class="whitelink">{$first->$cat_name}&nbsp;({$first->total_projects})</a><br />
								{/foreach}
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
		<td width="216">
			<table width="208" height="170" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="{$Templates_Image}orange_bg.gif">
						<table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td>
								{foreach name=second_cat from=$Cat_Options_2 item=second}
								<a href="category.php?cat_id={$second->cat_id}" class="whitelink">{$second->$cat_name}&nbsp;({$second->total_projects})</a><br />
								{/foreach}
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
		<td width="217">
			<table width="208" height="170" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="{$Templates_Image}red_bg.gif" valign="top">
						<table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td class="bodytextwhite1" valign="top">{$content_2}</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
		<td width="208">
			<table width="208" height="170" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="{$Templates_Image}green_bg.gif" valign="top">
						<table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td class="bodytextwhite1" valign="top">{$content_3}</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="858" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="11"></td>
	</tr>
	<tr>
		<td background="{$Templates_Image}dot_bg.gif"><img src="{$Templates_Image}dot_bg.gif" width="3" height="1" /></td>
	</tr>
</table>
<table width="858" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="20">&nbsp;</td>
		<td width="678" valign="top">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>	
								<td><img src="{$Templates_Image}lf_cur_menu.gif" border="0"></td>
								<td background="{$Templates_Image}bg_cur_menu.gif" class="bodytextblack"><a href="all_projects.php" class="footerLink">{$VIEW_PROJECTS}</a></td>
								<td><img src="{$Templates_Image}rg_cur_menu.gif" border="0"></td>
							</tr>
						</table>
					</td>
					<td>&nbsp;</td>
					<td>
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td><img src="{$Templates_Image}lf_cur_menu.gif" border="0"></td>
								<td background="{$Templates_Image}bg_cur_menu.gif" class="bodytextblack"><a href="all_seller_profiles.php" class="footerlink">{$SELLER_PROFILES}</a></td>
								<td><img src="{$Templates_Image}rg_cur_menu.gif" border="0"></td>
							</tr>
						</table>
					</td>
					<td>&nbsp;</td>
					<td>
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td><img src="{$Templates_Image}lf_cur_menu.gif" border="0"></td>
								<td background="{$Templates_Image}bg_cur_menu.gif" class="bodytextblack"><a href="all_portfolio.php" class="footerLink">{$PORTFOLIO_SAMPLES}</a></td>
								<td><img src="{$Templates_Image}rg_cur_menu.gif" border="0"></td>
							</tr>
						</table>
					</td>	
					<td>&nbsp;</td>
					<td><a href="post_project.php" class="bodytextblack"><strong>{$Post_Project_FREE}</strong></a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="858" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<form name="frmSearchPortfolio" method="post" action="search_portfolio.php">
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
				<tr>
					<td width="3%" class="bodytextblack">&nbsp;</td>
					<td width="14%" class="bodytextblack"><strong>{$Search_Portfolio}:</strong></td>
					<td width="19%" class="bodytextblack">&nbsp;</td>
					<td width="64%" rowspan="2" valign="bottom"><input type="submit" name="Submit" value="{$Button_Go}" class="stdButton" /></td>
				</tr>
				<tr>
					<td width="3%">&nbsp;</td>
					<td width="14%"><input name="search_keyword" type="text" class="textbox" size="18" value="{$search_keyword}" /></td>
					<td width="19%"><select name="search_opt" class="textbox">
					{$Project_Array}
					</select></td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
</table>
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
	<tr>
		<td width="230" height="25" bgcolor="#578EB8" class="bodytextwhite" align="left">&nbsp;</td>
	</tr>
	{section name=Portfolios loop=$Loop}
	<tr class="{cycle values='list_B, list_A'}">
		<td class="bodytextblack">
			<table width="100%" cellpadding="3" cellspacing="3" border="0">
				<tr>
					<td colspan="3" width="70%">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								{foreach name=files_name from=$files[Portfolios] item=files_name}
									<td width="33%"><a href="javascript:OpenImage('{$files_name->sample_file}')"><img src="{$img_path}{$files_name->sample_file}" border="0" height="140" width="140" /></a></td>
								{/foreach}
								{if $smarty.foreach.files_name.total == 2}
									<td width="33%" class="bodytextblack">&nbsp;</td>
								{/if}
								{if $smarty.foreach.files_name.total == 1}
									<td width="33%" class="bodytextblack">&nbsp;</td>
									<td width="33%" class="bodytextblack">&nbsp;</td>
								{/if}
							</tr>
						</table>
					</td>
					<td width="30%">
						<table width="100%" cellpadding="3" cellspacing="3" border="0">
							<tr>
								<td class="bodytextblack"><strong>{$User}</strong></td>
								<td class="bodytextblack">{$user_login_id[Portfolios]}</td>
							</tr>
							<tr>
								<td class="bodytextblack"><strong>{$Rating}</strong></td>
								<td class="bodytextblack">
								{if $rating[Portfolios] == 0.00}
									No Feedback yet
								{else}	
								    <img src="{$Templates_Image}{$rating[Portfolios]|intval}.gif" width="120"><br /><a href="{$user_login_id[Portfolios]}_feedback.html" class="footerlink">({$reviews[Portfolios]} reviews)</a>
								{/if}
								</td>
							</tr>
							<tr>
								<td class="bodytextblack"><strong>{$Earning}</strong></td>
								<td class="bodytextblack">
								{if $earning[Portfolios] == 0.00}
									$ 0.00
								{else}
									$&nbsp;{$earning[Portfolios]}
								{/if}
								</td>
							</tr>
							<tr>
								<td class="bodytextblack"><strong>{$Location}</strong></td>
								<td class="bodytextblack">{$location[Portfolios]}</td>
							</tr>
						</table>
					</td>
				</tr>	
				<tr>
					<td colspan="3" class="bodytextblack"><a href="seller_profile_{$user_login_id[Portfolios]}.html" class="footerLink">Profile</a> | <a href="{$user_login_id[Portfolios]}_feedback.html" class="footerlink">Feedback</a> | <a href="seller_portfoilo_{$user_login_id[Portfolios]}.html" class="footerLink">Portfolio</a> | <a href="contact_{$user_login_id[Portfolios]}.html" class="footerLink">Contact {$user_login_id[Portfolios]}</a> | <a href="post_project.php" class="footerLink">Post Project to {$user_login_id[Portfolios]}</a></td>
					<td class="bodytextblack" align="center"><a href="#" class="footerLink">{$user_portfolio_count[Portfolios]} {$Sample_Match}</a></td>
				</tr>
			</table>
		</td>
	</tr>
	{sectionelse}

	<tr>
		<td align="center" class="bodytextblack">Sorry no result founds.</td>
	</tr>
	{/section}
</table>
<table width="858" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="22" align="center" class="bodytextblack">{$Page_Link}</td>
	</tr>
	<tr>
		<td valign="top" align="center">{$google_adsense_code}</td>
	</tr>
</table>
