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

{assign var='externalFilters' value={hook h='filterproductspro'}}
<div id="js-product-list-top" class="pb-1 tablet:pb-3 pt-0 products-selection tablet:mb-[40px]">
  {if $page.page_name == 'category'}
    <div class="bg-main-dark mb-5 p-2 rounded-full tablet:hidden text-base text-center text-white"
      data-current-category-id="{$smarty.get.id_category}" onclick="openMenuWithCategory({$smarty.get.id_category})">
      {l s='Categories' d='Shop.Theme.Global'}
    </div>
  {/if}

  <div class=" flex flex-wrap justify-between desktop-presta:mr-[15px] ">
    <div style="flex:0 0 auto;" class="w-1/2 tablet:w-[232px] order-1 flex justify-center ">
      {if !empty($externalFilters) || (!empty($listing.rendered_facets))}

        <button id="search_filters_toggler"
        data-filters-tab-btn='0'
          class="flex items-center justify-between cursor-pointer border-2 border-solid border-gray-2000 px-5 tablet:px-10 text-left text-base tablet:text-lg uppercase text-normal bg-gray-1000 hover:border-gray-3000 rounded-md text-main-dark text-left w-full transition duration-200" >
          {l s='Filter' d='Shop.Theme.Actions'}
          <span class="top-[3px] float-right pl-4 relative ">
            <svg class="tablet:w-[25px] tablet:h-[25px]" width="18" height="18" viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M15.1507 0C15.5448 0 15.8642 0.319412 15.8642 0.71342V6.20261C15.8642 6.59661 15.5448 6.91602 15.1507 6.91602C14.7567 6.91602 14.4373 6.59661 14.4373 6.20261V4.13424H0.713464C0.319432 4.13424 0 3.81484 0 3.42082C0 3.02682 0.319432 2.7074 0.713464 2.7074H14.4373V0.71342C14.4373 0.319412 14.7567 0 15.1507 0ZM22.6568 3.41391C22.6607 3.8079 22.3443 4.13039 21.9504 4.13422L17.9434 4.17143C17.5495 4.17525 17.2269 3.85895 17.2231 3.46496C17.2193 3.07096 17.5356 2.74848 17.9296 2.74465L21.9365 2.70744C22.3306 2.70362 22.653 3.01992 22.6568 3.41391ZM9.4478 8.18574C9.84184 8.18574 10.1613 8.50515 10.1613 8.89916V11.6057V11.6073V14.3883C10.1613 14.7823 9.84184 15.1018 9.4478 15.1018C9.05377 15.1018 8.73433 14.7823 8.73433 14.3883V12.32H0.713464C0.319432 12.32 0 12.0006 0 11.6066C0 11.2126 0.319432 10.8932 0.713464 10.8932H8.73433V8.89916C8.73433 8.50515 9.05377 8.18574 9.4478 8.18574ZM11.548 11.6066C11.548 11.2126 11.8675 10.8932 12.2615 10.8932H21.9435C22.3375 10.8932 22.6569 11.2126 22.6569 11.6066C22.6569 12.0006 22.3375 12.32 21.9435 12.32H12.2615C11.8675 12.32 11.548 12.0006 11.548 11.6066ZM13.2279 16.084C13.622 16.084 13.9414 16.4034 13.9414 16.7974V22.2866C13.9414 22.6806 13.622 23 13.2279 23C12.8339 23 12.5145 22.6806 12.5145 22.2866V20.2182H1.05647C0.662433 20.2182 0.34301 19.8988 0.34301 19.5048C0.34301 19.1108 0.662433 18.7914 1.05647 18.7914H12.5145V16.7974C12.5145 16.4034 12.8339 16.084 13.2279 16.084ZM23 19.5004C23.0024 19.8944 22.6849 20.2158 22.2909 20.2182L16.0575 20.2556C15.6635 20.2581 15.3422 19.9406 15.3397 19.5466C15.3373 19.1526 15.6548 18.8313 16.0488 18.8288L22.2821 18.7914C22.6762 18.789 22.9975 19.1064 23 19.5004Z" fill="black"/>
            </svg>
          </span>
        </button>
      {/if}
    </div>

    <div
      class="flex justify-center tablet:justify-end order-2 tablet:order-3 rounded-md w-1/2  pl-[10px] tablet:pl-0 {if $externalFilters}  tablet:rounded-none tablet:rounded-r-md tablet:w-auto  {else} tablet:w-full {/if} ">
      <div class="w-full tablet:w-[232px]">
        <div class=" w-full select-title text-base">
          <button
            id="search_sort_toggler"
            data-filters-tab-btn='1'
            class="select-title w-full text-base tablet:text-lg uppercase bg-transparent px-5 tablet:px-10 py-2 tablet:py-2.5 text-left !flex justify-between items-center font-light text-main-dark border-gray-2000 hover:border-gray-3000 rounded-md border-solid !border-2 transition duration-200 cursor-pointer">
            <span class="sort-by text-main-dark font-normal text-main-dark">{l s='Sort by:' d='Shop.Theme.Global'}</span>
            <span class="shrink-0 ml-2 text-main-dark">
              <svg class="fill-current tablet:w-[25px] tablet:h-[25px] tablet:top-[3px] relative" width="18" height="12" viewBox="0 0 18 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M17.1429 0.857143C17.1429 1.08447 17.0526 1.30249 16.8918 1.46323C16.7311 1.62398 16.513 1.71429 16.2857 1.71429H0.857143C0.629814 1.71429 0.411797 1.62398 0.251051 1.46323C0.0903058 1.30249 0 1.08447 0 0.857143C0 0.629814 0.0903058 0.411797 0.251051 0.251051C0.411797 0.0903058 0.629814 0 0.857143 0H16.2857C16.513 0 16.7311 0.0903058 16.8918 0.251051C17.0526 0.411797 17.1429 0.629814 17.1429 0.857143ZM12.8571 5.14286H0.857143C0.629814 5.14286 0.411797 5.23316 0.251051 5.39391C0.0903058 5.55465 0 5.77267 0 6C0 6.22733 0.0903058 6.44535 0.251051 6.60609C0.411797 6.76684 0.629814 6.85714 0.857143 6.85714H12.8571C13.0845 6.85714 13.3025 6.76684 13.4632 6.60609C13.624 6.44535 13.7143 6.22733 13.7143 6C13.7143 5.77267 13.624 5.55465 13.4632 5.39391C13.3025 5.23316 13.0845 5.14286 12.8571 5.14286ZM8.57143 10.2857H0.857143C0.629814 10.2857 0.411797 10.376 0.251051 10.5368C0.0903058 10.6975 0 10.9155 0 11.1429C0 11.3702 0.0903058 11.5882 0.251051 11.7489C0.411797 11.9097 0.629814 12 0.857143 12H8.57143C8.79876 12 9.01677 11.9097 9.17752 11.7489C9.33827 11.5882 9.42857 11.3702 9.42857 11.1429C9.42857 10.9155 9.33827 10.6975 9.17752 10.5368C9.01677 10.376 8.79876 10.2857 8.57143 10.2857Z" ></path>
              </svg>
            </span> 
          </button>
        </div>
      </div>
    </div>

    <div id="search_filters_modal" class="modal_productList">
    <div id="search_filters_modal_inner" class="modal_productList-inner">
      <div
        class=" px-[30px] flex justify-between items-center border-0 border-b border-solid border-gray-2000">
        <div class="flex">
          {if !empty($externalFilters) || (isset($listing.rendered_facets) && $listing.rendered_facets)}
            <span class="py-2.5 font-header text-main-dark text-xl tablet:text-3xl cursor-pointer" data-filters-tab='0' >{l s='Filter' d='Shop.Theme.Actions'}</span>
          {/if}
          <span class="py-2.5 font-header text-main-dark text-xl tablet:text-3xl cursor-pointer" data-filters-tab='1' >{l s='Sort by:' d='Shop.Theme.Global'}</span>
        </div>
        <button class="group cursor-pointer appearance-none bg-transparent border-0 h-10 py-1.5"
          data-filters-modal-close>
          <svg class="fill-current text-main-dark group-hover:text-main transition duration-200" width="26"
            height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M0.755782 0.707112C1.14631 0.316585 1.77947 0.316587 2.17 0.707116L25.293 23.8304C25.6835 24.2209 25.6835 24.8541 25.293 25.2446L25.2447 25.2929C24.8542 25.6834 24.221 25.6834 23.8305 25.2929L0.707512 2.16959C0.316992 1.77907 0.316992 1.1459 0.707514 0.755379L0.755782 0.707112Z">
            </path>
            <path
              d="M0.707106 25.2442C0.316582 24.8537 0.316582 24.2205 0.707105 23.83L23.8303 0.706705C24.2208 0.31618 24.854 0.316179 25.2445 0.706704L25.2928 0.754972C25.6833 1.1455 25.6833 1.77866 25.2928 2.16919L2.16958 25.2925C1.77906 25.683 1.1459 25.683 0.755373 25.2925L0.707106 25.2442Z">
            </path>
          </svg>
        </button>
      </div>
      <div class="w-full h-full overflow-hidden sort-by-row">
        <div class="w-full flex h-full transition duration-[300ms]" data-filters-tabs>
          <div class="shrink-0 grow-0 basis-full px-[30px] overflow-y-auto scrollbar-custom" >
            {block name='product_list_active_filters'}
              {if !empty($externalFilters) || (isset($listing.rendered_facets) && $listing.rendered_facets)}
                {$externalFilters nofilter}
              {/if}
            {/block}
          </div>

          <div id="sort-list" class="shrink-0 grow-0 basis-full px-[30px] overflow-y-auto scrollbar-custom products-sort-order">
            {block name='sort_by'}
              {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
            {/block}
          </div>

        </div>
      </div>

      <div
        class="border-0 border-b border-gray-2000 border-solid flex items-center justify-between mt-auto px-[30px] py-2.5">
        <button id="search_filters_show_prod"
          class="text-center bg-main text-white px-5 w-full rounded-full  pb-2 hover:bg-main-hover transition duration-200 border-0 py-2 text-lg uppercase cursor-pointer"
          data-filters-modal-close>
          {l s='Show products' d='Shop.Theme.Actions'}
          <span data-filters-active-count></span>
        </button>
      </div>
    </div>
  </div>


  </div>
</div>