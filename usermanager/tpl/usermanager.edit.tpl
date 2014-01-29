<!-- BEGIN: MAIN -->
			<div class="row-fluid">
				<div class="col-md-12">
{FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"}
					<div class="block">
						<h5><i class="fa fa-user"></i> {PHP.L.usermanager_edit_title} {USERMANAGER_NICKNAME}</h5>
						<div class="wrapper">
							<div class="btn-group">
								<a href="{USERMANAGER_URL_FOR_DELETED}" class="btn btn-danger confirmLink"><i class="fa fa-times"></i> {PHP.L.Delete}</a>
								<a href="{USERMANAGER_URL_FOR_RESET}" class="btn btn-primary confirmLink"><i class="fa fa-refresh"></i> {PHP.L.usermanager_reset_pass}</a>
<!-- IF {PHP.cot_modules.pm} -->
								<a title="{PHP.L.users_sendpm}" href="{USERMANAGER_ID|cot_url('pm','m=send&to=$this')}" class="btn btn-primary">{PHP.L.users_sendpm}</a>
<!-- ENDIF -->
								<a href="{PHP|cot_url('admin','m=other&p=usermanager')}" class="btn btn-primary"><i class="fa fa-step-backward"></i> Назад к списку</a>
							</div>
<!-- BEGIN: USERMANAGER_EDIT -->
							<form action="{USERMANAGER_SEND}" method="post" name="useredit" enctype="multipart/form-data">
								<input type="hidden" name="id" value="{USERMANAGER_ID}" />
								<table class="table table-bordered table-hover">
									<tr>
										<td class="width20">{PHP.L.users_id}:</td>
										<td class="width80">#{USERMANAGER_ID}</td>
									</tr>
									<tr>
										<td>{PHP.L.Username}:</td>
										<td>{USERMANAGER_NAME}</td>
									</tr>
									<tr>
										<td>{PHP.L.Groupsmembership}:</td>
										<td class="usergrouplist">{PHP.L.Maingroup}:{USERMANAGER_GROUPS}</td>
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
										<td colspan="2" class="valid">
											<button type="submit" class="btn btn-primary">{PHP.L.Update}</button>
										</td>
									</tr>
								</table>
							</form>
<!-- END: USERMANAGER_EDIT -->
						</div>
					</div>
				</div>
			</div>
<!-- END: MAIN -->