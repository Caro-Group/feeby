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

 <div class="images-container flex tablet:flex-row-reverse items-center">
 {block name='product_cover_thumbnails'}
   {block name='product_cover'}
     {if $product.default_image}
       <div class="group border-2 border-solid border-gray-1000 rounded-[5px] swiper product-cover w-full mb-0 overflow-hidden aspect-[16/15] tablet:aspect-square" data-swiper-product>
        {include file='catalog/_partials/product-flags.tpl'}
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

         <div class="swiper-wrapper border-gray-default">
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
               <img id="zoom_product" data-type-zoom="" class="img-fluid object-contain swiper-lazy"
                 data-src="{$image.bySize.large_default.url}" alt="{$product.default_image.legend}"
                 title="{$product.default_image.legend}" itemprop="image"
                 width="{$product.default_image.bySize.large_default.width}"
                 height="{$product.default_image.bySize.large_default.height}"
                 data-zoom-image="{$image.bySize.large_default.url}"
                 data-original="{$link->getImageLink($product->link_rewrite, $product.default_image.id_image)}" />

               {if $image.legend|strstr:"(Konfigurator)" && !isset($selectedOriginalImage)}
                 <img id="product_original_img" class="hidden js-thumb" loading="lazy"
                   src="{$link->getImageLink($product->link_rewrite, $image.id_image)}" alt="{$image.legend}"
                   title="{$image.legend}" itemprop="image" />
                   {assign var="selectedOriginalImage" value="true"}
               {/if}
             </div>

             {/if}
           {/foreach}
         </div>

         {foreach from=$product.images item=image key=$key name=pictures}
         <div data-zoom-container class="absolute top-0 left-0 w-full h-full z-50" data-zoom-image="{$image.bySize.large_default.url}"></div>
         {break}
         {/foreach}

         <div class="absolute bottom-2.5 tablet:bottom-5 inset-x-2.5 tablet:inset-x-5 z-50 flex justify-between tablet:justify-start tablet:gap-2.5 items-center tablet:w-[90px]">
            <i class="ti-arrow-left justify-center items-center flex w-10 h-10 text-main-dark bg-gray-1000 hover:bg-main-dark hover:text-white rounded-full transition cursor-pointer"
              data-swiper-product-prev> </i>
              <div class="!flex tablet:!hidden gap-[9px]" data-swiper-product-pagination></div>
            <i class="ti-arrow-right justify-center items-center flex w-10 h-10 text-main-dark bg-gray-1000 hover:bg-main-dark hover:text-white rounded-full transition cursor-pointer"
              data-swiper-product-next> </i>
          </div>

         <div class="absolute hidden tablet:block items-end bottom-5 right-5 z-10 pointer-events-none ml-auto">
            <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
              <circle class="stroke-gray-3000 group-hover:stroke-main-dark transition duration-200" cx="20" cy="20" r="19" stroke-width="2"></circle>
              <rect class="fill-gray-3000 group-hover:fill-main-dark transition duration-200" x="10" y="19" width="20" height="2"></rect>
              <rect class="fill-gray-3000 group-hover:fill-main-dark transition duration-200" x="21" y="10" width="20" height="2" transform="rotate(90 21 10)"></rect>
            </svg>
          </div>

         <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
           <i class="material-icons zoom-in">&#xE8FF;</i>
         </div>
         {include file="module:bavideotab/views/templates/front/coverVideo.tpl"}
       </div>


     {else}
       <img class="lazy" data-src="{$urls.no_picture_image.bySize.large_default.url}" style="width:100%;" />
     {/if}
   {/block}

   {block name='product_images'}

     <div class="hidden tablet:block shrink-0">

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

       <div class="product-thumb-images flex relative mr-5 h-full max-h-full">
         <div class="swiper h-[230px] tablet-medium:h-[350px] desktop-presta:h-[470px] overflow-hidden" data-swiper-product-thumb>
           <div id="thumb-gallery" class="swiper-wrapper flex flex-col">
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
                   class="swiper-lazy swiper-custom-slide h-[110px] 1920:h-[82px] w-[110px] 1920:w-[82px] relative thumb-container cursor-pointer {if $image.id_image == $product.default_image.id_image} active {/if}"
                   style="    flex-shrink: 0;
                     transition-property: transform;">
                   <a data-image="{$image.bySize.large_default.url}" class="block w-full h-full"
                     data-zoom-image="{$image.bySize.large_default.url}">
                     <img
                       class="block w-full h-full border border-solid border-gray-1000 rounded-lg box-border transition-all duration-200 {if $image.id_image == $product.default_image.id_image} selected {/if}"
                       src="{$image.bySize.product_thumbnail.url}"
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
               class="absolute left-[calc(50%_-_20px)] top-0 swiper-button-disabled z-10 h-[21px]">
               <svg xmlns="http://www.w3.org/2000/svg" width="40" height="21" viewBox="0 0 40 21" fill="none">
                <path d="M35 21C37.7614 21 40 18.7614 40 16L40 1.90735e-06L9.17939e-07 1.58893e-07L2.18557e-07 16C9.78513e-08 18.7614 2.23857 21 5 21L35 21Z" fill="#EFEFEF" fill-opacity="0.95"/>
                <path d="M20.825 5.97613L26.9996 11.2109L26.9996 11.212L26.1265 11.9521L20.3878 7.01576L14.6504 11.9511L13.7773 11.2109L19.9519 5.97613L20.825 5.97613Z" fill="#181828"/>
              </svg>
             </div>
             <div data-swiper-product-thumb-next
               class="absolute left-[calc(50%_-_20px)] bottom-0 swiper-button-disabled z-10 h-[21px]">
               <svg xmlns="http://www.w3.org/2000/svg" width="40" height="21" viewBox="0 0 40 21" fill="none">
                 <path d="M35 -2.18557e-07C37.7614 -9.78513e-08 40 2.23858 40 5L40 21L-9.17939e-07 21L-2.18557e-07 5C-9.78513e-08 2.23857 2.23857 -1.6506e-06 5 -1.5299e-06L35 -2.18557e-07Z" fill="#EFEFEF" fill-opacity="0.95"/>
                 <path d="M20.825 14.5131L26.9996 9.27835L26.9996 9.27731L26.1265 8.53711L20.3878 13.4735L14.6504 8.53816L13.7773 9.27835L19.9519 14.5131L20.825 14.5131Z" fill="#181828"/>
               </svg>
             </div>
           {/if}

         </div>
       </div>
     </div>
   {/block}
 {/block}
 {hook h='displayAfterProductThumbs'}
</div>