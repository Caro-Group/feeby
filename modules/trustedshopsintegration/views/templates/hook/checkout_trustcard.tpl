{*
* 2016-2021 Trusted Shops GmbH
*
* NOTICE OF LICENSE
*  @author    Trusted Shops GmbH
*  @copyright 2016-2021 Trusted Shops GmbH
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*
*}
<div id="trustedShopsCheckout" style="display: none;">
    <span id="tsCheckoutOrderNr">{$order_number|escape:'htmlall':'UTF-8'}</span>
    <span id="tsCheckoutBuyerEmail">{$customer_email|escape:'htmlall':'UTF-8'}</span>
    <span id="tsCheckoutOrderAmount">{$order_amount|escape:'htmlall':'UTF-8'}</span>
    <span id="tsCheckoutOrderCurrency">{$order_currency|escape:'htmlall':'UTF-8'}</span>
    <span id="tsCheckoutOrderPaymentType">{$payment_method|escape:'htmlall':'UTF-8'}</span>
    <span id="tsCheckoutOrderEstDeliveryDate">{$delivery_date|escape:'htmlall':'UTF-8'}</span>
<!-- product reviews start -->
<!-- for each product in the basket full set of data is required -->
{if $collect_reviews == 1}
    {foreach from=$products key=key item=i}
        <span class="tsCheckoutProductItem">
            <span class="tsCheckoutProductUrl">{$i.url|escape:'quotes':'UTF-8'}</span>
            <span class="tsCheckoutProductImageUrl">{$link->getImageLink($i.link_rewrite, $i.id_image, $i.image_type_default)|escape:'quotes':'UTF-8'}</span>
            <span class="tsCheckoutProductName">{$i.product_name|escape:'htmlall':'UTF-8'}</span>
            <span class="tsCheckoutProductSKU">{$i.sku|escape:'htmlall':'UTF-8'}</span>
            <span class="tsCheckoutProductGTIN">{$i.gtin|escape:'htmlall':'UTF-8'}</span>
            <span class="tsCheckoutProductMPN">{$i.mpn|escape:'htmlall':'UTF-8'}</span>
            <span class="tsCheckoutProductBrand">{$i.brand|escape:'htmlall':'UTF-8'}</span>
        </span>
    {/foreach}
{/if}
<!-- product reviews end -->
</div>
