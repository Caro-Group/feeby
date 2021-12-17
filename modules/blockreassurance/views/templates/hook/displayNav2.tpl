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


  <div class="flex justify-center tablet:justify-start desktop:justify-center font-light  text-xs tablet:text-base    -mx-8 tablet:-mx-0 text-main-dark">
      {foreach from=$elements item=$block key=$key name=blocks}
  {if $smarty.foreach.blocks.iteration < 3}
  
  <p class="{if $block@first}mb-0 mr-4 phone-wide:mr-0{/if} phone-wide:px-3 font-body">
                      {if $block.image}
                          <img class="h-6 tablet:h-10" src="{$block.image}">
                      {/if}
  {$block.title}
  </p>
  {/if}
      {/foreach}
  </div>
  
  {/if}
  