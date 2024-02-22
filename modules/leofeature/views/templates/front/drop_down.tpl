{*
* @Module Name: Leo Feature
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  2007-2018 Leotheme
* @description: Leo feature for prestashop 1.7: ajax cart, review, compare, wishlist at product list
*}
{if $only_total != 1}
	<div class="leo-dropdown-cart-content clearfix rounded-md font-body font-light text-main-dark text-sm shadow-xl">
		<!-- add Spent X to get free ship in checkout page Leotheme -->
		{assign var='freeshipping_price' value=Configuration::get('PS_SHIPPING_FREE_PRICE')}
		{if $freeshipping_price}
			{math equation='a-b' a=$cart.totals.total.amount b=$cart.subtotals.shipping.amount assign='total_without_shipping'}
			{math equation='a-b' a=$freeshipping_price b=$total_without_shipping assign='remaining_to_spend'}
			{if $remaining_to_spend > 0}
				{assign var=currency value=Context::getContext()->currency}
				<p class="font-body text-center">{l s='Spent' d='Modules.Leofeature.Shop'} <span
						class="font-normal">{Tools::displayPrice($remaining_to_spend,$currency)}</span>
					{l s='To get free ship!' d='Modules.Leofeature.Shop'}</p>
			{else}
				<p class="font-body text-center">{l s='You qualify for free shipping!' d='Modules.Leofeature.Shop'}</p>
			{/if}
		{/if}
		<!-- end -->
		<div class="leo-dropdown-list-item-warpper">
			<ul class="leo-dropdown-list-item overflow-auto">{foreach from=$cart.products item=product name="cart_product"}
					<li
						class="leo-dropdown-cart-item flex clearfix{if ($product.attributes|count && $show_combination) || ($product.customizations|count && $show_customization)} has-view-additional{/if}{if $smarty.foreach.cart_product.first} first{/if}{if $smarty.foreach.cart_product.last} last{/if}">
						<div class="leo-cart-item-img w-1/3 max-w-[150px] shrink-0">
							{if $product.images}
								<a class="label block" href="{$product.url}" title="{$product.name}"><img
										class="img-fluid w-full border border-solid bg-gray-1000 rounded-md"
										src="{$product.images.0.bySize.cart_default.url}" alt="{$product.name}"
										title="{$product.name}" /></a>
							{/if}
						</div>
						<div class="leo-cart-item-info grow pr-2">
							<div class="product-name"><a class="label font-medium" href="{$product.url}"
									title="{$product.name}">{$product.name}</a></div>

							{if $product.attributes|count && $show_combination}
								<div class="combinations text-xs">
									{foreach from=$product.attributes|@array_slice:0:2 key="attribute" item="value"}
										<div class="product-line-info">
											<span class="label !text-gray-3000">{$attribute}:</span>
											<span class="value !text-gray-3000">{$value}</span>
										</div>
									{/foreach}
								</div>
							{/if}

							<div class="product-price mt-1">
								{if $product.has_discount}
									<div class="product-discount">
										<span class="regular-price">{$product.regular_price}</span>

										{if $product.discount_type === 'percentage'}
											<span class="discount discount-percentage">
												-{$product.discount_percentage_absolute}
											</span>
										{else}
											<span class="discount discount-amount">
												-{$product.discount_to_display}
											</span>
										{/if}

									</div>
								{/if}
								<div class="current-price">
									<span class="price font-medium">{$product.price}</span>
								</div>
								{if $product.unit_price_full}
									<div class="unit-price-cart">{$product.unit_price_full}</div>
								{/if}
							</div>

							{if $enable_update_quantity}
								<div class="product-quantity">
									{if $enable_button_quantity}
										<a href="javascript:void(0)" class="leo-bt-product-quantity leo-bt-product-quantity-down"><i
												class="material-icons">&#xE15B;</i></a>
									{/if}
									<input class="leo-input-product-quantity input-group"
										data-down-url="{$product.down_quantity_url}" data-up-url="{$product.up_quantity_url}"
										data-update-url="{$product.update_quantity_url}"
										data-id-product="{$product.id_product|escape:'javascript'}"
										data-id-product-attribute="{$product.id_product_attribute|escape:'javascript'}"
										data-id-customization="{$product.id_customization|escape:'javascript'}"
										data-min-quantity="{$product.minimal_quantity}" data-product-quantity="{$product.quantity}"
										data-quantity-available="{$product.quantity_available}" type="text"
										value="{$product.quantity}" min="{$product.minimal_quantity}" />
									{if $enable_button_quantity}
										<a href="javascript:void(0)" class="leo-bt-product-quantity leo-bt-product-quantity-up"><i
												class="material-icons">&#xE145;</i></a>
									{/if}
								</div>
							{else}
								<div class="product-quantity"><span
										class="lablel">{l s='Quantity' d='Modules.Leofeature.Shop'}</span>: {$product.quantity}
								</div>
							{/if}
						</div>
						<div class="w-5 shrink-0">
							<a class="leo-remove-from-cart" href="javascript:void(0)"
								title="{l s='Remove from cart' d='Modules.Leofeature.Shop'}"
								data-link-url="{$product.remove_from_cart_url}"
								data-id-product="{$product.id_product|escape:'javascript'}"
								data-id-product-attribute="{$product.id_product_attribute|escape:'javascript'}"
								data-id-customization="{$product.id_customization|escape:'javascript'}">
								<i class="material-icons">&#xE872;</i>
							</a>
						</div>
				</li>{/foreach}</ul>
		</div>
		<div class="leo-dropdown-bottom">
		{/if}
		<div class="leo-dropdown-total" data-cart-total="{$cart.products_count}">
			<div class="leo-dropdown-cart-subtotals p-5">
				{foreach from=$cart.subtotals item="subtotal"}
					{if $subtotal && $subtotal.type == 'products'}
						<div class="{$subtotal.type} clearfix">
							<div class="flex items-end">
								<div class="p-0 flex-1">
									<span class="font-normal text-base text-main-dark">{$subtotal.label}</span>
								</div>
								<div class="p-0 text-right">
									<span class="font-normal text-xl text-main-dark">{$subtotal.value}</span>
								</div>
							</div>
						</div>
					{/if}
				{/foreach}
			</div>
		</div>
		{if $only_total != 1}
			<div class="leo-cart-dropdown-action clearfix">
				<a class="bg-main-dark border-0 cursor-pointer duration-150 flex font-body hover:text-white hover:bg-main-hover items-center justify-between px-5 py-4 rounded-full text-white text-sm uppercase w-full whitespace-nowrap items-center"
					href="{$order_url}">
					{l s='Check Out' d='Modules.Leofeature.Shop'}
					<i class="ti-arrow-right ml-2"></i>
				</a>
			</div>
			{include file='_partials/minicart-logos.tpl'}
		</div>
	</div>
{/if}