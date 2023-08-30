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
