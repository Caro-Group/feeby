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

 {assign var='displayBanner' value={hook h='displayBanner'}|regex_replace:"/(\s)|\/\*[\s\S]*?\*\/|([^\\:]|^)\/\/.*|<!--[\s\S]*?-->$/m":""}
 {assign var='displayNav1' value={hook h='displayNav1'}|regex_replace:"/(\s)|\/\*[\s\S]*?\*\/|([^\\:]|^)\/\/.*|<!--[\s\S]*?-->$/m":""}
 {assign var='displayNav2' value={hook h='displayNav2'}|regex_replace:"/(\s)|\/\*[\s\S]*?\*\/|([^\\:]|^)\/\/.*|<!--[\s\S]*?-->$/m":""}
 {assign var='displayTop' value={hook h='displayTop'}|regex_replace:"/(\s)|\/\*[\s\S]*?\*\/|([^\\:]|^)\/\/.*|<!--[\s\S]*?-->$/m":""}
 
 {if $displayBanner}
   {block name='header_banner'}
     {if isset($fullwidth_hook.displayBanner) AND $fullwidth_hook.displayBanner == 0}
       <div class="container">
     {/if}
         {hook h='displayBanner'}
     {if isset($fullwidth_hook.displayBanner) AND $fullwidth_hook.displayBanner == 0}
       </div>
     {/if}
   {/block}
 {/if}
 
 {if $displayNav1 && $displayNav2}
   {block name='header_nav'}
     {if isset($fullwidth_hook.displayNav1) AND $fullwidth_hook.displayNav1 == 0}
       <div class="container">
     {/if}
         {hook h='displayNav1'}
     {if isset($fullwidth_hook.displayNav1) AND $fullwidth_hook.displayNav1 == 0}
       </div>
     {/if}
     {if isset($fullwidth_hook.displayNav2) AND $fullwidth_hook.displayNav2 == 0}
       <div class="container">
     {/if}
         {hook h='displayNav2'}
     {if isset($fullwidth_hook.displayNav2) AND $fullwidth_hook.displayNav2 == 0}
       </div>
     {/if}
   {/block}
 {/if}
 
 {if $displayTop}
   {block name='header_top'}
     {if isset($fullwidth_hook.displayTop) AND $fullwidth_hook.displayTop == 0}
       <div class="container">
     {/if}
         {hook h='displayTop'}
     {if isset($fullwidth_hook.displayTop) AND $fullwidth_hook.displayTop == 0}
       </div>
     {/if}
     {hook h='displayNavFullWidth'}
   {/block}
 {/if}
 