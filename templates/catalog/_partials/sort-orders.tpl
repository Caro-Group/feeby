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
<div class="products-sort-order w-full select-title text-base">
  <button
    id="search_sort_toggler"
    class="select-title w-full text-base tablet:text-lg uppercase bg-transparent px-5 tablet:px-10 py-2 tablet:py-2.5 text-left !flex justify-between items-center font-light text-main-dark border-gray-2000 hover:border-gray-3000 rounded-md border-solid !border-2 transition duration-200">
     <span class="sort-by text-main-dark font-normal text-main-dark">{l s='Sort by:' d='Shop.Theme.Global'}</span>
     <span class="shrink-0 ml-2 text-main-dark">
      <svg class="fill-current tablet:w-[25px] tablet:h-[25px] tablet:top-[3px] relative" width="18" height="12" viewBox="0 0 18 12" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M17.1429 0.857143C17.1429 1.08447 17.0526 1.30249 16.8918 1.46323C16.7311 1.62398 16.513 1.71429 16.2857 1.71429H0.857143C0.629814 1.71429 0.411797 1.62398 0.251051 1.46323C0.0903058 1.30249 0 1.08447 0 0.857143C0 0.629814 0.0903058 0.411797 0.251051 0.251051C0.411797 0.0903058 0.629814 0 0.857143 0H16.2857C16.513 0 16.7311 0.0903058 16.8918 0.251051C17.0526 0.411797 17.1429 0.629814 17.1429 0.857143ZM12.8571 5.14286H0.857143C0.629814 5.14286 0.411797 5.23316 0.251051 5.39391C0.0903058 5.55465 0 5.77267 0 6C0 6.22733 0.0903058 6.44535 0.251051 6.60609C0.411797 6.76684 0.629814 6.85714 0.857143 6.85714H12.8571C13.0845 6.85714 13.3025 6.76684 13.4632 6.60609C13.624 6.44535 13.7143 6.22733 13.7143 6C13.7143 5.77267 13.624 5.55465 13.4632 5.39391C13.3025 5.23316 13.0845 5.14286 12.8571 5.14286ZM8.57143 10.2857H0.857143C0.629814 10.2857 0.411797 10.376 0.251051 10.5368C0.0903058 10.6975 0 10.9155 0 11.1429C0 11.3702 0.0903058 11.5882 0.251051 11.7489C0.411797 11.9097 0.629814 12 0.857143 12H8.57143C8.79876 12 9.01677 11.9097 9.17752 11.7489C9.33827 11.5882 9.42857 11.3702 9.42857 11.1429C9.42857 10.9155 9.33827 10.6975 9.17752 10.5368C9.01677 10.376 8.79876 10.2857 8.57143 10.2857Z" ></path>
      </svg>
     </span> 
  </button>

  <div id="search_sort_modal" class="modal_productList">
    <div id="search_sort_modal_inner" class="modal_productList-inner">
      <div class=" py-2.5 px-[30px] flex justify-between items-center border-0 border-b border-solid border-gray-2000">
        <span class="font-header italic text-main-dark text-2xl tablet:text-4xl">{l s='Sort by:' d='Shop.Theme.Global'}</span>
          <button class="group cursor-pointer appearance-none bg-transparent border-0 h-10 py-1.5" data-sort-modal-close> 
            <svg class="fill-current text-main-dark group-hover:text-main transition duration-200" width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M0.755782 0.707112C1.14631 0.316585 1.77947 0.316587 2.17 0.707116L25.293 23.8304C25.6835 24.2209 25.6835 24.8541 25.293 25.2446L25.2447 25.2929C24.8542 25.6834 24.221 25.6834 23.8305 25.2929L0.707512 2.16959C0.316992 1.77907 0.316992 1.1459 0.707514 0.755379L0.755782 0.707112Z" ></path>
              <path d="M0.707106 25.2442C0.316582 24.8537 0.316582 24.2205 0.707105 23.83L23.8303 0.706705C24.2208 0.31618 24.854 0.316179 25.2445 0.706704L25.2928 0.754972C25.6833 1.1455 25.6833 1.77866 25.2928 2.16919L2.16958 25.2925C1.77906 25.683 1.1459 25.683 0.755373 25.2925L0.707106 25.2442Z" ></path>
            </svg>
          </button>            
        </div>
      <div id="sort-list" class="px-[30px] overflow-y-auto scrollbar-custom">
        {foreach from=$listing.sort_orders item=sort_order}
          <a
            rel="nofollow"
            href="{$sort_order.url}"
            class="group !bg-white border-0 border-b border-solid border-gray-2000 font-normal py-3 text-main-dark select-list js-search-link {['current' => $sort_order.current, 'js-search-link' => true]|classnames}"
          >
          <span class="inline-block mr-3 top-1 w-5 h-5 rounded border-2 border-solid border-gray-3000 group-hover:border-main transition duration-200 relative  before:absolute before:content-[''] before:rounded-sm before:w-2.5 before:h-2.5 before:left-[3.75px] before:top-[3.5px] "></span>
            {$sort_order.label}
          </a>
        {/foreach}
      </div>
      <div class="border-0 border-b border-gray-2000 border-solid flex items-center justify-between mt-auto px-[30px] py-2.5">
        <button id="search_show_show_prod" class="text-center bg-main text-white px-5 w-full rounded-full  pb-2 hover:bg-main-hover transition duration-200 text-lg uppercase"
        data-sort-modal-close >
        {l s='Show products' d='Shop.Theme.Actions'}
          <span data-filters-active-count></span>
        </button>
      <div>

    </div>
  </div>

</div>
