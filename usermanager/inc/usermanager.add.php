<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=tools
[END_COT_EXT]
==================== */
(defined('COT_CODE') && defined('COT_ADMIN')) or die('Wrong URL.');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('usermanager', 'any');
cot_block($usr['isadmin']);

$adminhelp = $L['usermanager_add_help'];
$adminsubtitle = $L['usermanager_add_title'];

/* === Hook === */
foreach (cot_getextplugins('usermanager.add.first') as $pl)
{
	include $pl;
}
/* ===== */

$z = cot_import('z', 'G', 'ALP');

if ($z == 'add')
{
	$ruser = array();

	/* === Hook for the plugins === */
	foreach (cot_getextplugins('usermanager.add.add.first') as $pl)
	{
		include $pl;
	}
	/* ===== */

	$ruser['user_name'] = cot_import('rusername', 'P', 'TXT', 100, TRUE);
	$ruser['user_email'] = cot_import('ruseremail', 'P', 'TXT', 64, TRUE);
	$rpassword1 = cot_import('rpassword1', 'P', 'HTM', 32);
	$rpassword2 = cot_import('rpassword2', 'P', 'HTM', 32);
	$ruser['user_country'] = cot_import('rcountry', 'P', 'TXT');
	$ruser['user_timezone'] = cot_import('rusertimezone', 'P', 'TXT');
	$ruser['user_timezone'] = (!$ruser['user_timezone']) ? $cfg['defaulttimezone'] : $ruser['user_timezone'];
	$ruser['user_gender'] = cot_import('rusergender','P','TXT');
	$ruser['user_email'] = mb_strtolower($ruser['user_email']);

	// Extra fields
	foreach($cot_extrafields[$db_users] as $exfld)
	{
		$ruser['user_'.$exfld['field_name']] = cot_import_extrafields('ruser'.$exfld['field_name'], $exfld);
	}

	$ruser['user_birthdate'] = cot_import_date('ruserbirthdate', false);
	if (!is_null($ruser['user_birthdate']) && $ruser['user_birthdate'] > $sys['now'])
	{
		cot_error('pro_invalidbirthdate', 'ruserbirthdate');
	}

	$ruser['user_maingrp'] = cot_import('rusermaingrp', 'P', 'INT');
	$ruser['user_banexpire'] = cot_import('ruserbanexpire', 'P', 'INT');
	$ruser['user_text'] = cot_import('rusertext', 'P', 'HTM');
	$ruser['user_theme'] = cot_import('rusertheme', 'P', 'TXT');
	$ruser['user_lang'] = cot_import('ruserlang', 'P', 'ALP');

	if (mb_strlen($ruser['user_name']) < 2 || mb_strpos($ruser['user_name'], ',') !== false || mb_strpos($ruser['user_name'], "'") !== false)
	{
		cot_error('aut_usernametooshort', 'rusername');
	}
	if ($ruser['user_name'] != $urr['user_name'] && $db->query("SELECT COUNT(*) FROM $db_users WHERE user_name = ?", array($ruser['user_name']))->fetchColumn() > 0)
	{
		cot_error('aut_usernamealreadyindb', 'rusername');
	}
	if (!cot_check_email($ruser['user_email']))
	{
		cot_error('aut_emailtooshort', 'ruseremail');
	}
	if ($ruser['user_email'] != $urr['user_email'] && $db->query("SELECT COUNT(*) FROM $db_users WHERE user_email = ?", array($ruser['user_email']))->fetchColumn() > 0)
	{
		cot_error('aut_emailalreadyindb', 'ruseremail');
	}
	if (!empty($rusernewpass) && mb_strlen($rusernewpass) < 4)
	{
		cot_error('aut_passwordtooshort', 'rusernewpass');
	}

	$user_exists = (bool)$db->query("SELECT user_id FROM $db_users WHERE user_name = ? LIMIT 1", array($ruser['user_name']))->fetch();
	$email_exists = (bool)$db->query("SELECT user_id FROM $db_users WHERE user_email = ? LIMIT 1", array($ruser['user_email']))->fetch();

	if (preg_match('/&#\d+;/', $ruser['user_name']) || preg_match('/[<>#\'"\/]/', $ruser['user_name'])) cot_error('aut_invalidloginchars', 'rusername');
	if (mb_strlen($ruser['user_name']) < 2) cot_error('aut_usernametooshort', 'rusername');
	if (mb_strlen($rpassword1) < 4) cot_error('aut_passwordtooshort', 'rpassword1');
	if (!cot_check_email($ruser['user_email'])) cot_error('aut_emailtooshort', 'ruseremail');
	if ($user_exists) cot_error('aut_usernamealreadyindb', 'rusername');
	if ($email_exists && !$cfg['useremailduplicate']) cot_error('aut_emailalreadyindb', 'ruseremail');
	if ($rpassword1 != $rpassword2) cot_error('aut_passwordmismatch', 'rpassword2');

	/* === Hook for the plugins === */
	foreach (cot_getextplugins('usermanager.add.add.validate') as $pl)
	{
		include $pl;
	}
	/* ===== */

	if (!cot_error_found())
	{
		$ruser['user_password'] = $rpassword1;
		$userid = cot_add_user($ruser, null, null, null, !$cfg['plugin']['usermanager']['useremailverif'] ? $ruser['user_maingrp'] ? $ruser['user_maingrp'] : 4 : null);

		$rusergroupsms = cot_import('rusergroupsms', 'P', 'ARR');
		if (is_array($rusergroupsms))
		{
			foreach($cot_groups as $k => $i)
			{
				if (isset($rusergroupsms[$k]))
				{
					$db->insert($db_groups_users, array('gru_userid' => (int)$userid, 'gru_groupid' => (int)$k));
				}
			}
		}

		/* === Hook for the plugins === */
		foreach (cot_getextplugins('usermanager.add.add.done') as $pl)
		{
			include $pl;
		}
		/* ===== */

		if ($cfg['users']['regnoactivation'] || !$cfg['plugin']['usermanager']['useremailverif'])
		{
			cot_message($L['msg106_title']);
		}
		else
		{
			cot_message($L['usermanager_add_user_need_valid']);
		}
		cot_redirect(cot_url('admin', $common_params.'&a=main&d='.$durl, '', true));
	}
}

