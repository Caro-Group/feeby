{*
* Do not edit the file if you want to upgrade the module in future.
* 
* @author    Globo Jsc <contact@globosoftware.net>
* @copyright 2016 Globo., Jsc
* @link	     http://www.globosoftware.net/
* @license   please read license in file license.txt
*/
*}

{if isset($listimages) && $listimages}
    {foreach from=$listimages item=item key=key name=name}
        <div class="{$item['ins_id']|escape:'htmlall':'UTF-8'} gitem_">
            <div class="g_l_i">
                <a class="g_bo_link" data-toggle="modal" data-target="#myModal" data-id-gimg-selected="{$item['ins_id']|escape:'htmlall':'UTF-8'}" id="{$item['ins_id']|escape:'htmlall':'UTF-8'}" data-date="{$item['ins_created_time']|escape:'htmlall':'UTF-8'}" data-link="{$item['ins_link']|escape:'htmlall':'UTF-8'}" data-like="{$item['ins_like']|escape:'htmlall':'UTF-8'}" data-caption="{$item['ins_caption']|escape:'htmlall':'UTF-8'}" data-ins-shortcode="{$item['ins_shortcode']|escape:'htmlall':'UTF-8'}">
                    <img src="{$item['ins_img']|escape:'htmlall':'UTF-8'}"/>
                    {if !empty($item['list_product'])}
                        {$i = 1}
                        {foreach $item['list_product'] key=kk item=ii}
                            <span class="g_item_tag_bo" style="left: {$ii['percentX']|escape:'htmlall':'UTF-8'}%; top: {$ii['percentY']|escape:'htmlall':'UTF-8'}%;">{$i++|escape:'htmlall':'UTF-8'}</span>
                        {/foreach}
                    {/if}
                </a>
            </div>
        </div>
    {/foreach}
{/if}