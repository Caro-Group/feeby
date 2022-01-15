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
<div id="order-items" class="px-5 tablet:px-0"
  <div>
    {block name='order_items_table_head'}
      <h3 class="font-body font-normal tablet:text-xl text-base text-main-dark">{l s='Order items' d='Shop.Theme.Checkout'}</h3>
    {/block}
  </div>

  <div class="order-confirmation-table">

    {block name='order_confirmation_table'}
      {foreach from=$products item=product}
        <div class="flex items-center mb-3">
          <span class="flex-0 h-[65px] mr-5 phone-wide:h-[102px] phone-wide:w-miniature w-[65px]">
            {if !empty($product.cover)}
              <img src="{$product.cover.medium.url}" width="102px" height="102px" class="border border-gray-1000 border-solid rounded-md object-contain h-full"/>
            {else}
              <img src="{$urls.no_picture_image.bySize.medium_default.url}" class="border border-gray-1000 border-solid rounded-md object-contain h-full"/>
            {/if}
          </span>
          <div class="flex flex-1 flex-col phone-wide:flex-row phone-wide:items-center">
            <div class="font-body mr-5 text-main-dark">
              {if $add_product_link}<a class="block mb-2" href="{$product.url}" target="_blank">{/if}
                <span class="text-main-dark text-sm tablet:text-base font-normal">{$product.name}</span>
              {if $add_product_link}</a>{/if}

              {if is_array($product.customizations) && $product.customizations|count}
                {foreach from=$product.customizations item="customization"}
                  <div class="customizations">
                    <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                  </div>
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
                                  <img class="lazy" data-src="{$field.image.small.url}">
                                {/if}
                              </div>
                            </div>
                          {/foreach}
                        </div>
                      </div>
                    </div>
                  </div>
                {/foreach}
              {/if}

              <div class="font-light tablet:text-sm text-xs mb-2">{l s='Unit price' d='Shop.Theme.Checkout'} {$product.price}</div>
              <div class="font-light tablet:text-sm text-xs mb-2">{l s='Quantity' d='Shop.Theme.Checkout'} {$product.quantity}</div>

              {hook h='displayProductPriceBlock' product=$product type="unit_price"}
            </div>
            <div class=" qty">
              <div>

                <div class="tablet:mt-2 font-body font-normal tablet:text-xl text-base text-main-dark"><span class="block tablet-wide:hidden text-xs tablet:text-sm font-body font-light">{l s='Total products' d='Shop.Theme.Checkout'}</span>{$product.total}</div>
              </div>
            </div>
          </div>
        </div>
      {/foreach}
    {/block}

  </div>
</div>
