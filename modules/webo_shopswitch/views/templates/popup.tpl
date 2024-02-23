{**
 * 2007-2020 PrestaShop SA and Contributors
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
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div id="shopswitch-popup"
    class="popup-hidden shadow-xl absolute z-50 right-0 top-full bg-white rounded-[5px] transition duration-300">
    <ul class="flex flex-col">
        {foreach from=$shops item=shop}
            {if $shop.id_shop != Context::getContext()->shop->id}
                {assign var=shop_currencies  value=Currency::getCurrenciesByIdShop($shop.id_shop)}
                <li class="border-0 border-b last:border-b-0 border-solid border-gray-2000">
                    <a href="{$protocol}{$shop.domain_ssl}{$shop.uri}" class="group flex items-center py-2 px-4">
                        {if isset($shop.lang.id_lang)}
                            <img class="shrink-0 mr-2 rounded-full border border-solid border-gray-2000 group-hover:border-main object-cover transition-all duration-200 overflow-hidden"
                                height="25" width="25" src="/img/l/{$shop.lang.id_lang}.jpg" alt="{$shop.lang.language_code}"
                                title="{$shop.lang.name}" />
                        {else}
                            <img class="shrink-0 mr-2 rounded-full border border-solid border-gray-2000 group-hover:border-main object-cover transition-all duration-200 overflow-hidden"
                                height="25" width="25" src="/img/l/none.jpg" alt="Flag no found">
                        {/if}
                        <span
                            class="text-base whitespace-nowrap font-normal text-main-dark group-hover:text-main uppercase transition duration-200">
                            {$shop.lang.iso_code} | {$shop_currencies[0]['iso_code']}
                        </span>
                    </a>
                </li>
            {/if}
        {/foreach}
    </ul>
</div>