{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApProductCarousel -->
{if isset($formAtts.lib_has_error) && $formAtts.lib_has_error}
    {if isset($formAtts.lib_error) && $formAtts.lib_error}
        <div class="alert alert-warning leo-lib-error">{$formAtts.lib_error}</div>
    {/if}
{else}
    {($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}

    {if isset($products) && !empty($products)}
        {if isset($formAtts.title)&&!empty($formAtts.title)}
            {include file='_partials/slider.tpl' type='products-exclusive' products=$products title={$formAtts.title|rtrim|escape:'html':'UTF-8'}}
        {else}
            {include file='_partials/slider.tpl' type='products-exclusive' products=$products title=""}
        {/if}
    {else}
        <p class="alert alert-info">{l s='No products at this time.' mod='appagebuilder'}</p>	
    {/if}

    {($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
{/if}