$editor_class = $cfg['users']['usertextimg'] ? 'minieditor' : '';

/* === Hook === */
foreach (cot_getextplugins('usermanager.add.main') as $pl)
{
	include $pl;
}
/* ===== */

$t->assign(array(
	//'USERMANAGER_ADMINEMAIL' => $cot_adminemail,//TODO: del this str?
	'USERMANAGER_FORM_URL' => cot_url('admin', $common_params.'&a=add&z=add&d='.$durl),
	'USERMANAGER_NAME' => cot_inputbox('text', 'rusername', $ruser['user_name'], array('size' => 24, 'maxlength' => 100)),
	'USERMANAGER_EMAIL' => cot_inputbox('text', 'ruseremail', $ruser['user_email'], array('size' => 24, 'maxlength' => 64)),
	'USERMANAGER_PASSWORD' => cot_inputbox('password', 'rpassword1', '', array('size' => 12, 'maxlength' => 32)),
	'USERMANAGER_PASSWORDREPEAT' => cot_inputbox('password', 'rpassword2', '', array('size' => 12, 'maxlength' => 32)),
	'USERMANAGER_COUNTRY' => cot_selectbox_countries($ruser['user_country'], 'rcountry'),
	'USERMANAGER_TIMEZONE' => cot_selectbox_timezone($ruser['user_timezone'], 'rusertimezone'),
	'USERMANAGER_GENDER' => cot_selectbox_gender($ruser['user_gender'],'rusergender'),
	'USERMANAGER_BIRTHDATE' => cot_selectbox_date(0, 'short', 'ruserbirthdate', cot_date('Y', $sys['now']), cot_date('Y', $sys['now']) - 100, false),
	'USERMANAGER_THEME' => cot_inputbox('text', 'rusertheme', $ruser['user_theme'], array('size' => 32, 'maxlength' => 32)),
	'USERMANAGER_LANG' => cot_inputbox('text', 'ruserlang', $ruser['user_lang'], array('size' => 32, 'maxlength' => 32)),
	'USERMANAGER_MAINGRP' => cot_build_group($ruser['user_maingrp']),
	'USERMANAGER_GROUPS' => cot_build_groupsms($ruser['user_id'], true/*$usr['isadmin']*/, ($ruser['user_maingrp'] ? $ruser['user_maingrp'] : 4)),
	'USERMANAGER_HIDEEMAIL' => cot_radiobox($ruser['user_hideemail'], 'ruserhideemail', array(1, 0), array($L['Yes'], $L['No'])),
	'USERMANAGER_TEXT' => cot_textarea('rusertext', $ruser['user_text'], 4, 56, array('class' => $editor_class)),
));

foreach($cot_extrafields[$db_users] as $exfld)
{
	$tag = strtoupper($exfld['field_name']);
	$t->assign(array(
		'USERMANAGER_'.$tag => cot_build_extrafields('ruser'.$exfld['field_name'], $exfld, $ruser['user_'.$exfld['field_name']]),
		'USERMANAGER_'.$tag.'_TITLE' => isset($L['user_'.$exfld['field_name'].'_title']) ? $L['user_'.$exfld['field_name'].'_title'] : $exfld['field_description']
	));
}

/* === Hook === */
foreach (cot_getextplugins('usermanager.add.tags') as $pl)
{
	include $pl;
}
/* ===== */

$t->parse('MAIN.USERMANAGER_ADD');

$t->assign(array(
	'USERMANAGER_USER_URL' => cot_url('admin', $common_params.'&d='.$durl),
));