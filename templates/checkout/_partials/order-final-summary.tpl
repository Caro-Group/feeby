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
<section id="order-summary-content" class="page-content page-order-confirmation">
  <div class="row">
    <div class="col-md-12">
      <h1 class="h1 black">{l s='Order summary' d='Shop.Theme.Checkout'}</h4>
    </div>
  </div>

{if count($customer.addresses) > 0}
  <div class="flex flex-row flex-wrap">
    {if $cart.id_address_delivery}
      <div class="w-full tablet-wide:w-1/2">
        <h4 class="h5 black addresshead">{l s='Your Delivery Address' d='Shop.Theme.Checkout'}</h4>
        <div class="mb-4">
          {$customer.addresses[$cart.id_address_delivery]['formatted'] nofilter}
        </div>
        <span class="js-edit-delivery flex flex-row items-center">{l s='edit' d='Shop.Theme.Actions'} <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="ml-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M8.75 13.384 15 7.134V6.25L8.75 0l-.884.884 5.183 5.183H0v1.25h13.05L7.865 12.5l.884.884h.001Z" fill="#BABABA"/></svg></span>
      </div>
    {/if}
    {if $cart.id_address_invoice}
      <div class="w-full tablet-wide:w-1/2">
        <h4 class="h5 black addresshead">{l s='Your Invoice Address' d='Shop.Theme.Checkout'}</h4>
        <div class="mb-4">
          {$customer.addresses[$cart.id_address_invoice]['formatted'] nofilter}
        </div>
        <span class="js-edit-delivery flex flex-row items-center">{l s='edit' d='Shop.Theme.Actions'} <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="ml-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M8.75 13.384 15 7.134V6.25L8.75 0l-.884.884 5.183 5.183H0v1.25h13.05L7.865 12.5l.884.884h.001Z" fill="#BABABA"/></svg></span>
      </div>
    {/if}
  </div>
{/if} 

  <div class="flex flex-row flex-wrap phablet:flex-nowrap">
    
    <div class="w-full tablet-wide:w-1/2">
      <h4 class="h4">
        {l s='Shipping Method' d='Shop.Theme.Checkout'} 
      </h4>

      <div class="flex flex-col flex-wrap">
        <div class="flex flex-col flex-auto">
          <span class="carrier-name">{$selected_delivery_option.name}</span>
          <span class="carrier-delay">{$selected_delivery_option.delay}</span>
          <span class="carrier-price">{$selected_delivery_option.price}</span>
        </div>
        {if $selected_delivery_option.logo}
          <div class="flex-none ml-auto">
            <img src="{$selected_delivery_option.logo}" alt="{$selected_delivery_option.name}" class="h-10 w-auto">      
          </div>
        {/if}
      </div>

      <span class="step-edit step-to-delivery js-edit-delivery">{l s='edit' d='Shop.Theme.Actions'} <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="ml-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M8.75 13.384 15 7.134V6.25L8.75 0l-.884.884 5.183 5.183H0v1.25h13.05L7.865 12.5l.884.884h.001Z" fill="#BABABA"/></svg></span>
    </div>

    <div class="w-full tablet-wide:w-1/2">
      <h4 class="h4">
        {l s='Payment Method' d='Shop.Theme.Checkout'}
      </h4>

      {if $is_free}
        <p>{l s='No payment needed for this order' d='Shop.Theme.Checkout'}</p>
      {else}
        <div class="payment-options pointer-events-none">
          {foreach from=$payment_options item="module_options"}
            {foreach from=$module_options item="option"}
              {if $option.id === $selected_payment_option}

                <div class="flex flex-row flex-wrap phablet:flex-nowrap">
                  <div class="flex flex-col flex-auto">
                    {if $option.additionalInformation}
                      <div
                        id="{$option.id}-additional-information"
                        class="js-additional-information definition-list additional-information{if $option.id != $selected_payment_option} ps-hidden {/if}"
                      >
                        {$option.additionalInformation nofilter}
                      </div>
                    {/if}

                    <div>
                      <div id="{$option.id}-container">
                        {* This is the way an option should be selected when Javascript is enabled *}
                        <span class="custom-radio hidden">
                          <input
                            class="ps-shown-by-js {if $option.binary} binary {/if}"
                            id="{$option.id}"
                            data-module-name="{$option.module_name}"
                            name="payment-option"
                            type="radio"
                            required
                            {if $selected_payment_option == $option.id || $is_free} checked {/if}
                          >
                          <span></span>
                        </span>
                        {* This is the way an option should be selected when Javascript is disabled *}
                        <form method="GET" class="ps-hidden-by-js">
                          {if $option.id === $selected_payment_option}
                            {l s='Selected' d='Shop.Theme.Checkout'}
                          {else}
                            <button class="ps-hidden-by-js" type="submit" name="select_payment_option" value="{$option.id}">
                              {l s='Choose' d='Shop.Theme.Actions'}
                            </button>
                          {/if}
                        </form>
      
                      </div>
                    </div>
                    <span>{$option.call_to_action_text}</span>
                  </div>
      
                  {if $option.logo}
                    <div class="flex-none ml-auto">
                      <img src="{$option.logo}" class="h-10 w-auto">
                    </label>
                  {/if}

                  <div
                    id="pay-with-{$option.id}-form"
                    class="js-payment-option-form ps-hidden"
                  >
                    {if $option.form}
                      {$option.form nofilter}
                    {else}
                      <form id="payment-form" method="POST" action="{$option.action nofilter}">
                        {foreach from=$option.inputs item=input}
                          <input type="{$input.type}" name="{$input.name}" value="{$input.value}">
                        {/foreach}
                        <button style="display:none" id="pay-with-{$option.id}" type="submit"></button>
                      </form>
                    {/if}
                  </div>
                </div>
              {/if}
            {/foreach}
          {foreachelse}
            <p class="alert alert-danger">{l s='Unfortunately, there are no payment method available.' d='Shop.Theme.Checkout'}</p>
          {/foreach}
        </div>
      {/if}

      <button data-checkout-back="#checkout-payment-step" class="step-edit ">{l s='edit' d='Shop.Theme.Actions'} <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="ml-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M8.75 13.384 15 7.134V6.25L8.75 0l-.884.884 5.183 5.183H0v1.25h13.05L7.865 12.5l.884.884h.001Z" fill="#BABABA"/></svg></button>
    </div>

  </div>

  <div class="row">
    {block name='order_confirmation_table'}
      {include file='checkout/_partials/order-final-summary-table.tpl'
         products=$cart.products
         products_count=$cart.products_count
         subtotals=$cart.subtotals
         totals=$cart.totals
         labels=$cart.labels
         add_product_link=true
       }
    {/block}
  </div>
</section>
