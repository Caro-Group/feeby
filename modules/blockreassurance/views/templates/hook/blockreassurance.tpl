{*
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2019 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{* tablet:mt-12 tablet:mb-8 *}

{if $elements}
<div class="max-w-screen-desktop-wide mx-auto px-2 tablet:px-8">
    <div class="flex flex-wrap">
    {foreach from=$elements item=$block key=$key name=blocks}
        <div class="flex flex-col items-center w-1/2 tablet:w-1/4 px-8 mt-7 text-base ">
            <div class="h-12 w-12 tablet:h-16 tablet:w-16">
                    {if $block.image}
                        <img src="{$block.image}">
                    {/if}
            </div>
            <div class="flex flex-col text-center text-main-dark font-main text-base tablet:text-xl">
                <div >{$block.title}</div>
                <p >{$block.description nofilter}</p>
            </div>
        </div>
    {/foreach}
    </div>
</div>
{/if}
