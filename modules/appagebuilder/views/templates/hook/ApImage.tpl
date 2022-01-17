{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApImage -->

{* desktop-presta:h-96 desktop-wide:h-100 text-md tablet:text-xl not-italic *}
{if $page_name == 'index'}

    <div id="image-{$formAtts.form_id|escape:'html':'UTF-8'}" class="flex flex-col {(isset($formAtts.class)) ? $formAtts.class : ''|escape:'html':'UTF-8'}">
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
            <img class="object-cover transform group-hover:scale-110 duration-2000 {if $aplazyload}lazy{/if}" {if $aplazyload}data-src{else}src{/if}="{if isset($formAtts.image) && $formAtts.image}{$path|escape:'html':'UTF-8'}{$formAtts.image|escape:'html':'UTF-8'}{else}{if isset($formAtts.image_link)}{$formAtts.image_link|escape:'html':'UTF-8'}{/if}{/if}" class="{(isset($formAtts.animation) && $formAtts.animation != 'none') ? 'has-animation' : ''|escape:'html':'UTF-8'}"
                {if isset($formAtts.animation) && $formAtts.animation != 'none'} data-animation="{$formAtts.animation|escape:'html':'UTF-8'}" {/if}
                {if $formAtts.animation_delay != ''} data-animation-delay="{$formAtts.animation_delay|escape:'html':'UTF-8'}" {/if}
                title="{((isset($formAtts.title) && $formAtts.title) ? $formAtts.title : '')|escape:'html':'UTF-8'}"
                alt="{((isset($formAtts.alt) && $formAtts.alt) ? $formAtts.alt : '')|escape:'html':'UTF-8'}"
            style=" width:{((isset($formAtts.width) && $formAtts.width) ? $formAtts.width : '100%')|escape:'html':'UTF-8'}; 
                height:{((isset($formAtts.height) && $formAtts.height) ? $formAtts.height : '100%')|escape:'html':'UTF-8'}" />
    
    
            {* add any 'dot' class in panel in order to create one and set it's position  *}
            {if $formAtts.class|strstr:"dot"}
                <div class="hidden desktop-presta:block absolute bg-white group-hover:bg-main w-3 h-3 rounded-full shadow-md transition
                {if $formAtts.class|strstr:"dot-top"}
                     top-1/3
                {/if}
                {if $formAtts.class|strstr:"dot-top2"}
                    top-1/4
                {/if}
                {if $formAtts.class|strstr:"dot-right"}
                     right-1/3
                {/if}
                {if $formAtts.class|strstr:"dot-right2"}
                     right-1/4
                {/if}
                {if $formAtts.class|strstr:"dot-left"}
                     left-1/3
                {/if}
                {if $formAtts.class|strstr:"dot-left2"}
                    left-1/4
                {/if}
                {if $formAtts.class|strstr:"dot-bot"}
                    bottom-1/3
                {/if}
                {if $formAtts.class|strstr:"dot-bot2"}
                    bottom-1/4
                {/if}
                {if $formAtts.class|strstr:"dot-mid-x"}
                     inset-x-2/4
                {/if}
                {if $formAtts.class|strstr:"dot-mid-y"}
                    inset-y-2/4
                {/if}
                ">
                </div>
            {/if}
    
            </div>
            {if isset($formAtts.description) && $formAtts.description}
                <div class='image_description min-h-8 tablet:min-h-8 mt-3 ml-2 tablet:ml-8 tablet:mt-4 tablet:mr-5 tablet:mb-8 flex'>
                        {($formAtts.description) ? $formAtts.description:'' nofilter}{* HTML form , no escape necessary *} 
                        <i class="mt-1 duration-150 opacity-0 group-hover:opacity-100 group-hover:text-main group-hover:translate-x-4 hidden desktop-presta:inline-block relative text-lg text-main-dark ti-arrow-right transform transition"></i>
                </div>
            {/if}
            {if isset($formAtts.url) && $formAtts.url}
            </a>
            {/if}
            
        {/if}
        {($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
            
    </div>
    
    
        
{elseif $page_name == 'product' && $hookName == 'displayTop'}
        <div id="image-{$formAtts.form_id|escape:'html':'UTF-8'}" class="block {(isset($formAtts.class)) ? $formAtts.class : ''|escape:'html':'UTF-8'}">
            {($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}
            
            {if (isset($formAtts.image) && $formAtts.image) || (isset($formAtts.image_link) && $formAtts.image_link)}
                {if isset($formAtts.url) && $formAtts.url}
                <a href="{$formAtts.url}{*full url can not escape*}" {(isset($formAtts.is_open) && $formAtts.is_open) ? 'target="_blank"' : ''|escape:'html':'UTF-8'}>
                {/if}
                <img class="mb-5" {if $aplazyload}loading="lazy"{else}loading="eager"{/if} src="{if isset($formAtts.image) && $formAtts.image}{$path|escape:'html':'UTF-8'}{$formAtts.image|escape:'html':'UTF-8'}{else}{if isset($formAtts.image_link)}{$formAtts.image_link|escape:'html':'UTF-8'}{/if}{/if}" class="{(isset($formAtts.animation) && $formAtts.animation != 'none') ? 'has-animation' : ''|escape:'html':'UTF-8'}"
                    {if isset($formAtts.animation) && $formAtts.animation != 'none'} data-animation="{$formAtts.animation|escape:'html':'UTF-8'}" {/if}
                    {if $formAtts.animation_delay != ''} data-animation-delay="{$formAtts.animation_delay|escape:'html':'UTF-8'}" {/if}
                    title="{((isset($formAtts.title) && $formAtts.title) ? $formAtts.title : '')|escape:'html':'UTF-8'}"
                    alt="{((isset($formAtts.alt) && $formAtts.alt) ? $formAtts.alt : '')|escape:'html':'UTF-8'}" />

                {if isset($formAtts.url) && $formAtts.url}
                </a>
                {/if}
            {/if}

            {if isset($formAtts.title) && $formAtts.title}
                <h4 class="title_block">{$formAtts.title nofilter}{* HTML form , no escape necessary *}</h4>
            {/if}
            {if isset($formAtts.sub_title) && $formAtts.sub_title}
                <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
            {/if}

            {($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
                {if isset($formAtts.description) && $formAtts.description}
                    <div class='image_description'>
                       {($formAtts.description) ? $formAtts.description:'' nofilter}{* HTML form , no escape necessary *}
                    </div>
                {/if}
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
            <img class="{if $aplazyload}lazy{/if} rounded-[5px]" src="{if isset($formAtts.image) && $formAtts.image}{$path|escape:'html':'UTF-8'}{$formAtts.image|escape:'html':'UTF-8'}{else}{if isset($formAtts.image_link)}{$formAtts.image_link|escape:'html':'UTF-8'}{/if}{/if}" class="{(isset($formAtts.animation) && $formAtts.animation != 'none') ? 'has-animation' : ''|escape:'html':'UTF-8'}"
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
    
    
