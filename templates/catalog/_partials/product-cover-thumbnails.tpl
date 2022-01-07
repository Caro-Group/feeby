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
    {if $isMobile && $dmobile_swipe}
      <div class="list-images-mobile">
        {foreach from=$product.images item=image}
          <div>
            <img
              class="thumb js-thumb {if $image.id_image == $product.default_image.id_image} selected {/if}"
              data-image-medium-src="{$image.bySize.medium_default.url}"
              data-image-large-src="{$image.bySize.large_default.url}"
              src="{$image.bySize.large_default.url}"
              alt="{$image.legend}"
              title="{$image.legend}"
              itemprop="image"
            >
          </div>
        {/foreach}
      </div>
    {else}
      {block name='product_cover'}
        <div class="product-cover border-2 border-solid rounded-[5px] border-gray-default">
          {block name='product_flags'}
            <ul class="product-flags">
              {foreach from=$product.flags item=flag}
                <li class="product-flag {$flag.type}">{$flag.label}</li>
              {/foreach}
            </ul>
          {/block}
        {if $product.default_image}
          <img id="zoom_product" data-type-zoom="" class="js-qv-product-cover img-fluid" src="{$product.default_image.bySize.large_default.url}" alt="{$product.default_image.legend}" title="{$product.default_image.legend}" itemprop="image">
          <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
            <i class="material-icons zoom-in">&#xE8FF;</i>
          </div>
        {else}
          <img class="lazy" data-src="{$urls.no_picture_image.bySize.large_default.url}" style="width:100%;">
        {/if}
        </div>
      {/block}
      {block name='product_images'}
        <div id="thumb-gallery" class="product-thumb-images flex">
          <div class="swiper" data-swiper-product>
            <div class="swiper-wrapper">
              {foreach from=$product.images item=image}
                <div class="w-auto h-full relative thumb-container {if $image.id_image == $product.default_image.id_image} active {/if}" style="    flex-shrink: 0;
                  transition-property: transform;">
                  <a href="javascript:void(0)" data-image="{$image.bySize.large_default.url}" data-zoom-image="{$image.bySize.large_default.url}"> 
                    <img
                      class="w-auto thumb js-thumb border border-solid rounded-lg mr-[18px] {if $image.id_image == $product.default_image.id_image} border-main {/if}"
                      data-image-medium-src="{$image.bySize.medium_default.url}"
                      data-image-large-src="{$image.bySize.large_default.url}"
                      src="{$image.bySize.home_default.url}"
                      alt="{$image.legend}"
                      title="{$image.legend}"
                      itemprop="image"
                      width="200"
                      height="200"
                    />
                  </a>
                </div>
              {/foreach}
            </div>
            {if $product.images|@count > 1}
              <div data-swiper-product-prev class="absolute bg-gray-default bottom-0 flex items-center justify-center left-0 m-auto rounded-r-[5px] swiper-button-disabled top-0 w-[24px] h-[40px] z-10">
                <svg xmlns="http://www.w3.org/2000/svg" width="7" height="14" fill="none">
                  <path d="M0 6.175 6.132 0h.001L7 .873 1.218 6.612l5.78 5.737-.866.873L0 7.048v-.873Z" fill="#181828"/>
                </svg>
              </div>
              <div data-swiper-product-next class="absolute bg-gray-default bottom-0 flex items-center justify-center right-0 m-auto rounded-l-[5px] swiper-button-disabled top-0 w-[24px] h-[40px] z-10">
                <svg xmlns="http://www.w3.org/2000/svg" width="7" height="14" fill="none">
                  <path d="M7 6.175.868 0H.867L0 .873l5.782 5.739-5.78 5.737.866.873L7 7.048v-.873Z" fill="#181828"/>
                </svg>
              </div>
            {/if}
          </div>
        </div> 
      {/block}
    {/if}
  {/block}
  {hook h='displayAfterProductThumbs'}
</div>
