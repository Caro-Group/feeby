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

<div class="images-container">
  {block name='product_cover_thumbnails'}
    {block name='product_cover'}
      {if $product.default_image}
        <div class="swiper product-cover border-2 border-solid rounded-[5px] border-gray-default overflow-hidden "
          data-swiper-product>
          <div class="swiper-wrapper h-full">
            {foreach from=$product.images item=image key=$key name=pictures}
              <div class="swiper-slide h-full">
                <img id="zoom_product" loading="lazy" data-type-zoom="" class="img-fluid"
                  src="{$image.bySize.large_default.url}" alt="{$product.default_image.legend}"
                  title="{$product.default_image.legend}" itemprop="image"
                  width="{$product.default_image.bySize.large_default.width}"
                  height="{$product.default_image.bySize.large_default.height}"
                  data-original="{$link->getImageLink($product->link_rewrite, $product.default_image.id_image)}">

                {if $image.legend|strstr:"(Konfigurator)"}
                  <img id="product_original_img" class="hidden" loading="lazy"
                    src="{$link->getImageLink($product->link_rewrite, $image.id_image)}" alt="{$image.legend}"
                    title="{$image.legend}" itemprop="image" data-pagespeed-no-transform>
                  {break}
                {/if}
              </div>
            {/foreach}
          </div>
        </div>
        <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
          <i class="material-icons zoom-in">&#xE8FF;</i>
        </div>
      {else}
        <img class="lazy" data-src="{$urls.no_picture_image.bySize.large_default.url}" style="width:100%;">
      {/if}
      {hook h='displayProductCoverPlacement'}
    {/block}
    {block name='product_images'}

      {foreach from=$groups item=$attribute}
        {if $attribute["group_name"] == "Typ"}
          {foreach from=$attribute["attributes"] item=$item}
            {if $item["name"] == 'Obraz na płótnie' && $item["selected"]}
              {assign var="productHideThreeLastThumbs" value="true"}
            {/if}
            {if $item["name"] == 'Obraz panelowy' && $item["selected"]}
              {assign var="productHideLastThumbs" value="true"}
            {/if}
          {/foreach}
        {/if}
      {/foreach}

      <div id="thumb-gallery" class="product-thumb-images flex relative">
        <div class="swiper w-full overflow-hidden" data-swiper-product-thumb>
          <div class="swiper-wrapper">
            {foreach from=$product.images item=image key=$key name=pictures}

              {if !((
                      isset($productHideThreeLastThumbs) && 
                      (
                        $key > ($product.images|count - 4) ||
                        $key > ($product.images|count - 3) ||
                        $key > ($product.images|count - 2) ||
                        $key > ($product.images|count - 1)
                      )
                    ) || (
                      isset($productHideLastThumbs) &&
                      (
                        $key > ($product.images|count - 2) ||
                        $key > ($product.images|count - 1)
                      )
                    ))}
              <div
                class="swiper-custom-slide w-auto h-full relative thumb-container {if $image.id_image == $product.default_image.id_image} active {/if}"
                style="    flex-shrink: 0;
                   transition-property: transform;">
                <a href="javascript:void(0)" data-image="{$image.bySize.large_default.url}"
                  data-zoom-image="{$image.bySize.large_default.url}">
                  <img
                    class="h-[100px] w-[100px] tablet:h-[200px] tablet:w-[200px] thumb js-thumb border border-solid rounded-lg mr-[18px] {if $image.id_image == $product.default_image.id_image} selected {/if}"
                    data-image-medium-src="{$image.bySize.medium_default.url}"
                    data-image-large-src="{$image.bySize.large_default.url}" src="{$image.bySize.product_thumbnail.url}"
                    alt="{$image.legend}" title="{$image.legend}" itemprop="image" width="200" height="200" loading="lazy" />
                </a>
              </div>
              {if $image@last}
                {assign var='displayProductThumbEndCustom' value={hook h='displayProductThumbEndCustom'} }
                {if $displayProductThumbEndCustom}
                  <div
                    class="swiper-custom-slide w-auto h-full relative thumb-container {if $image.id_image == $product.default_image.id_image} active {/if}"
                    style="    flex-shrink: 0;
                       transition-property: transform;">
                    {hook h='displayProductThumbEndCustom'}
                  </div>
                {/if}
              {/if}
            {/if}
          {/foreach}
        </div>
        {if $product.images|@count > 1}
          <div data-swiper-product-thumb-prev
            class="absolute bg-gray-default bottom-0 flex items-center justify-center left-0 m-auto rounded-r-[5px] swiper-button-disabled top-0 w-[24px] h-[40px] z-10">
            <svg xmlns="http://www.w3.org/2000/svg" width="7" height="14" fill="none">
              <path d="M0 6.175 6.132 0h.001L7 .873 1.218 6.612l5.78 5.737-.866.873L0 7.048v-.873Z" fill="#181828" />
            </svg>
          </div>
          <div data-swiper-product-thumb-next
            class="absolute bg-gray-default bottom-0 flex items-center justify-center right-0 m-auto rounded-l-[5px] swiper-button-disabled top-0 w-[24px] h-[40px] z-10">
            <svg xmlns="http://www.w3.org/2000/svg" width="7" height="14" fill="none">
              <path d="M7 6.175.868 0H.867L0 .873l5.782 5.739-5.78 5.737.866.873L7 7.048v-.873Z" fill="#181828" />
            </svg>
          </div>
        {/if}
      </div>
    </div>
  {/block}
  {/block}
  {hook h='displayAfterProductThumbs'}
</div>