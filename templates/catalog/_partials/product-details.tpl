{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<div class="tab-pane fade{if !$product.description} in active{/if}"
     id="product-details"
     data-product="{$product.embedded_attributes|json_encode}"
     role="tabpanel"
  >
  {block name='product_features'}
    {if $product.grouped_features}
      <section class="product-features">
        <p class="w-full text-main-dark font-light text-sm tablet:text-base font-body">{l s='Data sheet' d='Shop.Theme.Catalog'}</p>
        <dl class="block data-sheet">
          {foreach from=$product.grouped_features item=feature}
            <dt class="name mb-[2px] p-5 bg-gray-1000 w-auto tablet:w-[250px] text-main-dark font-medium text-sm tablet:text-base float-left">{$feature.name}</dt>
            <dd class="value mb-[2px] p-5 bg-gray-1000 w-full text-main-dark font-light text-sm tablet:text-base">
              {if $feature.id_feature === '3' && $category->id_parent === '582'}
                <a href="{$link->getCategoryLink($category->id_category, $category->link_rewrite)|escape:'html':'UTF-8'}">
                  {$feature.value|escape:'htmlall'|nl2br nofilter} - {$category->name} ({l s='See more of this artist\'s works' d='Shop.Theme.Catalog'})
                </a>
              {else}
                {$feature.value|escape:'htmlall'|nl2br nofilter}
              {/if}
            </dd>
          {/foreach}
        </dl>
      </section>
    {/if}
  {/block}
</div>