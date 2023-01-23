{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
<section id="js-active-search-filters" class="mt-5 mb-5 tablet:mb-0 tablet:pl-5 {if $activeFilters|count}active_filters{else}hide{/if}" style="display: flex;align-items: baseline;flex-wrap: wrap;">
  {block name='active_filters_title'}
    <p class="{if $activeFilters|count}active-filter-title{else}hidden-xs-up{/if} text-base font-body font-normal hidden tablet:block">{l s='Active filters' d='Shop.Theme.Global'} <span class="hidden-sm-down hidden-lg-up">({$activeFilters|count})</span></p>
  {/block}

  {if $activeFilters|count}
    <ul class="hidden tablet:flex flex-wrap">
      {foreach from=$activeFilters item="filter"}
        {block name='active_filters_item'}
          <li class="filter-block ml-4 text-sm mb-4 border-2 border-gray-2000 border-solid rounded-md py-1 pl-1 pr-2 ">
            <a class="js-search-link group text-main-dark font-normal" href="{$filter.nextEncodedFacetsURL}">
              <i class="material-icons float-left font-light mr-2 close text-lg relative mt-px flex justify-center items-center text-main-dark group-hover:text-main transition">&#xE5CD;</i>
              {l s='%1$s:' d='Shop.Theme.Catalog' sprintf=[$filter.facetLabel]}
              {$filter.label}
            </a>
          </li>
        {/block}
      {/foreach}
    </ul>
  {/if}

    {block name='facets_clearall_button'}
      {if $activeFilters|count}
        <div id="_desktop_search_filters_clear_all" class="clear-all-wrapper w-full tablet:w-auto relative">
          <button data-search-url="{$clear_all_link}" class="js-search-filters-clear-all block bg-gray-1000 hover:bg-gray-2000 transition border-2 border-gray-1000 border-solid cursor-pointer text-main-dark mx-auto tablet:ml-4 px-5 py-1.5 tablet:py-1 relative rounded-full text-base tablet:text-sm uppercase tablet:!normal-case">
            {l s='Clear all' d='Shop.Theme.Actions'}
          </button>
        </div>
      {/if}
    {/block}
</section>
