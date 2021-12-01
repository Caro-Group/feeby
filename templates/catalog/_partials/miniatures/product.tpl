{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='product_miniature_item'}
<article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
	<div>
		<div>
			{block name='product_thumbnail'}
				{if isset($cfg_product_list_image) && $cfg_product_list_image}
					<div class="leo-more-info" data-idproduct="{$product.id_product}"></div>
				{/if}
				{if $product.cover}
					<a href="{$product.canonical_url}">
						<img
							class="img-fluid object-cover w-full max-w-sm"
							width="235" height="303"
							src = "{$product.cover.bySize.home_default.url}"
							alt = "{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
							data-full-size-image-url = "{$product.cover.large.url}"
							loading="lazy"
						/> 
					</a>
				{else}
					<a href="{$product.canonical_url}">
				            <img
							class="object-cover w-full max-w-sm"
							width="235" height="303"  
							src="{$urls.no_picture_image.bySize.home_default.url}" 
							alt="No image available"
							loading="lazy" 
							/>
				        </a>
				{/if}	
			{/block}
			
			{block name='product_flags'}
				{include file='catalog/_partials/product-flags.tpl'}
			{/block}
			
			<div>
				{hook h='displayLeoCartButton' product=$product}
				{hook h='displayLeoWishlistButton' product=$product}
			</div>
		</div>
		<div class="product-meta px-6 pt-0"> 

			{hook h='displayLeoCartAttribute' product=$product}
			{hook h='displayLeoCartQuantity' product=$product}
			
			{block name='product_name'}
		         <h3 class="text-sm text-gray-main font-weight-normal" itemprop="name"><a href="{$product.canonical_url}">{$product.name}</a></h3>
			{/block}
 
				{block name='product_price_and_shipping'}
					{if $product.show_price}
            			<div>

							{hook h='displayProductPriceBlock' product=$product type="before_price"}

							<span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
							<span itemprop="price" class=" {if $product.has_discount} text-main {else} text-gray-main {/if} text-base font-bold">{$product.price}</span>

							{hook h='displayProductPriceBlock' product=$product type='unit_price'}

							{hook h='displayProductPriceBlock' product=$product type='weight'}

							{if $product.has_discount}
								{hook h='displayProductPriceBlock' product=$product type="old_price"}
								<span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
								<span class="ml-2 line-through text-gray-300 text-sm">{$product.regular_price}</span>
								{* {if $product.discount_type === 'percentage'} dać jako alt w flag
									<span class="discount-percentage discount-product">{$product.discount_percentage}</span>
								{elseif $product.discount_type === 'amount'}	
									<span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
								{/if} *}
							{/if}

						</div>
					{/if}
				{/block}
				
				{block name='product_description_short'}
					<div class="product-description-short" itemprop="description">{$product.description_short|strip_tags|truncate:150:'...' nofilter}</div>
				{/block} 
		</div>
	</div>
</article>
{/block}
