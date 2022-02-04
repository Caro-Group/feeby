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
  {if isset($category) && $category.image.large.url}
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb-[10px] desktop-presta:mb-[60px]">
        <img class="w-full h-auto max-h-[400px] object-cover" src="{$category.image.large.url}" alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}">
    </div>
  {/if}

  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mb-[10px] desktop-presta:mb-[60px]">
  {if $breadcrumb.count < 3}
    <a class="tablet:hidden block mt-6 mb-5" href="{$breadcrumb.links[0]['url']}" title="{$breadcrumb.links[0]['title']}">
      <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" class="mr-2 fill-current"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" ></path></svg>
    </a>
   {else}
    <a class="tablet:hidden block mt-6 mb-5" href="{$breadcrumb.links[count($breadcrumb)-1]['url']}" title="{$breadcrumb.links[count($breadcrumb)-1]['title']}">
      <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" class="mr-2 fill-current"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" ></path></svg>
    </a>
   {/if}  
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
