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
        <h3 class="text-2xl font-header italic font-light mt-5 mb-8">
            {l s='Language' d='Shop.Theme.Global'}
        </h3>



        <div class="language-selector">
            <ul class="flex flex-wrap justify-center">
                {foreach from=$languages item=language}
                    <li class="flex flex-col items-center basis-1/3">
                        <input class="group appearance-none" type="radio" id="languageChoice" name="language"
                            value="{$link->getLanguageLink($language.id_lang)}"
                            {if $language.id_lang == $current_language.id_lang} checked {/if}>
                        <label for="languageChoice" class="flex flec-col items-center mb-2.5">
                            <img class="flex-grow-0 flex-shrink-0 mr-2.5 rounded-full border border-solid border-gray-2000 group-checked:border-main transition duration-200"
                                src="/modules/webo_shopswitch/views/img/PL.png" height="50" width="50">
                            <span class="text-base font-normal text-main-dark">{$language.name_simple}</span>
                        </label>
                    </li>
                {/foreach}
            </ul>
        </div>

        <h3 class="text-2xl font-header italic font-light mt-10 mb-8">
            {l s='Currency' d='Shop.Theme.Global'}
        </h3>


        <div class="currency-selector">
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