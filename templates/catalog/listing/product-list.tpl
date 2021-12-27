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
{extends file=$layout}

{block name='topBothColumn'}

 <img class="img-fluid" src="{$link->getMediaLink($smarty.const._THEME_CAT_DIR_)}{$smarty.get.id_category}.jpg" width="{$category.image.large.width}" height="{$category.image.large.height}" alt="{$category.image.legend}" style="margin-bottom: 30px;width: 100%;"/>

{if $breadcrumb.count < 3}
 <a style="display: block;margin-bottom: 20px;" class="hidden-xl-up" href="{$breadcrumb.links[0]['url']}" title="{$breadcrumb.links[0]['title']}">
  <i style="font-size: 25px;" class="material-icons">&#xE408;</i>
 </a>
{else}
 <a style="display: block;margin-bottom: 20px;" class="hidden-xl-up" href="{$breadcrumb.links[count($breadcrumb)-1]['url']}" title="{$breadcrumb.links[count($breadcrumb)-1]['title']}">
  <i style="font-size: 25px;" class="material-icons">&#xE408;</i>
 </a>
{/if}

 <h1 class="h1">{$page.meta.keywords}</h1>

{/block}

{block name='content'}
  <section id="main">

    {block name='product_list_header'}
      <h2 id="js-product-list-header" class="h2">{$listing.label}</h2>
    {/block}

    <ul id="additionallCategoriesFilter"></ul>

    <section id="products">
      {if $listing.products|count}

        <div class="row row-md-revert">

         <div class="col-xs-12 col-md-pull-12">
          {block name='product_list_top'}
            {include file='catalog/_partials/products-top.tpl' listing=$listing}
            {block name='product_list_active_filters'}{/block}
          {/block}
         </div>
        </div>

        <div>
          {block name='product_list'}
            {include file='catalog/_partials/products.tpl' listing=$listing}
          {/block}
        </div>

        <div id="js-product-list-bottom">
          {block name='product_list_bottom'}
            {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
          {/block}
        </div>

      {else}
        <div id="js-product-list-top"></div>

        <div id="js-product-list">
          {include file='errors/not-found.tpl'}
        </div>

        <div id="js-product-list-bottom"></div>
      {/if}
    </section>

    {hook h="displayFooterCategory"}

  </section>
{/block}
