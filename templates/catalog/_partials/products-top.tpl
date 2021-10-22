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
{if !isset($LISTING_GRID_MODE) || !isset($LISTING_PRODUCT_COLUMN) || !isset($LISTING_PRODUCT_COLUMN_MODULE) || !isset($LISTING_PRODUCT_TABLET) || !isset($LISTING_PRODUCT_SMALLDEVICE) || !isset($LISTING_PRODUCT_EXTRASMALLDEVICE) || !isset($LISTING_PRODUCT_MOBILE)}
    {block name="setting"}
      {include file="layouts/setting.tpl"}
    {/block}
{/if}

<div id="js-product-list-top" class="products-selection">
  <div style="flex: 1 1 auto;background: #000;display: flex;align-items: center;justify-content: center;color: #fff;border-radius: 20px;padding: 5px 35px 5px 15px;margin-bottom: 10px;" class="hidden-md-up" onclick="openMenuWithCategory({$smarty.get.id_category})">
    {l s='Categories' d='Shop.Theme.Global'}
  </div>

  <div style="display: flex;flex-wrap: wrap;">
    <div style="flex:0 0 auto;" class="hidden-md-up">
        {if !empty($listing.rendered_facets)}
          <div class="col-sm-4 col-xs-4 col-sp-12 filter-button">
            <button id="search_filter_toggler_collapse" class="btn btn-outline" data-toggle="collapse" href="#search_filters_wrapper" aria-expanded="false" aria-controls="search_filters_wrapper">
              {l s='Filter' d='Shop.Theme.Actions'}{if !empty($activeFilters)} ({$activeFilters|count}){/if}
            </button>
          </div>
        {/if}
    </div>

	
    {block name='product_list_active_filters'}
      <div style="flex:1 1 auto;" class="hidden-sm-down">
        {$listing.rendered_active_filters nofilter}
      </div>
    {/block}

    {literal}
      <script>
        function openMenuWithCategory(id)
        {
         var menu_el = $('.off-canvas-nav-megamenu').find('[data-category-id=' + id + ']').first();
         if(!menu_el.length){
           menu_el = $('[data-menu-type="category"].active').first();
            menu_el.children('.dropdown-toggle').click();
         }
         var menu_id = menu_el.parents('[data-megamenu-id]').data('megamenu-id');

         menu_el.parents('.dropdown').children('.dropdown-toggle').click();
         $('[data-target="\.megamenu-off-canvas-' + menu_id + '"]').first().click();
        } 
      </script>
    {/literal}

    <div style="flex: 1 1 auto;
    {if !empty($activeFilters)}background: #f9f9f9;{/if}
    display: flex;
    padding-right: 15px;
    padding-left: 15px;
    justify-content: flex-end;">
      <div class="row sort-by-row">
        {block name='sort_by'}
          {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
        {/block}
      </div>
    </div>

  </div>
</div>
