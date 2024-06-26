{**
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

{if Context::getContext()->language->iso_code == 'pl' }
        {assign "logos" ["/themes/feeby/assets/img/blik.svg", "/themes/feeby/assets/img/Alior.svg", "/themes/feeby/assets/img/Autopay.svg", "/themes/feeby/assets/img/Visa.svg"]}
    {else}
        {assign "logos" ["/themes/feeby/assets/img/PayPal.svg", "/themes/feeby/assets/img/Klarna.svg", "/themes/feeby/assets/img/Mastercard.svg", "/themes/feeby/assets/img/Visa.svg"]}
{/if}

<ul class="flex justify-between gap-4 px-5 pb-2">
    {foreach from=$logos item=link}
        <li class="grow max-h-[40px]">
            <img class="w-full h-full" src="{$link}">
        </li>
    {/foreach}
</ul>