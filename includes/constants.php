<?
/* this file is mainly used for defining table constants. */
//$config['Table_Prefix'] = $_SESSION['Language_Types']."_";
/*
Project Status information
-------------------------------
1->Open
2->Forze
3->Assign project(Accept project)
4->closed manually by user
5->closed (after finished days.....)
6->closed

*/
#=================================================================
# A
#=================================================================
define('AUTH_USER',						 'auth_user');
define('AFFILATION_MASTER',				 'affilation_master');
define('AFFILATION_COMMISION',			 'affilation_commision');
#=================================================================
# B
#=================================================================
define('BADWORD_MASTER',				 'badword_master');
define('BID_MASTER',			     	 'bid_master');
define('BUYER_RATING_MASTER',	 	 	 'buyer_rating_master ');
#=================================================================
# C
#=================================================================
define('COUNTRY_MASTER',				 'country_master');
define('CATEGORY_MASTER',				 'category_master');
define('CONTACT_MASTER',				 'contact_master');
define('CONTACT_US_MASTER',				 'contact_us_master');

#=================================================================
# D  
#=================================================================
define('DEVELOPMENT_COST',				 'development_cost');
define('DINEROMAIL_MASTER',			        'dineromail_master');
define('DINEROMAIL_PENDING_DEPOSITE',  	        'dineromail_pending_deposite');

#=================================================================
# E
#=================================================================
define('EMAIL_CONFIG',				 'email_config');
define('ESCROW_PAYMENT_MASTER',		 'escrow_payment_master');
define('EXECUTION_TIME',			 'execution_time');
define('EMAIL_TEMPLATE',			 'email_template');
define('EMAIL_IN_PIPELINE',			 'email_in_pipeline');
#=================================================================
# F
#=================================================================

#=================================================================
# G
#=================================================================
#=================================================================
# H
#=================================================================
define('HOMEPAGE_MASTER',				 'homepage_master');
#=================================================================
# I
#=================================================================
define('INDUSTRY_MASTER',				 'industry_master');
#=================================================================
# J
#=================================================================
#=================================================================
# K
#=================================================================
#=================================================================
# L
#=================================================================
#=================================================================
# M
#=================================================================
define('MEMBER_MASTER',				 'member_master');
define('MESSAGE_BOARD_MASTER',		 'message_board_master');
define('MEMBERSHIP_PLAN_MASTER',	 'membership_plan_master');
define('MEMBER_MEMBERSHIP_HISTORY',	 'member_membership_history');
define('MONEYBOOKER_MASTER',		    'moneybooker_master');
define('MONEYBOOKER_PENDING_DEPOSITE','moneybooker_pending_deposite');
define('MERCADOPAGO_MASTER',		    'mercadopago_master');
define('MERCADOPAGO_PENDING_DEPOSITE', 'mercadopago_pending_deposite');
#=================================================================
# N
#=================================================================
define('NEWSLETTER_MASTER',			 'newsletter_master ');
define('NETELLER_MASTER',		        'neteller_master');
define('NETELLER_PENDING_DEPOSITE',  	        'neteller_pending_deposite');

#=================================================================
# O
#=================================================================
#=================================================================
# P
#=================================================================
define('PAGE_MASTER',				 'page_master');
define('PROFILE_MASTER',			 'profile_master');
define('PROJECT_MASTER',			 'project_master');
define('PAYPAL_MASTER',			     'paypal_master');
define('PROJECT_EDIT_MASTER',		 'project_edit_master');
define('PROJECT_EXTEND_MASTER',		 'project_extend_master'); 
define('PRIVATE_MESSAGE_MASTER',	 'private_message_master');
define('PAYPAL_PENDING_DEPOSITE',	 'paypal_pending_deposite');
#=================================================================
# Q
#=================================================================

#=================================================================
# R
#=================================================================
define('REPORT_VIOLATIONS_MASTER',		 'report_violations_master ');

#=================================================================
# S
#=================================================================
define('SELLER_SKILL_MASTER',		     'seller_skill_master ');
define('SELLER_PORTFOLIO_MASTER',		 'seller_portfolio_master ');
define('SELLER_RATING_MASTER',	 	 	 'seller_rating_master ');
define('SITE_EARNING_DEPOSITE',	 	 	 'site_earning_deposite');
define('SITE_EARNING_PROJECT',	 	 	 'site_earning_project');

#=================================================================
# T
#=================================================================

#=================================================================
# U
#=================================================================

#=================================================================
# V
#=================================================================
#=================================================================
# W
#=================================================================
define('WEBSITE_CONFIG',				'website_config');
define('WITHDRAW_MASTER',		 		'withdraw_master');

