<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=tools
[END_COT_EXT]
==================== */
(defined('COT_CODE') && defined('COT_ADMIN')) or die('Wrong URL.');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('usermanager', 'any');
cot_block($usr['isadmin']);

$adminhelp = $L['usermanager_details_help'];
$adminsubtitle = $L['usermanager_details_title'];

/* === Hook === */
foreach (cot_getextplugins('usermanager.details.first') as $pl)
{
	include $pl;
}
/* ===== */

$id = cot_import('id', 'G', 'INT');

$urr = $db->query("SELECT u.*, g.*
	FROM $db_users as u
	LEFT JOIN $db_groups as g ON g.grp_id=u.user_maingrp
	WHERE user_id = ?", array($id))->fetch();

/* === Hook === */
foreach (cot_getextplugins('usermanager.details.main') as $pl)
{
	include $pl;
}
/* ===== */

$t->assign(cot_generate_usertags($urr['user_id'], 'USERMANAGER_', '', TRUE), htmlspecialchars($urr['user_name']));

$t->assign(array(
	'USERMANAGER_TITLE' => cot_breadcrumbs(array(array(cot_url('users', 'm=details&id='.$urr['user_id'].'&u='.$urr['user_name']), $urr['user_name'])), false),
	'USERMANAGER_URL_FOR_DELETED' => cot_confirm_url(cot_url('admin', $common_params.'&a=delete&id='.$urr['user_id'].'&d='.$durl.'&'.cot_xg()), 'user', 'user_confirm_delete'),
	'USERMANAGER_URL_FOR_EDIT' => cot_url('admin', 'm=other&p=usermanager&a=edit&id='.$urr['user_id']),
	'USERMANAGER_URL_FOR_RESET' => cot_confirm_url(cot_url('admin', $common_params.'&a=reset&id='.$urr['user_id'].'&d='.$durl.'&'.cot_xg()), 'user', 'user_confirm_reset'),
));

/* === Hook === */
foreach (cot_getextplugins('usermanager.details.tags') as $pl)
{
	include $pl;
}
/* ===== */

$t->parse('MAIN.USERMANAGER_DETAILS');

$t->assign(array(
	'USERMANAGER_USER_URL' => cot_url('admin', $common_params.'&d='.$durl),
));