<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=tools
[END_COT_EXT]
==================== */
(defined('COT_CODE') && defined('COT_ADMIN')) or die('Wrong URL.');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('usermanager', 'any');
cot_block($usr['isadmin']);

$adminhelp = $L['usermanager_help'];
$adminsubtitle = $L['usermanager_title'];

/* === Hook === */
foreach (cot_getextplugins('usermanager.main.first') as $pl)
{
	include $pl;
}
/* ===== */

list($pg, $d, $durl) = cot_import_pagenav('d', $cfg['users']['maxusersperpage']);

if ($filter == 'all')
{
	$sqlwhere = "1 ";
}
/*
elseif ($filter == 'expired')
{
	$sqlwhere = "user_begin > {$sys['now']} OR (user_expire <> 0 AND user_expire < {$sys['now']})";
}*/
else
{	$grp_id = mb_substr($filter, 4);	if ($grp_id > 0) $sqlwhere = "user_maingrp = ".$db->prep($grp_id)." ";}

/* === Hook === */
foreach (cot_getextplugins('usermanager.main.main') as $pl)
{
	include $pl;
}
/* ===== */

$totalitems = $db->query("SELECT COUNT(*) FROM $db_users WHERE ".$sqlwhere)->fetchColumn();
$pagenav = cot_pagenav('admin', $common_params, $d, $totalitems, $cfg['maxrowsperpage'], 'd', '', $cfg['jquery'] && $cfg['turnajax']);

$sql_users = $db->query("SELECT u.*, g.*
	FROM $db_users as u
	LEFT JOIN $db_groups as g ON g.grp_id=u.user_maingrp
	WHERE $sqlwhere
		ORDER BY $sqlsorttype $sqlsortway
		LIMIT $d, ".$cfg['maxrowsperpage']);

$ii = 0;
/* === Hook - Part1 : Set === */
$extp = cot_getextplugins('usermanager.main.loop');
/* ===== */
foreach ($sql_users->fetchAll() as $row)
{
	$t->assign(cot_generate_usertags($row['user_id'], 'USERMANAGER_', '', TRUE), htmlspecialchars($row['user_name']));
	$t->assign(array(
		'USERMANAGER_URL_FOR_DETAILS' => cot_url('admin', 'm=other&p=usermanager&a=details&id='.$row['user_id']),
		'USERMANAGER_URL_FOR_DELETED' => cot_confirm_url(cot_url('admin', $common_params.'&a=delete&id='.$row['user_id'].'&d='.$durl.'&'.cot_xg()), 'user', 'user_confirm_delete'),
		'USERMANAGER_URL_FOR_EDIT' => cot_url('admin', 'm=other&p=usermanager&a=edit&id='.$row['user_id']),
		'USERMANAGER_URL_FOR_RESET' => cot_confirm_url(cot_url('admin', $common_params.'&a=reset&id='.$row['user_id'].'&d='.$durl.'&'.cot_xg()), 'user', 'user_confirm_reset'),
		'USERMANAGER_EMAIL' => cot_build_email($row['user_email']),
		'USERMANAGER_ODDEVEN' => cot_build_oddeven($ii),
		'USERMANAGER_CAT_COUNT' => $sub_count
	));

	/* === Hook - Part2 : Include === */
	foreach ($extp as $pl)
	{
		include $pl;
	}
	/* ===== */

	$t->parse('MAIN.USERMANAGER_DEFAULT.USERMANAGER_ROW');
	$ii++;
}

$is_row_empty = ($sql_users->rowCount() == 0) ? true : false ;

/* === Hook === */
foreach (cot_getextplugins('usermanager.main.tags') as $pl)
{
	include $pl;
}
/* ===== */

$t->assign(array(
	'USERMANAGER_FORM_URL' => cot_url('admin', $common_params.'&a=update_checked&d='.$durl),
	'USERMANAGER_ORDER' => cot_selectbox($sorttype, 'sorttype', array_keys($sort_type), array_values($sort_type), false),
	'USERMANAGER_WAY' => cot_selectbox($sortway, 'sortway', array_keys($sort_way), array_values($sort_way), false),
	'USERMANAGER_FILTER' => cot_selectbox($filter, 'filter', array_keys($filter_type), array_values($filter_type), false),
	'USERMANAGER_TOTALDBPAGES' => $totaldbpages,
	'USERMANAGER_PAGINATION_PREV' => $pagenav['prev'],
	'USERMANAGER_PAGNAV' => $pagenav['main'],
	'USERMANAGER_PAGINATION_NEXT' => $pagenav['next'],
	'USERMANAGER_TOTALITEMS' => $totalitems,
	'USERMANAGER_ON_PAGE' => $ii,
));

$t->parse('MAIN.USERMANAGER_DEFAULT');

$t->assign(array(
	'USERMANAGER_ADD_FORM_URL' => cot_url('admin', $common_params.'&a=add&z=add&d='.$durl),
	'USERMANAGER_NAME' => cot_inputbox('text', 'rusername', $ruser['user_name'], array('size' => 24, 'maxlength' => 100)),
	'USERMANAGER_EMAIL' => cot_inputbox('text', 'ruseremail', $ruser['user_email'], array('size' => 24, 'maxlength' => 64)),
	'USERMANAGER_PASSWORD' => cot_inputbox('password', 'rpassword1', '', array('size' => 12, 'maxlength' => 32)),
	'USERMANAGER_PASSWORDREPEAT' => cot_inputbox('password', 'rpassword2', '', array('size' => 12, 'maxlength' => 32)),
));