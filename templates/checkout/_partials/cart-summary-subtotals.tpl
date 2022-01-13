{**
 * PrestaShop and Contributors
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
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<div>

  {foreach from=$cart.subtotals item="subtotal"}
    {if $subtotal && $subtotal.value|count_characters > 0 && $subtotal.type !== 'tax' && $subtotal.type !== 'discount'}
    <div class="flex w-full flex-wrap items-center justify-between {if $cart.subtotals.discounts && $subtotal.type === 'products' } pb-1 {else} pb-5 tablet:pb-7 {/if} pt-5 tablet:pt-3 border-0 border-b border-solid border-gray-2000 " id="cart-subtotal-{$subtotal.type}">
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
        {if $subtotal.type === 'products' && $cart.subtotals.discounts }
          <div class="flex justify-between items-center w-full mt-1">
            <span class="text-main-dark text-sm tablet:text-base font-light">{$cart.subtotals.discounts.label}</span>
            <span class="text-main text-lg font-light">-&nbsp;{$cart.subtotals.discounts.value}</span>
          </div>
        {/if}
      </div>
    {/if}
  {/foreach}

</div>

