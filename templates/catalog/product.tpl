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
 
  {foreach from=$product->features item=$feature}
    {if $feature.name == 'Konfigurowalny' && $feature.value == 'Tak'}
  	  {assign var="productConfigurable" value="true"}
      {include file="catalog/_partials/product-configure.tpl" product=$product} 
    {/if}
  {/foreach}

  
   {if isset($product.productLayout) && $product.productLayout != ''}
     {hook h='displayLeoProfileProduct' product=$product typeProduct='detail'}
   {else}
 
     <section id="main" class="product-detail tablet:pt-[20px]" itemscope itemtype="https://schema.org/Product">
       <meta itemprop="url" content="{$product.url}">
 
       {block name='breadcrumb_arrow'}
        {include file='_partials/breadcrumb_arrow.tpl'}
       {/block}

       {assign var="tags" value=Tag::getProductTags(Tools::getValue('id_product'))}
       {if isset($tags) && isset($tags[$language.id]) && $tags[$language.id] != ''}
          <div class="flex flex-row text-gray-3000 text-xs w-full tablet:w-3/5 tablet:pr-10 text-sm">
            {l s='Tags' d='Shop.Theme.Catalog'}:
            <ul class="flex flex-wrap float-left">
              {foreach from=$tags[$language.id] key=k item=value}
                <li class="ml-1 mb-1">
                  <a href="{$link->getPageLink('search', true, NULL, "tag={$value|urlencode}")}" class="hover:text-main text-gray-3000 text-sm transition">#{$value|escape:html:'UTF-8'}</a>
                </li>
              {/foreach}
            </ul>
          </div>
        {/if}

       <div class="flex flex-wrap flex-row mb-[25px] tablet:mb-0">
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
 
         <div class="h-max relative tablet:w-2/5 top-0 w-full tablet:sticky z-[60]">
           {block name='page_header_container'}
             {block name='page_header'}
               <h1 class="font-header product-detail-name text-[20px] tablet:text-[35px] tablet:leading-[45px] leading-24px mb-0 pr-[46px]" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
             {/block}
           {/block}
 
           <div class="leo-compare-wishlist-button absolute top-0 right-0">
             {hook h='displayLeoWishlistButton' product=$product}
             {hook h='displayLeoCompareButton' product=$product}
           </div>
 
           {hook h='displayLeoProductReviewExtra' product=$product}
 
           <div class="product-information">
             {hook h='displayProductInformationTop'}
             
             {block name='product_description_short'}
              {if $product.description_short}
                <div class="text-sm tablet:text-base text-main-dark font-body font-light" itemprop="description">{$product.description_short|strip_tags nofilter}</div>
              {/if}
             {/block}
              
              <div class="product-actions">
               {block name='product_buy'}
                 <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                   <input type="hidden" name="token" value="{$static_token}">
                   <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                   <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">
 
                   {block name='product_variants'}
                     {include file='catalog/_partials/product-variants.tpl'}
                   {/block}
                   {if isset($productConfigurable)}
                      <p class="font-body font-medium text-sm tablet:text-base text-gray-3000">{l s='Wypróbuj fototapetę przed zamówieniem ' d='Shop.Theme.Actions'}
                      <button type="button" class="bg-transparent text-gray-3000 border-0 px-0 underline hover:text-main cursor-pointer transition " data-button-action="add-sample-to-cart" >{l s='zamów próbkę' d='Shop.Theme.Actions'}</button>.</p>
                   {/if}
 
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
                   
                   <div class="fixed bottom-0 left-0 right-0 tablet:relative w-full tablet:w-auto px-5 tablet:px-0 bg-gray-default tablet:bg-transparent z-50">
                    {block name='product_prices'}
                        {assign var="perM" value=true}
                      {include file='catalog/_partials/product-prices.tpl'}
                    {/block}
                    
                    {block name='product_discounts'}
                      {include file='catalog/_partials/product-discounts.tpl'}
                    {/block}

                    <div class="{if isset($productConfigurable)}hidden{/if}">
                    
                      {block name='product_add_to_cart'}
                        {include file='catalog/_partials/product-add-to-cart.tpl'}
                      {/block}
    
                      {block name='product_additional_info'}
                        {include file='catalog/_partials/product-additional-info.tpl'}
                      {/block}
    
                    </div>
                   </div>
                   
                   {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                   {block name='product_refresh'}{/block}
                 </form>
               {/block}
             </div>
 
            
            
            {if isset($productConfigurable)}
              <button type="button" class="bg-main block border-0 cursor-pointer font-medium h-full hover:bg-main-hover overflow-hidden phone-wide:text-base px-4 py-3 relative rounded-full tablet:text-xl text-base text-center text-white transition uppercase w-full tablet:mb-6" data-toggle="modal" data-target="#productConfigurable">
                {l s='Zamów fototapetę' d='Shop.Theme.Actions'}
              </button>
              
            {/if}
            
            {if $product.is_customizable && count($product.customizations.fields)}
              <div class="{if isset($productConfigurable)}hidden{/if}">
              {block name='product_customization'}
                {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
              {/block}
              
              {hook h='displayProductButtons' product=$product}
               </div>
             {/if}

 
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
 
 
 
 
       <aside class="products-aside -mx-[30px] overflow-hidden">
         {* hook h='displayApSC' sc_key=sc2585205791 *}
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
     </section>
   {/if}
 
 {/block}

 {block name='hook_footer_before' prepend}
  <div class="container max-w-screen-full-hd w-full">
    <div class="border-0 border-b border-gray-2000 border-solid mx-auto w-full tablet:mb-6 tablet:mt-1"></div>
  </div>
  <aside class="container instagram">
  {hook h='displayApSC' sc_key=sc2039205557}
  </aside>
 {/block}
 
