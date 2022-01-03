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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2019 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{foreach from=$languages item=language}
{if $languages|count > 1}
<div class="translatable-field row lang-{$language.id_lang|escape:'quotes':'UTF-8'}">
	<div class="col-lg-9">
{/if}
		<input type="text" id="{$input_name|escape:'quotes':'UTF-8'}_{$language.id_lang|escape:'quotes':'UTF-8'}" name="{$input_name|escape:'quotes':'UTF-8'}_{$language.id_lang|escape:'quotes':'UTF-8'}" class="{if isset($class)}{$class|escape:'quotes':'UTF-8'}{/if}" value="{if isset($input_value[$language.id_lang])}{$input_value[$language.id_lang]|htmlentitiesUTF8}{/if}">
    <span class="counter" data-max="{if isset($max)}{$max|escape:'quotes':'UTF-8'}{else}none{/if}"></span>
{if $languages|count > 1}
	</div>
	<div class="col-lg-2">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			{$language.iso_code|escape:'quotes':'UTF-8'}
			<span class="caret"></span>
		</button>
		<ul class="dropdown-menu">
			{foreach from=$languages item=language name=language}
            <li><a href="javascript:hideOtherLanguage({$language.id_lang|escape:'quotes':'UTF-8'});">{$language.iso_code|escape:'quotes':'UTF-8'}</a></li>
			{/foreach}
		</ul>
	</div>
</div>
{/if}
{/foreach}