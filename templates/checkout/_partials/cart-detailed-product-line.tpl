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
<div class="flex flex-row flex-wrap phone:flex-nowrap w-full relative tablet-wide:items-center">
  <!--  product line left content: image-->
  <div class="flex-none h-[65px] mr-5 phone-wide:h-[102px] phone-wide:w-miniature w-[65px]">
    {if $product.cover}
      <img class="border border-gray-1000 border-solid rounded-md object-contain h-full" src="{$product.cover.bySize.cart_default.url}" alt="{$product.name|escape:'quotes'}" width="102px" height="102px">
    {else} 
      <img class="border border-gray-1000 border-solid rounded-md object-contain h-full" src="{$urls.no_picture_image.bySize.cart_default.url}" alt="{l s='Placeholder' d='Shop.Theme.Checkout'}" width="102px" height="102px"/>
    {/if}
  </div>

  <div class="flex flex-col tablet-wide:flex-row tablet-wide:items-center w-full flex-auto ">
    <!--  product line body: label, attributes, customizations -->
    <div class="flex-1 tablet-wide:pr-5 w-full">
      
      <a class="block font-normal mb-2 text-base text-main-dark mr-4 mt-3 tablet:mt-1 tablet-wide:mr-0" href="{$product.url}" data-id_customization="{$product.id_customization|intval}">{$product.name}</a>

      {foreach from=$product.attributes key="attribute" item="value"}
        <div class="flex flex-row">
          <span class="font-light mr-1 text-base text-main-dark">{$attribute}:</span>
          <span class="font-light text-base text-main-dark">{$value}</span>
        </div>
      {/foreach}

      {if is_array($product.customizations) && $product.customizations|count}
        {block name='cart_detailed_product_line_customization'}
          {foreach from=$product.customizations item="customization"}
            <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
            <div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
                      <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
                  </div>
                  <div class="modal-body">
                    {foreach from=$customization.fields item="field"}
                      <div class="product-customization-line row">
                        <div class="col-sm-3 col-xs-4 label">
                          {$field.label}
                        </div>
                        <div class="col-sm-9 col-xs-8 value">
                          {if $field.type == 'text'}
                            {if (int)$field.id_module}
                              {$field.text nofilter}
                            {else}
                              {$field.text}
                            {/if}
                          {elseif $field.type == 'image'}
                            <img src="{$field.image.small.url}">
                          {/if}
                        </div>
                      </div>
                    {/foreach}
                  </div>
                </div>
              </div>
            </div>
          {/foreach}
        {/block}
      {/if}
    </div>
    
    <!--  product line body: discounts, price  -->
    <div class="flex flex-row w-full tablet-wide:w-36 tablet-wide:pr-5 mt-6 tablet-wide:mt-0 mb-6 {if $product.has_discount}has-discount{/if}">
      <div class="text-base text-gray-3000 block tablet-wide:hidden flex-auto">
        {l s='Price' d='Shop.Theme.Checkout'}
      </div>
      <div class="relative flex justify-end flex-col tablet-wide:justify-start >
        {if $product.has_discount}
          <div class=" flex justify-end flex-wrap">
            <span class="line-through tablet:text-base text-gray-3000 text-sm">{$product.regular_price}</span>
            {if $product.discount_type === 'percentage'}
              <span class=" text-white px-2 bg-main rounded-full ml-2 tablet-wide:-mr-5 text-sm h-5">
                -{$product.discount_percentage_absolute}
              </span>
            {* {else}
              <span class="discount discount-amount">
                -{$product.discount_to_display}
              </span> *}
            {/if}
          </div>
        {/if}
        <div class="current-price">
      <span class="price text-base tablet:text-lg {if $product.has_discount} text-main {else} text-main-dark {/if} font-medium">{$product.price}</span>
          {if $product.unit_price_full}
            <div class="unit-price-cart">{$product.unit_price_full}</div>
          {/if}
        </div>
      </div>
    </div>


    <!--  product line right content: actions (quantity, delete), price -->
    <div class="flex flex-row w-full tablet-wide:w-32 items-start tablet-wide:pr-5 qty mb-6">
      <div class="text-base text-gray-3000 block tablet-wide:hidden flex-auto">
        {l s='Quantity' d='Shop.Theme.Checkout'}
      </div>
      <div class="flex justify-end tablet-wide:justify-start">
        {if isset($product.is_gift) && $product.is_gift}
          <span class="gift-quantity">{$product.quantity}</span>
        {else}
          <input
            class="js-cart-line-product-quantity border border-gray-2000 border-r-0 border-solid py-3 px-2 rounded-l-md h-[50px] w-[50px] float-left text-sm tablet:text-base focus:ring-0 text-center text-lg font-normal "
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
      </div>
    </div>

    <div class="flex w-full tablet-wide:w-28 mb-6">
      <div class="text-base text-gray-3000 block tablet-wide:hidden flex-auto">
        {l s='Total cost' d='Shop.Theme.Checkout'}
      </div>
      <span class="product-price flex-auto flex justify-end tablet-wide:justify-start text-base tablet:text-lg text-main-dark font-medium font-body">
          {if isset($product.is_gift) && $product.is_gift}
            <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
          {else}
            {$product.total}
          {/if}
      </span>
    </div>

  </div>
  <div class="absolute ml-3 right-0 phone:relative flex-none tablet-wide:mb-6">
      <div class="cart-line-product-actions">
        <a
            class                       = "remove-from-cart"
            rel                         = "nofollow"
            href                        = "{$product.remove_from_cart_url}"
            data-link-action            = "delete-from-cart"
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
