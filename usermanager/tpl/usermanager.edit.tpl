<!-- BEGIN: MAIN -->
		<h2>{PHP.L.usermanager_edit_title}</h2>
		{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}

		<div class="block button-toolbar">
			<a title="{PHP.L.Configuration}" href="{USERMANAGER_CONFIG_URL}" class="button">{PHP.L.Configuration}</a>
			<a title="{PHP.L.Configuration}" href="{USERMANAGER_RIGHTS_URL}" class="button">{PHP.L.Rights}</a>
			<a href="{USERMANAGER_EXTRAFIELDS_URL}" class="button">{PHP.L.adm_extrafields}</a>
			<a href="{USERMANAGER_GROUPS_URL}" class="button">{PHP.L.Groups}</a>
			<a href="{USERMANAGER_USER_URL}" class="button">{PHP.L.Users}</a>
			<a href="{USERMANAGER_ADD_URL}" class="button special">{PHP.L.usermanager_add_user}</a>
			<a href="{USERMANAGER_PROFILE_URL}" class="button">{PHP.L.Profile}</a>
		</div>

<!-- BEGIN: USERMANAGER_EDIT -->
		<div class="block">
			<h3 class="users">
				{USERMANAGER_TITLE}:
				<a href="{USERMANAGER_URL_FOR_DELETED}" class="button confirmLink confirm">{PHP.L.Delete}</a>
				<a href="{USERMANAGER_URL_FOR_RESET}" class="button confirm">{PHP.L.usermanager_reset_pass}</a>
			</h3>
			<form action="{USERMANAGER_SEND}" method="post" name="useredit" enctype="multipart/form-data">
				<input type="hidden" name="id" value="{USERMANAGER_ID}" />
				<table class="cells">
					<tr>
						<td class="width30">{PHP.L.users_id}:</td>
						<td class="width70">#{USERMANAGER_ID}</td>
					</tr>
					<tr>
						<td>{PHP.L.Username}:</td>
						<td>{USERMANAGER_NAME}</td>
					</tr>
					<tr>
						<td>{PHP.L.Groupsmembership}:</td>
						<td>{PHP.L.Maingroup}:<br />&nbsp;{PHP.out.img_down}<br />{USERMANAGER_GROUPS}</td>
					</tr>
					<tr>
						<td>{PHP.L.Country}:</td>
						<td>{USERMANAGER_COUNTRY}</td>
					</tr>
					<tr>
						<td>{PHP.L.Timezone}:</td>
						<td>{USERMANAGER_TIMEZONE}</td>
					</tr>
					<tr>
						<td>{PHP.L.Theme}:</td>
						<td>{USERMANAGER_THEME}</td>
					</tr>
					<tr>
						<td>{PHP.L.Language}:</td>
						<td>{USERMANAGER_LANG}</td>
					</tr>
					<!-- IF {USERMANAGER_AVATAR} -->
					<tr>
						<td>{PHP.L.Avatar}:</td>
						<td>{USERMANAGER_AVATAR}</td>
					</tr>
					<!-- ENDIF -->
					<!-- IF {USERMANAGER_SIGNATURE} -->
					<tr>
						<td>{PHP.L.Signature}:</td>
						<td>{USERMANAGER_SIGNATURE}</td>
					</tr>
					<!-- ENDIF -->
					<!-- IF {USERMANAGER_PHOTO} -->
					<tr>
						<td>{PHP.L.Photo}:</td>
						<td>{USERMANAGER_PHOTO}</td>
					</tr>
					<!-- ENDIF -->
					<tr>
						<td>{PHP.L.users_newpass}:</td>
						<td>
							{USERMANAGER_NEWPASS}
							<p class="small">{PHP.L.users_newpasshint1}</p>
						</td>
					</tr>
					<tr>
						<td>{PHP.L.Email}:</td>
						<td>{USERMANAGER_EMAIL}</td>
					</tr>
					<tr>
						<td>{PHP.L.users_hideemail}:</td>
						<td>{USERMANAGER_HIDEEMAIL}</td>
					</tr>
<!--//
TODO: Need?
<!-- IF {PHP.cot_modules.pm} -->
					<tr>
						<td>{PHP.L.users_pmnotify}:</td>
						<td>{USERMANAGER_PMNOTIFY}<br />{PHP.themelang.usersedit.PMnotifyhint}</td>
					</tr>
<!-- ENDIF -->
//-->
					<tr>
						<td>{PHP.L.Birthdate}:</td>
						<td>{USERMANAGER_BIRTHDATE}</td>
					</tr>
					<tr>
						<td>{PHP.L.Gender}:</td>
						<td>{USERMANAGER_GENDER}</td>
					</tr>
					<tr>
						<td>{PHP.L.Signature}:</td>
						<td>{USERMANAGER_TEXT}</td>
					</tr>
					<tr>
						<td>{PHP.L.Registered}:</td>
						<td>{USERMANAGER_REGDATE}</td>
					</tr>
					<tr>
						<td>{PHP.L.Lastlogged}:</td>
						<td>{USERMANAGER_LASTLOG}</td>
					</tr>
					<tr>
						<td>{PHP.L.users_lastip}:</td>
						<td>{USERMANAGER_LASTIP}</td>
					</tr>
					<tr>
						<td>{PHP.L.users_logcounter}:</td>
						<td>{USERMANAGER_LOGCOUNT}</td>
					</tr>
					<tr>
						<td colspan="2" class="valid"><button type="submit">{PHP.L.Update}</button></td>
					</tr>
				</table>
			</form>
		</div>
<!-- END: USERMANAGER_EDIT -->
<!-- END: MAIN -->