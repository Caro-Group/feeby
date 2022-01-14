{*
* Do not edit the file if you want to upgrade the module in future.
* 
* @author    Globo Jsc <contact@globosoftware.net>
* @copyright 2016 Globo., Jsc
* @link	     http://www.globosoftware.net/
* @license   please read license in file license.txt
*/
*}

{extends file='page.tpl'}
{block name='page_content'}
<input type="hidden" class="instagram_url_rewrite" value="{$instagram_url_rewrite|escape:'htmlall':'UTF-8'}" />
<div class="ginstagram_w">
    {if $getCfig->showtitle == 1}
        {if $checkPageIns == true && isset($checkPageIns)}
            {if $addlinktext !=""}
                <h1 class="g_title_ins">
                    <a href="{$addlinktext|escape:'html':'UTF-8'}" target="_blank">
                        <span>{$title|escape:'html':'UTF-8'}</span>
                    </a>
                </h1>
            {else}
                <h1 class="g_title_ins"><span>{$title|escape:'html':'UTF-8'}</span></h1>
            {/if}
        {else}
            {if $addlinktext !=""}
                <h2 class="g_title_ins">
                    <a href="{$addlinktext|escape:'html':'UTF-8'}" target="_blank">
                        <span>{$title|escape:'html':'UTF-8'}</span>
                    </a>
                </h2>
            {else}
                <h2 class="g_title_ins"><span>{$title|escape:'html':'UTF-8'}</span></h2>
            {/if}
        {/if}
    {/if}
    
    {if $getCfig->tem_box_number != '' || $getCfig->tem_box_number > 0}
        {$nb = $getCfig->tem_box_number}
    {else}
        {$nb = 10}
    {/if}
    <div id="ginsposition__{$getCfig->id_gembedinstagram|escape:'htmlall':'UTF-8'}_{$position|escape:'htmlall':'UTF-8'}_{$hooks|escape:'htmlall':'UTF-8'}" class="{if $getCfig->icon_show == 1}ginsshowicon{/if} ginstagramproduct ginstemplate_{$getCfig->template|escape:'html':'UTF-8'} ginsposition__{$getCfig->id_gembedinstagram|escape:'html':'UTF-8'}_{$position|escape:'html':'UTF-8'}_{$hooks|escape:'html':'UTF-8'} autoload_1" 
                data-tem="{$getCfig->template|escape:'htmlall':'UTF-8'}" 
                data-boxL="{$getCfig->tem_box_limit|escape:'htmlall':'UTF-8'}" 
                data-boxC="{$getCfig->tem_box_column|escape:'htmlall':'UTF-8'}" 
                data-boxN="{$getCfig->tem_box_number|escape:'htmlall':'UTF-8'}" 
                data-sliC="{$getCfig->tem_sli_column|escape:'htmlall':'UTF-8'}" 
                data-sliA="{$getCfig->tem_sli_autorun|escape:'htmlall':'UTF-8'}" 
                data-sliL="{$getCfig->tem_sli_limit|escape:'htmlall':'UTF-8'}" 
                data-fulN="{$getCfig->tem_ful_number|escape:'htmlall':'UTF-8'}" 
                data-fulL="{$getCfig->tem_ful_limit|escape:'htmlall':'UTF-8'}" 
                data-fulA="{$getCfig->tem_ful_autoload|escape:'htmlall':'UTF-8'}" 
                data-convert-boxC="{100/$getCfig->tem_box_column|escape:'htmlall':'UTF-8'}"
                data-idEmbed="{$getCfig->id_gembedinstagram|escape:'htmlall':'UTF-8'}"
                data-bg_shopit="{$getCfig->bg_shopit|escape:'htmlall':'UTF-8'}"
                data-marginimg="{$getCfig->marginimg|escape:'htmlall':'UTF-8'}"
                data-shopIt="{$textshopit|escape:'htmlall':'UTF-8'}"
                data-showtaged="{$getCfig->showtaged|escape:'htmlall':'UTF-8'}" 
                data-screen-col="{$getCfig->screen_column_b|escape:'htmlall':'UTF-8'}"
                data-btn-showbg="{$getCfig->shopit_show_bg|escape:'htmlall':'UTF-8'}"
                data-btnborder-color="{$getCfig->shopit_border_color|escape:'htmlall':'UTF-8'}"
                data-btnborder-size="{$getCfig->shopit_border_size|escape:'htmlall':'UTF-8'}"
                data-btn-colortext="{$getCfig->shopit_color_text|escape:'htmlall':'UTF-8'}"
                data-icon-color="{$getCfig->icon_color|escape:'htmlall':'UTF-8'}"
                data-icon-show="{$getCfig->icon_show|escape:'htmlall':'UTF-8'}"
                data-disable="{if isset($listDisable)}{$listDisable|escape:'htmlall':'UTF-8'}{/if}"
                data-count=""
                data-countCurrent="0"
                data-gBackgroundOpacity="{$getCfig->gBackgroundOpacity|escape:'htmlall':'UTF-8'}"
                data-gborderRadiusImg="{$getCfig->gborderRadiusImg|escape:'htmlall':'UTF-8'}"
                data-gZoomImgHover="{$getCfig->gZoomImgHover|escape:'htmlall':'UTF-8'}"
                data-gShowImgTagHover="{$getCfig->gShowImgTagHover|escape:'htmlall':'UTF-8'}"
                data-gShowImgTag="{$getCfig->gShowImgTag|escape:'htmlall':'UTF-8'}"
                data-ShowTagProductHover_img="{$getCfig->ShowTagProductHover_img|escape:'htmlall':'UTF-8'}"
                data-nb="{$nb|escape:'htmlall':'UTF-8'}"
                data-layout-product="{$getCfig->type_layout|escape:'htmlall':'UTF-8'}"
                data-active-acount="{$getCfig->active_acount|escape:'htmlall':'UTF-8'}"
    >
        <div class="gwraperins">
        </div>
    </div>
    <div id="gpopupins" style="display:none">
    </div>
    <div class="ginsnodata" style="display:none !important">
        <div class="gmainpopup_ins">
            <div class="gimg_ins">
                <div class="gwrapimgins">
                    <img src="" />
                </div>
            </div>
            <div class="gproduct_ins">
                <h4>{l s='Tag Products' mod='g_productinstagram'}</h4>
                <div class="g_list_tag g_maxheight_ins">
                    <h5>{l s='Not found products.' mod='g_productinstagram'}</h5>
                </div>
            </div>
        </div>
    </div>
</div>
<style type="text/css">
    .ginstemplate_3 .gitem_ {
        float:left;
    }
    {if $getCfig->tem_box_limit > 0}
        .ginsposition__{$getCfig->id_gembedinstagram|escape:'html':'UTF-8'}_{$position|escape:'html':'UTF-8'}_{$hooks|escape:'html':'UTF-8'} .gitem_:nth-child(n+ {$getCfig->tem_box_limit|escape:'htmlall':'UTF-8' + 1}) {
            display:none !important;
        }
    {/if}
</style>
{/block}