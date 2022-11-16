{* 
* @Module Name: Leo Product Search
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright Leotheme
*}

{function name="lps_categories" nodes=[] depth=0}
  {strip}
    {if $nodes|count}
        {foreach from=$nodes item=node}         
            <a href="#" data-cate-id="{$node.id_category|escape:'htmlall':'UTF-8'|stripslashes}" data-cate-name="{$node.name}" class="cate-item cate-level-{$node.level_depth}{if isset($selectedCate) && $node.id_category eq $selectedCate} active{/if}" >{if $node.level_depth > 1}{str_repeat('-', $node.level_depth)}{/if}{$node.name}</a>           
            {lps_categories nodes=$node.children depth=$depth+1}           
        {/foreach}
    {/if}
  {/strip}
{/function}

<!-- Block search module -->
<div id="leo_search_block_top" class="w-full exclusive{if $en_search_by_cat} search-by-category{/if}">
		<form method="get" action="{$link->getPageLink('search', true)|escape:'html':'UTF-8'}" id="leosearchtopbox" data-label-suggestion="{l s='Suggestion' mod='leoproductsearch'}" data-search-for="{l s='Search for' mod='leoproductsearch'}" data-in-category="{l s='in category' mod='leoproductsearch'}" data-products-for="{l s='Products For' mod='leoproductsearch'}" data-label-products="{l s='Products' mod='leoproductsearch'}" data-view-all="{l s='View all' mod='leoproductsearch'}">
		<input type="hidden" name="fc" value="module" />
		<input type="hidden" name="module" value="leoproductsearch" />
		<input type="hidden" name="controller" value="productsearch" />
		<input type="hidden" name="txt_not_found" value="{l s='No products found' mod='leoproductsearch'}">
                <input type="hidden" name="leoproductsearch_static_token" value="{$leoproductsearch_static_token|escape:'htmlall':'UTF-8'|stripslashes}"/>
		{*
		<input type="hidden" name="orderby" value="position" />
		<input type="hidden" name="orderway" value="desc" />
		*}
    	<label>{l s='Search products:' mod='leoproductsearch'}</label>
		<div class="block_content clearfix leoproductsearch-content">
			{if $en_search_by_cat}		
				<div class="list-cate-wrapper">
					<input id="leosearchtop-cate-id" name="cate" value="{if isset($selectedCate)}{$selectedCate}{/if}" type="hidden">
					<a href="javascript:void(0)" id="dropdownListCateTop" class="select-title" rel="nofollow" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span>{if $selectedCateName != ''}{$selectedCateName}{else}{l s='All Categories' mod='leoproductsearch'}{/if}</span>
						<i class="material-icons pull-xs-right">keyboard_arrow_down</i>
					</a>
					<div class="list-cate dropdown-menu" aria-labelledby="dropdownListCateTop">
						<a href="#" data-cate-id="" data-cate-name="{l s='All Categories' mod='leoproductsearch'}" class="cate-item{if $selectedCate == ''} active{/if}" >{l s='All Categories' mod='leoproductsearch'}</a>				
						<a href="#" data-cate-id="{$cates.id_category|escape:'htmlall':'UTF-8'|stripslashes}" data-cate-name="{$cates.name}" class="cate-item cate-level-{$cates.level_depth}{if isset($selectedCate) && $cates.id_category eq $selectedCate} active{/if}" >{if $cates.level_depth > 1}{str_repeat('-', $cates.level_depth)}{/if}{$cates.name}</a>
						{lps_categories nodes=$cates.children}
					</div>
				</div>
			{/if}
			<div class="leoproductsearch-result">
				<div class="leoproductsearch-loading cssload-speeding-wheel"></div>
				<input class="search_query form-control italic border-0 tablet-medium:border border-gray-2000 border-solid rounded-full text-sm bg-transparent focus:border-gray-3000 transition" type="text" id="leo_search_query_top" name="s" value="{$search_query|escape:'htmlall':'UTF-8'|stripslashes}" placeholder="{l s='Search' mod='leoproductsearch'}"/>
				<div class="ac_results lps_results"></div>
			</div>
			<button type="submit" id="leo_search_top_button" class="btn group bg-transparent tablet-medium:w-16 w-12 ">
			<svg width="24" height="24" viewBox="0 0 25 25" xmlns="http://www.w3.org/2000/svg
				" class="align-middle fill-current group-hover:text-main text-main-dark transition">
				<path d="M24.8564 24.8563C25.0479 24.6647 25.0479 24.3545 24.8563 24.163L17.6572 16.9639L17.6867 16.9311C19.3076 15.1315 20.3038 12.7588 20.3038 10.1518C20.3037 4.55414 15.7496 0 10.1519 0C4.55414 0 0 4.55414 0 10.1519C0 15.7496 4.55414 20.3038 10.1519 20.3038C12.7588 20.3038 15.1315 19.3076 16.9312 17.6867L16.9639 17.6573L24.163 24.8563C24.2587 24.9521 24.3843 25 24.5097 25C24.6351 25 24.7606 24.9521 24.8564 24.8563ZM10.1519 19.323C5.09531 19.323 0.980748 15.209 0.980748 10.1519C0.980748 5.09482 5.09531 0.980687 10.1519 0.980687C15.2085 0.980687 19.323 5.09476 19.323 10.1519C19.323 15.209 15.2085 19.323 10.1519 19.323Z"></path>
			</svg>
			</button> 
		</div>
	</form>
</div>
<script type="text/javascript">
	var blocksearch_type = 'top';
</script>
<!-- /Block search module -->
