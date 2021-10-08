{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<div style="display: flex;align-items: baseline;justify-content: space-between;">  
{block name='page_header_container'}
        {block name='page_header'}
                <h1 class="h1 product-detail-name" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
          {/block}
{/block}
      
  <div class="leo-compare-wishlist-button">
     {hook h='displayLeoWishlistButton' product=$product}
     {hook h='displayLeoCompareButton' product=$product}
   </div>
</div>

{* 
*{block name='page_header_container'}
*	{block name='page_header'}
*		{foreach from=$product.images item=image name="titles"}
*			{if $smarty.foreach.titles.index == 1} {break}{/if}
*			<h1 class="h1 product-detail-name" itemprop="image">{block name='page_title'}{$image.legend}{/block}</h1>
*		{/foreach}
*	{/block}
*{/block}
*}