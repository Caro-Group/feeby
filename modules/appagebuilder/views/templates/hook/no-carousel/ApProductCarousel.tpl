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
    <div class="block products_block cus-nocarousel">
        {($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}
        {if isset($formAtts.title)&&!empty($formAtts.title)}
        <h4 class="title_block">
            {$formAtts.title|rtrim|escape:'html':'UTF-8'}
        </h4>
        {/if}
        {if isset($formAtts.sub_title) && $formAtts.sub_title}
            <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
        {/if}
        <div class="block_content">	
			{if !empty($products)}
				{assign var=leo_include_file value=$leo_helper->getTplTemplate('ProductOwlCarousel.tpl', $formAtts['override_folder'])}
				{include file=$leo_include_file}
			{/if}
        </div>
        {($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
    </div>
{/if}