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
<div class="cart-detailed-totals">
  <h2 class="card-block text-xl font-bold">
    {l s='Summary' d='Shop.Theme.Checkout'}
  </h2>
  <div class="card-block">
    {foreach from=$cart.subtotals item="subtotal"}
      {if $subtotal && $subtotal.value|count_characters > 0 && $subtotal.type !== 'tax'}
        <div class="cart-summary-line flex items-center justify-between" id="cart-subtotal-{$subtotal.type}">
          <span class="flex label{if 'products' === $subtotal.type} js-subtotal{/if}">
            {if 'products' == $subtotal.type}
              {$cart.summary_string}
            {else if 'shipping' == $subtotal.type}
              {$subtotal.label}
              <svg class="ml-1" data-toggle="popover" data-selector="#cart-subtotal-send-popover" data-trigger="hover" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none">
                <path d="M10 0a10 10 0 1 0 0 20 10 10 0 0 0 0-20Zm0 18a8 8 0 1 1 0-16 8 8 0 0 1 0 16Z" fill="#C4C4C4"/>
                <path d="M10 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2ZM10 8a1 1 0 0 0-1 1v5a1 1 0 1 0 2 0V9a1 1 0 0 0-1-1Z" fill="#C4C4C4"/>
              </svg>
            {else}
              {$subtotal.label}
            {/if}
          </span>
          <span class="ml-auto value">
            {if $subtotal.amount == 0}
              <span class="bg-gray-600 p-1 rounded text-white text-xl font-sans">{l s='Free of charge' d='Shop.Theme.Checkout'}</span>
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

<div id="cart-subtotal-send-popover">
  TEST
</div>
{/block}
