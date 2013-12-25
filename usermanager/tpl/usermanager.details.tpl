<!-- BEGIN: MAIN -->
		<h2>{PHP.L.usermanager_details_title}</h2>
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

<!-- BEGIN: USERMANAGER_DETAILS -->
		<div class="block">
			<h3 class="users">
				{USERMANAGER_TITLE}:
				<a href="{USERMANAGER_URL_FOR_DELETED}" class="button confirmLink confirm">{PHP.L.Delete}</a>
				<a href="{USERMANAGER_URL_FOR_EDIT}" class="button">{PHP.L.Edit}</a>
				<a href="{USERMANAGER_URL_FOR_RESET}" class="button confirmLink confirm">{PHP.L.usermanager_reset_pass}</a>
			</h3>
			<table class="cells">
<!-- IF {PHP.cot_modules.pm} -->
				<tr>
					<td>{PHP.L.users_sendpm}:</td>
					<td>{USERMANAGER_PM}</td>
				</tr>
<!-- ENDIF -->
				<tr>
					<td class="width30">{PHP.L.Maingroup}:</td>
					<td class="width70">{USERMANAGER_MAINGRP}</td>
				</tr>
				<tr>
					<td>{PHP.L.Groupsmembership}:</td>
					<td>{PHP.L.Maingroup}:<br />&nbsp;{PHP.out.img_down}<br />{USERMANAGER_GROUPS}</td>
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
комменты юзверя
ПФС юзверя
пейджи юзверя
...
//-->

			</table>
		</div>
<!-- END: USERMANAGER_DETAILS -->
<!-- END: MAIN -->