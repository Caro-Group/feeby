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
{if isset($customer.addresses) && $customer.addresses|count > 0}
    <div class="form-group clearfix wk-align-center">
        <label class="mb-0 h-5">
            <span>
                <input type="radio" name="wk-invoice-address" id="wk-invoice-address-1" value="1" checked="checked" class="cursor-pointer after:absolute after:content-[''] after:h-[10px] after:m-[3px] after:rounded-sm after:transition after:w-[10px] appearance-none border-2 border-gray-3000 border-solid checked:after:bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-main checked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-5 outline-none ring-transparent rounded transition transition-all w-5">
                <span></span>
            </span>
        </label>
        <div class="col-md-10 col-sm-10 col-xs-10">
            <select class="form-control bg-white border border-solid border-gray-2000 focus:border-gray-3000 focus:ring-0 font-body font-medium form-control-select form-select js-country pl-4 rounded-full w-full" id="wk-existing-invoice-address">
                {foreach $customer.addresses as $addr}
                    <option {if isset($cart.id_address_delivery)} 
                        {if $cart.id_address_invoice == $addr.id}selected="selected"
                            {/if} 
                        {/if} value="{$addr.id}">{$addr.alias}</option>
                {/foreach}
            </select>
        </div>
    </div>
{/if}

{if $customer.addresses|count > 0}
    <div class="form-group clearfix">
        <label class="float-left w-5"></label>
        <div class="col-md-10 col-sm-10 col-xs-10">
            <address class="wk-diff-address wk-invoice-address-card">
                {$customer.addresses.{$cart.id_address_invoice}.formatted nofilter}
                <hr>
                <footer style="text-align: right;margin:0 0.3125rem;">
                    <a class="edit-address text-muted" id="wk-invoice-address-edit" href="javascript:void(0);">
                        <i class="material-icons edit"></i>{l s='Edit' mod='wkonepagecheckout'}
                    </a>
                    <a class="delete-address text-muted" id="wk-invoice-address-delete" href="javascript:void(0);">
                        <i class="material-icons delete"></i>{l s='Delete' mod='wkonepagecheckout'}
                    </a>
                </footer>
            </address>
        </div>
    </div>
{/if}

{if $customer.addresses|count > 0}
    <div class="form-group clearfix wk-align-center">
        <label class="mb-0 h-5">
            <span>
                <input type="radio" name="wk-invoice-address" id="wk-invoice-address-2" value="2" class="cursor-pointer after:absolute after:content-[''] after:h-[10px] after:m-[3px] after:rounded-sm after:transition after:w-[10px] appearance-none border-2 border-gray-3000 border-solid checked:after:bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-main checked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-5 outline-none ring-transparent rounded transition transition-all w-5">
                <span></span>
            </span>
        </label>
        <div class="col-md-10 col-sm-10 col-xs-10">
            <div class="wk-diff-address wk-diff-address-invoice">{l s='Add new invoice address' mod='wkonepagecheckout'}
            </div>
        </div>
    </div>
{/if}