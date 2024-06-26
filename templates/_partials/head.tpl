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
{hook h="displayAfterTitleTag"}
  <meta name="description" content="{block name='head_seo_description'}{$page.meta.description}{/block}">
  <meta name="keywords" content="{block name='head_seo_keywords'}{$page.meta.keywords}{/block}">
    <meta name="google-site-verification" content="Ay0z4lz4rniVz3tIQ-ELp-6ygY-dbxr3h8XgQMvc4u4" />
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
  <link rel="apple-touch-icon" href="/themes/feeby/assets/symbol/icon-512x512.png?{$shop.favicon_update_time}">
{/block}


<meta name="theme-color" content="#DF1A5B">
<link rel="manifest" href="/themes/feeby/manifest.webmanifest">
<!-- no-JS fallback -->

<script type="text/javascript">
  if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
      navigator.serviceWorker.register("/themes/feeby/assets/js/sw.js?rev=4", { scope: '/' });
    });
  }
</script>

{block name="setting"}
  {include file="layouts/setting.tpl"}
{/block}
{block name='stylesheets'}
  {include file="_partials/stylesheets.tpl" stylesheets=$stylesheets}
{/block}

{*

Classes used in builder:

tablet-medium:mr-20 tablet-wide:mr-8 desktop:mr-0 tablet-medium:top-auto tablet-medium:w-3/5 tablet-medium:absolute
tablet-medium:-bottom-12 tablet:mx-4 desktop-presta:mx-0 tablet-medium:border-b-0 tablet-medium:border-t
tablet-medium:pb-0
tablet-wide:mt-4
tablet-wide:hidden
tablet-medium:hidden
static
tablet-medium:flex
*}

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
Classes used in builder:
 tablet-medium:mr-20 tablet-wide:mr-8 desktop:mr-0 tablet-medium:top-auto tablet-medium:w-3/5 tablet-medium:absolute tablet-medium:-bottom-12 py-1 tablet:py-0 tablet:h-[60px] desktop:w-1/2 desktop:pr-32 desktop:pr-20 tablet:text-4xl text-2xl mt-14 tablet:mt-14 mt-16 tablet:mt-28 mt-20 tablet:mt-20  px-10px mb-12
 tablet-medium:mb-12 desktop-presta:px-24 tablet-medium:px-7 pl-2 flex-1 tablet-medium:max-w-screen-phablet tablet:-mx-4 p-8 tablet-wide:p-20 tablet-wide:pb-16 px-24 tablet-medium:bg-transparent w-16 tablet-medium:w-full tablet-medium:px-10 tablet-medium:px-8
 pl-0
*}