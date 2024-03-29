{*
*
* @author Przelewy24
* @copyright Przelewy24
* @license https://www.gnu.org/licenses/lgpl-3.0.en.html
*
*}
{extends file='page.tpl'}
{capture name=path}{l s='Pay with Przelewy24' mod='przelewy24'}{/capture}
{assign var='current_step' value='payment'}
{block name='page_content'}
<div class="p24-payment-return-page przelewy-24">

    <a href="http://przelewy24.pl" target="_blank">
        <img src="{$logo_url}"
             alt="{l s='Pay with Przelewy24' mod='przelewy24'}">
    </a>
    {if 'ok' === $status}
        <p>{l s='Your order is ready.' mod='przelewy24'}
            <br>{l s='Total amount' mod='przelewy24'}:
            <span class="price"><strong>{$total_to_pay}</strong></span>
            <br>{l s='We sent for you email with this information.' mod='przelewy24'}
            <br>{l s='For any questions or information, contact with' mod='przelewy24'}
            <a href="{$link->getPageLink('contact', true)|escape:'html':'UTF-8'}">{l s='customer service' mod='przelewy24'}</a>.
        </p>
        {if $P24_PAYMENT_METHOD_LIST}
            <p class="p24-choose">
                {l s='Select payment method' mod='przelewy24'}:
            </p>
        {elseif $payment_method_selected_id > 0}
            <p>
                {l s='Your payment method' mod='przelewy24'}:
                <strong>
                    {$payment_method_selected_name}
                </strong>
            </p>
            <p>
                <img alt="{$payment_method_selected_name}"
                     class="p24-svg-image-limited"
                     src="{$payment_methods_map[$payment_method_selected_id]['imgUrl']}">
            </p>
        {/if}
        {if $card_remember_input}
            {if $customer_cards|sizeof > 0}
                <div class="p24-recurring">
                    <p>
                        {l s='Your stored credit cards' mod='przelewy24'}:
                    </p>
                    {foreach from=$customer_cards key=id item=card}
                        <a class="bank-box recurring"
                           data-id="{$card.card_type_md5}"
                           data-card-id="{$card.id}"
                           data-action="{$charge_card_url}">
                            <div class="bank-logo bank-logo-{$card.card_type_md5}">
                                <span>{$card.mask_substr}</span>
                            </div>
                            <div class="bank-name">{$card.card_type}</div>
                        </a>
                    {/foreach}
                </div>
            {/if}
            {if !$customer_is_guest}
            <div class="">
                <label>
                    <input data-action="{$p24_ajax_notices_url}" {if $remember_customer_cards}checked="checked"{/if}
                           type="checkbox"
                           id="p24-remember-my-card"
                           class="p24-remember-my-card"
                           name="p24-remember-my-card" value="1">
                    <span>{l s='Remember my payment card' mod='przelewy24'}</span>
                </label>
            </div>
            {/if}
        {/if}
        <div>
            {if $P24_PAYMENT_METHOD_LIST}
                {if $p24_paymethod_graphics}
                    {if $p24_paymethod_list_first|sizeof > 0}
                        {if isset($p24_paymethod_list_first[266]) && Configuration::get('P24_NOW_PROMOTE') 
                            && $p24_amount < 1000000 && $p24_currency == "PLN"}
                            <div class="pay-method-list pay-method-graphics pay-method-list-first box">
                                <a class="bank-box link"
                                data-id="266">
                                    <div class="bank-logo logo-position" style="background-image: url({$payment_methods_map[266]['mobileImgUrl']}"></div>
                                    <div class="bank-name" style="font-size: 14px;">P24now</div>
                                </a>
                            </div>
                        {/if}
                    {/if}
                {/if}
            {/if}
        </div>
        {if $P24_PAYMENT_METHOD_LIST}
            {if $p24_paymethod_graphics}
                <div class="flex flex-wrap items-center justify-center mb-5">
                    {if $p24_paymethod_list_first|sizeof > 0}
                        {foreach $p24_paymethod_list_first as $bank_id => $bank_name}
                            {if !empty($bank_name)}
                                {if $p24_amount > 1000000 || $p24_currency != "PLN" || Configuration::get('P24_NOW_PROMOTE') != 1}
                                    {if ($bank_id|intval) != 266}
                                        <a class="bank-box" {if (145 === ($bank_id|intval) || 218 === ($bank_id|intval)) && $pay_card_inside_shop}onclick="showPayJsPopup()"{/if}
                                        data-id="{$bank_id}">
                                            <div class="bank-logo" style="background-image: url({$payment_methods_map[$bank_id]['mobileImgUrl']})"></div>
                                            <div class="bank-name">{$bank_name}</div>
                                        </a>
                                    {/if}
                                {else}
                                    <a class="bank-box" {if (145 === ($bank_id|intval) || 218 === ($bank_id|intval)) && $pay_card_inside_shop}onclick="showPayJsPopup()"{/if}
                                        data-id="{$bank_id}">
                                        <div class="bank-logo" style="background-image: url({$payment_methods_map[$bank_id]['mobileImgUrl']})"></div>
                                        <div class="bank-name">{$bank_name}</div>
                                    </a>
                                {/if}
                            {/if}
                        {/foreach}
                    {/if}
                </div>
                <div class="flex flex-wrap items-center justify-center mb-5">
                    {if $p24_paymethod_list_second|sizeof > 0}
                        {foreach $p24_paymethod_list_second as $bank_id => $bank_name}
                            {if !empty($bank_name)}
                                {if $p24_amount > 1000000 || $p24_currency != "PLN"}
                                    {if $bank_id != 266}
                                        <a class="bank-box" {if (145 === ($bank_id|intval) || 218 === ($bank_id|intval)) && $pay_card_inside_shop}onclick="showPayJsPopup()"{/if}
                                        data-id="{$bank_id}">
                                            <div class="bank-logo" style="background-image: url({$payment_methods_map[$bank_id]['mobileImgUrl']})"></div>
                                            <div class="bank-name">{$bank_name}</div>
                                        </a>
                                    {/if}
                                {else}
                                    <a class="bank-box" {if (145 === ($bank_id|intval) || 218 === ($bank_id|intval)) && $pay_card_inside_shop}onclick="showPayJsPopup()"{/if}
                                        data-id="{$bank_id}">
                                        <div class="bank-logo" style="background-image: url({$payment_methods_map[$bank_id]['mobileImgUrl']})"></div>
                                        <div class="bank-name">{$bank_name}</div>
                                    </a>
                                {/if}
                            {/if}
                        {/foreach}
                    {/if}
                </div>
            {else}
                <ul class="pay-method-list pay-method-text-list pay-method-list-first">
                    {if $p24_paymethod_list_first|sizeof > 0}
                        {foreach $p24_paymethod_list_first as $bank_id => $bank_name}
                            {if !empty($bank_name)}
                                <li>
                                    <input type="radio" class="bank-box"
                                           {if (145 === ($bank_id|intval) || 218 === ($bank_id|intval)) && $pay_card_inside_shop}onclick="showPayJsPopup()"{/if} data-id="{$bank_id}"
                                           id="paymethod-bank-id-{$bank_id}"
                                           name="paymethod-bank">
                                    <label for="paymethod-bank-id-{$bank_id}"
                                           style="font-weight:normal;position:relative; top:-3px;">
                                        {$bank_name}
                                    </label>
                                </li>
                            {/if}
                        {/foreach}
                    {/if}
                </ul>
                {include file="module:przelewy24/views/templates/hook/parts/nav_more_less.tpl"}
                <ul class="pay-method-list pay-method-text-list pay-method-list-second" style="display: none">
                    {if $p24_paymethod_list_second|sizeof > 0}
                        {foreach $p24_paymethod_list_second as $bank_id => $bank_name}
                            {if !empty($bank_name)}
                                <li>
                                    <input type="radio" class="bank-box"
                                           {if (145 === ($bank_id|intval) || 218 === ($bank_id|intval)) && $pay_card_inside_shop}onclick="showPayJsPopup()"{/if} data-id="{$bank_id}"
                                           id="paymethod-bank-id-{$bank_id}"
                                           name="paymethod-bank">
                                    <label for="paymethod-bank-id-{$bank_id}"
                                           style="font-weight:normal;position:relative; top:-3px;">
                                        {$bank_name}
                                    </label>
                                </li>
                            {/if}
                        {/foreach}
                    {/if}
                </ul>
            {/if}
        {/if}
        <form action="{$p24_url}" method="post" id="przelewy24Form" name="przelewy24Form"
              accept-charset="utf-8">
            <input type="hidden" name="p24_merchant_id" value="{$p24_merchant_id}">
            <input type="hidden" name="p24_session_id" value="{$p24_session_id}">
            <input type="hidden" name="p24_pos_id" value="{$p24_pos_id}">
            <input type="hidden" name="p24_amount" value="{$p24_amount}">
            <input type="hidden" name="p24_currency" value="{$p24_currency}">
            <input type="hidden" name="p24_description" value="{$p24_description}">
            <input type="hidden" name="p24_email" value="{$p24_email}">
            <input type="hidden" name="p24_client" value="{$p24_client}">
            <input type="hidden" name="p24_address" value="{$p24_address}">
            <input type="hidden" name="p24_zip" value="{$p24_zip}">
            <input type="hidden" name="p24_city" value="{$p24_city}">
            <input type="hidden" name="p24_country" value="{$p24_country}">
            <input type="hidden" name="p24_encoding" value="UTF-8">
            <input type="hidden" name="p24_url_status" value="{$p24_url_status}">
            <input type="hidden" name="p24_url_return" value="{$p24_url_return}">
            <input type="hidden" name="p24_api_version" value="{$p24_api_version}">
            <input type="hidden" name="p24_ecommerce" value="{$p24_ecommerce}">
            <input type="hidden" name="p24_ecommerce2" value="{$p24_ecommerce2}">
            <input type="hidden" name="p24_language" value="{$p24_language}">
            <input type="hidden" name="p24_sign" value="{$p24_sign}">
            <input type="hidden" name="p24_wait_for_result" value="{$p24_wait_for_result}">
            <input type="hidden" name="p24_shipping" value="{$p24_shipping}">
            <input type="hidden" name="p24_method" value="{$payment_method_selected_id}">
            <input type="hidden" name="p24_card_customer_id" value="">
            <input type="hidden" name="p24_channel" {if $payment_method_selected_id === 266} value="2048" {/if}>
            

            {foreach $p24ProductItems as $name => $value}
                <input type="hidden" name="{$name}" value="{$value}">
            {/foreach}

            {if $accept_in_shop}
                <div>
                    <p id="p24_regulation_accept_text" style="color: red;">
                        {l s='Please accept' mod='przelewy24'}
                        <a href="http://www.przelewy24.pl/regulamin.htm" target="_blank">
                            {l s='the Przelewy24 Terms' mod='przelewy24'}
                        </a>
                    </p>
                    <label for="p24_regulation_accept" class="cursor-pointer flex items-center justify-center radio-block">
                        <span class="flex items-center justify-center align-[-3px] mr-5">
                            <input type="checkbox" name="p24_regulation_accept" id="p24_regulation_accept" value="1" class="after:absolute after:content-[''] after:h-[10px] after:m-[3px] after:rounded-sm after:transition after:w-[10px] appearance-none border-2 border-gray-3000 border-solid checked:after:bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-main checked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-5 outline-none ring-transparent rounded transition transition-all w-5">
                            <span><i class="material-icons rtl-no-flip checkbox-checked"></i></span>
                        </span>
                        <span>{l s='Yes, I have read and accept Przelewy24.pl terms.' mod='przelewy24'}</span>
                    </div>
                </div>
            {/if}

            <br>

            {if 'blik_uid' === $p24_method}
                <div class="p24-loader"></div>
                <div class="p24-loader-bg"></div>
                <input type="hidden" name="p24_blik_method" value="{$p24_method}">
                {if $p24_blik_alias}
                    <p id="blikAlias">
                        <strong>
                            {l s='You have existing alias, please proceed with your order' mod='przelewy24'}
                        </strong>
                    </p>
                    <div id="blikAliasAlternativeKeys">
                        <strong>
                            {l s='You have alternative aplications key, please chose one' mod='przelewy24'}
                        </strong>
                    </div>
                {/if}
                <div id="blikCodeContainer" class="form-group" {if $p24_blik_alias}style="display: none;"{/if}
                     data-websocket-url="{$p24_blik_websocket}"
                     data-shop-order-id="{$p24_shop_order_id}"
                     data-payment-failed-url="{$p24_payment_failed_url}"
                     data-ajax-verify-blik-url="{$p24_blik_ajax_verify_url}"
                     data-ajax-blik-error-url="{$p24_blik_error_url}"
                >
                    <div class="alert alert-warning" id="blikAliasError"></div>
                    <div class="alert alert-warning" id="declinedAlias">
                        {l s='Your Blik alias was declined, please provide BlikCode' mod='przelewy24'}
                    </div>
                    <input type="text" class="form-control" id="blikCode" name="p24_blik_code"
                           placeholder="{l s='Your BlikCode' mod='przelewy24'}" autocomplete="off" maxlength="6">
                    <span id="blikCodeError" class="help-block"></span>
                    <span id="wrongBlikCode" class="help-block">
                        {l s='BlikCode needs to be exactly 6 digits' mod='przelewy24'}
                    </span>
                </div>
                <br>
                <p>
                    <strong>{l s='Please get your mobile device with BLIK application ready to confirm payment' mod='przelewy24'}</strong>
                </p>
            {/if}

            <br>

            {if $accept_in_shop}
                {$submitButtonDisabled = 'disabled'}
            {else}
                {$submitButtonDisabled = ''}
            {/if}
            {if $payment_method_selected_id > 0}
                <button data-validation-required="{$validationRequired}" data-text-oneclick="{l s='Pay by OneClick' mod='przelewy24'}"  {$submitButtonDisabled} id="submitButton" class="bg-main border-0 continue cursor-pointer duration-150 flex hover:bg-main-hover items-center justify-between mb-8 ml-auto mx-auto p-3 px-4 rounded-full tablet:text-sm tablet:w-auto text-white text-xs uppercase w-full whitespace-nowrap" {if 2 === ($validationRequired|intval)}data-validation-link="{$validationLink}" type="button" onclick="proceedPayment({$cartId})"{else} onclick="formSend();" type="submit"{/if} >{l s='Pay' mod='przelewy24'}</button>
            {elseif isset($p24_blik_code)}
                <button {$submitButtonDisabled} id="submitButton" onclick="formSend();" class="bg-main border-0 continue cursor-pointer duration-150 flex hover:bg-main-hover items-center justify-between mb-8 ml-auto mx-auto p-3 px-4 rounded-full tablet:text-sm tablet:w-auto text-white text-xs uppercase w-full whitespace-nowrap">{l s='Pay by Blik' mod='przelewy24'}</button>
            {else}
                <button {$submitButtonDisabled} id="submitButton" data-validation-required="{$validationRequired}" data-text-oneclick="{l s='Pay by OneClick' mod='przelewy24'}" class="bg-main border-0 continue cursor-pointer duration-150 flex hover:bg-main-hover items-center justify-between mb-8 ml-auto mx-auto p-3 px-4 rounded-full tablet:text-sm tablet:w-auto text-white text-xs uppercase w-full whitespace-nowrap" {if 2 === ($validationRequired|intval)}data-validation-link="{$validationLink}" type="button" onclick="proceedPayment({$cartId})"{else} onclick="formSend();" type="submit"{/if}>{l s='Pay by Przelewy24' mod='przelewy24'}</button>
            {/if}
        </form>
        {if !isset($p24_blik_code)}
            <p class="p24-small-text">
                {l s='Now you will be redirected to the Przelewy24 to process payments.' mod='przelewy24'}
            </p>
        {/if}
    {elseif 'payment' === $status}
        <p class="warning">
            {l s='Thank you for your order' mod='przelewy24'}
        </p>
    {else}
        <p class="warning">
            {l s='There was an error. Contact with' mod='przelewy24'}
            <a href="{$link->getPageLink('contact', true)|escape:'html':'UTF-8'}">{l s='customer service' mod='przelewy24'}</a>.
        </p>
    {/if}
