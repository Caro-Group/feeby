{* 
* @Module Name: Leo Feature
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright Leotheme
* @description: Leo feature for prestashop 1.7: ajax cart, review, compare, wishlist at product list 
*}
{if $products && count($products) >0}
	{foreach from=$products item=product_item name=for_products}
		{assign var='product' value=$product_item.product_info}
		{assign var='wishlist' value=$product_item.wishlist_info}
		<div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-xs-12 product-miniature relative js-product-miniature leo-wishlistproduct-item leo-wishlistproduct-item-{$wishlist.id_wishlist_product} product-{$product.id_product}" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
			<div class="delete-wishlist-product clearfix">
				<a class="leo-wishlist-button-delete btn" href="javascript:void(0)" title="{l s='Remove from this wishlist' d='Modules.Leofeature.Shop'}" data-id-wishlist="{$wishlist.id_wishlist}" data-id-wishlist-product="{$wishlist.id_wishlist_product}" data-id-product="{$product.id_product}"><i class="material-icons">&#xE872;</i>
				</a>
			</div>
			<div class="thumbnail-container clearfix">
				{block name='product_thumbnail'}
					{if $product.cover}
					  <a href="{$product.url}" class="thumbnail product-thumbnail">
						<img
						  class="img-fluid lazyOwl"
						  src="{$product.cover.bySize.home_default.url}"
						  alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
						  data-full-size-image-url="{$product.cover.large.url}"
						/>
						
					  </a>
					{else}
					  <a href="{$product.url}" class="thumbnail product-thumbnail">
						<img src="{$urls.no_picture_image.bySize.home_default.url}" />
					  </a>
					{/if}
				{/block}
				<div class="product-description">							
				  {block name='product_name'}
					<h1 class="text-main-dark font-body font-light not-italic 
					text-sm tablet:text-base text-left" itemprop="name"><a class="text-main-dark" href="{$product.url}">{$product.name|truncate:30:'...'}</a></h1>
				  {/block}
				  
				</div>			
			</div>
			<div class="wishlist-product-info">
				<div class="form-group">
					<label>{l s='Quantity' d='Modules.Leofeature.Shop'}</label>
					<input class="form-control wishlist-product-quantity wishlist-product-quantity-{$wishlist.id_wishlist_product}" type="number" min=1 value="{$wishlist.quantity}">					
				</div>
				<div class="form-group">
					<label>{l s='Priority' d='Modules.Leofeature.Shop'}</label>
					<select class="form-control wishlist-product-priority wishlist-product-priority-{$wishlist.id_wishlist_product}">					  
						{for $i=0 to 2}
							<option value="{$i}"{if $i == $wishlist.priority} selected="selected"{/if}>								
								{if $i == 0}{l s='High' d='Modules.Leofeature.Shop'}{/if}
								{if $i == 1}{l s='Medium' d='Modules.Leofeature.Shop'}{/if}
								{if $i == 2}{l s='Low' d='Modules.Leofeature.Shop'}{/if}								
							</option>
						{/for}
					</select>
				  </div>
			</div>		
			<div class="wishlist-product-action">
				<a class="leo-wishlist-product-save-button btn btn-primary" href="javascript:void(0)" title="{l s='Save' d='Modules.Leofeature.Shop'}" data-id-wishlist="{$wishlist.id_wishlist}" data-id-wishlist-product="{$wishlist.id_wishlist_product}" data-id-product="{$product.id_product}">{l s='Save' d='Modules.Leofeature.Shop'}
				</a>
				{if isset($wishlists) && count($wishlists) > 0}					
					<div class="dropdown leo-wishlist-button-dropdown">					 
					  <button class="leo-wishlist-button dropdown-toggle btn btn-primary show-list" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{l s='Move' d='Modules.Leofeature.Shop'}</button>
					  <div class="dropdown-menu leo-list-wishlist leo-list-wishlist-{$product.id_product}  mt-[2px] bg-gray-1000 rounded-md ">				
						{foreach from=$wishlists item=wishlists_item}							
							<a href="#" class="dropdown-item list-group-item list-group-item-action move-wishlist-item border-b border-0 border-solid border-white hover:bg-[#F5F5F5] hover:text-main-dark text-main-dark transition last:border-b-0 " data-id-wishlist="{$wishlists_item.id_wishlist}" data-id-wishlist-product="{$wishlist.id_wishlist_product}" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" title="{$wishlists_item.name}">{$wishlists_item.name}</a>			
						{/foreach}
					  </div>
					</div>
				{/if}
			</div>
		</div>
	{/foreach}
{else}
	<div class="col-xl-12"><p class="alert alert-warning">{l s='No products' d='Modules.Leofeature.Shop'}</p></div>
{/if}

