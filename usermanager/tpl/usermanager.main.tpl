<!-- BEGIN: MAIN -->
			<div class="row-fluid">
				<div class="block">
					<h5><i class="icon-group"></i> {PHP.L.usermanager_title}</h5>
{FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"}
					<div class="btn-group">
						<a title="{PHP.L.Configuration}" href="{USERMANAGER_CONFIG_URL}" class="btn btn-primary">{PHP.L.Configuration}</a>
						<a title="{PHP.L.Configuration}" href="{USERMANAGER_RIGHTS_URL}" class="btn btn-primary">{PHP.L.Rights}</a>
						<a href="{USERMANAGER_EXTRAFIELDS_URL}" class="btn btn-primary">{PHP.L.adm_extrafields}</a>
						<a href="{USERMANAGER_GROUPS_URL}" class="btn btn-primary">{PHP.L.Groups}</a>
						<a href="{USERMANAGER_ADD_URL}" class="btn btn-primary special">{PHP.L.usermanager_add_user}</a>
						<a href="{USERMANAGER_PROFILE_URL}" class="btn btn-primary">{PHP.L.Profile}</a>
					</div>

<!-- BEGIN: USERMANAGER_DEFAULT -->
<!-- IF {PHP.cfg.jquery} -->
					<script type="text/javascript">
						$(document).ready(function()
						{
							$('.moreinfo').hide();
							$(".mor_info_on_off").click(function()
							{
								var kk = $(this).attr('id').replace('mrc_', 'mro_');
								$('#'+kk+'').slideToggle(100);
							});
						});
					</script>
<!-- ENDIF -->
					<form id="form_valqueue" name="form_valqueue" method="post" action="{USERMANAGER_FORM_URL}">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th class="width5">
<!-- IF {PHP.cfg.jquery} -->
										<input name="allchek" class="checkbox" type="checkbox" value="" onclick="$('.checkbox').attr('checked', this.checked);" />
<!-- ENDIF -->
									</th>
									<th class="width5">ID</th>
									<th class="width15">{PHP.L.Name}</th>
									<th class="width10">{PHP.L.Maingroup}</th>
									<th class="width10">{PHP.L.Level}</th>
									<th class="width10">{PHP.L.Registered}</th>
									<th class="width45">{PHP.L.Action}</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="7">
										<input type="hidden" name="paction" value="" />
										<!-- IF {USERMANAGER_TOTALITEMS} > 1 -->{PHP.L.adm_sort} {USERMANAGER_ORDER} {USERMANAGER_WAY}<!-- ENDIF --> {PHP.L.Show} {USERMANAGER_FILTER}
										<input name="paction" type="submit" value="{PHP.L.Filter}" onclick="this.form.paction.value=this.value" class="btn btn-primary">
									</td>
								</tr>
<!-- BEGIN: USERMANAGER_ROW -->
								<tr>
									<td class="centerall {USERMANAGER_ODDEVEN}">
										<input name="s[{USERMANAGER_ID}]" type="checkbox" class="checkbox" />
									</td>
									<td class="centerall {USERMANAGER_ODDEVEN}">
										{USERMANAGER_ID}
									</td>
									<td class="centerall {USERMANAGER_ODDEVEN}">
										<span id="mrc_{PHP.ii}" class="mor_info_on_off strong" style="cursor:pointer;">{USERMANAGER_NICKNAME}</span>
									</td>
									<td class="centerall {USERMANAGER_ODDEVEN}">
<!-- IF {USERMANAGER_MAINGRPICON} -->
										<img src="{USERMANAGER_MAINGRPICON}" alt="{USERMANAGER_MAINGRPNAME}" />
<!-- ELSE -->
										{USERMANAGER_MAINGRP}
<!-- ENDIF -->
									</td>
									<td class="centerall {USERMANAGER_ODDEVEN}">
										{USERMANAGER_MAINGRPSTARS}
									</td>
									<td class="centerall {USERMANAGER_ODDEVEN}">
										{USERMANAGER_REGDATE}
									</td>
									<td class="action {USERMANAGER_ODDEVEN}">
										<a title="{PHP.L.Open}" href="{USERMANAGER_URL_FOR_DETAILS}" class="btn btn-{PHP.R.admin-config-buttonsize}">{PHP.L.short_open}</a>
										<a title="{PHP.L.Delete}" href="{USERMANAGER_URL_FOR_DELETED}" class="confirmLink confirm btn btn-{PHP.R.admin-config-buttonsize}">{PHP.L.short_delete}</a>
										<a title="{PHP.L.Edit}" href="{USERMANAGER_URL_FOR_EDIT}" class="btn btn-{PHP.R.admin-config-buttonsize}">{PHP.L.Edit}</a>
										<a title="{PHP.L.Reset}" href="{USERMANAGER_URL_FOR_RESET}" class="confirmLink confirm btn btn-{PHP.R.admin-config-buttonsize}">{PHP.L.usermanager_reset_pass}</a>
<!-- IF {PHP.cot_modules.pm} -->
										<a title="Отправить ЛС" href="{USERMANAGER_ID|cot_url('pm','m=send&to=$this')}" class="btn btn-{PHP.R.admin-config-buttonsize}">Отправить ЛС</a>
<!-- ENDIF -->
									</td>
								</tr>
								<tr class="moreinfo" id="mro_{PHP.ii}">
									<td colspan="7" class="{USERMANAGER_ODDEVEN}">
										<table class="table table-bordered">
											<tr>
												<td class="width30">ID:</td>
												<td class="width70">{USERMANAGER_ID}</td>
											</tr>
											<tr>
												<td>{PHP.L.Name}:</td>
												<td>{USERMANAGER_NAME}</td>
											</tr>
											<tr>
												<td>{PHP.L.Maingroup}:</td>
												<td>{USERMANAGER_MAINGRPTITLE}</td>
											</tr>
											<tr>
												<td>{PHP.L.Groupsmembership}:</td>
												<td>{USERMANAGER_GROUPS}</td>
											</tr>
											<tr>
												<td>{PHP.L.Country}:</td>
												<td>{USERMANAGER_COUNTRY}</td>
											</tr>
											<tr>
												<td>{PHP.L.Gender}:</td>
												<td>{USERMANAGER_GENDER}</td>
											</tr>
											<tr>
												<td>{PHP.L.Age}:</td>
												<td>{USERMANAGER_AGE}</td>
											</tr>
											<tr>
												<td>{PHP.L.Birthdate}:</td>
												<td>{USERMANAGER_BIRTHDATE}</td>
											</tr>
											<tr>
												<td>{PHP.L.Lastlogged}:</td>
												<td>{USERMANAGER_LASTLOG}</td>
											</tr>
											<tr>
												<td>{PHP.L.users_logcounter}:</td>
												<td>{USERMANAGER_LOGCOUNT}</td>
											</tr>
											<tr>
												<td>{PHP.L.users_lastip}:</td>
												<td>{USERMANAGER_LASTIP}</td>
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
<!--//
комменты юзверя
ПФС юзверя
пейджи юзверя
...
//-->
											<tr>
												<td>{PHP.L.Email}:</td>
												<td>{USERMANAGER_EMAIL}</td>
											</tr>
											<tr>
												<td>{PHP.L.Signature}:</td>
												<td>{USERMANAGER_TEXT}</td>
											</tr>
										</table>
									</td>
								</tr>
	<!-- END: USERMANAGER_ROW -->
	<!-- IF {PHP.is_row_empty} -->
								<tr>
									<td class="centerall" colspan="7">{PHP.L.None}</td>
								</tr>
	<!-- ENDIF -->
								<tr>
									<td class="valid" colspan="7">
	<!-- IF {PHP.cfg.jquery} -->
										<input name="paction" type="submit" value="Удалить отмеченные" onclick="this.form.paction.value=this.value" class="btn btn-primary">
										<input name="paction" type="submit" value="Сбросить пароль для отмеченных" onclick="this.form.paction.value=this.value" class="btn btn-primary">
	<!-- ENDIF -->
									</td>
								</tr>
							</tbody>
						</table>
<!-- IF {USERMANAGER_PAGNAV} -->
						<div class="pagination pagination-{PHP.R.admin-config-pagisize} pagination-{PHP.R.admin-config-pagialign}">
							<ul>{USERMANAGER_PAGINATION_PREV}{USERMANAGER_PAGNAV}{USERMANAGER_PAGINATION_NEXT}</ul>
						</div>
<!-- ENDIF -->
					</form>
				</div>
			</div>
<!-- END: USERMANAGER_DEFAULT -->

		<div class="block">
			<h5>{PHP.L.usermanager_add_user}:</h5>
			<form name="adduser" id="addlevel" action="{USERMANAGER_ADD_FORM_URL}" method="post">
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
						{USERMANAGER_EMAIL} *<!-- IF {PHP.cfg.plugin.usermanager.useremailverif} --> <span class="small">{PHP.L.users_validemailhint}</span><!-- ELSE --><input name="rusermaingrp" type="hidden" value="4" /><!-- ENDIF -->
					</td>
				</tr>
				<tr>
					<td class="valid" colspan="2"><input type="submit" class="btn btn-success" value="{PHP.L.Add}" /></td>
				</tr>
			</table>
			</form>
		</div>

<!-- END: MAIN -->