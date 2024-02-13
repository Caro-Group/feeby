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

{if $page.page_name != 'module-psgdpr-gdpr' && $page.page_name != 'my-account' && $page.page_name != 'order-follow' && $page.page_name != 'order-slip' && $page.page_name != 'module-leofeature-mywishlist' && $page.page_name != 'address' &&$page.page_name != 'addresses' && $page.page_name != 'cart' && $page.page_name != 'discount' && $page.page_name != 'history' && $page.page_name != 'identity' && $page.page_name != 'myaccount' && $page.page_name != 'order' && $page.page_name != 'orderconfirmation' && $page.page_name != 'orderdetail' && $page.page_name != 'orderfollow' && $page.page_name != 'orderreturn' && $page.page_name != 'orderslip' && $page.page_name != 'checkout' && $page.page_name != 'success' && $page.page_name != 'authentication'  && $page.page_name != 'mywishlist'  && $page.page_name != 'gdpr' }


<div class="max-w-screen-desktop-wide mx-auto px-2 tablet:px-8">
    <div class="flex flex-wrap">
    {foreach from=$blocks item=$block key=$key name=blocks}
        <div class="flex flex-col items-center w-1/2 tablet:w-1/4 px-8 mt-7 text-base font-light tablet:text-xl"
            {if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])} style="cursor:pointer;" onclick="window.open('{$block['link']}')"{/if}>
            <div class="h-12 w-12 tablet:h-16 tablet:w-16">
                {if $block['icon'] != 'undefined'}
                    {if $block['icon']}
                        <img src="{$block['icon']}" width="48" height="48" alt="{$block.title}">
                    {elseif $block['custom_icon']}
                        <img src="{$block['custom_icon']}" width="48" height="48" alt="{$block.title}">
                    {/if}
                {/if}
            </div>
            <div class="flex flex-col text-center text-main-dark">
                <div style="color:{$textColor}">{$block['title']}</div>
                <p style="color:{$textColor};">{$block['description'] nofilter}</p>
            </div>
        </div>
    {/foreach}
    </div>
</div>

{/if}