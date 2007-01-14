<div class="header">
	{if $gBitSystem->isFeatureActive( 'wiki_page_title' )}
		<h1>{$pageInfo.title|escape}</h1>
		{if $cached_page eq 'y'}<span class="cached">(cached)</span>{/if}
	{/if}

	{include file="bitpackage:wiki/page_date_bar.tpl"}

	{if $gBitSystem->isFeatureActive( 'wiki_description' ) and $description}
		<p>{$pageInfo.description|escape}</p>
	{/if}
</div><!-- end .header -->