define('WP_COMMENTS',		 			'wp_comments');
define('WP_LINKS',		 				'wp_links');
define('WP_OPTIONS',		 			'wp_options');
define('WP_POSTMETA',		 			'wp_postmeta');
define('WP_POSTS',		 				'wp_posts');
define('WP_TERMS',				 		'wp_terms');
define('WP_TERM_RELATIONSHIPS',		 	'wp_term_relationships');
define('WP_TERM_TACONOMY',		 		'wp_term_taxonomy');
define('WP_USERMETA',			 		'wp_usermeta');
define('WP_USERS',				 		'wp_users');

#=================================================================
# X
#=================================================================

#=================================================================
# Y
#=================================================================
define('YEAR_EXPERIENCE',				'year_experience');
#=================================================================
# Z
#=================================================================



define('TERM_CONDITION',		  				'2');
#---------------------------
# Email Constants
#---------------------------
define('EMAIL_HEADER',							'1');
define('EMAIL_FOOTER',							'2');
define('EMAIL_FORGET_PASSWORD',					'3');
define('EMAIL_INVITE_TAC',						'4');
define('EMAIL_SIGNUP',							'5');
define('SUBSCRIPTION_BUY',					    '6');
define('EMAIL_DELETE_PROJECT',					'7');
define('EMAIL_CHANGE_PASSWORD',	    			'8');
define('DEPOSIT_MONEY',		    				'9');
define('STORAGE_BUY',              				'10');
define('PROJECT_INFORMATION_CHANGE',			'11');
define('AUTOMATIC_RENEWAL',						'12');
define('PRIVATE_MESSAGE',						'13');
define('BID_WON',								'14');
define('OVERDUE_REMINDER',						'15');
define('BID_DENY',								'16');
define('CAN_NOT_ACCEPT_PROJECT_BY_SELLER',  	'17');
define('MAIL_TO_SELLER_AFTER_ACCEPT_PROJECT',  	'18');
define('MAIL_TO_BUYER_AFTER_ACCEPT_PROJECT',  	'19');
define('PALCE_BID_ON_PROJECT',				  	'20');
define('MESSAGE_ON_PROJECT',				  	'21');
define('VIOLATE_USER',						  	'22');
define('INFORM_TO_ADMIN_VIOLATE_USER',		  	'23');
define('ESCROW_PAYMENT_TO_SELLER',   		  	'24');
define('INVITE_FRIEND_FOR_BIDDING_ON_PROJECT', 	'25');
define('CANCEL_PAYMENT', 						'26');
define('SEND_NEW_PROJECTS', 					'27');
define('REPORT_VIOLATION',	 					'28');
define('EMAIL_SEND_USER',	 					'29');
define('EMAIL_SEND_TO_BLOCKUSER',	 			'30');
define('EMAIL_TO_POST_PROJECT',		 			'31');
define('NOTIFICATION_OF_PROJECT',			 	'32');
define('BID_CANCEL',						 	'33');
define('ESCROW_PAYMENT_RELE',				 	'34');
define('NOT_ENOUGH_FUNDS',              		'35');
define('SEND_ALL_PROJECTS',						'36');
define('RENEW_MEMBERSHIP',						'37');
define('PENDING_REQUEST',						'38');
define('PROJECT_WILL_BE_CLOSED',				'39');
//define('TAC_UPDATES',							'40');
//define('TAC_NEW_CONTACT',						'40');
//define('BECOME_ACCOUNT',						'41');
define('BID_PLACE_IN_PENDING',					'42');
define('ACCOUNT_ACTIVATED', 					'43');
define('ACTIVATE_BID_ON_PROJECT',				'44');
define('BID_DELETE_BY_ADMIN',					'45');
define('UPDATES_FROM_TAC',						'46');
define('ACCOUNT_DEACTIVATED',			        '48');

$lang['PageSize_List'] = array(	'1'	=> '1',
				'5'	=> '5',
				'10'	=> '10',
				'15'	=> '15',
				'30' 	=> '30',
				'50'	=> '50',
				'100' 	=> '100',
			 	);
								
$lang_arr['Employees'] = array(	'1-10'	=> '1-10',
				'11-50'	=> '11-50',
				'51-249' => '51-249',
				'250-600' => '250-600',
				'+600' 	  => '+600',
			        );

$lang_arr['Reasons'] = array(	'0'		=> 'No Reasons',
								'1'		=> 'Bid is too high',
								'2'		=> 'Bid is too low',
								'3'		=> 'Bid Does not seem realistic',
								'4'		=> 'Bid did not provide sufficient information',
								'5' 	=> 'Service provider did not have necessary expertise',
								'6'		=> 'Did not address my project requirements',
								'7'		=> 'Sufficient examples of work not available',
								'8'		=> 'Prefer another style',
						 	);

$lang['Expertize'] 	= array(	'1'		=> '1',
								'2'		=> '2',
								'3'		=> '3',
								'4'		=> '4',
								'5' 	=> '5',
								'6'		=> '6',
								'7' 	=> '7',
								'8' 	=> '8',
								'9' 	=> '9',
								'10' 	=> '10',
						 	);
