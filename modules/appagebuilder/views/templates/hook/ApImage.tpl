{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApImage -->

{* desktop-presta:h-96 desktop-wide:h-100  *}
{if $page.page_name = 'index'}


<div id="image-{$formAtts.form_id|escape:'html':'UTF-8'}" class="block flex flex-col {(isset($formAtts.class)) ? $formAtts.class : ''|escape:'html':'UTF-8'}">
	{($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}

    {if isset($formAtts.title) && $formAtts.title}
        <h4 class="title_block">{$formAtts.title nofilter}{* HTML form , no escape necessary *}</h4>
    {/if}
    {if isset($formAtts.sub_title) && $formAtts.sub_title}
        <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
    {/if}
    
    {if (isset($formAtts.image) && $formAtts.image) || (isset($formAtts.image_link) && $formAtts.image_link)}
    
        {if isset($formAtts.url) && $formAtts.url}
        <a href="{$formAtts.url}{*full url can not escape*}" class="flex flex-col h-full group" {(isset($formAtts.is_open) && $formAtts.is_open) ? 'target="_blank"' : ''|escape:'html':'UTF-8'}>
        {/if}
        <div class="overflow-hidden rounded-md h-full">
        <img class="object-cover {if $aplazyload}lazy{/if}" {if $aplazyload}data-src{else}src{/if}="{if isset($formAtts.image) && $formAtts.image}{$path|escape:'html':'UTF-8'}{$formAtts.image|escape:'html':'UTF-8'}{else}{if isset($formAtts.image_link)}{$formAtts.image_link|escape:'html':'UTF-8'}{/if}{/if}" class="{(isset($formAtts.animation) && $formAtts.animation != 'none') ? 'has-animation' : ''|escape:'html':'UTF-8'}"
            {if isset($formAtts.animation) && $formAtts.animation != 'none'} data-animation="{$formAtts.animation|escape:'html':'UTF-8'}" {/if}
            {if $formAtts.animation_delay != ''} data-animation-delay="{$formAtts.animation_delay|escape:'html':'UTF-8'}" {/if}
            title="{((isset($formAtts.title) && $formAtts.title) ? $formAtts.title : '')|escape:'html':'UTF-8'}"
            alt="{((isset($formAtts.alt) && $formAtts.alt) ? $formAtts.alt : '')|escape:'html':'UTF-8'}"
	    style=" width:{((isset($formAtts.width) && $formAtts.width) ? $formAtts.width : '100%')|escape:'html':'UTF-8'}; 
			height:{((isset($formAtts.height) && $formAtts.height) ? $formAtts.height : '100%')|escape:'html':'UTF-8'}" />
        </div>
        {if isset($formAtts.description) && $formAtts.description}
            <div class='image_description h-8 mt-6 ml-8 flex'>
					{($formAtts.description) ? $formAtts.description:'' nofilter}{* HTML form , no escape necessary *} 
                    <i class="duration-150 opacity-0 group-hover:opacity-100 group-hover:text-main group-hover:translate-x-4 inline-block relative text-lg text-main-dark ti-arrow-right transform transition"></i>
            </div>
        {/if}
        {if isset($formAtts.url) && $formAtts.url}
        </a>
        {/if}
        
    {/if}
	{($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
        
</div>


    
{else}



<div id="image-{$formAtts.form_id|escape:'html':'UTF-8'}" class="block {(isset($formAtts.class)) ? $formAtts.class : ''|escape:'html':'UTF-8'}">
	{($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}

    {if isset($formAtts.title) && $formAtts.title}
        <h4 class="title_block">{$formAtts.title nofilter}{* HTML form , no escape necessary *}</h4>
    {/if}
    {if isset($formAtts.sub_title) && $formAtts.sub_title}
        <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
    {/if}
    
    {if (isset($formAtts.image) && $formAtts.image) || (isset($formAtts.image_link) && $formAtts.image_link)}
        {if isset($formAtts.url) && $formAtts.url}
        <a href="{$formAtts.url}{*full url can not escape*}" {(isset($formAtts.is_open) && $formAtts.is_open) ? 'target="_blank"' : ''|escape:'html':'UTF-8'}>
        {/if}
        <img {if $aplazyload}class="lazy" data-src{else}src{/if}="{if isset($formAtts.image) && $formAtts.image}{$path|escape:'html':'UTF-8'}{$formAtts.image|escape:'html':'UTF-8'}{else}{if isset($formAtts.image_link)}{$formAtts.image_link|escape:'html':'UTF-8'}{/if}{/if}" class="{(isset($formAtts.animation) && $formAtts.animation != 'none') ? 'has-animation' : ''|escape:'html':'UTF-8'}"
            {if isset($formAtts.animation) && $formAtts.animation != 'none'} data-animation="{$formAtts.animation|escape:'html':'UTF-8'}" {/if}
            {if $formAtts.animation_delay != ''} data-animation-delay="{$formAtts.animation_delay|escape:'html':'UTF-8'}" {/if}
            title="{((isset($formAtts.title) && $formAtts.title) ? $formAtts.title : '')|escape:'html':'UTF-8'}"
            alt="{((isset($formAtts.alt) && $formAtts.alt) ? $formAtts.alt : '')|escape:'html':'UTF-8'}"
	    style=" width:{((isset($formAtts.width) && $formAtts.width) ? $formAtts.width : 'auto')|escape:'html':'UTF-8'}; 
			height:{((isset($formAtts.height) && $formAtts.height) ? $formAtts.height : 'auto')|escape:'html':'UTF-8'}" />

        {if isset($formAtts.url) && $formAtts.url}
        </a>
        {/if}
    {/if}
	{($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
        {if isset($formAtts.description) && $formAtts.description}
            <div class='image_description'>
								{($formAtts.description) ? $formAtts.description:'' nofilter}{* HTML form , no escape necessary *}
            </div>
        {/if}
</div>

{/if}

