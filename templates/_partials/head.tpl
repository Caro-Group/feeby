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
{block name='head_charset'}
  <meta charset="utf-8">
{/block}
{block name='head_ie_compatibility'}
  <meta http-equiv="x-ua-compatible" content="ie=edge">
{/block}

{block name='head_seo'}
  <title>{block name='head_seo_title'}{$page.meta.title}{/block}</title>
  <meta name="description" content="{block name='head_seo_description'}{$page.meta.description}{/block}">
  <meta name="keywords" content="{block name='head_seo_keywords'}{$page.meta.keywords}{/block}">
  {if $page.meta.robots !== 'index'}
    <meta name="robots" content="{$page.meta.robots}">
  {/if}
  {if $page.canonical}
    <link rel="canonical" href="{$page.canonical}">
  {/if}
  {block name='head_hreflang'}
      {foreach from=$urls.alternative_langs item=pageUrl key=code}
            <link rel="alternate" href="{$pageUrl}" hreflang="{$code}">
      {/foreach}
  {/block}
{/block}

{block name='head_viewport'}
  <meta name="viewport" content="width=device-width, initial-scale=1">
{/block}

{block name='head_icons'}
  <link rel="icon" type="image/vnd.microsoft.icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
  <link rel="shortcut icon" type="image/x-icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
{/block}

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,400&display=swap" rel="stylesheet">

{block name="setting"}
  {include file="layouts/setting.tpl"}
{/block}
{block name='stylesheets'}
  {include file="_partials/stylesheets.tpl" stylesheets=$stylesheets}
{/block}

{* LEO - Load Css With Prestashop Standard *}
{if isset($LOAD_CSS_TYPE) && !$LOAD_CSS_TYPE}
   
    {if isset($LEO_CSS)}
        {foreach from=$LEO_CSS key=css_uri item=media}
          <link rel="stylesheet" href="{$css_uri}" type="text/css" media="{$media}" />
        {/foreach}
    {/if}
    
    {if isset($LEO_SKIN_CSS)}
        {foreach from=$LEO_SKIN_CSS item=linkCss}
            {$linkCss nofilter}
        {/foreach}
    {/if}
{/if}
{* LEO LAYOUT *}
{if isset($LAYOUT_WIDTH)}
    {$LAYOUT_WIDTH nofilter}
{/if}

{block name='javascript_head'}
  {include file="_partials/javascript.tpl" javascript=$javascript.head vars=$js_custom_vars}
{/block}

{block name='hook_header'}
  {$HOOK_HEADER nofilter}
{/block}

{block name='hook_extra'}{/block}

{* 
Classes used in builder: tablet-medium:mr-20 tablet-wide:mr-8 desktop:mr-0 tablet-medium:top-auto tablet-medium:w-3/5 tablet-medium:absolute tablet-medium:-bottom-12 py-1 tablet:py-0 tablet:h-[60px] desktop:w-1/2 desktop:pr-32 tablet:text-4xl text-2xl mt-14 tablet:mt-14 mt-16 tablet:mt-28 mt-20 tablet:mt-20  px-10px mb-12 tablet-medium:mb-12 desktop-presta:px-24 tablet-medium:px-7 pl-2 flex-1 max-w-screen-phablet 
*}