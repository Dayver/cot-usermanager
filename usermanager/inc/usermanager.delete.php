<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=tools
[END_COT_EXT]
==================== */
(defined('COT_CODE') && defined('COT_ADMIN')) or die('Wrong URL.');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('usermanager', 'any');
cot_block($usr['isadmin']);

$id = cot_import('id', 'G', 'INT');

cot_check_xg();

/* === Hook === */
foreach (cot_getextplugins('usermanager.delete.first') as $pl)
{
	include $pl;
}
/* ===== */

$sql = $db->query("SELECT * FROM $db_users WHERE user_id = $id");
cot_die($sql->rowCount() == 0);
$urr = $sql->fetch();

$sql = $db->delete($db_users, "user_id=$id");
$sql = $db->delete($db_groups_users, "gru_userid=$id");

foreach($cot_extrafields[$db_users] as $exfld)
{
	cot_extrafield_unlinkfiles($urr['user_'.$exfld['field_name']], $exfld);
}

if (cot_module_active('pfs') && cot_import('ruserdelpfs', 'R', 'BOL'))
{
	require_once cot_incfile('pfs', 'module');
	cot_pfs_deleteall($id);
}

/* === Hook === */
foreach (cot_getextplugins('usermanager.delete.done') as $pl)
{
	include $pl;
}
/* ===== */

cot_log("Deleted user #".$id,'adm');
cot_message($L['usermanager_delete_user_ok']);
cot_redirect(cot_url('admin', $common_params.'&a=main&d='.$durl, '', true));