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
        <p class="h6">{l s='Data sheet' d='Shop.Theme.Catalog'}</p>
        <dl class="data-sheet">
          {foreach from=$product.grouped_features item=feature}
            <dt class="name">{$feature.name}</dt>
            <dd class="value">
              {if $feature.id_feature === '3' && $category->id_parent === '582'}
                <a href="{$link->getCategoryLink($category->id_category, $category->link_rewrite)|escape:'html':'UTF-8'}">
                  {$feature.value|escape:'htmlall'|nl2br nofilter}
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