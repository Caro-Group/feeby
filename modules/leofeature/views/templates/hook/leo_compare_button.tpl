{* 
* @Module Name: Leo Feature
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  Leotheme
* @description: Leo feature for prestashop 1.7: ajax cart, review, compare, wishlist at product list 
*}
<div class="compare">
	<a class="leo-compare-button btn-primary btn-product btn{if $added} added{/if}" href="javascript:void(0)" data-id-product="{$leo_compare_id_product}" title="{if $added}{l s='Remove from Compare' d='Modules.Leofeature.Shop'}{else}{l s='Add to Compare' d='Modules.Leofeature.Shop'}{/if}">
		<span class="leo-compare-bt-loading cssload-speeding-wheel"></span>
		<span class="leo-compare-bt-content">
			<i class="icon-btn-product icon-compare material-icons">&#xE915;</i>
			<span class="name-btn-product bg-main">{l s='Add to Compare' d='Modules.Leofeature.Shop'}</span>
		</span>
	</a>
</div>