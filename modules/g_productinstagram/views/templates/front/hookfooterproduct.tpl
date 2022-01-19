{*
* Do not edit the file if you want to upgrade the module in future.
* 
* @author    Globo Jsc <contact@globosoftware.net>
* @copyright 2016 Globo., Jsc
* @link	     http://www.globosoftware.net/
* @license   please read license in file license.txt
*/
*}

{if isset($data.list_imgins) && $data.list_imgins}
    <h3 class="h5 text-uppercase">{$data.lable_product|escape:'htmlall':'UTF-8'}</h3>
    <div class="ginstagram_p">
        <input type="hidden" class="templateproduct" value="{$data.templateproduct|escape:'htmlall':'UTF-8'}" />
        <input type="hidden" class="numberdpls" value="{$data.numberdpls|escape:'htmlall':'UTF-8'}" />
        <input type="hidden" class="limitedimage" value="{$data.limitedimage|escape:'htmlall':'UTF-8'}" />
        <input type="hidden" class="layoutproduct" value="{$data.layoutproduct|escape:'htmlall':'UTF-8'}" />
        <div class="listimages">
            {foreach from=$data.list_imgins item=item key=key name=name}
                <div class="gitem_" id="gitemp">
                    <div class="g_l_i">
                        <a class="g_proimg_link" data-toggle="modal" data-target="#myModal" id="{$item.ins_id|escape:'htmlall':'UTF-8'}" data-date="{$item.ins_created_time|escape:'htmlall':'UTF-8'}" data-link="{$item.ins_link|escape:'htmlall':'UTF-8'}" data-like="{$item.ins_like|escape:'htmlall':'UTF-8'}" data-ins-shortcode="{$item.ins_shortcode|escape:'htmlall':'UTF-8'}" data-idEmbed="{$item.id_gembedinstagram|intval}">
                            <img src="{$item.ins_img|escape:'htmlall':'UTF-8'}">
                        </a>
                    </div>
                </div>
            {/foreach}
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
{/if}