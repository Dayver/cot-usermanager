<!-- BEGIN: MAIN -->
			<div class="row-fluid">
				<div class="block">
					<h5><i class="icon-group"></i> {PHP.L.usermanager_add_title}</h5>
{FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"}
					<div class="btn-group">
						<a title="{PHP.L.Configuration}" href="{USERMANAGER_CONFIG_URL}" class="btn btn-primary">{PHP.L.Configuration}</a>
						<a title="{PHP.L.Configuration}" href="{USERMANAGER_RIGHTS_URL}" class="btn btn-primary">{PHP.L.Rights}</a>
						<a href="{USERMANAGER_EXTRAFIELDS_URL}" class="btn btn-primary">{PHP.L.adm_extrafields}</a>
						<a href="{USERMANAGER_GROUPS_URL}" class="btn btn-primary">{PHP.L.Groups}</a>
						<a href="{USERMANAGER_USER_URL}" class="btn btn-primary">{PHP.L.Users}</a>
						<a href="{USERMANAGER_PROFILE_URL}" class="btn btn-primary">{PHP.L.Profile}</a>
					</div>

<!-- BEGIN: USERMANAGER_ADD -->
					<form name="adduser" action="{USERMANAGER_FORM_URL}" method="post" enctype="multipart/form-data">
						<table class="table table-bordered table-hover">
							<tr>
								<td class="width20">{PHP.L.Username}:</td>
								<td class="width80">{USERMANAGER_NAME} *</td>
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
									<button type="submit" class="btn btn-primary">{PHP.L.Add}</button>
								</td>
							</tr>
						</table>
					</form>
<!-- END: USERMANAGER_ADD -->
<!-- END: MAIN -->