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
 {extends file='checkout/_partials/steps/checkout-step.tpl'}

 {block name='step_content'}
 
  <div class="mb-2 border-b border-gray-100">
    <h2>
      {l s='Data of the ordering person' d='Shop.Theme.Checkout'}
    </h2>

    {include file='checkout/_partials/steps/addresses.tpl'}
  </div>

  <div style="{if !($customer.addresses|count) || $show_delivery_address_form || $show_invoice_address_form }opacity:0.5;pointer-events:none;{/if}">

    <h2>
      {l s='Delivery method' d='Shop.Theme.Checkout'}
    </h2>

    <div id="hook-display-before-carrier">
      {$hookDisplayBeforeCarrier nofilter}
    </div>
  
    <div class="delivery-options-list">
      {if $delivery_options|count}
        <form
          class="clearfix"
          id="js-delivery"
          data-url-update="{url entity='order' params=['ajax' => 1, 'action' => 'selectDeliveryOption']}"
          method="post"
          aria-label="{l s='Shipping Address and Method' d='Shop.Theme.Checkout'}"
        >
          <div class="form-fields">
            {block name='delivery_options'}
              <div class="delivery-options">
                {foreach from=$delivery_options item=carrier key=carrier_id name=delivery_options_loop}
                    <div class="row delivery-option" {if $carrier.id === 31 || $carrier.id === 32}onclick="gmParcelLockerChoose(this);return false;"{/if}>
                      <div class="col-sm-1">
                        <span class="custom-radio float-xs-left">
                          <input type="radio" name="delivery_option[{$id_address_delivery}]" id="delivery_option_{$carrier.id}" value="{$carrier_id}"{if ($smarty.foreach.delivery_options_loop.index == 0 && $delivery_option != $carrier_id) || $delivery_option == $carrier_id} checked{/if} />
                          <span></span>
                        </span>
                      </div>
                      <label for="delivery_option_{$carrier.id}" class="col-sm-11 delivery-option-2">
                        <div class="row">
                          <div class="col-sm-5 col-xs-12">
                            <div class="row">
                              {if $carrier.logo}
                              <div class="col-xs-3">
                                  <img class="lazy" data-src="{$carrier.logo}" alt="{$carrier.name}" />
                              </div>
                              {/if}
                              <div class="{if $carrier.logo}col-xs-9{else}col-xs-12{/if}">
                                <span class="h6 carrier-name">{$carrier.name}</span>
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-4 col-xs-12">
                            <span class="carrier-delay">{$carrier.delay}</span>
                          </div>
                          <div class="col-sm-3 col-xs-12">
                            <span class="carrier-price">{$carrier.price}</span>
                          </div>
                        </div>
                      </label>
                    </div>
                    <div class="row carrier-extra-content"{if $delivery_option != $carrier_id} style="display:none;"{/if}>
                      {$carrier.extraContent nofilter}
                    </div>
                    <div class="clearfix"></div>
                {/foreach}
              </div>
            {/block}
            <div class="order-options">
  
              {if $recyclablePackAllowed}
                <span class="custom-checkbox">
                  <input type="checkbox" id="input_recyclable" name="recyclable" value="1" {if $recyclable} checked {/if}>
                  <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
                  <label for="input_recyclable">{l s='I would like to receive my order in recycled packaging.' d='Shop.Theme.Checkout'}</label>
                </span>
              {/if}
  
              {if $gift.allowed}
                <span class="custom-checkbox">
                  <input class="js-gift-checkbox" id="input_gift" name="gift" type="checkbox" value="1" {if $gift.isGift}checked="checked"{/if}>
                  <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
                  <label for="input_gift">{$gift.label}</label >
                </span>
  
                <div id="gift" class="collapse{if $gift.isGift} in{/if}">
                  <label for="gift_message">{l s='If you\'d like, you can add a note to the gift:' d='Shop.Theme.Checkout'}</label>
                  <textarea rows="2" cols="120" id="gift_message" name="gift_message">{$gift.message}</textarea>
                </div>
              {/if}
  
            </div>
          </div>
  
          <div class="flex flex-wrap justify-between">
            <button data-checkout-back="#checkout-personal-information-step" class="text-black bg-transparent border-0 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="mr-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" fill="#181828"/></svg>{l s='Go back' d='Shop.Theme.Checkout'}</button>  
            <button type="submit" class="continue continue bg-main hover:opacity-80 duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer" name="confirmDeliveryOption" value="1">
              {l s='Continue' d='Shop.Theme.Actions'}
            </button>
          </div>
  
        </form>
      {else}
        <p class="alert alert-danger">{l s='Unfortunately, there are no carriers available for your delivery address.' d='Shop.Theme.Checkout'}</p>
      {/if}
    </div>
  
    <div id="hook-display-after-carrier">
      {$hookDisplayAfterCarrier nofilter}
    </div>
  
    <div id="extra_carrier"></div>
   </div>
 {/block}
 