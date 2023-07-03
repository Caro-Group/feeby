{**
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
{extends file='catalog/listing/product-list.tpl'}

{block name='displayTopBothColumn'}
  
  {if isset($category) && $category.image && $category.image.large.url}
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 desktop-presta:mb-[10px]">
      <div class="-mx-[20px] tablet:mx-0">
        <picture>
          <source srcset="{$category.image.large.url|replace:" ":"%20"|replace:".png":".webp"|replace:".jpg":".webp"}?timestamp={$category.date_upd|replace:'-':''|replace:' ':''|replace:':':''|escape:'html':'UTF-8'}" type="image/webp">
          <source srcset="{$category.image.large.url|replace:" ":"%20"}?timestamp={$category.date_upd|replace:'-':''|replace:' ':''|replace:':':''|escape:'html':'UTF-8'}" type="image/jpeg"> 
          <img class="w-full h-auto max-h-[400px] object-cover tablet:rounded-md" src="{$category.image.large.url|replace:" ":"%20"}?timestamp={$category.date_upd|replace:'-':''|replace:' ':''|replace:':':''}" alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}">
        </picture>
      </div>
    </div>
  {/if}

  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb-[10px] desktop-presta:mb-5">

  {include file='_partials/category_text.tpl'}

  {block name='breadcrumb_arrow'}
    {include file='_partials/breadcrumb_arrow.tpl'}
  {/block}

    <h1 class="title_block title_block text-2xl tablet:text-4xl mt-2 tablet:mt-10 font-light text-main-dark">
      {if $category.meta_keywords !== ''}
        {$category.meta_keywords}
      {elseif isset($categories) }
        {$categories.name}
      {else}
        {$page.title}
      {/if}
    </h1>
  </div>
{/block}

{block name='displayBottomContent'}
  <div class="container">
    {include file='catalog/_partials/category-header.tpl' listing=$listing category=$category}
    {if isset($LEO_SUBCATEGORY) && $LEO_SUBCATEGORY && isset($subcategories) && count($subcategories) > 0}
      <div id="subcategories">
        <div class="row">
          {foreach from=$subcategories item=subcategory}
            <div class="subcategory-block col-xl-4 col-lg-4 col-md-6 col-sm-6 col-xs-6 col-sp-12">
              <div class="subcategory-image">
                <a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="img" >
                  <img class="lazy img-fluid" data-src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image, 'category_default')}" alt="{$subcategory.name|escape:'html':'UTF-8'}"/>
                </a>
              </div>
              <div class="subcategory-meta">
                <h3><a class="subcategory-name" href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}">{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'}</a></h3> 
                <div class="subcategory-description">{$subcategory.description|strip_tags|truncate:120:'...'|escape:'html':'UTF-8' nofilter}</div>   
              </div>
            </div>
          {/foreach}
        </div>
      </div>
    {/if}
  </div>
{/block}


{block name='product_list_header'}{/block}
