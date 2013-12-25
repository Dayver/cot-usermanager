<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=tools
[END_COT_EXT]
==================== */
(defined('COT_CODE') && defined('COT_ADMIN')) or die('Wrong URL.');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('usermanager', 'any');
cot_block($usr['isadmin']);

include cot_incfile('usermanager', 'plug');

/* === Hook === */
foreach (cot_getextplugins('usermanager.first') as $pl)
{
	include $pl;
}
/* ===== */

if (!in_array($a, array('add', 'details', 'edit', 'delete', 'reset', 'profile', 'register')))
{
	$a = 'main';}
$t = new XTemplate(cot_tplfile(array('usermanager', $a), 'plug', true));

$sorttype = cot_import('sorttype', 'R', 'ALP');
$sorttype = empty($sorttype) ? 'id' : $sorttype;
$sort_type = array(
	'id' => $L['Id'],
	'banexpire' => $L['Banned'],
	'name' => $L['Name'],
	'passfunc' => $L[''],
	'maingrp' => $L['Maingroup'],
	'country' => $L['Country'],
	'timezone' => $L['Timezone'],
	'text' => $L['Signature'],
	'birthdate' => $L['Birthdate'],
	'gender' => $L['Gender'],
	'email' => $L['Email'],
	'hideemail' => $L['users_hideemail'],
	'theme' => $L['Theme'],
	'scheme' => $L['Scheme'],
	'lang' => $L['Language'],
	'regdate' => $L['Registered'],
	'lastlog' => $L['Lastlogged'],
	'lastvisit' => $L['usermanager_lastvisit'],
	'lastip' => $L['users_lastip'],
	'logcount' => $L['users_logcounter'],
);
$sqlsorttype = 'user_'.$sorttype;

$sortway = cot_import('sortway', 'R', 'ALP');
$sortway = empty($sortway) ? 'desc' : $sortway;
$sort_way = array(
	'asc' => $L['Ascending'],
	'desc' => $L['Descending']
);
$sqlsortway = $sortway;

$filter = cot_import('filter', 'R', 'ALP');
$filter = empty($filter) ? 'all' : $filter;
$filter_type = array(
	'all' => $L['All'],
);
foreach ($cot_groups as $v)
{	$filter_type['grp_'.$v['id']] = $L['Maingroup'].' = '.$v['title'];}

$common_params = 'm=other&p=usermanager&sorttype='.$sorttype.'&sortway='.$sortway.'&filter='.$filter;

/* === Hook === */
foreach (cot_getextplugins('usermanager.main') as $pl)
{
	include $pl;
}
/* ===== */

include cot_incfile('usermanager', 'plug', $a);

$t->assign(array(
	'USERMANAGER_CONFIG_URL' => cot_url('admin', 'm=config&n=edit&o=module&p=users'),
	'USERMANAGER_ADD_URL' => cot_url('admin', 'm=other&p=usermanager&a=add'),
	'USERMANAGER_EXTRAFIELDS_URL' => cot_url('admin', 'm=extrafields&n='.$db_users),
	'USERMANAGER_GROUPS_URL' => cot_url('admin', 'm=users'),
	'USERMANAGER_RIGHTS_URL' => cot_url('admin', 'm=rightsbyitem&ic=users&io=a'),
	'USERMANAGER_PROFILE_URL' => cot_url('admin', 'm=other&p=usermanager&a=profile'),
));
cot_display_messages($t);

/* === Hook  === */
foreach (cot_getextplugins('usermanager.tags') as $pl)
{
	include $pl;
}
/* ===== */

$t->parse('MAIN');
$plugin_body .= $t->text('MAIN');