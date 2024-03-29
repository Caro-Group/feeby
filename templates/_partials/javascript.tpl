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
{if $javascript.external|@count == 1}
  {foreach $javascript.external as $js}
    <script defer type="text/javascript" src="{$js.uri}" {$js.attribute}></script>
  {/foreach}
{else}
  {foreach $javascript.external as $js}
    <script defer type="text/javascript" src="{$js.uri}" {$js.attribute}></script>
  {/foreach}
{/if}

{foreach $javascript.inline as $js}
  <script defer type="text/javascript" src="data:text/javascript,
    {$js.content|escape:'quotes'}
  "></script>
{/foreach}

{if isset($vars) && $vars|@count}
  <script type="text/javascript">
    {foreach from=$vars key=var_name item=var_value}
      var {$var_name} = {$var_value|json_encode nofilter};
    {/foreach}
  </script>
{/if}

<script type="text/javascript" src="data:text/javascript,
	var choosefile_text = '{l s='Choose file' d='Shop.Theme.Actions'}';
	var turnoff_popup_text = '{l s='Do not show this popup again' d='Shop.Theme.Actions'}';

	var size_item_quickview = 82;
	var style_scroll_quickview = 'vertical';

	var size_item_page = 113;
	var style_scroll_page = 'horizontal';

	var size_item_quickview_attr = 101;	
	var style_scroll_quickview_attr = 'vertical';

	var size_item_popup = 160;
	var style_scroll_popup = 'vertical';

  var menu_category = '{l s='Category' d='Shop.Theme.Global'}';
  var menu_category_see_all = '{l s='See all' d='Shop.Theme.Global'}';
"></script>