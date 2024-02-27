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
<div class="wk-order-total col-md-12 col-sm-12">
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="row">
                <div class="border-gray-2000 border-solid border flex rounded-full pl-4 bg-white tablet:max-w-[350px]">
                    <input placeholder="{l s='Promo code' mod='wkonepagecheckout'}" type="text" name="wk-voucher"
                        id="wk-voucher" class="promo-input w-full bg-transparent border-0 py-3 outline-none font-body focus:ring-0 text-[12px] tablet:text-sm">
                    <button id="addVoucher" class="bg-main hover:bg-main-hover cursor-pointer overflow-hidden transition border-0 rounded-full text-white px-8 uppercase whitespace-nowrap font-body">
                        <span class="font-light text-5xl flex justify-center leading-[30px] mb-2.5">+</span>
                    </button>
                </div>
                <div class=" wkhide col-md-8 col-xs-12 wkpromo-code alert alert-danger" role="alert">
                    <i class="material-icons"></i><span>{l s='Enter a voucher code.' mod='wkonepagecheckout'}</span>
                </div>
                {if isset($cart.discounts) && $cart.discounts}
                    <div class="wk-voucher-available col-md-12">
                        <p class="block-promo promo-highlighted">
                            {l s='Take advantage of our exclusive offers: ' mod='wkonepagecheckout'}</p>
                        <ul class="block-promo">
                            {foreach $cart.discounts as $discounts}
                                <li>
                                    <a id="wkadd-code" href="javascript:void(0);"><span
                                            class="wkcode">{$discounts.code}</span></a><span> - {$discounts.name}</span>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                {/if}
            </div>
        </div>
        <div class="col-md-6 col-sm-12 mt-5 tablet:mt-0">
            <div class="row">
                {if isset($cart.vouchers.added)}
                    {foreach $cart.vouchers.added as $voucher}
                        <div class="wk-box">
                            <div class="wk-product-info col-md-7 col-sm-7 col-xs-7">
                                <span>{$voucher.name}</span>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <span>({$voucher.reduction_formatted})</span>
                            </div>
                            <div title="{l s='Delete voucher' mod='wkonepagecheckout'}"
                                class="wk-product-info col-md-1 col-sm-2 col-xs-2" id="wk-delete-voucher"
                                data-id="{$voucher.id_cart_rule}">
                                <i class="material-icons pull-xs-left">delete</i>
                            </div>
                        </div>
                    {/foreach}
                {/if}

                {if isset($isVirtual) && !$isVirtual}
                    <div class="wk-box">
                        <div class="wk-product-info col-md-8 col-sm-6 col-xs-6 text-main-dark text-sm">
                            <span>{l s='Total shipping' mod='wkonepagecheckout'}</span>
                        </div>
                        <div class="col-md-4 col-xs-2 col-sm-6 col-xs-6 wk-product-val">
                            {if isset($cart.subtotals.shipping)}
                                <span>{$cart.subtotals.shipping.value}</span>
                            {/if}
                        </div>
                    </div>
                {/if}
                {if isset($cart.subtotals.discounts)}
                    <div class="wk-box">
                        <div class="wk-product-info col-md-8 col-sm-6 col-xs-6 text-main-dark text-sm">
                            <span>{l s='Total Discount' mod='wkonepagecheckout'}</span>
                        </div>
                        <div class="col-md-4 col-xs-2 col-sm-6 col-xs-6 wk-product-val">
                            <span>-{$cart.subtotals.discounts.value}</span>
                        </div>
                    </div>
                {/if}

                {if Configuration::get('PS_GIFT_WRAPPING')}
                    {if isset($cart.subtotals.gift_wrapping)}
                        <div class="wk-box">
                            <div class="wk-product-info col-md-8 col-sm-6 col-xs-6 text-main-dark text-sm">
                                <span>{$cart.subtotals.gift_wrapping.label}</span>
                            </div>
                            <div class="col-md-4 col-xs-2 col-sm-6 col-xs-6 wk-product-val">
                                <span>{$cart.subtotals.gift_wrapping.value}</span>
                            </div>
                        </div>
                    {/if}
                {/if}

                {if Configuration::get('PS_TAX')}

                    <div class="wk-box border-0 border-t border-solid border-gray-2000 pt-3">
                        <div class="wk-product-info col-md-8 col-sm-6 col-xs-6 text-main-dark text-sm">
                            <span class="text-lg">
                                {l s='Total (tax incl.)' mod='wkonepagecheckout'}
                            </span>
                        </div>
                        <div class="col-md-4 col-xs-2 col-sm-6 col-xs-6 wk-product-val">
                            {if isset($cart.totals.total_including_tax)}
                                <span class="text-xl text-main-dark">{$cart.totals.total_including_tax.value}</span>
                            {/if}
                        </div>
                    </div>
                {else}
                    <div class="wk-box border-0 border-t border-solid border-gray-2000 pt-3">
                        <div class="wk-product-info col-md-8 col-sm-6 col-xs-6 text-main-dark text-sm">
                            <span>
                                {l s='Total' mod='wkonepagecheckout'}
                                &nbsp;{if Configuration::get('PS_TAX')}{$cart.labels.tax_short}{/if}
                            </span>
                        </div>
                        <div class="col-md-4 col-xs-2 col-sm-6 col-xs-6 wk-product-val">
                            {if isset($cart.totals.total)}
                                <span>{$cart.totals.total.value}</span>
                            {/if}
                        </div>
                    </div>
                {/if}

                {if Configuration::get('PS_TAX_DISPLAY') && isset($cart.subtotals.tax)}
                    <div class="wk-box">
                        <div class="wk-product-info col-md-8 col-sm-6 col-xs-6 text-main-dark text-sm">
                            <span>{l s='Total tax' mod='wkonepagecheckout'}</span>
                        </div>
                        <div class="col-md-4 col-xs-2 col-sm-6 col-xs-6 wk-product-val">
                            <span>{$cart.subtotals.tax.value}</span>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>