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
 
  <div class="border-0 border-b border-solid border-gray-1000 mb-8 p-5 tablet:p-0">
    <div class="flex flex-row mb-7 tablet:mb-14 ">
      <h2 class="border-0 border-b-[3px] rounded-b-sm border-main border-solid mb-0 pb-2 tablet:pb-3 font-normal text-xl tablet:text-2xl">
        {l s='Data of the ordering person' d='Shop.Theme.Checkout'}
      </h2>
    </div>

    {include file='checkout/_partials/steps/addresses.tpl'}
  </div>

  <div class="{if !($customer.addresses|count) || $show_delivery_address_form || $show_invoice_address_form } pointer-events-none opacity-5 {/if} p-5 tablet:p-0">

    <div class="flex flex-row mb-2.5 tablet:mb-7 ">
      <h2 class="border-0 border-b-[3px] rounded-b-sm border-main border-solid mb-0 pb-2 tablet:pb-3 font-normal text-xl tablet:text-2xl">
        {l s='Delivery method' d='Shop.Theme.Checkout'}
      </h2>
    </div>
    
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
          <div class="form-fields mb-7 tablet:mb-9 pb-1">
            {block name='delivery_options'}
              <div class="delivery-options flex flex-col flex-wrap">
                {assign var="carrier_module" value=''}
                {foreach from=$delivery_options item=carrier key=carrier_id name=delivery_options_loop}
                    {if isset($carrier.external_module_name) && $carrier.external_module_name != $carrier_module}
                      <div class="flex flex-row flex-wrap justify-between items-baseline mb-2 tablet:mb-4 mt-4 tablet:mt-7">
                        <div class="font-body text-base text-main-dark tablet:text-xl font-normal ml-[15px] tablet:ml-0">
                          {if $carrier.external_module_name === ''}
                            {l s='Courier' d='Shop.Theme.Checkout'}
                          {elseif $carrier.external_module_name === 'gmparcellocker'}
                            {l s='gmparcellocker' d='Shop.Theme.Checkout'}
                          {else}
                            {l s=$carrier.external_module_name d='Shop.Theme.Checkout'}
                          {/if}
                        </div>
                        {if isset($carrier.delay)}  
                          <div class="tablet:text-sm text-xs text-main-dark font-light">{$carrier.delay}</div>
                        {/if}
                      </div>
                      {assign var="carrier_module" value=$carrier.external_module_name}
                    {/if}
                    <div class="delivery-option bg-gray-1000 delivery-option flex flex-row mx-0 mb-2.5 tablet:mb-5 px-[15px] tablet:px-5 py-3 tablet:py-4 rounded-md cursor-pointer" {if $carrier.id === 31 || $carrier.id === 32}onclick="gmParcelLockerChoose(this);return false;"{/if}>
                      <div class="flex items-center justify-center mr-3 tablet:ml-3 tablet:mr-7">
                        <span class=" float-xs-left h-5">
                          <input type="radio" name="delivery_option[{$id_address_delivery}]" id="delivery_option_{$carrier.id}" value="{$carrier_id}"{if ($smarty.foreach.delivery_options_loop.index == 0 && $delivery_option != $carrier_id) || $delivery_option == $carrier_id} checked{/if} class="cursor-pointer after:absolute after:content-[''] after:h-[10px] after:m-[3px] after:rounded-sm after:transition after:w-[10px] appearance-none border-2 border-gray-3000 border-solid checked:after:bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-main checked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-5 outline-none ring-transparent rounded transition transition-all w-5" />
                        </span>
                      </div>
                      <label for="delivery_option_{$carrier.id}" class="flex-auto delivery-option-2 mb-0 cursor-pointer">
                        <div class="flex flex-row items-center tablet-wide:items-center">
                        {capture name='carrier_temp_price'}{l s='Free' d='Shop.Theme.Checkout'}{/capture}
                          <div class="
                          {if $carrier.price == $smarty.capture.carrier_temp_price }
                            bg-main font-normal rounded-full px-3 py-[3px] tablet:text-base text-sm text-white
                          {else}  
                            text-main-dark tablet:text-xl text-base
                          {/if}
                          font-body uppercase  mr-4 whitespace-nowrap">
        
                            {$carrier.price}
                          </div>
                          <div class="flex-auto font-body tablet:text-base text-sm text-main-dark font-medium py-1 mr-3">
                              {$carrier.name}
                          </div>
                          {if $carrier.logo}
                            <div class="flex-none tablet-wide:ml-auto">
                                <img src="{$carrier.logo}" alt="{$carrier.name}" class="w-9 h-7 tablet:w-16 tablet:h-12 object-contain rounded-md w-auto"/>
                            </div>
                          {/if}
                        </div>
                      </label>
                    </div>
                    <div class="carrier-extra-content"{if $delivery_option != $carrier_id} style="display:none;"{/if}>
                      {$carrier.extraContent nofilter}
                    </div>
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
  
          <div class="flex flex-col-reverse flex-wrap items-baseline justify-between tablet:flex-row tablet:items-center mb-4 tablet:mb-[30px]">
            <button data-checkout-back="#checkout-personal-information-step" class="text-main-dark bg-transparent border-0 uppercase whitespace-nowrap mb-0 flex items-center justify-between cursor-pointer"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="mr-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" fill="#181828"/></svg>{l s='Go back' d='Shop.Theme.Checkout'}</button>  
            <button type="submit" class="continue w-full text-lg tablet:w-auto bg-main hover:bg-main-hover duration-150 border-0 rounded-full text-white py-3 px-8 uppercase whitespace-nowrap mb-8 tablet:mb-0 flex items-center justify-between ml-auto cursor-pointer" name="confirmDeliveryOption" value="1">
              {l s='Continue' d='Shop.Theme.Actions'}
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"/></svg>
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
 
 