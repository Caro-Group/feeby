{*
* Do not edit the file if you want to upgrade the module in future.
* 
* @author    Globo Software Solution JSC <contact@globosoftware.net>
* @copyright 2015 GreenWeb Team
* @link	     http://www.globosoftware.net
* @license   please read license in file license.txt
*/
*}

{extends file="helpers/form/form.tpl"}
{block name="field"}
    {if $input.type == 'opentab'}
        </div>
        <div class="{if isset($input.name) && $input.name != ''}{$input.name|escape:'htmlall':'UTF-8'}{if $input.name == 'tab_config'} active{/if}{/if}">
        <div>
    {elseif $input.type == 'closetab'}
        </div>
    {elseif $input.type == 'listaccount'}
        {assign var=gend_list value=$input.list_acount|@end}
        {assign var=gcountend_list value=$input.list_acount|@count}
        <input class="count_business_list" type="hidden" value="{if $gcountend_list != 0}{$gend_list["id_account"]|escape:'htmlall':'UTF-8'}{else}0{/if}"/>
        <div class="listaccount hide">
            <div class="form-group"><label class="control-label col-lg-3">{l s='Instagram User ID' mod='g_productinstagram'}</label>
                <div class="col-lg-7"><input type="text" name="user_id[]" value=""></div>
            </div>
            <div class="form-group"><label class="control-label col-lg-3">{l s='Instagram Access Token' mod='g_productinstagram'}</label>
                <div class="col-lg-7"><input type="text" name="user_token[]" value=""></div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Business Account' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="guser_business[]" id="gbusiness_on" value="1">
                        <label class="gbusiness_on_lb" for="gbusiness_on">{l s='Yes' mod='g_productinstagram'}</label>
                        <input type="radio" name="guser_business[]" id="gbusiness_off" value="0" checked="checked">
                        <label class="gbusiness_off_lb" for="gbusiness_off">{l s='No' mod='g_productinstagram'}</label>
                        <a class="slide-button btn"></a> 
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='New Access Token' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="guser_newtoken[]" id="newtoken_on" value="1">
                        <label class="newtoken_on_lb" for="newtoken_on">{l s='Yes' mod='g_productinstagram'}</label>
                        <input type="radio" name="guser_newtoken[]" id="newtoken_off" value="0" checked="checked">
                        <label class="newtoken_off_lb" for="newtoken_off">{l s='No' mod='g_productinstagram'}</label>
                        <a class="slide-button btn"></a> 
                    </span>
                </div>
            </div>
        </div>
        <div class="show_listaccount">
            {foreach from=$input.list_acount item=account key=key}
                <div class="form-group">
                    <label class="control-label col-lg-3">{l s='Instagram User ID' mod='g_productinstagram'}</label>
                    <div class="col-lg-7"><input type="text" name="user_id[{$account.id_account|intval}]" value="{$account.instagram_user|escape:'htmlall':'UTF-8'}"></div>
                        <br /><br />
                    <label class="control-label col-lg-3">{l s='Instagram Access Token' mod='g_productinstagram'}</label>
                    <div class="col-lg-7"><input type="text" name="user_token[{$account.id_account|intval}]" value="{$account.instagram_access_token|escape:'htmlall':'UTF-8'}"></div>
                    <input class="hide" type="checkbox" name="delete_id[]" value="{$account.id_account|intval}"/>
                    <div class="form-group">
                    <label class="control-label col-lg-3">
                        {l s='Business Account' mod='g_productinstagram'}
                    </label>
                    <div class="col-lg-9">
                        <span class="switch prestashop-switch fixed-width-lg">
                            <input type="radio" name="guser_business[{$account.id_account|intval}]" id="gbusiness_on{$account.id_account|intval}" value="1" {if $account.instagram_guser_business =='1'}checked="checked"{/if}>
                            <label class="gbusiness_on_lb{$account.id_account|intval}" for="gbusiness_on{$account.id_account|intval}">{l s='Yes' mod='g_productinstagram'}</label>
                            <input type="radio" name="guser_business[{$account.id_account|intval}]" id="gbusiness_off{$account.id_account|intval}" value="0" {if $account.instagram_guser_business =='0'}checked="checked"{/if}>
                            <label class="gbusiness_off_lb{$account.id_account|intval}" for="gbusiness_off{$account.id_account|intval}">{l s='No' mod='g_productinstagram'}</label>
                            <a class="slide-button btn"></a> 
                        </span>
                    </div>
                    <br /><br />
                    <label class="control-label col-lg-3">
                        {l s='New Access Token' mod='g_productinstagram'}
                    </label>
                    <div class="col-lg-9">
                        <span class="switch prestashop-switch fixed-width-lg">
                            <input type="radio" name="guser_newtoken[{$account.id_account|intval}]" id="newtoken_on{$account.id_account|intval}" value="1" {if $account.instagram_new_token =='1'}checked="checked"{/if}>
                            <label class="newtoken_on_lb{$account.id_account|intval}" for="newtoken_on{$account.id_account|intval}">{l s='Yes' mod='g_productinstagram'}</label>
                            <input type="radio" name="guser_newtoken[{$account.id_account|intval}]" id="newtoken_off{$account.id_account|intval}" value="0" {if $account.instagram_new_token =='0'}checked="checked"{/if}>
                            <label class="newtoken_off_lb{$account.id_account|intval}" for="newtoken_off{$account.id_account|intval}">{l s='No' mod='g_productinstagram'}</label>
                            <a class="slide-button btn"></a> 
                        </span>
                    </div>
                    </div>
                    <button type="button" class="btn btn-default remove_acount"><i class="icon-remove"></i></button>
                </div>
                
            {/foreach}
        </div>
    {elseif $input.type == 'button_add_account'}
        <div class="col-xs-9 col-xs-offset-3"><button type="button" class="btn btn-default" id="add_element_acount"><i class="icon-plus"></i> {l s='Add Acount' mod='g_productinstagram'}</button></div>
    {elseif $input.type == 'tabconfig'}
        <ul class="tabs-create">
            <li class="active"><a href="javascript:void(0);" data-id="tab_config"><i class="icon-user"></i> {l s='INSTAGRAM ACCOUNT' mod='g_productinstagram'}</a></li>
            <li><a href="javascript:void(0);" data-id="tab_config_img"><i class="icon-info"></i> {l s='GENERAL SETTING' mod='g_productinstagram'}</a></li>
        </ul>
    {else}
        {$smarty.block.parent}
    {/if}
{/block}