<!-- BEGIN: MAIN -->
		<h2>{PHP.L.usermanager_add_title}</h2>
		{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}

		<div class="block button-toolbar">
			<a title="{PHP.L.Configuration}" href="{USERMANAGER_CONFIG_URL}" class="button">{PHP.L.Configuration}</a>
			<a title="{PHP.L.Configuration}" href="{USERMANAGER_RIGHTS_URL}" class="button">{PHP.L.Rights}</a>
			<a href="{USERMANAGER_EXTRAFIELDS_URL}" class="button">{PHP.L.adm_extrafields}</a>
			<a href="{USERMANAGER_GROUPS_URL}" class="button">{PHP.L.Groups}</a>
			<a href="{USERMANAGER_USER_URL}" class="button">{PHP.L.Users}</a>
			<a href="{USERMANAGER_PROFILE_URL}" class="button">{PHP.L.Profile}</a>
		</div>

<!-- BEGIN: USERMANAGER_ADD -->
		<div class="block">
			<h3>{PHP.L.usermanager_add_user}:</h3>
			{PHP.L.aut_registersubtitle}<br />
			{PHP.L.aut_registertitle}
			<form name="adduser" action="{USERMANAGER_FORM_URL}" method="post" enctype="multipart/form-data">
				<table class="cells">
					<tr>
						<td class="width30">{PHP.L.Username}:</td>
						<td class="width70">{USERMANAGER_NAME} *</td>
					</tr>
					<tr>
						<td>{PHP.L.Password}:</td>
						<td>{USERMANAGER_PASSWORD} *</td>
					</tr>
					<tr>
						<td>{PHP.L.users_confirmpass}:</td>
						<td>{USERMANAGER_PASSWORDREPEAT} *</td>
					</tr>
					<tr>
						<td>{PHP.L.users_validemail}:</td>
						<td>
							{USERMANAGER_EMAIL} *<!-- IF {PHP.cfg.plugin.usermanager.useremailverif} --> <span class="small">{PHP.L.users_validemailhint}</span><!-- ENDIF -->
						</td>
					</tr>
					<tr>
						<td>{PHP.L.users_hideemail}</td>
						<td>{USERMANAGER_HIDEEMAIL}</td>
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
						<td>{PHP.L.Gender}:</td>
						<td>{USERMANAGER_GENDER}</td>
					</tr>
					<tr>
						<td>{PHP.L.Birthdate}:</td>
						<td>{USERMANAGER_BIRTHDATE}</td>
					</tr>
					<tr>
						<td>{PHP.L.Theme}:</td>
						<td>{USERMANAGER_THEME}</td>
					</tr>
					<tr>
						<td>{PHP.L.Language}:</td>
						<td>{USERMANAGER_LANG}</td>
					</tr>
<!--//
TODO: Need?
					<!-- IF {USERMANAGER_AVATAR} -->
					<tr>
						<td>{PHP.L.Avatar}:</td>
						<td>{USERMANAGER_AVATAR}</td>
					</tr>
					<!-- ENDIF -->
					<!-- IF {USERMANAGER_PHOTO} -->
					<tr>
						<td>{PHP.L.Photo}:</td>
						<td>{USERMANAGER_PHOTO}</td>
					</tr>
					<!-- ENDIF -->
<!-- IF {PHP.cot_modules.pm} -->
					<tr>
						<td>{PHP.L.users_pmnotify}:</td>
						<td>{USERMANAGER_PMNOTIFY} <span class="small">{PHP.themelang.usersedit.PMnotifyhint}</span></td>
					</tr>
<!-- ENDIF -->
					<!-- IF {USERMANAGER_SIGNATURE} -->
					<tr>
						<td>{PHP.L.Signature}:</td>
						<td>{USERMANAGER_SIGNATURE}</td>
					</tr>
					<!-- ENDIF -->
//-->
					<tr>
						<td>{PHP.L.Signature}:</td>
						<td>{USERMANAGER_TEXT}</td>
					</tr>
					<tr>
						<td colspan="2" class="valid">
							<button type="submit">{PHP.L.Add}</button>
						</td>
					</tr>
				</table>
			</form>
			</form>
		</div>
<!-- END: USERMANAGER_ADD -->
<!-- END: MAIN -->