</div>
<div id="P24FormAreaHolder" onclick="hidePayJsPopup();" style="display: none">
    <div id="P24FormArea" class="popup" style="visibility: hidden"></div>
    <div id="p24-card-loader"></div>
    <div id="p24-card-alert" style="display: none"></div>
</div>

<div class="row p24-register-card-wrapper"
     data-dictionary='{
                        "cardHolderLabel":"{l s='Name and surname' mod='przelewy24'}",
                        "cardNumberLabel":"{l s='Card number' mod='przelewy24'}",
                        "cvvLabel":"{l s='cvv' mod='przelewy24'}",
                        "expDateLabel":"{l s='Expired date' mod='przelewy24'}",
                        "payButtonCaption":"{l s='Pay' mod='przelewy24'}",
                        "description":"{l s='Register card and payment' mod='przelewy24'}",
                        "threeDSAuthMessage":"{l s='Click to redirect to 3ds payment.' mod='przelewy24'}",
                        "registerCardLabel":"{l s='Register card' mod='przelewy24'}"
                    }'
     data-card-action="cardCharge"
     data-card-cart-id="{$cartId}"
     data-successCallback="payInShopSuccess"
     data-failureCallback="payInShopFailure"
     data-action-payment-success="{$link->getModuleLink('przelewy24', 'paymentSuccessful', [], true)|escape:'html':'UTF-8'}"
     data-action-payment-failed="{$link->getModuleLink('przelewy24', 'paymentFailed', [], true)|escape:'html':'UTF-8'}"
     data-action-register-card-form="{$link->getModuleLink('przelewy24', 'ajaxChargeCardForm', [], true)|escape:'html':'UTF-8'}"
     data-action-remember_order_id="{$link->getModuleLink('przelewy24', 'ajaxRememberOneclickOrderId', [], true)|escape:'html':'UTF-8'}"
     data-action-payment-check="{$link->getModuleLink('przelewy24', 'ajaxPaymentCheck', [], true)|escape:'html':'UTF-8'}">
</div>

    {if $p24_blik_inside_enable}
    {include file="module:przelewy24/views/templates/hook/parts/blik_html_code.tpl"}
    {/if}

{literal}
<style>
.box {
    text-align: center;
    width: max-content !important;
    justify-content: center;
    display: flex !important;
    align-items: center;
    margin: auto;
}

.link {
    width: 200px;
    height: 120px;
    display: flex;
    align-items: center;
    flex-direction: column;
    justify-content: center;
    margin: auto;
}

.logo-position {
    width: 100%;
    margin-bottom: 1rem;
    background-size: auto;
}
</style>
{/literal} 
{/block}
