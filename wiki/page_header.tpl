<div class="header">
	{if $gBitSystem->isFeatureActive( 'wiki_page_title' )}
		<h1>{$pageInfo.title|escape}</h1>
		{if $cached_page eq 'y'}<span class="cached">(cached)</span>{/if}
	{/if}

	{include file="bitpackage:wiki/page_date_bar.tpl"}

	{if $gBitSystem->isFeatureActive( 'wiki_description' ) and $description}
		<h2>{$pageInfo.description|escape}</h2>
	{/if}
</div><!-- end .header -->
