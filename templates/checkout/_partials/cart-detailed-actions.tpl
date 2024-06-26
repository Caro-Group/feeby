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
{block name='cart_detailed_actions'}
  <div class="checkout cart-detailed-actions mt-6">
    {if $cart.minimalPurchaseRequired}
      <div class="alert alert-warning" role="alert">
        {$cart.minimalPurchaseRequired}
      </div>
      <div class="text-center">
        <button type="button" class="bg-main-dark text-lg tablet:text-xl text-white hover:bg-main-hover w-full py-3 block uppercase rounded-full transition hover:text-white cursor-not-allowed" disabled>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</button>
      </div>
    {elseif empty($cart.products) }
      <div class="text-center">
        <button type="button" class="bg-main-dark text-lg tablet:text-xl text-white hover:bg-main-hover w-full py-3 block uppercase rounded-full transition hover:text-white cursor-not-allowed" disabled>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</button>
      </div>
    {else}
      <div class="text-center">
        <a href="{$urls.pages.order}" class="bg-main-dark text-lg tablet:text-xl text-white hover:bg-main-hover w-full py-3 block uppercase rounded-full transition hover:text-white">{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
        {hook h='displayExpressCheckout'}
      </div>
    {/if}
  </div>
{/block}
