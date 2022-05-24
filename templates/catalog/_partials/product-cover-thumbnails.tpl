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
        <div class="swiper product-cover mb-0 overflow-hidden " data-swiper-product>
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

          <div class="swiper-wrapper h-full border-2 border-solid rounded-[5px] border-gray-default">
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

              <div class="swiper-slide h-full">
                <img id="zoom_product" loading="lazy" data-type-zoom="" class="img-fluid object-contain"
                  src="{$image.bySize.large_default.url}" alt="{$product.default_image.legend}"
                  title="{$product.default_image.legend}" itemprop="image"
                  width="{$product.default_image.bySize.large_default.width}"
                  height="{$product.default_image.bySize.large_default.height}"
                  data-zoom-image="{$image.bySize.large_default.url}"
                  data-original="{$link->getImageLink($product->link_rewrite, $product.default_image.id_image)}" />

                {if $image.legend|strstr:"(Konfigurator)" && !isset($selectedOriginalImage)}
                  <img id="product_original_img" class="hidden" loading="lazy"
                    src="{$link->getImageLink($product->link_rewrite, $image.id_image)}" alt="{$image.legend}"
                    title="{$image.legend}" itemprop="image" data-pagespeed-no-transform />
                    {assign var="selectedOriginalImage" value="true"}
                {/if}
              </div>

              {/if}
            {/foreach}
          </div>

          {foreach from=$product.images item=image key=$key name=pictures}
          <div data-zoom-container class="absolute top-0 left-0 w-full h-full z-1" data-zoom-image="{$image.bySize.large_default.url}"></div>
          {break}
          {/foreach}
          <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
            <i class="material-icons zoom-in">&#xE8FF;</i>
          </div>
          <div class="absolute left-4 bottom-10 z-50 hidden tablet:flex">
            <i class="ti-arrow-left justify-center items-center flex ml-6 w-10 h-10 text-main-dark bg-gray-1000 hover:bg-main-dark hover:text-white rounded-full transition cursor-pointer"
              data-swiper-product-prev> </i>
            <i class="ti-arrow-right justify-center items-center flex ml-6 w-10 h-10 text-main-dark bg-gray-1000 hover:bg-main-dark hover:text-white rounded-full transition cursor-pointer"
              data-swiper-product-next> </i>
          </div>

        </div>
      {else}
        <img class="lazy" data-src="{$urls.no_picture_image.bySize.large_default.url}" style="width:100%;" />
      {/if}
      {hook h='displayProductCoverPlacement'}
    {/block}

    {block name='product_images'}
      <div class="swiper-container-horizontal relative h-10"><div class="product-thumb-images swiper-pagination"></div></div>
    {/block}
  {/block}
  {hook h='displayAfterProductThumbs'}
</div>