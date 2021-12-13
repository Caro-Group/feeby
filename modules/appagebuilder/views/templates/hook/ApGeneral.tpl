{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApGeneral -->

{* 
 phone-wide:px-4 phone wide:justify-center  phablet:mx-5 desktop:mx-16 mx-0 h-1/2 h-5 tablet:h-10 select-none font-light desktop:justify-center h-6 text-xs tablet:text-sm tablet:text-base phone-wide:mr-0 h-4 tablet:h-6
*}

{if $hookName == 'displayNav1'}
<div {if isset($formAtts.id) && $formAtts.id} id="{$formAtts.id|escape:'html':'UTF-8' nofilter}"{/if}
    {if isset($formAtts.class)} class="{$formAtts.class|escape:'html':'UTF-8'}"{/if}>
	{($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}
    {if isset($formAtts.title) && $formAtts.title}
    <h4 class="title_block">{$formAtts.title|escape:'html':'UTF-8' nofilter}</h4>
    {/if}
    {if isset($formAtts.sub_title) && $formAtts.sub_title}
        <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
    {/if}
    {if isset($formAtts.content_html)}
        {$formAtts.content_html nofilter}{* HTML form , no escape necessary *}
    {else}
        {$apContent nofilter}{* HTML form , no escape necessary *}
    {/if}
	{($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
</div>
{else}

<div {if isset($formAtts.id) && $formAtts.id} id="{$formAtts.id|escape:'html':'UTF-8' nofilter}"{/if}
    {if isset($formAtts.class)} class="block {$formAtts.class|escape:'html':'UTF-8'}"{/if}>
	{($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}
    {if isset($formAtts.title) && $formAtts.title}
    <h4 class="title_block">{$formAtts.title|escape:'html':'UTF-8' nofilter}</h4>
    {/if}
    {if isset($formAtts.sub_title) && $formAtts.sub_title}
        <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
    {/if}
    {if isset($formAtts.content_html)}
        {$formAtts.content_html nofilter}{* HTML form , no escape necessary *}
    {else}
        {$apContent nofilter}{* HTML form , no escape necessary *}
    {/if}
	{($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
</div>
{/if}