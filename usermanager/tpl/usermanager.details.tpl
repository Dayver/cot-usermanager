<!-- BEGIN: MAIN -->
			<div class="row-fluid">
			<div class="col-md-12">
{FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"}
				<div class="block">
					<h5><i class="fa fa-pencil"></i> {PHP.L.usermanager_details_title} {USERMANAGER_NICKNAME}</h5>
					<div class="wrapper">
						<div class="btn-group">
							<a href="{USERMANAGER_URL_FOR_DELETED}" class="btn btn-primary confirmLink confirm"><i class="fa fa-times"></i> {PHP.L.Delete}</a>
							<a href="{USERMANAGER_URL_FOR_EDIT}" class="btn btn-primary"><i class="fa fa-pencil"></i> {PHP.L.Edit}</a>
							<a href="{USERMANAGER_URL_FOR_RESET}" class="btn btn-primary confirmLink confirm"><i class="fa fa-refresh"></i> {PHP.L.usermanager_reset_pass}</a>
<!-- IF {PHP.cot_modules.pm} -->
							<a title="{PHP.L.users_sendpm}" href="{USERMANAGER_ID|cot_url('pm','m=send&to=$this')}" class="btn btn-primary">{PHP.L.users_sendpm}</a>
<!-- ENDIF -->
							<a href="{USERMANAGER_USER_URL}" class="btn btn-success"><i class="fa fa-step-backward"></i> Назад к списку</a>
						</div>
<!-- BEGIN: USERMANAGER_DETAILS -->
						<table class="table table-bordered table-hover">
							<tr>
								<td class="width20">{PHP.L.Maingroup}:</td>
								<td class="width80">{USERMANAGER_MAINGRP}</td>
							</tr>
							<tr>
								<td>{PHP.L.Groupsmembership}:</td>
								<td class="usergrouplist">{USERMANAGER_GROUPS}</td>
							</tr>
							<tr>
								<td>{PHP.L.Country}:</td>
								<td>{USERMANAGER_COUNTRYFLAG} {USERMANAGER_COUNTRY}</td>
							</tr>
							<tr>
								<td>{PHP.L.Timezone}:</td>
								<td>{USERMANAGER_TIMEZONE}</td>
							</tr>
							<tr>
								<td>{PHP.L.Birthdate}:</td>
								<td>{USERMANAGER_BIRTHDATE}</td>
							</tr>
							<tr>
								<td>{PHP.L.Age}:</td>
								<td>{USERMANAGER_AGE}</td>
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
comments, pfs, pages
//-->
						</table>
					</div>
				</div>
<!-- END: USERMANAGER_DETAILS -->
			</div>
			</div>
<!-- END: MAIN -->