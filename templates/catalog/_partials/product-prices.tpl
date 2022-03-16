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
 {if $product.show_price}
  <div class="product-prices">
    {block name='product_discount'}
      {if $product.has_discount}
        <div class="leading-none mb-1 product-discount text-[#BABABA] text-base line-through">
          {hook h='displayProductPriceBlock' product=$product type="old_price"}
          <span class="regular-price">{$product.regular_price}</span>
        </div>
      {/if}
    {/block}

    <div class="flex flex-row items-baseline"> 

      {block name='product_price'}
        <div
          class="font-medium leading-none product-price text-[25px] tablet:text-[35px] mr-[10px] {if $product.has_discount}text-main{else}text-[#232322]{/if} {if $product.has_discount}has-discount{/if}"
          itemprop="offers"
          itemscope
          itemtype="https://schema.org/Offer"
        >
          <link itemprop="availability" href="{$product.seo_availability}"/>
          <meta itemprop="priceCurrency" content="{$currency.iso_code}">

          <div class="current-price">
          {if $displayUnitPrice}
              {assign var=currency value=Context::getContext()->currency}
              {if isset($perM) && $perM}
                  <span itemprop="price" content="{if $product.rounded_display_price}{$product.rounded_display_price}{else}{$product.price}{/if}">{$product.price}</span> <span class="mr-2 text-2xl text-[#232322]">/ m²</span>
                {else}
                  <span class="mr-2 text-2xl text-[#232322]">{$product.minimal_quantity}</span><span class="mr-2 text-2xl text-[#232322]">m² / </span>
                  <span itemprop="price" content="{if $product.rounded_display_price}{$product.rounded_display_price}{else}{Context::getContext()->currentLocale->formatPrice($product.price_amount*$product.minimal_quantity,$currency->iso_code)}{/if}">{Context::getContext()->currentLocale->formatPrice($product.price_amount*$product.minimal_quantity,$currency->iso_code)}</span>  
              {/if}

            {else}
              <span itemprop="price" content="{if $product.rounded_display_price}{$product.rounded_display_price}{else}{$product.price}{/if}">{$product.price}</span>  
            {/if}
          </div>
        </div>
      {/block}

      {block name='product_without_taxes'}
        {if $priceDisplay == 2}
          <p class="product-without-taxes">{l s='%price% tax excl.' d='Shop.Theme.Catalog' sprintf=['%price%' => $product.price_tax_exc]}</p>
        {/if}
      {/block}

      {block name='product_pack_price'}
        {if $displayPackPrice}
          <p class="product-pack-price"><span>{l s='Instead of %price%' d='Shop.Theme.Catalog' sprintf=['%price%' => $noPackPrice]}</span></p>
        {/if}
      {/block}

      {block name='product_ecotax'}
        {if $product.ecotax.amount > 0}
          <p class="price-ecotax">{l s='Including %amount% for ecotax' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.ecotax.value]}
            {if $product.has_discount}
              {l s='(not impacted by the discount)' d='Shop.Theme.Catalog'}
            {/if}
          </p>
        {/if}
      {/block}

      {hook h='displayProductPriceBlock' product=$product type="weight" hook_origin='product_sheet'}

      <div class="leading-none tax-shipping-delivery-label lowercase font-light text-base text-[#BABABA]">
        {if isset($configuration.taxes_enabled) &&  !$configuration.taxes_enabled}
          {l s='No tax' d='Shop.Theme.Catalog'}
        {elseif $configuration.display_taxes_label}
          {$product.labels.tax_long}
        {/if}
        {hook h='displayProductPriceBlock' product=$product type="price"}
        {hook h='displayProductPriceBlock' product=$product type="after_price"}
        {if $product.additional_delivery_times == 1}
          {if $product.delivery_information}
            <span class="delivery-information">{$product.delivery_information}</span>
          {/if}
        {elseif $product.additional_delivery_times == 2}
          {if $product.quantity > 0}
            <span class="delivery-information">{$product.delivery_in_stock}</span>
          {* Out of stock message should not be displayed if customer can't order the product. *}
          {elseif $product.quantity <= 0 && $product.add_to_cart_url}
            <span class="delivery-information">{$product.delivery_out_stock}</span>
          {/if}
        {/if}
      </div>
    </div>
  </div>
{/if}
