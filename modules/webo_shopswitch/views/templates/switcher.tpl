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


<div id="Webo">
    <div class="language-currency flex items-center ml-[50px] mr-5 desktop-presta:ml-[100px] group cursor-pointer">
        <img class="flex-grow-0 flex-shrink-0 mr-2.5 rounded-full border border-solid border-gray-2000 group-hover:border-main transition duration-200"
            src="/modules/webo_shopswitch/views/img/PL.png" height="30" width="30">
        <span
            class="text-sm uppercase text-main-dark group-hover:text-main transition duration-200">{$current_language.name_simple}</span>
        <span
            class="text-sm uppercase text-main-dark group-hover:text-main-dark before:content-['|'] before:text-lg before:leading-[16px]
before:text-main-dark before:mx-[7px] group-hover:text-main transition duration-200">{$current_currency.iso_code}</span>
    </div>
    {include file='module:webo_shopswitch/views/templates/popup.tpl'}
</div>