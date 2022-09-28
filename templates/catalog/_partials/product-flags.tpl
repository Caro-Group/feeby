{**
 * PrestaShop and Contributors
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
 * @copyright PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<ul class="product-flags flex flex-wrap text-white mt-1 mr-12 z-20">
	{foreach from=$product.flags item=flag}
		<li class="leading-5 mr-1 px-2 mb-1 rounded-full text-center uppercase
				{if $flag.type == 'discount' }
					bg-main 
				{elseif $flag.type == 'new'}
					bg-main-dark
				{else}
					bg-gray-3000	
				{/if}">

			{if $flag.type == 'discount'}
			{l s='Discount' d='Shop.Theme.Global'} {else}
				{$flag.label}
			{/if}
		</li>
	{/foreach}
	{assign var="tags" value=Tag::getProductTags(Tools::getValue('id_product'))}
	{if isset($tags) && isset($tags[$language.id]) && $tags[$language.id] != ''}
		{foreach from=$tags[$language.id] key=k item=tag}
			{if $tag === 'bestseller'}
				<li class="leading-5 mr-1 px-2 mb-1 rounded-full text-center bg-gray-3000 uppercase">
					{l s='Bestseller' d='Shop.Theme.Global'}
				</li>
			{/if}
		{/foreach}
	{/if}
</ul>