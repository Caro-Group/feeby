{**
* NOTICE OF LICENSE
*
* All rights reserved,
* Please go through LICENSE.txt file inside our module
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade this module to newer
* versions in the future. If you wish to customize this module for your
* needs please refer to CustomizationPolicy.txt file inside our module for more information.
*
*  @author    Webkul IN
*  @copyright since 2010 Webkul
*  @license   LICENSE.txt
*}
<div class="form-group">
    <label class="cursor-pointer text-xs text-gray-dark align-middle">
        <input type="checkbox" name="wk-different-invoice" value="1" class="mr-2 bg-white border-2 border-gray-3000 border-solid checked:bg-main-dark checked:focus:bg-main-dark checked:hover:bg-main-dark focus:ring-0 focus:ring-transparent form-checkbox opacity-100 outline-none rounded transition" {if Configuration::get('WK_CHECKOUT_DELIVERY_AS_INVOICE')}checked="checked"{/if}>
        {l s='Use this address as invoice address' mod='wkonepagecheckout'}
    </label>
</div>

{if isset($customer.addresses) && $customer.addresses|count > 0}
    <div class="form-group clearfix wk-align-center">
        <label class="mb-0 h-5 cursor-pointer">
            <span>
                <input type="radio" name="wk-delivery-address" id="wk-delivery-address-1" value="1" checked="checked" class="after:absolute after:content-[''] after:h-[10px] after:m-[3px] after:rounded-sm after:transition after:w-[10px] appearance-none border-2 border-gray-3000 border-solid checked:after:bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-main checked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-5 outline-none ring-transparent rounded transition transition-all w-5">
                <span></span>
            </span>
        </label>
        <div class="col-md-10 col-sm-10 col-xs-10">
            <select class="form-control border-gray-2000 border-solid border rounded-full bg-white" id="wk-existing-delivery-address">
                {foreach $customer.addresses as $addr}
                    <option {if isset($cart.id_address_delivery)} 
                        {if $cart.id_address_delivery == $addr.id}selected="selected"
                            {/if} 
                        {/if} value="{$addr.id}">{$addr.alias}</option>
                {/foreach}
            </select>
        </div>
    </div>
{/if}

{if $customer.addresses|count > 0}
    <div class="form-group wk-delivery-address-div clearfix">
        <label class="float-left w-5"></label>
        <div class="col-md-10 col-sm-10 col-xs-10">
            <address class="wk-diff-address wk-delivery-address-card rounded-lg border border-solid border-gray-2000">
                {$customer.addresses.{$cart.id_address_delivery}.formatted nofilter}
                <hr>
                <footer style="text-align: right;margin:0 0.3125rem;">
                    <a class="edit-address text-muted" id="wk-delivery-address-edit" href="javascript:void(0);">
                        <i class="material-icons edit"></i>{l s='Edit' mod='wkonepagecheckout'}
                    </a>
                    <a class="delete-address text-muted" id="wk-delivery-address-delete" href="javascript:void(0);">
                        <i class="material-icons delete"></i>{l s='Delete' mod='wkonepagecheckout'}
                    </a>
                </footer>
            </address>
        </div>
    </div>
{/if}

{if $customer.addresses|count > 0}
    <div class="form-group clearfix wk-align-center">
        <label class="mb-0 h-5 cursor-pointer">
            <span>
                <input type="radio" name="wk-delivery-address" id="wk-delivery-address-2" value="2" data-attr="delivery" class="after:absolute after:content-[''] after:h-[10px] after:m-[3px] after:rounded-sm after:transition after:w-[10px] appearance-none border-2 border-gray-3000 border-solid checked:after:bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-main checked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-5 outline-none ring-transparent rounded transition transition-all w-5">
                <span></span>
            </span>
        </label>
        <div class="col-md-10 col-sm-10 col-xs-10">
            <div class="wk-diff-address wk-diff-address-delivery">{l s='Add new delivery address' mod='wkonepagecheckout'}
            </div>
        </div>
    </div>
{/if}