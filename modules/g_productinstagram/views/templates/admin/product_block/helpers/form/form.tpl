{*
* Do not edit the file if you want to upgrade the module in future.
* 
* @author    Globo Jsc <contact@globosoftware.net>
* @copyright 2016 Globo., Jsc
* @link	     http://www.globosoftware.net/
* @license   please read license in file license.txt
*/
*}

{extends file="helpers/form/form.tpl"}
{block name="field"}
    {if $input.type == 'opentab'}
        </div>
        <div class="{if isset($input.class) && $input.class != ''}{$input.class|escape:'htmlall':'UTF-8'}{/if}" id="{if isset($input.id) && $input.id != ''}{$input.id|escape:'htmlall':'UTF-8'}{/if}">
            {if isset($input.id) && $input.id == 'config'}
                <div class=" panel-heading">{l s='Customize template style' mod="g_productinstagram"}</div>
            {/if}
        <div>
    {elseif $input.type == 'closetab'}
        </div>
    {elseif $input.type == 'active_config'}
        <button type="button" class="customtemplate_style btn"><i class="icon-cog"></i></button>
    {elseif $input.type == 'responsive'}
        {if $fields_value['numberdpls'] == '' || !isset($fields_value['numberdpls'])}
            {$val_col = ''}    
        {else}
            {$val_col = explode(',',$fields_value['numberdpls'])}
        {/if}
        <div class="globo_wrap_screen_ins globo_wrap_screen_ins_1 col-lg-9">
            <div>
                <input type="hidden" class="numberdpls screen_column" name="numberdpls" value="{if $fields_value['numberdpls'] != ''}{$fields_value['numberdpls']|escape:'htmlall':'UTF-8'}{else}{$fields_value['numberdpls']|escape:'htmlall':'UTF-8'},5,4,3,2,2{/if}" />
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>1200px</b></span>
                    <input type="text" class="form-control g_template_config g_config_screen_col validate_isInt" value="{if $val_col != '' && is_array($val_col)}{$val_col[1]|escape:'htmlall':'UTF-8'}{else}5{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>992px</b></span>
                    <input type="text" class="form-control g_template_config g_config_screen_col validate_isInt" value="{if $val_col != '' && is_array($val_col)}{$val_col[2]|escape:'htmlall':'UTF-8'}{else}4{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>768px</b></span>
                    <input type="text" class="form-control g_template_config g_config_screen_col validate_isInt" value="{if $val_col != '' && is_array($val_col)}{$val_col[3]|escape:'htmlall':'UTF-8'}{else}3{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>480px</b></span>
                    <input type="text" class="form-control g_template_config g_config_screen_col validate_isInt" value="{if $val_col != '' && is_array($val_col)}{$val_col[4]|escape:'htmlall':'UTF-8'}{else}2{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>320px</b></span>
                    <input type="text" class="form-control g_template_config g_config_screen_col validate_isInt" value="{if $val_col != '' && is_array($val_col)}{$val_col[5]|escape:'htmlall':'UTF-8'}{else}2{/if}" />
                </div>
            </div>
        </div>
    {elseif $input.type == 'list_images'}
        <div class="hide clone">
            {if isset($fields_value.listimages) && $fields_value.listimages}
                {foreach from=$fields_value.listimages item=item key=key name=name}
                    <div class="{$item['ins_id']|escape:'htmlall':'UTF-8'} gitem_">
                        <div class="g_l_i">
                            <a class="g_bo_link" data-idembed="{$item['id_g_productinstagram']|escape:'htmlall':'UTF-8'}" data-toggle="modal" data-target="#templateModal" data-id-gimg-selected="{$item['ins_id']|escape:'htmlall':'UTF-8'}" id="{$item['ins_id']|escape:'htmlall':'UTF-8'}" data-date="{$item['ins_created_time']|escape:'htmlall':'UTF-8'}" data-link="{$item['ins_link']|escape:'htmlall':'UTF-8'}" data-like="{$item['ins_like']|escape:'htmlall':'UTF-8'}" data-caption="{$item['ins_caption']|escape:'htmlall':'UTF-8'}" data-ins-shortcode="{$item['ins_shortcode']|escape:'htmlall':'UTF-8'}">
                                <img src="{$item['ins_img']|escape:'htmlall':'UTF-8'}" onload="checkloadimagead($(this),$('#templateproduct').val())"/>
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
        </div>
        <div class="action">
            <input type="hidden" class="linkcontroller" value="{$fields_value.linkcontroller|escape:'htmlall':'UTF-8'}">
        </div>
        <div class="buildertemplate">
            <div class="listimages">
                {if isset($fields_value.listimages) && $fields_value.listimages}
                    {foreach from=$fields_value.listimages item=item key=key name=name}
                        <div class="{$item['ins_id']|escape:'htmlall':'UTF-8'} gitem_">
                            <div class="g_l_i">
                                <a class="g_bo_link" data-idembed="{$item['id_g_productinstagram']|escape:'htmlall':'UTF-8'}" data-toggle="modal" data-target="#templateModal" data-id-gimg-selected="{$item['ins_id']|escape:'htmlall':'UTF-8'}" id="{$item['ins_id']|escape:'htmlall':'UTF-8'}" data-date="{$item['ins_created_time']|escape:'htmlall':'UTF-8'}" data-link="{$item['ins_link']|escape:'htmlall':'UTF-8'}" data-like="{$item['ins_like']|escape:'htmlall':'UTF-8'}" data-caption="{$item['ins_caption']|escape:'htmlall':'UTF-8'}" data-ins-shortcode="{$item['ins_shortcode']|escape:'htmlall':'UTF-8'}">
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
            </div>
        </div>
        <div id="g_popupproduct_main">
            <div id="templateModal" class="modal fade" role="dialog">
              <div class="modal-dialog">        
                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-body" id="g_getcontent_ins">
                        <div class="col-lg-8 col-sm-8 col-xs-12 g_m_i">
                            <div class="g_img">
                                <img src="" />
                                <div class="g_list_tag_pro"></div>
                            </div>
                        </div>
                        <div class="g_tag_product col-lg-4 col-sm-4 col-xs-12">
                            <div class="author_instagram">
                                <div class="author_thumb"><a href=""><img src="../modules/g_productinstagram/views/img/admin/userimgdemo.png"/></a></div>
                                <div class="author_name">
                                    <a href="#"><h3>{l s='User name' mod="g_productinstagram"}</h3></a>
                                    <p>{l s='User full name' mod="g_productinstagram"}</p>
                                </div>
                                <a class="btn btn-default follow" href="#">{l s='follow' mod="g_productinstagram"}</a>
                            </div>
                            <div class="g_list_tag g_maxheight">
                                <ul>
                                </ul>
                            </div>
                            <div class="date_like">
                                <b> <i class="icon-heart-o"></i>125,156 {l s='Likes' mod='g_productinstagram'}</b> <span>Sep,22 2019</span>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
        </div>
    {else}
        {$smarty.block.parent}
    {/if}
{/block}