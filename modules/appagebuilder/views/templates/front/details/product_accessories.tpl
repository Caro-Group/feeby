{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}

{block name='product_accessories'}
  {if $accessories}
    {include file='_partials/slider.tpl' type='product-accessories' products=$products title={l s='You might also like' d='Shop.Theme.Catalog'}}
  {/if}
{/block}