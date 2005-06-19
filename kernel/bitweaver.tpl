{include file="bitpackage:kernel/header.tpl"}
{strip}
{if $print_page ne "y"}
	{if $gBitSystemPrefs.feature_bidi eq 'y'}
		<div dir="rtl">
	{/if}

	<div id="tikibar">
		Welcome to {$siteTitle|default:"bitweaver"}
	</div>

	<div id="wrap1">
		<div id="bittop">
			<div class="toplogin">
				{if $gBitUser->isRegistered()}
					{tr}logged in as{/tr} {displayname}<br /><a href="{$gBitLoc.USERS_PKG_URL}logout.php">{tr}logout{/tr}</a>
				{else}
					{form ipackage="users" ifile="validate.php"}
						<input type="text" name="user" alt="user name" size="10" value="username" onfocus="this.value=''" /><br />
						<input type="password" name="pass" alt="password" size="10" value="password" onfocus="this.value=''" /><br />
						<input type="image" src="{$gBitLoc.THEMES_PKG_URL}styles/native/images/login.gif" style="border:0;" name="login" value="{tr}login{/tr}" />
						{if $rememberme ne 'disabled'}
							<input type="hidden" name="rme" id="rme" value="on" />
						{/if}
						{if $gBitSystem->isFeatureActive( 'allowRegister' )}
							<br /><a href="{$gBitLoc.USERS_PKG_URL}register.php">{tr}register{/tr}</a>
						{/if}
					{/form}
				{/if}
			</div>
			<h1>{$siteTitle|default:"bitweaver"}</h1>
			<h2>{$gBitSystemPrefs.site_slogan}</h2>
		</div><!-- end #bittop -->

		{if $gBitSystemPrefs.feature_top_bar eq 'y'}
			<div id="bittopbarwrap">
			    {include file="bitpackage:kernel/top_bar.tpl"}
			</div>
		{/if}

		<div id="wrap2"><div id="wrap3"><div id="wrap4"><div id="wrap5">
			<div id="tikibody">
				{if $gBitSystemPrefs.feature_left_column eq 'y' && $l_modules && !$gHideModules}
					<div id="bitleft">
						<div class="bitleft-tl"></div>
						<div class="bitleft-tr"></div>
						<div class="bitleft-r">
						{section name=homeix loop=$l_modules}
							{$l_modules[homeix].data}
						{/section}</div>
					</div><!-- end #bitleft -->
				{/if}

				{if $gBitSystemPrefs.feature_right_column eq 'y' && $r_modules && !$gHideModules}
					<div id="bitright">
						{section name=homeix loop=$r_modules}
							{$r_modules[homeix].data}
						{/section}
					</div><!-- end #bitright -->
				{/if}

				<div id="tikimain" class="tiki-cols-
					{if $gBitSystemPrefs.feature_left_column eq 'y' && $l_modules && !$gHideModules and $gBitSystemPrefs.feature_right_column eq 'y' && $r_modules && !$gHideModules}
						3
					{elseif $gBitSystemPrefs.feature_left_column eq 'y' && $l_modules && !$gHideModules}
						2l
					{elseif $gBitSystemPrefs.feature_right_column eq 'y' && $r_modules && !$gHideModules}
						2r
					{else}
						1
					{/if}
				">
					{include file="bitpackage:liberty/display_structure.tpl"}
					{if $pageError}
						<div class="error">{$pageError}</div>
					{/if}
					{include file=$mid}
				</div><!-- end #tikimain -->

				<div class="clear"></div>
			</div><!-- end #tikibody -->
		</div></div></div></div><!-- end #wrap2,3,4,5 -->

		<div id="tikibottom">
			{if $gBitSystemPrefs.feature_bot_bar eq 'y'}
				{include file="bitpackage:kernel/bot_bar.tpl"}
			{/if}
		</div><!-- end #tikibottom -->
	</div><!-- end #wrap1 -->

	{if $gBitSystemPrefs.feature_bidi eq 'y'}
		</div>
	{/if}

	{include file="bitpackage:kernel/footer.tpl"}
{/if}
{/strip}
