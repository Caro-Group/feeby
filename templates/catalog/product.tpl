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
{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='content'}  

  {if isset($product.productLayout) && $product.productLayout != ''}
    {hook h='displayLeoProfileProduct' product=$product typeProduct='detail'}
  {else}

    <section id="main" class="product-detail pt-[20px]" itemscope itemtype="https://schema.org/Product">
      <meta itemprop="url" content="{$product.url}">

      <div class="flex flex-wrap flex-row">
        <div class="w-full tablet:w-3/5 tablet:pr-10">
          {block name='page_content_container'}
            <section class="page-content" id="content">
              {block name='page_content'}
              {include file='catalog/_partials/product-flags.tpl'}
                {block name='product_cover_thumbnails'}
                  {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                {/block}
              {/block}
            </section>
            {block name='product_images_modal'}
              {include file='catalog/_partials/product-images-modal.tpl'}
            {/block}
          {/block}
        </div>

        <div class="h-max position-sticky tablet:w-2/5 top-0 w-full">
          {block name='page_header_container'}
            {block name='page_header'}
              <h1 class="font-header product-detail-name text-[20px] tablet:text-[35px] tablet:leading-[45px] leading-24px mb-5 pr-[46px]" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
            {/block}
          {/block}

          <div class="leo-compare-wishlist-button absolute top-0 right-0">
            {hook h='displayLeoWishlistButton' product=$product}
            {hook h='displayLeoCompareButton' product=$product}
          </div>

          {hook h='displayLeoProductReviewExtra' product=$product}

          <div class="product-information">

            {if isset($category) && $category->id_parent == 582} {* CATEGORY: ARTIST *}
              {capture name=cat_thumb}{$smarty.const._THEME_CAT_DIR_}{$category->id_parent}_thumb.jpg{/capture}

              <a href="{$link->getCategoryLink($category->id)}" class="flex flex-row flex-wrap border-2 border-solid border-gray-default p-[10px] rounded-[5px] max-w-[240px] mb-[40px]">
                {if file_exists($link->getMediaLink($smarty.capture.cat_thumb))}
                  <img src="{$link->getMediaLink($smarty.capture.cat_thumb)}" class="rounded-full mr-[10px]" width="55px" height="55px"/>
                {else}
                  <img src="{$urls.img_url}cat_artist_thumb.jpg" class="rounded-full mr-[10px]" width="55px" height="55px"/>
                {/if}
                <span class="flex flex-col flex-wrap justify-center">
                  <span class="block text-base text-gray-3000">{l s='Designer' d='Shop.Theme.Catalog'}</span>
                  <span class="font-header text-main-dark italic font-light">{$category->name}</span>
                </span>
                <svg class="ml-auto my-auto mr-3" xmlns="http://www.w3.org/2000/svg" width="7" height="14" fill="none"><path d="M7 6.175.868 0H.867L0 .873l5.782 5.739-5.78 5.737.866.873L7 7.048v-.873Z" fill="#232322"/></svg>
              </a>
            {/if}
            
            {block name='product_description_short'}{/block}

            {if $product.is_customizable && count($product.customizations.fields)}
              {block name='product_customization'}
                {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
              {/block}
            {/if}

            <div class="product-actions">
              {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                  {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                  {/block}

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack">
                        <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                          {/block}
                        {/foreach}
                    </section>
                    {/if}
                  {/block}

                  <hr class="border-gray-1000 block w-full"/>
                  
                  {block name='product_prices'}
                    {include file='catalog/_partials/product-prices.tpl'}
                  {/block}
                  
                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}

                  {block name='product_add_to_cart'}
                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                  {/block}

                  {block name='product_additional_info'}
                    {include file='catalog/_partials/product-additional-info.tpl'}
                  {/block}

                  {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                  {block name='product_refresh'}{/block}
                </form>
              {/block}
            </div>

            {hook h='displayProductButtons' product=$product}

            {block name='hook_display_reassurance'}
              {hook h='displayReassurance'}
            {/block}

          </div>

        </div>
      </div>

      {block name='product_info'}
        {if isset($USE_PTABS) && $USE_PTABS == 'tab'}
          {include file="sub/product_info/tab.tpl"}
        {else if isset($USE_PTABS) && $USE_PTABS == 'accordion'}
          {include file="sub/product_info/accordions.tpl"}
        {else}
          {include file="sub/product_info/default.tpl"}
        {/if}  
      {/block}




      <aside class="products-aside">
        {hook h='displayApSC' sc_key=sc2585205791}
      </aside>

      {block name='product_accessories'}
        {if $accessories}
          <section class="product-accessories clearfix">
            <h3 class="h5 products-section-title">{l s='You might also like' d='Shop.Theme.Catalog'}</h3>
            <div class="products" itemscope itemtype="http://schema.org/ItemList">
              <div class="owl-row {if isset($productClassWidget)} {$productClassWidget}{/if}">
                <div id="category-products2" class="owl-carousel owl-theme owl-loading">
                  {foreach from=$accessories item="product_accessory" key="position"}
                    <div class="item{if $smarty.foreach.mypLoop.index == 0} first{/if}">
                      {block name='product_miniature'}
                        {if isset($productProfileDefault) && $productProfileDefault}
                            {* exits THEME_NAME/profiles/profile_name.tpl -> load template*}
                            {hook h='displayLeoProfileProduct' product=$product_accessory profile=$productProfileDefault}
                        {else}
                            {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position}
                        {/if}
                      {/block}
                    </div>
                  {/foreach}
                </div>
              </div>
            </div>
          </section>
        {/if}
      {/block}

      {block name='product_footer'}
        {hook h='displayFooterProduct' product=$product category=$category}
      {/block}

      {block name='product_images_modal'}
        {include file='catalog/_partials/product-images-modal.tpl'}
      {/block}

      {block name='page_footer_container'}
        <footer class="page-footer">
          {block name='page_footer'}
            <!-- Footer content -->
          {/block}
        </footer>
      {/block}

    </section>
  {/if}

{/block}
