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
<div class="flex flex-row flex-wrap phone:flex-nowrap w-full relative desktop-presta:items-center">
  <!--  product line left content: image-->
  <div class="flex-none h-[65px] mr-5 phone-wide:h-[102px] phone-wide:w-miniature w-[65px]">
    {if $product.cover}
      <img class="border border-gray-1000 border-solid rounded-md object-contain h-full"
        width="{$product.cover.bySize.cart_default.width}"
        height="{$product.cover.bySize.cart_default.height}" 
        src="{$product.cover.bySize.cart_default.url}" alt="{$product.name|escape:'quotes'}">
    {else} 
      <img class="border border-gray-1000 border-solid rounded-md object-contain h-full" 
        width="{$urls.no_picture_image.bySize.cart_default.width}"
        height="{$urls.no_picture_image.bySize.cart_default.height}" 
        src="{$urls.no_picture_image.bySize.cart_default.url}" alt="{l s='Placeholder' d='Shop.Theme.Checkout'}"/>
    {/if}
  </div>

  <div class="flex flex-col desktop-presta:flex-row desktop-presta:items-center w-full flex-auto ">
    <!--  product line body: label, attributes, customizations -->
    <div class="flex-1 desktop-presta:pr-5 w-full">
      
      <a class="block font-normal mb-2 text-base text-main-dark mr-4 mt-3 tablet:mt-1 desktop-presta:mr-0" href="{$product.url}" data-id_customization="{$product.id_customization|intval}">{$product.name}</a>

      {foreach from=$product.attributes key="attribute" item="value"}
        <div class="flex flex-row">
          <span class="font-light mr-1 text-base text-main-dark">{$attribute}:</span>
          <span class="font-light text-base text-main-dark">{$value}</span>
        </div>
        {if $value eq 'Próbka'}
          {assign var="productSample" value="true"}
        {/if}
      {/foreach}

      {if is_array($product.customizations) && $product.customizations|count && !isset($productSample)}
        {block name='cart_detailed_product_line_customization'}
          {foreach from=$product.customizations item="customization"}
            <div class="flex flex-row">
            {foreach from=$customization.fields item="field"}
              <span class="font-light mr-1 text-base text-main-dark">
                {$field.label}:
              </span>
              <span class="font-light text-base text-main-dark">
              {debug}
                {if $field.type == 'text'}
                  {if (int)$field.id_module}
                    {$field.text nofilter}
                  {else}
                    {$field.text|replace:'1':'A'|replace:'2':'B'|replace:'3':'C'|replace:'4':'D'|replace:'5':'E'|replace:',':', '}
                  {/if}
                {elseif $field.type == 'image'}
                  <img src="{$field.image.small.url}">
                {/if}
              </span>
            {/foreach}
            </div>
          {/foreach}
        {/block}
      {/if}
    </div>
    
    <!--  product line body: discounts, price  -->
    <div class="flex flex-row w-full desktop-presta:w-36 desktop-presta:pr-5 mt-6 desktop-presta:mt-0 mb-6 {if $product.has_discount}has-discount{/if}">
      <div class="text-base text-gray-3000 block desktop-presta:hidden flex-auto">
        {l s='Price' d='Shop.Theme.Checkout'}
      </div>
      <div class="relative flex justify-end flex-col desktop-presta:justify-start">
        {if $product.has_discount}
          <div class=" flex justify-end flex-wrap">
            <span class="line-through tablet:text-base text-gray-3000 text-sm">{$product.regular_price}</span>
            {if $product.discount_type === 'percentage'}
              <span class=" text-white px-2 bg-main rounded-full ml-2 desktop-presta:-mr-5 text-sm h-5">
                -{$product.discount_percentage_absolute}
              </span>
            {* {else}
              <span class="discount discount-amount">
                -{$product.discount_to_display}
              </span> *}
            {/if}
          </div>
        {/if}
        <div class="current-price text-right desktop-presta:text-left">
          {if $product.unit_price_full}
           <span class="price text-base tablet:text-lg {if $product.has_discount} text-main {else} text-main-dark {/if} font-medium">{$product.unit_price_full}</span>
          {else}
            <span class="price text-base tablet:text-lg {if $product.has_discount} text-main {else} text-main-dark {/if} font-medium">{$product.price}</span>
          {/if}
        </div>
      </div>
    </div>


    <!--  product line right content: actions (quantity, delete), price -->
    <div class="flex flex-row w-full desktop-presta:w-32 items-start desktop-presta:pr-5 qty mb-6">
      <div class="text-base text-gray-3000 block desktop-presta:hidden flex-auto">
        {l s='Quantity' d='Shop.Theme.Checkout'}
      </div>
      <div class="flex justify-end desktop-presta:justify-start">
        {if isset($product.is_gift) && $product.is_gift}
          <span class="gift-quantity">{$product.quantity}</span>
        {else}
          {if is_array($product.customizations) && $product.customizations|count}
            <span class="js-cart-line-product-quantity -mr-5 border border-gray-2000 border-solid float-left focus:ring-0 font-normal h-[50px] pl-2 pr-2 py-3 rounded-md text-center text-lg w-[75px] form-control">{$product.quantity}</span>
          {else}
            <input
              class="js-cart-line-product-quantity  -mr-5 border border-gray-2000 border-solid float-left focus:ring-0 font-normal h-[50px] pl-1 pr-5 py-3 rounded-md text-center text-lg w-[75px] "
              data-down-url="{$product.down_quantity_url}"
              data-up-url="{$product.up_quantity_url}"
              data-update-url="{$product.update_quantity_url}"
              data-product-id="{$product.id_product}"
              type="number"
              value="{$product.quantity}"
              name="product-quantity-spin"
              min="1"
            />
          {/if}
        {/if}
      </div>
    </div>

    <div class="flex w-full desktop-presta:w-28 mb-6">
      <div class="text-base text-gray-3000 block desktop-presta:hidden flex-auto">
        {l s='Total cost' d='Shop.Theme.Checkout'}
      </div>
      <span class="product-price flex-auto flex justify-end desktop-presta:justify-start text-base tablet:text-lg text-main-dark font-medium font-body">
          {if isset($product.is_gift) && $product.is_gift}
            <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
          {else}
            {$product.total}
          {/if}
      </span>
    </div>

  </div>
  <div class="absolute ml-3 right-0 phone:relative flex-none desktop-presta:mb-6">
      <div class="cart-line-product-actions">
        <a
            class                       = "remove-from-cart"
            rel                         = "nofollow"
            href                        = "{$product.remove_from_cart_url}"
            data-x-link-action            = "delete-from-cart"
            data-id-product             = "{$product.id_product|escape:'javascript'}"
            data-id-product-attribute   = "{$product.id_product_attribute|escape:'javascript'}"
            data-id-customization   	  = "{$product.id_customization|escape:'javascript'}"
        >
          {if !isset($product.is_gift) || !$product.is_gift}
            <i class="material-icons font-light text-2xl relative flex justify-center items-center text-gray-3000 tablet:text-main-dark hover:text-main transition">&#xE5CD;</i>
          {/if}
        </a>

        {block name='hook_cart_extra_product_actions'}
          {hook h='displayCartExtraProductActions' product=$product}
        {/block}

      </div>
    </div>

</div>
