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
<div class="hidden fixed inset-0 max-h-screen flex justify-center items-center p-5 bg-[#282828]/50">
    <div class="flex flec-col items-center w-full max-w-[468px] bg-white rounded-[5px] p-7">
        <h3 class="font-header italic font-light mt-5 mb-8">
            {l s='Language' d='Shop.Theme.Global'}
        </h3>



        <div class="language-selector">
            <span>{$current_language.name_simple}</span>
            <ul>
                {foreach from=$languages item=language}
                    <li {if $language.id_lang == $current_language.id_lang} class="current" {/if}>
                        <a href="{$link->getLanguageLink($language.id_lang)}">{$language.name_simple}</a>
                    </li>
                {/foreach}
            </ul>
        </div>

        <h3 class="font-header italic font-light mt-10 mb-8">
            {l s='Currency' d='Shop.Theme.Global'}
        </h3>


        <div class="currency-selector">
            <span>{$current_currency.iso_code} {$current_currency.sign}</span>
            <ul>
                {foreach from=$currencies item=currency}
                    <li {if $currency.current} class="current" {/if}>
                        <a rel="nofollow" href="{$currency.url}">{$currency.iso_code} {$currency.sign}</a>
                    </li>
                {/foreach}
            </ul>
        </div>
    </div>
</div>