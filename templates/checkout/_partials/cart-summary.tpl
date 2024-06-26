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
<section id="js-checkout-summary" class="bg-gray-1000 tablet:rounded-md js-cart mb-8 js-cart" data-refresh-url="{$urls.pages.cart}?ajax=1&action=refresh">
  <div class="card-block flex flex-row px-[30px] py-[15px] pb-0">
    <h2 class="block font-body font-normal mb-2 tablet:mb-[10px] text-2xl text-main-dark">
      {l s='Your order' d='Shop.Theme.Checkout'}
    </h2>
  </div>

  <div class="card-block px-[30px] py-0 font-body">

    {block name='hook_checkout_summary_top'}
      {hook h='displayCheckoutSummaryTop'}
    {/block}

    {block name='cart_summary_subtotals'}
      {include file='checkout/_partials/cart-summary-subtotals.tpl' cart=$cart}
    {/block}

    {block name='cart_summary_totals'}
      {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
    {/block}
  </div>


  <p class="font-body font-medium mt-7 px-[30px] py-5 text-center text-main-dark text-sm tablet:text-base">
    {l s='Your order will be available in 2 work day' d='Shop.Theme.Checkout'}
  </p>
</section>

