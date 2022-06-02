{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApImage -->

{* desktop-presta:h-96 desktop-wide:h-100 text-md tablet:text-xl not-italic *}

<div id="image-{$formAtts.form_id|escape:'html':'UTF-8'}"
    class="flex flex-col {(isset($formAtts.class)) ? $formAtts.class : ''|escape:'html':'UTF-8'}">
    {($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}

    {if (isset($formAtts.image) && $formAtts.image) || (isset($formAtts.image_link) && $formAtts.image_link)}

        {if isset($formAtts.url) && $formAtts.url}
            <a href="{$formAtts.url}{*full url can not escape*}" class="flex flex-col h-full group"
                {(isset($formAtts.is_open) && $formAtts.is_open) ? 'target="_blank"' : ''|escape:'html':'UTF-8'}>
            {else}
                <div class="flex flex-col h-full group">
                {/if}
                <div class="overflow-hidden rounded-md h-full">
                    <img
                        class="object-cover {(isset($formAtts.class) && $formAtts.class|strstr:"object-center") ? 'object-center' : 'object-top'|escape:'html':'UTF-8'} aspect-square tablet:aspect-auto transform group-hover:scale-110 duration-2000 w-full h-auto tablet:h-[325px] desktop-presta:h-[460px] desktop:h-full"
                        loading="lazy"
                        src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                        data-lazy
                        data-src="{if isset($formAtts.image) && $formAtts.image}{$path|escape:'html':'UTF-8'}{$formAtts.image|escape:'html':'UTF-8'}{else}{if isset($formAtts.image_link)}{$formAtts.image_link|escape:'html':'UTF-8'}{/if}{/if}"
                        class="{(isset($formAtts.animation) && $formAtts.animation != 'none') ? 'has-animation' : ''|escape:'html':'UTF-8'}"
                        {if isset($formAtts.animation) && $formAtts.animation != 'none'}
                        data-animation="{$formAtts.animation|escape:'html':'UTF-8'}" {/if}
                        {if $formAtts.animation_delay != ''}
                        data-animation-delay="{$formAtts.animation_delay|escape:'html':'UTF-8'}" {/if}
                        title="{((isset($formAtts.title) && $formAtts.title) ? $formAtts.title : '')|escape:'html':'UTF-8'}"
                        alt="{((isset($formAtts.alt) && $formAtts.alt) ? $formAtts.alt : '')|escape:'html':'UTF-8'}"
                        width="{((isset($formAtts.width) && $formAtts.width) ? ($formAtts.width|replace:"px":"") : '100%')|escape:'html':'UTF-8'}"
                        height="{((isset($formAtts.height) && $formAtts.height) ? ($formAtts.height|replace:"px":"") : '100%')|escape:'html':'UTF-8'}" />


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
                {if isset($formAtts.title) && $formAtts.title}
                    <div class='h-4 min-h-8 tablet:min-h-8 mt-3 ml-2 tablet:ml-8 tablet:mt-4 tablet:mr-5 tablet:mb-8 flex'>
                        <span
                            class="text-base tablet:text-2xl text-main-dark font-body not-italic font-light">{($formAtts.title) ? $formAtts.title:'' nofilter}{* HTML form , no escape necessary *}
                        </span>
                        {if isset($formAtts.url) && $formAtts.url} <i
                            class="mt-1 duration-150 opacity-0 group-hover:opacity-100 group-hover:text-main group-hover:translate-x-4 hidden desktop-presta:inline-block relative text-lg text-main-dark ti-arrow-right transform transition"></i>{/if}
                    </div>
                {/if}
                {if isset($formAtts.description) && $formAtts.description}
                    <div
                        class='image_description h-4 min-h-8 tablet:min-h-8 mt-3 ml-2 tablet:ml-8 tablet:mt-4 tablet:mr-5 tablet:mb-8 flex'>
                        {($formAtts.description) ? $formAtts.description:'' nofilter}{* HTML form , no escape necessary *}
                        {if isset($formAtts.url) && $formAtts.url} <i
                            class="mt-1 duration-150 opacity-0 group-hover:opacity-100 group-hover:text-main group-hover:translate-x-4 hidden desktop-presta:inline-block relative text-lg text-main-dark ti-arrow-right transform transition"></i>{/if}
                    </div>
                {/if}
                {if isset($formAtts.url) && $formAtts.url}
            </a>
        {else}
        </div>
    {/if}

{/if}
{($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}

</div>