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
{block name='cart_detailed_totals'}
<div>
  <span class="font-header italic text-2xl text-main-dark block py-[20px] tablet:py-[30px] mb-2 tablet:mb-[10px]">
    {l s='Summary' d='Shop.Theme.Checkout'}
  </span>
  <div>
    {foreach from=$cart.subtotals item="subtotal"}
      {if $subtotal && $subtotal.value|count_characters > 0 && $subtotal.type !== 'tax'}
        <div class="flex items-center justify-between pb-5 pt-5 tablet:pb-7 tablet:pt-3 border-0 border-b border-solid border-gray-2000 " id="cart-subtotal-{$subtotal.type}">
          <span class="flex label text-base tablet:text-xl text-main-dark font-normal text-left {if 'products' === $subtotal.type} js-subtotal{/if}">
            {if 'products' == $subtotal.type}
              {l s='Order value' d='Shop.Theme.Checkout'}
            {else if 'shipping' == $subtotal.type}
              {$subtotal.label}
              <div data-toggle="popover" data-title="" data-content="" data-html="true" data-trigger="hover">
                <i class="ml-1 bottom-[7px] material-icons relative tablet:bottom-1 tablet:text-[22px] text-lg text-main"></i>    
              </div>
            {else}
              {$subtotal.label}
            {/if}
          </span>
          <span class="ml-auto value text-xl text-main-dark font-normal">
            {if $subtotal.amount == 0}
              <span class="bg-main font-normal px-3 py-[3px] uppercase rounded-full tablet:text-base text-sm text-white">{l s='Free of charge' d='Shop.Theme.Checkout'}</span>
            {else}
              {if 'discount' == $subtotal.type}-&nbsp;{/if}{$subtotal.value}
            {/if}
          </span>
          {if $subtotal.type === 'shipping'}
              <div><small class="value">{hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}</small></div>
          {/if}
        </div>
      {/if}
    {/foreach}
  </div>

  {block name='cart_summary_totals'}
    {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
  {/block}
</div>
{/block}
