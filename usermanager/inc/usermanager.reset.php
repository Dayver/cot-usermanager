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

$sql = $db->query("SELECT user_id, user_name, user_lostpass FROM $db_users WHERE user_id=".$id);
$email_found= FALSE;
while ($row = $sql->fetch())
{
	$rusername = $row['user_name'];
	$ruserid = $row['user_id'];
	$validationkey = $row['user_lostpass'];

	if (empty($validationkey) || $validationkey == "0")
	{
		$validationkey = md5(microtime());
		$sql = $db->update($db_users, array('user_lostpass' => $validationkey, 'user_lastip' => $usr['ip']), "user_id=$ruserid");
	}

	$rsubject = $L['pasrec_title'];
	$ractivate = $cfg['mainurl'].'/'.cot_url('users', 'm=passrecover&a=auth&v='.$validationkey, '', true);
	$rbody = sprintf($L['pasrec_email1'], $rusername, $ractivate, $usr['ip'], cot_date('datetime_medium'));
	$rbody .= "\n\n ".$L['aut_contactadmin'];
	cot_mail($email, $rsubject, $rbody);
	$email_found = TRUE;
	if (!$cfg['useremailduplicate']) break;
}
if ($email_found)
{
	cot_message($L['usermanager_reset_user_send_email']);
	cot_redirect(cot_url('admin', $common_params.'&a=main&d='.$durl, '', true));
}
else
{
	cot_error($L['nf'], 'user_id');
	cot_redirect(cot_url('admin', $common_params.'&a=main&d='.$durl, '', true));
}