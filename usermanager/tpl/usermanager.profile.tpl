<!-- BEGIN: MAIN -->
			<div class="row-fluid">
			<div class="col-md-12">
{FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"}
				<div class="block">
					<h5><i class="fa fa-user"></i> {PHP.L.usermanager_profile_title}</h5>
					<div class="wrapper">
{FILE "{PHP.cfg.plugins_dir}/usermanager/tpl/nav.inc.tpl"}
<!-- BEGIN: USERMANAGER_PROFILE -->
					<form action="{USERMANAGER_SEND}" method="post" enctype="multipart/form-data" name="profile">
						<input type="hidden" name="userid" value="{USERMANAGER_ID}" />
						<table class="table table-bordered table-hover">
							<tr>
								<td class="width20">{PHP.L.Username}:</td>
								<td class="width80">{USERMANAGER_NAME}</td>
							</tr>
							<tr>
								<td>{PHP.L.Groupsmembership}:</td>
								<td>
									<div class="usergrouplist">
										{USERMANAGER_GROUPS}
									</div>
								</td>
							</tr>
							<tr>
								<td>{PHP.L.Registered}:</td>
								<td>{USERMANAGER_REGDATE}</td>
							</tr>
<!-- BEGIN: USERMANAGER_EMAILCHANGE -->
							<tr>
								<td>{PHP.L.Email}:</td>
								<td id="emailtd">
									<div class="width50 floatleft">
										{PHP.L.Email}:<br />{USERMANAGER_EMAIL}
									</div>
<!-- BEGIN: USERMANAGER_EMAILPROTECTION -->
									<script type="text/javascript">
										//<![CDATA[
										$(document).ready(function(){
											$("#emailnotes").hide();
											$("#emailtd").click(function(){$("#emailnotes").slideDown();});
										});
										//]]>
									</script>
									<div>
										{PHP.themelang.usersprofile.Emailpassword}:<br />{USERMANAGER_EMAILPASS}
									</div>
									<div class="small" id="emailnotes">{PHP.themelang.usersprofile.Emailnotes}</div>
<!-- END: USERMANAGER_EMAILPROTECTION -->
								</td>
							</tr>
<!-- END: USERMANAGER_EMAILCHANGE -->
							<tr>
								<td>{PHP.L.users_hideemail}:</td>
								<td>{USERMANAGER_HIDEEMAIL}</td>
							</tr>
<!--//
TODO: Need?
<!-- IF {PHP.cot_modules.pm} -->
							<tr>
								<td>{PHP.L.users_pmnotify}:</td>
								<td>
									{USERMANAGER_PMNOTIFY}
									<p class="small">{PHP.L.users_pmnotifyhint}</p>
								</td>
							</tr>
<!-- ENDIF -->
//-->
							<tr>
								<td>{PHP.L.Theme}:</td>
								<td>{USERMANAGER_THEME}</td>
							</tr>
							<tr>
								<td>{PHP.L.Language}:</td>
								<td>{USERMANAGER_LANG}</td>
							</tr>
							<tr class="hidden">
								<td>{PHP.L.Country}:</td>
								<td>{USERMANAGER_COUNTRY}</td>
							</tr>
							<tr>
								<td>{PHP.L.Timezone}:</td>
								<td>{USERMANAGER_TIMEZONE}</td>
							</tr>
							<tr>
								<td>{PHP.L.Birthdate}:</td>
								<td>{USERMANAGER_BIRTHDATE}
								</td>
							</tr>
							<tr>
								<td>{PHP.L.Gender}:</td>
								<td>{USERMANAGER_GENDER}</td>
							</tr>
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
							<tr>
								<td>{PHP.L.Signature}:</td>
								<td>{USERMANAGER_TEXT}</td>
							</tr>
							<tr>
								<td>
									{PHP.L.users_newpass}:
									<p class="small">{PHP.L.users_newpasshint1}</p>
								</td>
								<td>
									{USERMANAGER_OLDPASS}
									<p class="small">{PHP.L.users_oldpasshint}</p>
									{USERMANAGER_NEWPASS1} {USERMANAGER_NEWPASS2}
									<p class="small">{PHP.L.users_newpasshint2}</p>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="valid"><button type="submit" class="btn btn-success"><i class="fa fa-refresh"></i> {PHP.L.Update}</button></td>
							</tr>
						</table>
					</form>
<!-- END: USERMANAGER_PROFILE -->
			</div>
			</div>
			</div>
			</div>
<!-- END: MAIN -->