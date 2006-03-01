{include file="bitpackage:kernel/header.tpl"}
{strip}
{if $print_page ne "y"}
	{if $gBitSystem->isFeatureActive( 'bidirectional_text' )}
		<div dir="rtl">
	{/if}

	<div id="bitbar">
		Welcome to {$gBitSystem->getConfig('site_title')|default:"bitweaver"}
	</div>

	<div id="wrap1">
		<div id="bittop">
			<div class="toplogin">
				{if $gBitUser->isRegistered()}
					{tr}logged in as{/tr} {displayname}<br /><a href="{$smarty.const.USERS_PKG_URL}logout.php">{tr}logout{/tr}</a>
				{else}
					{assign var=force_secure value=$gBitSystem->isFeatureActive("https_login_required")}
					{form ipackage="users" ifile="validate.php" secure=$force_secure}
						<input type="text" name="user" alt="user name" size="10" value="username" onfocus="this.value=''" /><br />
						<input type="password" name="pass" alt="password" size="10" value="password" onfocus="this.value=''" /><br />
						<input type="image" src="{$smarty.const.THEMES_PKG_URL}styles/native/images/login.gif" style="border:0;" name="login" value="{tr}login{/tr}" />
						{if $rememberme ne 'disabled'}
							<input type="hidden" name="rme" id="rme" value="on" />
						{/if}
						{if $gBitSystem->isFeatureActive( 'allow_register' )}
							<br /><a href="{$smarty.const.USERS_PKG_URL}register.php">{tr}register{/tr}</a>
						{/if}
					{/form}
				{/if}
			</div>
			<h1>{$gBitSystem->getConfig('site_title')|default:"bitweaver"}</h1>
			<h2>{$gBitSystem->getConfig('site_slogan')}</h2>
		</div><!-- end #bittop -->

		{if $gBitSystem->isFeatureActive( 'top_bar' )}
			<div id="bittopbarwrap">
			    {include file="bitpackage:kernel/top_bar.tpl"}
			</div>
		{/if}

		<div id="wrap2"><div id="wrap3"><div id="wrap4"><div id="wrap5">
			<div id="bitbody">
				{if $gBitSystem->isFeatureActive( 'left_column' ) && $l_modules && !$gHideModules}
					<div id="bitleft">
						<div class="bitleft-tl"></div>
						<div class="bitleft-tr"></div>
						<div class="bitleft-r">
						{section name=homeix loop=$l_modules}
							{$l_modules[homeix].data}
						{/section}</div>
					</div><!-- end #bitleft -->
				{/if}

				{if $gBitSystem->isFeatureActive( 'right_column' ) && $r_modules && !$gHideModules}
					<div id="bitright">
						{section name=homeix loop=$r_modules}
							{$r_modules[homeix].data}
						{/section}
					</div><!-- end #bitright -->
				{/if}

				<div id="bitmain" class="bit-cols-{if $gBitSystem->isFeatureActive( 'left_column' ) && $l_modules && !$gHideModules and $gBitSystem->isFeatureActive( 'right_column' ) && $r_modules && !$gHideModules}3{elseif $gBitSystem->isFeatureActive( 'left_column' ) && $l_modules && !$gHideModules}2l{elseif $gBitSystem->isFeatureActive( 'right_column' ) && $r_modules && !$gHideModules}2r{else}1{/if}">
					{include file="bitpackage:liberty/display_structure.tpl"}
					<a style="padding:0;margin:0;border:0;" name="content"></a>
					{if $pageError}
						<div class="error">{$pageError}</div>
					{/if}
					{include file=$mid}
				</div><!-- end #bitmain -->

				<div class="clear"></div>
			</div><!-- end #bitbody -->
		</div></div></div></div><!-- end #wrap2,3,4,5 -->

		<div id="bitbottom">
			{if $gBitSystem->isFeatureActive( 'bot_bar' )}
				{include file="bitpackage:kernel/bot_bar.tpl"}
			{/if}
		</div><!-- end #bitbottom -->
	</div><!-- end #wrap1 -->

	{if $gBitSystem->isFeatureActive( 'bidirectional_text' )}
		</div>
	{/if}

	{include file="bitpackage:kernel/footer.tpl"}
{/if}
{/strip}
