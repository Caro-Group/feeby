{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApSlideShow -->
{if isset($formAtts.lib_has_error) && $formAtts.lib_has_error}
    {if isset($formAtts.lib_error) && $formAtts.lib_error}
        <div class="alert alert-warning leo-lib-error">{$formAtts.lib_error}</div>
    {/if}
{else}
    <div id="slideshow-{$formAtts.form_id|escape:'html':'UTF-8'}" class="ApSlideShow">
        {if isset($content_slider_mobile)}
            <div class="tablet:hidden">
                {$content_slider_mobile nofilter}{* HTML form , no escape necessary *}
            </div>
        {/if}
        {if isset($content_slider_tablet)}
            <div class="hidden tablet:block tablet-medium:hidden">
                {$content_slider_tablet nofilter}{* HTML form , no escape necessary *}
            </div>
        {/if}
        {if isset($content_slider)}
            <div class="hidden tablet-medium:block container mx-auto px-2.5">
                {$content_slider nofilter}{* HTML form , no escape necessary *}
            </div>
        {/if}
    </div>
{/if}