$lang['Project_Extend'] = array(	'1'		=> '1',
									'2'		=> '2',
									'3'		=> '3',
									'4'		=> '4',
									'5' 	=> '5',
									'6'		=> '6',
									'7' 	=> '7',
								);
$lang['Year_Experience'] = array(	'Less Than 1 year'		=> 'Less Than 1 year',
									'1 - 2 years'			=> '1 - 2 years',
									'3 - 5 years'			=> '3 - 5 years',
									'6 - 10 years'			=> '6 - 10 years',
									'11+ years'				=> '11+ years',
									);
								
$lang['Hourly_Rates'] = array(	
								'25'		=> '$25 - $50',
								'50'	=> '$50 - $75',
								'75'	=> '$75 - $100',
								'100' 	=> '$100 - $150',
								'150'	=> '$150 - $200',
								'200' 	=> '$200+',
								
							 	);
								
								
$lang['project_status_list'] = array(	'0'   	=> 'All', 
										'1'		=> 'Open',
										'2'		=> 'Freezed',
										'3'		=> 'Close for Bidding',
										'4' 	=> 'closed manually by user',
										'5' 	=> 'Closed',
									);								
								
$lang['violation'] = array(	
								'Posting contact information'			=> 'Posting contact information',
								'Advertising another website'			=> 'Advertising another website',
								'Fake project posted'					=> 'Fake project posted',
								'Obscenities or harassing behaviour' 	=> 'Obscenities or harassing behaviour',
								'Other' 								=> 'Other',
						);

$lang['days_for_bidding'] = array(	
									'1'		=> '1',
									'2'		=> '2',
									'3'		=> '3',
									'4' 	=> '4',
									'5'		=> '5',
									'6' 	=> '6',
									'7'		=> '7',
									'8'		=> '8',
									'9'		=> '9',
									'10' 	=> '10',
									'11'	=> '11',
									'12' 	=> '12',
									'13'	=> '13',
									'14' 	=> '14',
									'15'	=> '15',
									'16' 	=> '16',
									'17'	=> '17',
									'18'	=> '18',
									'19'	=> '19',
									'20' 	=> '20',
									'21'	=> '21',
									'22' 	=> '22',
									'23'	=> '23',
									'24' 	=> '24',
									'25'	=> '25',
									'26' 	=> '26',
									'27'	=> '27',
									'28'	=> '28',
									'29'	=> '29',
									'30' 	=> '30',
									'31'	=> '31',
									'32' 	=> '32',
									'33'	=> '33',
									'34' 	=> '34',
									'35'	=> '35',
									'36' 	=> '36',
									'37'	=> '37',
									'38'	=> '38',
									'39'	=> '39',
									'40' 	=> '40',
									'41'	=> '41',
									'42' 	=> '42',
									'43'	=> '43',
									'44' 	=> '44',
									'45'	=> '45',
									'46' 	=> '46',
									'47'	=> '47',
									'48'	=> '48',
									'49'	=> '49',
									'50' 	=> '50',
									'51'	=> '51',
									'52' 	=> '52',
									'53'	=> '53',
									'54' 	=> '54',
									'55'	=> '55',
									'56' 	=> '56',
									'57'	=> '57',
									'58'	=> '58',
									'59'	=> '59',
									'60' 	=> '60',
							 	);								

$arr_langs['Search_Project'] = array(		'1'				=> 'anywhere in the project',
											'2'				=> 'in title of project',
											'3'				=> 'in description of project',
									);

$arr_langs['Search_Portfolio'] = array(		'1'				=> 'anywhere in the portfolio',
											'2'				=> 'title',
											'3'				=> 'description',
											'4'				=> 'User ID',
									);

$arr_langs['Search_Seller'] = 	array(		'1'				=> 'anywhere in the profile',
											'2'				=> 'location',
											'3'				=> 'username',
											'4'				=> 'sellers description',
									);

$arr_langs['Accept_Deny_Project'] =	array(	'1'				=> 'Accept',
											'2'				=> 'Deny',
									);
									
$arr_langs['rating'] 	= 	array(			'1'				=> '1 - Very Poor',
											'2'				=> '2',
											'3'				=> '3',
											'4'				=> '4',
											'5'				=> '5 - Acceptable',
											'6'				=> '6',
											'7'				=> '7',
											'8'				=> '8',
											'9'				=> '9',
											'10'			=> '10 - Excellent',
									
								);
							
$lang['Month']			= array('01' 	=>	'January',
								'02'	=>	'February',
								'03'	=>	'March',
								'04'	=>	'April',
								'05'	=>	'May',
								'06'	=>	'June',
								'07'	=>	'July',
								'08'	=>	'August',
								'09'	=>	'September',
								'10'	=>	'Octomber',
								'11'	=>	'November',
								'12'	=>	'December',
							);							
?>
