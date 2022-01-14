{*
* Do not edit the file if you want to upgrade the module in future.
* 
* @author    Globo Jsc <contact@globosoftware.net>
* @copyright 2016 Globo., Jsc
* @link	     http://www.globosoftware.net/
* @license   please read license in file license.txt
*/
*}

{if isset($items)}
    {foreach $items as $item}
    <div class="gitem_" id="{if isset($item['configman']) && $item['configman']}{$item['configman']|escape:'htmlall':'UTF-8'}{/if}">
        <div class="g_l_i">
            <a class="g_bo_link" data-toggle="modal" data-target="#myModal" id="{$item['ins_id']|escape:'htmlall':'UTF-8'}" data-date="{$item['ins_created_time']|escape:'htmlall':'UTF-8'}" data-link="{$item['ins_link']|escape:'htmlall':'UTF-8'}" data-like="{$item['ins_like']|escape:'htmlall':'UTF-8'}" data-ins-shortcode="{$item['ins_shortcode']|escape:'htmlall':'UTF-8'}">
                <img src="{$item['ins_img']|escape:'htmlall':'UTF-8'}"  class="gHoverimg" style="border-radius: {$gCfig['gborderRadiusImg']|escape:'htmlall':'UTF-8'}px;" {if isset($gCfig['template']) && $gCfig['template'] != 4 }onload="checkloadimage($(this))"{/if} />
                {if !empty($item['list_product']) && $gCfig['gShowImgTag'] == 1}
                    {$i = 1}
                    {foreach $item['list_product'] key=kk item=ii}
                        <span class="g_item_tag_bo" style="left: {$ii['percentX']|escape:'htmlall':'UTF-8'}%; top: {$ii['percentY']|escape:'htmlall':'UTF-8'}%;">{$i++|escape:'htmlall':'UTF-8'}</span>
                    {/foreach}
                {/if}
                {if $gCfig['gcallaction'] == 1 || $gCfig['gallicon'] == 1 }
                    <div class="g_btn_ins" {if $gCfig['icon_show'] != 1 || $gCfig['gallicon'] != 1 || $textshopit == '' || $gCfig['gcallaction'] != 1} style="top: 0;"{/if}>
                        <div class="g_btn_shop">
                            {if $gCfig['icon_show'] == 1 && $gCfig['gallicon'] == 1}
                                <span class="giconins_"><i class="gicon_ins" style="color:{$gCfig['icon_color']|escape:'htmlall':'UTF-8'}!important"></i></span>
                            {/if}
                            {if $textshopit != '' && $gCfig['gcallaction'] == 1}
                                <span class="gtxtshopit {if $gCfig['shopit_show_bg'] != 1}notshowbgbtn{/if}" {if $bg_shopit != ''}style="background:{$bg_shopit|escape:'htmlall':'UTF-8'};border:{$gCfig['shopit_border_size']|escape:'htmlall':'UTF-8'}px solid {$gCfig['shopit_border_color']|escape:'htmlall':'UTF-8'}; color: {$gCfig['shopit_color_text']|escape:'htmlall':'UTF-8'}"{/if}>{$textshopit|escape:'htmlall':'UTF-8'}</span>
                            {/if}
                        </div>
                        {*<div class="g_bg_hover" {if $bg_hover != ''}style="background:{$bg_hover|escape:'htmlall':'UTF-8'}"{/if}></div>*}
                    </div>
                {/if}
            </a>
        </div>
    </div>
    {/foreach}
    {if $showLoadmore == true}
        <div class="g_waiting_load" style="display:none"><span></span></div>
        <div class="item_ g_load_more" style="display: block;">
            {if $getNottag == false}
                <a data-php="true" data-href="index.php?fc=module&module=g_productinstagram&controller=instagram&action=getAllTaged&embed_id={$embed_id|escape:'htmlall':'UTF-8'}&gpage={$pagipage|escape:'htmlall':'UTF-8'}" class="gloadmoreins">
                    <input class="btn btn-primary pull-xs-right hidden-xs-down" type="button" value="{l s='Load More' mod='g_productinstagram'}"/>
                </a>
            {else}
                <a data-php="true" data-href="index.php?fc=module&module=g_productinstagram&controller=instagram&action=getAllConfig&embed_id={$embed_id|escape:'htmlall':'UTF-8'}&gpage={$pagipage|escape:'htmlall':'UTF-8'}" class="gloadmoreins">
                    <input class="btn btn-primary pull-xs-right hidden-xs-down" type="button" value="{l s='Load More' mod='g_productinstagram'}"/>
                </a>
            {/if}
        </div>
    {/if}
{/if}