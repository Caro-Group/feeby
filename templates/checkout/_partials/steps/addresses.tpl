{**
 * PrestaShop
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

 <div class="js-address-form mb-8">
 <form
   method="POST"
   action="{url entity='order' params=['id_address' => $id_address]}"
   data-refresh-url="{url entity='order' params=['ajax' => 1, 'action' => 'addressForm']}"
 >
   <div>
     {if $use_same_address && !$cart.is_virtual}
       <p class="font-body font-light tablet:text-sm text-xs text-main-dark">
         {l s='The selected address will be used both as your personal address (for invoice) and as your delivery address.' d='Shop.Theme.Checkout'}
       </p>
     {elseif $use_same_address && $cart.is_virtual}
       <p class="font-body font-light tablet:text-sm text-xs text-main-dark">
         {l s='The selected address will be used as your personal address (for invoice).' d='Shop.Theme.Checkout'}
       </p>
     {/if}


     {if !$use_same_address}

       <h2 class="font-body font-light not-italic tablet:text-xl text-base">{l s='Your Invoice Address' d='Shop.Theme.Checkout'}</h2>

       {if $show_invoice_address_form}
         <div id="invoice-address">
           {render file                      = 'checkout/_partials/address-form.tpl'
             ui                        = $address_form
             use_same_address          = $use_same_address
             type                      = "invoice"
             form_has_continue_button  = $form_has_continue_button
           }
         </div>
       {else}
         <div id="invoice-addresses" class="address-selector js-address-selector">
           {include  file        = 'checkout/_partials/address-selector-block.tpl'
             addresses   = $customer.addresses
             name        = "id_address_invoice"
             selected    = $id_address_invoice
             type        = "invoice"
             interactive = !$show_delivery_address_form and !$show_invoice_address_form
           }
         </div>

         {if isset($invoice_address_error)}
           <p class="alert alert-danger js-address-error" name="alert-invoice" id="id-failure-address-{$invoice_address_error.id_address}">{$invoice_address_error.exception}</p>
         {else}
           <p class="alert alert-danger js-address-error" name="alert-invoice" style="display: none">{l s="Your address is incomplete, please update it." d="Shop.Notifications.Error"}</p>
         {/if}
       {/if}

     {/if}

     {if !$use_same_address}
       <h2 class="font-body font-light not-italic tablet:text-xl text-base mt-12">{l s='Shipping Address' d='Shop.Theme.Checkout'}</h2>
     {/if}

     {if $show_delivery_address_form}
       <div id="delivery-address">
         {render file                      = 'checkout/_partials/address-form.tpl'
           ui                        = $address_form
           use_same_address          = $use_same_address
           type                      = "delivery"
           form_has_continue_button  = $form_has_continue_button
         }
       </div>
     {elseif $customer.addresses|count > 0}
       <div id="delivery-addresses" class="address-selector js-address-selector mb-4">
         {include  file        = 'checkout/_partials/address-selector-block.tpl'
           addresses   = $customer.addresses
           name        = "id_address_delivery"
           selected    = $id_address_delivery
           type        = "delivery"
           interactive = !$show_delivery_address_form and !$show_invoice_address_form
         }
       </div>

       {if isset($delivery_address_error)}
         <p class="alert alert-danger js-address-error" name="alert-delivery" id="id-failure-address-{$delivery_address_error.id_address}">{$delivery_address_error.exception}</p>
       {else}
         <p class="alert alert-danger js-address-error" name="alert-delivery" style="display: none">{l s="Your address is incomplete, please update it." d="Shop.Notifications.Error"}</p>
       {/if}

       {if $use_same_address}
         <a href="{$new_address_delivery_url}" class="mb-4  border-b text-main-dark w-full hover:text-main transition text-sm font-body ">
         <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="none"><path fill="#181828" d="M0 5h12v1H0z"></path><path fill="#181828" d="M5 0v12H6V0z" class=""></path></svg>
           {l s='Different shipping delivery address' d='Shop.Theme.Actions'}
         </a>
       {/if}
     {/if}
   </div>
   
   {if !$form_has_continue_button && ( $show_delivery_address_form || $show_invoice_address_form ) }
   <div class="clearfix">
     <button type="submit" class="btn btn-primary continue float-xs-right" name="confirm-addresses" value="1">
       {l s='Continue' d='Shop.Theme.Actions'}
     </button>
     <input type="hidden" id="not-valid-addresses" value="{$not_valid_addresses}">
   </div>
   {/if}

 </form>
</div>
