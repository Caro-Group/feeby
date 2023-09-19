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
 {assign var="tags" value=Tag::getProductTags(Tools::getValue('id_product'))}

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

       <div class="flex flex-wrap flex-row mb-16 tablet:mb-0">
         <div class="w-full tablet:w-3/5 tablet:pr-10 tablet:pb-10">
           {block name='page_content_container'}
             <section class="page-content tablet:!mb-2.5" id="content">
               {block name='page_content'}
                 {block name='product_cover_thumbnails'}
                   {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                 {/block}
               {/block}
             </section>
             {if isset($tags) && isset($tags[$language.id]) && $tags[$language.id] != ''}
                <div class="hidden tablet:flex flex-row text-gray-3000 text-xs w-full pl-[130px]">
                  <ul class="flex flex-wrap float-left gap-1 gap-x-1.5 ">
                      <li>
                        <span class="text-gray-3000 text-xs transition font-medium">{l s='Tags' d='Shop.Theme.Catalog'}:</span>
                      </li>
                    {foreach from=$tags[$language.id] key=k item=value}
                      <li>
                        <a href="{$link->getPageLink('search', true, NULL, "tag={$value|urlencode}")}" class="hover:text-main text-gray-3000 text-xs transition">#{$value|escape:html:'UTF-8'}</a>
                      </li>
                    {/foreach}
                  </ul>
                </div>
              {/if}
  
             {block name='product_images_modal'}
               {include file='catalog/_partials/product-images-modal.tpl'}
             {/block}
           {/block}
         </div>
 
         <div class="h-max relative tablet:w-2/5 top-0 w-full tablet:sticky">
           {block name='page_header_container'}
             {block name='page_header'}
               <h1 class="font-header product-detail-name text-base tablet:text-xl font-normal mb-0 pr-[46px] tablet:pr-[94px]" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
             {/block}
           {/block}
 
           <div class=" absolute top-0 right-0">
             <div class="mt-10 tablet:mt-0 tablet:mr-12">
              {include file='_partials/share-btn.tpl'}
             </div>
             <div class="leo-compare-wishlist-button">
              {hook h='displayLeoWishlistButton' product=$product}
              {hook h='displayLeoCompareButton' product=$product}
            </div>
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

                   {block name='product_prices'}
                    {assign var="perM" value=true}
                    {include file='catalog/_partials/product-prices.tpl'}
                   {/block}
                  
                   {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                   {/block}
 
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
 
                   
                   <div class="fixed bottom-0 left-0 right-0 tablet:relative w-full tablet:w-auto px-5 tablet:px-0 bg-gray-default tablet:bg-transparent z-50  shadow-[0px_-4px_20px_0px_rgba(0,0,0,0.15)] shadow-black/[0.15] tablet:shadow-none">

                    <div class="{if isset($productConfigurable)}hidden{/if} desktop-wide:w-full">
                    
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

             <hr class="my-5 ">

             <div class="flex flex-wrap mt-5 leading-normal text-sm gap-2.5 tablet:gap-5 w-full">

              <a href="{if $breadcrumb["count"] > 0 && $breadcrumb["links"][1]["title"]|strstr:"Parawany"}/nasze-parawany{else}/technologia-wykonania{/if}" target="_blank" class="flex items-center tablet-medium:basis-auto transition">
                <svg class="shrink-0 mr-2.5" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                  <path d="M9 0.25C4.16797 0.25 0.25 4.16797 0.25 9C0.25 13.832 4.16797 17.75 9 17.75C13.832 17.75 17.75 13.832 17.75 9C17.75 4.16797 13.832 0.25 9 0.25ZM9 16.2656C4.98828 16.2656 1.73438 13.0117 1.73438 9C1.73438 4.98828 4.98828 1.73438 9 1.73438C13.0117 1.73438 16.2656 4.98828 16.2656 9C16.2656 13.0117 13.0117 16.2656 9 16.2656Z" fill="#ADAFBA"/>
                  <path d="M8.0625 5.5625C8.0625 5.81114 8.16127 6.0496 8.33709 6.22541C8.5129 6.40123 8.75136 6.5 9 6.5C9.24864 6.5 9.4871 6.40123 9.66291 6.22541C9.83873 6.0496 9.9375 5.81114 9.9375 5.5625C9.9375 5.31386 9.83873 5.0754 9.66291 4.89959C9.4871 4.72377 9.24864 4.625 9 4.625C8.75136 4.625 8.5129 4.72377 8.33709 4.89959C8.16127 5.0754 8.0625 5.31386 8.0625 5.5625ZM9.46875 7.75H8.53125C8.44531 7.75 8.375 7.82031 8.375 7.90625V13.2188C8.375 13.3047 8.44531 13.375 8.53125 13.375H9.46875C9.55469 13.375 9.625 13.3047 9.625 13.2188V7.90625C9.625 7.82031 9.55469 7.75 9.46875 7.75Z" fill="#ADAFBA"/>
                </svg>
                <span class="text-gray-3000 hover:text-main font-medium tablet:font-normal transition duration-200">
                  {l s='Learn more about our products' d='Shop.Theme.Actions'}
                </span>
              </a>

              <a href="/instrukcja-montazu" target="_blank" class="flex items-center tablet-medium:basis-auto transition">
                <svg class="shrink-0 mr-2.5" xmlns="http://www.w3.org/2000/svg" width="18" height="20" viewBox="0 0 21 23" fill="none">
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M20.5 6.57812V19.9375C20.5 20.6834 20.199 21.3988 19.6632 21.9262C19.1273 22.4537 18.4006 22.75 17.6429 22.75H16.2143V21.3438H17.6429C18.0217 21.3438 18.3851 21.1956 18.653 20.9319C18.9209 20.6681 19.0714 20.3105 19.0714 19.9375V6.57812H16.2143C15.646 6.57812 15.1009 6.35589 14.6991 5.9603C14.2972 5.56472 14.0714 5.02819 14.0714 4.46875V1.65625H6.21429C5.83541 1.65625 5.47204 1.80441 5.20413 2.06813C4.93622 2.33185 4.78571 2.68954 4.78571 3.0625V15.7188H3.35714V3.0625C3.35714 2.31658 3.65816 1.60121 4.19398 1.07376C4.7298 0.546316 5.45652 0.25 6.21429 0.25L14.0714 0.25L20.5 6.57812ZM2.78571 16.9141H0.5V22.5377H1.63V20.6505H2.77714C3.18714 20.6505 3.53571 20.5703 3.82286 20.4072C4.11286 20.2427 4.33429 20.0205 4.48429 19.7406C4.63998 19.447 4.71902 19.1198 4.71429 18.7886C4.71429 18.437 4.63857 18.1192 4.48857 17.8366C4.33937 17.5556 4.11127 17.3227 3.83143 17.1658C3.54571 16.997 3.19857 16.9141 2.78571 16.9141ZM3.56429 18.7886C3.56944 18.9739 3.52771 19.1575 3.44286 19.323C3.36673 19.467 3.24824 19.5851 3.10286 19.6619C2.93655 19.7429 2.75261 19.7825 2.56714 19.7772H1.62571V17.8H2.56857C2.88 17.8 3.12429 17.8844 3.3 18.0545C3.47571 18.2261 3.56429 18.4708 3.56429 18.7886ZM5.30286 16.9141V22.5377H7.38857C7.96143 22.5377 8.43714 22.4252 8.81429 22.2044C9.19594 21.9796 9.49396 21.6399 9.66429 21.2355C9.85 20.8136 9.94429 20.3045 9.94429 19.7111C9.94429 19.1205 9.85143 18.617 9.66429 18.1994C9.49597 17.7996 9.2008 17.4642 8.82286 17.2431C8.44571 17.0238 7.96714 16.9141 7.38714 16.9141H5.30286ZM6.43286 17.8211H7.23714C7.59143 17.8211 7.88 17.8914 8.10714 18.0348C8.34291 18.1866 8.52079 18.4112 8.61286 18.6733C8.72571 18.9559 8.78143 19.3089 8.78143 19.7322C8.78586 20.0127 8.7532 20.2925 8.68429 20.5647C8.63339 20.7793 8.53807 20.9814 8.40429 21.1581C8.27999 21.3158 8.11531 21.4381 7.92714 21.5125C7.70666 21.5937 7.47249 21.6328 7.23714 21.6278H6.43286V17.8211ZM11.78 20.3003V22.5377H10.6514V16.9141H14.2914V17.8323H11.78V19.4031H14.0743V20.3003H11.78Z" fill="#ADAFBA"/>
                </svg>
                <span class="text-gray-3000 hover:text-main font-medium tablet:font-normal transition duration-200">
                  {l s='Download the assembly manual' d='Shop.Theme.Actions'}
                </span>
              </a>
             </div>

             <hr class="my-5 tablet:hidden">
 
           </div>

           </div>
           {if isset($tags) && isset($tags[$language.id]) && $tags[$language.id] != ''}
              <div class="flex tablet:hidden flex-row text-gray-3000 text-xs w-full">
                <ul class="flex flex-wrap float-left gap-2.5 tablet:gap-1">
                    <li>
                      <span class="text-gray-3000 text-xs transition font-medium">{l s='Tags' d='Shop.Theme.Catalog'}:</span>
                    </li>
                  {foreach from=$tags[$language.id] key=k item=value}
                    <li>
                      <a href="{$link->getPageLink('search', true, NULL, "tag={$value|urlencode}")}" class="hover:text-main text-gray-3000 text-xs transition">#{$value|escape:html:'UTF-8'}</a>
                    </li>
                  {/foreach}
                </ul>
              </div>
            {/if}
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
 
