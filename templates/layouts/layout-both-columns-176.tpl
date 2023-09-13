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
<!doctype html>
<html lang="{$language.iso_code}" {if isset($IS_RTL) && $IS_RTL} dir="rtl"{if isset($LEO_RTL) && $LEO_RTL} class="rtl{if isset($LEO_DEFAULT_SKIN)} {$LEO_DEFAULT_SKIN}{/if}"{/if}
{else} class="{if isset($LEO_DEFAULT_SKIN)}{$LEO_DEFAULT_SKIN}{/if}" {/if}>

  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}{if isset($LEO_LAYOUT_MODE)} {$LEO_LAYOUT_MODE}{/if}{if isset($USE_FHEADER) && $USE_FHEADER} keep-header{/if}">

    {block name='hook_after_body_opening_tag'}
      {hook h='displayAfterBodyOpeningTag'}
    {/block}

    <div id="page">

      {block name='product_activation'}
        {include file='catalog/_partials/product-activation.tpl'}
      {/block}

      <header id="header" class="relative">
        {block name='header'}
          {include file='_partials/header.tpl'}
        {/block}
      </header>

      {block name='notifications'}
        {include file='_partials/notifications.tpl'}
      {/block}

      <main id="wrapper">
        {hook h="displayWrapperTop"}

        {if isset($fullwidth_hook.displayHome) AND $fullwidth_hook.displayHome == 0}
          <div class="container">
        {/if}

          {block name='breadcrumb'}
            {include file='_partials/breadcrumb.tpl'}
          {/block}

            {block name="displayTopBothColumn"}{/block}

            <div class="row">
              {block name="left_column"}
                <div id="left-column" class="sidebar col-xs-12 col-sm-12 col-md-4 col-lg-3">
                  {if $page.page_name == 'product'}
                    {hook h='displayLeftColumnProduct'}
                  {else}
                    {hook h="displayLeftColumn"}
                  {/if}
                </div>
              {/block}

              {block name="content_wrapper"}
                <div id="content-wrapper" class="left-column right-column col-sm-4 col-md-6">
                  {block name="displayContentWrapperTop"}{/block}

                  {block name="content"}{/block}

                  {block name="displayContentWrapperBottom"}{/block}
                </div>
              {/block}

              {block name="right_column"}
                <div id="right-column" class="sidebar col-xs-12 col-sm-12 col-md-4 col-lg-3">
                  {if $page.page_name == 'product'}
                    {hook h='displayRightColumnProduct'}
                  {else}
                    {hook h="displayRightColumn"}
                  {/if}
                </div>
              {/block}
            </div>

        {if isset($fullwidth_hook.displayHome) AND $fullwidth_hook.displayHome == 0}
          </div>
        {/if}

        {block name="displayBottomBothColumn"}{/block}
      </main>

      <footer id="footer" class="footer-container">
        {block name="footer"}
          {include file="_partials/footer.tpl"}
        {/block}
      </footer>

      {if isset($LEO_PANELTOOL) && $LEO_PANELTOOL}
          {include file="$tpl_dir./modules/appagebuilder/views/templates/front/info/paneltool.tpl"}
      {/if}
      {if isset($LEO_BACKTOP) && $LEO_BACKTOP}
          <div id="back-top"><a href="#" class="fa fa-angle-double-up"></a></div>
      {/if}

    </div>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {literal}
      <script type="text/javascript">!function(e){"function"==typeof define&&define.amd?define(e):e()}(function(){var e,t=["scroll","wheel","touchstart","touchmove","touchenter","touchend","touchleave","mouseout","mouseleave","mouseup","mousedown","mousemove","mouseenter","mousewheel","mouseover"];if(function(){var e=!1;try{var t=Object.defineProperty({},"passive",{get:function(){e=!0}});window.addEventListener("test",null,t),window.removeEventListener("test",null,t)}catch(e){}return e}()){var n=EventTarget.prototype.addEventListener;e=n,EventTarget.prototype.addEventListener=function(n,o,r){var i,s="object"==typeof r&&null!==r,u=s?r.capture:r;(r=s?function(e){var t=Object.getOwnPropertyDescriptor(e,"passive");return t&&!0!==t.writable&&void 0===t.set?Object.assign({},e):e}(r):{}).passive=void 0!==(i=r.passive)?i:-1!==t.indexOf(n)&&!0,r.capture=void 0!==u&&u,e.call(this,n,o,r)},EventTarget.prototype.addEventListener._original=e}});</script>
    {/literal}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}

  </body>
</html>
