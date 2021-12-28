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
<div class="col-sm-12 col-xs-12 products-sort-order dropdown tablet:bg-gray-1000 px-0 py-3 rounded-md tablet:border-0 border-solid border-gray-1000 border-2 tablet:rounded-none tablet:rounded-r-md select-title text-base">
  <button
    class=" select-title w-full text-base bg-transparent p-0 pr-6 pl-[10px] tablet:pl-5 text-left font-light text-main-dark"
    rel="nofollow"
    data-toggle="dropdown"
    aria-haspopup="true"
    aria-expanded="false">
     <span class="sort-by text-main-dark font-normal hidden tablet:inline-block text-main-dark">{l s='Sort by:' d='Shop.Theme.Global'}</span>
     <span class="mr-2 tablet:hidden text-main-dark"><svg class="fill-current" width="18" height="12" viewBox="0 0 18 12" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M17.1429 0.857143C17.1429 1.08447 17.0526 1.30249 16.8918 1.46323C16.7311 1.62398 16.513 1.71429 16.2857 1.71429H0.857143C0.629814 1.71429 0.411797 1.62398 0.251051 1.46323C0.0903058 1.30249 0 1.08447 0 0.857143C0 0.629814 0.0903058 0.411797 0.251051 0.251051C0.411797 0.0903058 0.629814 0 0.857143 0H16.2857C16.513 0 16.7311 0.0903058 16.8918 0.251051C17.0526 0.411797 17.1429 0.629814 17.1429 0.857143ZM12.8571 5.14286H0.857143C0.629814 5.14286 0.411797 5.23316 0.251051 5.39391C0.0903058 5.55465 0 5.77267 0 6C0 6.22733 0.0903058 6.44535 0.251051 6.60609C0.411797 6.76684 0.629814 6.85714 0.857143 6.85714H12.8571C13.0845 6.85714 13.3025 6.76684 13.4632 6.60609C13.624 6.44535 13.7143 6.22733 13.7143 6C13.7143 5.77267 13.624 5.55465 13.4632 5.39391C13.3025 5.23316 13.0845 5.14286 12.8571 5.14286ZM8.57143 10.2857H0.857143C0.629814 10.2857 0.411797 10.376 0.251051 10.5368C0.0903058 10.6975 0 10.9155 0 11.1429C0 11.3702 0.0903058 11.5882 0.251051 11.7489C0.411797 11.9097 0.629814 12 0.857143 12H8.57143C8.79876 12 9.01677 11.9097 9.17752 11.7489C9.33827 11.5882 9.42857 11.3702 9.42857 11.1429C9.42857 10.9155 9.33827 10.6975 9.17752 10.5368C9.01677 10.376 8.79876 10.2857 8.57143 10.2857Z" ></path>
      </svg>
     </span> 
    {if $listing.sort_selected}{$listing.sort_selected}{else}{l s='Select' d='Shop.Theme.Actions'}{/if}
     <i class="material-icons add text-3xl text-main-dark"></i>
  </button>
  <div class="dropdown-menu">
    {foreach from=$listing.sort_orders item=sort_order}
      <a
        rel="nofollow"
        href="{$sort_order.url}"
        class="select-list {['current' => $sort_order.current, 'js-search-link' => true]|classnames}"
      >
        {$sort_order.label}
      </a>
    {/foreach}
  </div>
</div>
