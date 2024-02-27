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
        <label class="col-md-1 col-xs-1 col-sm-1">
            <span class="custom-radio">
                <input type="radio" name="wk-invoice-address" id="wk-invoice-address-1" value="1" checked="checked">
                <span></span>
            </span>
        </label>
        <div class="col-md-10 col-sm-10 col-xs-10">
            <select class="form-control" id="wk-existing-invoice-address">
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
        <label class="col-md-1 col-xs-1 col-sm-1"></label>
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
        <label class="col-md-1 col-xs-1 col-sm-1">
            <span class="custom-radio">
                <input type="radio" name="wk-invoice-address" id="wk-invoice-address-2" value="2">
                <span></span>
            </span>
        </label>
        <div class="col-md-10 col-sm-10 col-xs-10">
            <div class="wk-diff-address wk-diff-address-invoice">{l s='Add new invoice address' mod='wkonepagecheckout'}
            </div>
        </div>
    </div>
{/if}