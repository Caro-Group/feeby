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
        <div class="{if isset($input.class) && $input.class != ''}{$input.class|escape:'htmlall':'UTF-8'}{/if} {if isset($input.name) && $input.name == 'general_infomation'} activetab{/if}" id="{if isset($input.name) && $input.name != ''}{$input.name|escape:'htmlall':'UTF-8'}{/if}">
        {if isset($input.title) && $input.title}
            <div class="{if isset($input.name) && $input.name == 'general_tab_button'}active{/if} panel-heading">{$input.title|escape:'htmlall':'UTF-8'}</div>
        {/if}
        {if isset($input.data) && $input.data == 1}
            <div id="g_popup_main">
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
                                    <h3>{l s='Related products' mod='g_productinstagram'}</h3>
                                    <ul>
                                    </ul>
                                </div>
                                <div class="g_not_pro_tag" style="display:none">{l s='No tagged products.' mod='g_productinstagram'}</div>
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
        {/if}
        <div>
    {elseif $input.type == 'closetab'}
        </div>
    {elseif $input.type == 'open_style'}
        <button type="button" class="customtemplate_style btn"><i class="icon-cog"></i></button>
    {elseif $input.type == 'general_puplish'}
        {if isset($shortcode)}
            <div class="col-lg-6">
                <div class="shortcode">
                    <div id="growls" class="default"><div class="growl growl-notice growl-medium">
                        <div class="growl-close"><i class="icon-close"></i></div>
                        <div class="growl-title"></div>
                        <div class="growl-message">{l s='Copied!' mod='g_productinstagram'}</div>
                    </div></div>
                    <span class="showSuccessCopyShort" style="display:none"></span>
                    <div class="panel-heading">{l s='SHORTCODES, SMARTY HOOK' mod='g_productinstagram'}</div>
                    <div class="detail">
                        <label class="control-label">{l s='SHORTCODES' mod='g_productinstagram'}</label>
                        <p class="help-block">{l s='You can use the short code to add the Template to content of cms page:' mod='g_productinstagram'}</p>
                        <div class="form-group">
                            <input type="text" disabled="disable" value="{$shortcode|escape:'html':'UTF-8'}" class="border_shortcode" />
                            <button class="btn btn-default copytoclipbroad" type="button">{l s='Copy' mod='g_productinstagram'}</button>
                        </div>
                        <label class="control-label">{l s='SMARTY HOOK' mod='g_productinstagram'}</label>
                        <p class="help-block">{l s='It is prestashop custom hook. You can add the code to any .tpl file if you want to display the template:' mod='g_productinstagram'}</p>
                        <div class="form-group">
                            <input type="text" disabled="disable" value="{$displayHook|escape:'html':'UTF-8'}" class="border_shortcode" />
                            <button class="btn btn-default copytoclipbroad" type="button">{l s='Copy' mod='g_productinstagram'}</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shortcode">
                    <div class="panel-heading">{l s='LINK' mod='g_productinstagram'}</div>
                    <div class="detail">
                        <label class="control-label">{l s='Link' mod='g_productinstagram'}</label>
                        <p class="help-block">{l s='This is the gallery link. You can put this link to the Menu, add to CMS page content, send to customer, etc.' mod='g_productinstagram'}</p>
                        <div class="form-group">
                            <input type="text" disabled="disable" value="{$inslink|escape:'html':'UTF-8'}" class="border_shortcode" />
                            <a class="btn btn-default" href="{$inslink|escape:'html':'UTF-8'}" target="_blank"><i class="icon-external-link"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
    {else if $input.type == 'switch_sli_autorun'}
        {*alert*}
        <input type="hidden" class="gshow_error_token" value="{l s='Invalid token error!' mod='g_productinstagram'}"/>
        <input type="hidden" class="confirm_del" value="{l s='Are you sure!' mod='g_productinstagram'}" />
        <input type="hidden" class="adlink_totext" value="{l s='ERROR: Custom URL invalid' mod='g_productinstagram'}" />
        <input type="hidden" value="{l s='You must save Step 1 to go to Step 2 ' mod='g_productinstagram'}" class="g_tabs_hide" />
        <input type="hidden" value="{l s='Remove' mod='g_productinstagram'}" class="g_title_hide" />
        <input type="hidden" value="{l s='The field' mod='g_productinstagram'}" class="gvalidate_1" />
        <input type="hidden" value="{l s='is required.' mod='g_productinstagram'}" class="gvalidate_4" />
        <input type="hidden" value="{l s=' is required at least in' mod='g_productinstagram'}" class="gvalidate_2" />
        <input type="hidden" value="{l s='Please, you check again value Config for Template!' mod='g_productinstagram'}" class="gvalidate_3" />
        <input type="hidden" class="g_title_approve" value="{l s='Active' mod='g_productinstagram'}" />
        <input type="hidden" class="g_title_view_post" value="{l s='View Post' mod='g_productinstagram'}" />
        <input type="hidden" class="g_load_more" value="{l s='Load more' mod='g_productinstagram'}" />
        <input type="hidden" class="g_show_img_remove_notactive" value="{l s='Removed the disabled image' mod='g_productinstagram'}" />
        <input type="hidden" class="g_show_img_errorgetHashtag" value="{l s='There are no images to display' mod='g_productinstagram'}" />
        <input type="hidden" class="g_show_img_nullval_getHashtag" value="{l s='You must fill hashtag field' mod='g_productinstagram'}" />
        <input type="hidden" class="g_title_add_tag" value="{l s='Assign product' mod='g_productinstagram'}" />
        {*setting config embed*}
        <input type="hidden" name="gendcursor" value="" class="g_end_cursor" />
        <input type="hidden" name="gendcursor" value="{$gendcursor|escape:'htmlall':'UTF-8'}" class="g_dataend_cursor" />
        <input type="hidden" value="{$config_account['GLOBO_SET_TOKEN']|escape:'htmlall':'UTF-8'}" class="gaccess_tokent" />
        <input type="hidden" value="{$config_account['GLOBO_SET_UID']|escape:'htmlall':'UTF-8'}" class="gaccess_uid" />
        <input type="hidden" value="" class="gbusiness_js" />
        <input type="hidden" value="" class="gnewtoken_js" />
        <input type="hidden" value="{$gid_Config|escape:'htmlall':'UTF-8'}" class="gid_Config" />
        <input type="hidden" value="{$g_urlnext_id|escape:'htmlall':'UTF-8'}" class="g_urlnext_id" />
        <input type="hidden" value="{$countDataproduct|escape:'htmlall':'UTF-8'}" class="g_notnull_dataproduct" />
        <input type="hidden" value="{$g_url_back_id|escape:'htmlall':'UTF-8'}" class="g_url_back_id" />
        {*ajax product*}
        <input type="hidden" class="controller_searchProduct" value="{$link->getAdminLink('AdminGetInformation')|addslashes|escape:'htmlall':'UTF-8'}&searchProduct" />
        <input type="hidden" class="controller_getOneIns" value="{$link->getAdminLink('AdminGetInformation')|addslashes|escape:'htmlall':'UTF-8'}&getOneIns" />
        <input type="hidden" class="controller_getCombination1" value="{$link->getAdminLink('AdminGetInformation')|addslashes|escape:'htmlall':'UTF-8'}&getCombination" />
        <input type="hidden" class="controller_addTag" value="{$link->getAdminLink('AdminProcessInfo')|addslashes|escape:'htmlall':'UTF-8'}&addTag" />
        <input type="hidden" class="controller_changeStatus" value="{$link->getAdminLink('AdminProcessInfo')|addslashes|escape:'htmlall':'UTF-8'}&changeStatus" />
        <input type="hidden" class="controller_removeStatusImg" value="{$link->getAdminLink('AdminProcessInfo')|addslashes|escape:'htmlall':'UTF-8'}&removeStatusImg" />
        <input type="hidden" class="controller_getAllByid" value="{$link->getAdminLink('AdminProcessInfo')|addslashes|escape:'htmlall':'UTF-8'}&getAllByid" />
        <input type="hidden" class="controller_checkImgByidData" value="{$link->getAdminLink('AdminProcessInfo')|addslashes|escape:'htmlall':'UTF-8'}&checkImgByidData" />
        <input type="hidden" class="controller_checkurl_acount" value="{$link->getAdminLink('AdminProcessInfo')|addslashes|escape:'htmlall':'UTF-8'}&checkurlAcount" />
        <input type="hidden" class="controller_jsonEncode" value="{$link->getAdminLink('AdminProcessInfo')|addslashes|escape:'htmlall':'UTF-8'}&controller_jsonEncode" />
        {*end*}
        {*get data *}
        <input type="hidden" class="g_All_dataImg" value="{$All_dataImg|escape:'htmlall':'UTF-8'}"/>
        {*end*}
        <div class="col-lg-9">
            <span class="switch prestashop-switch fixed-width-lg g_template_config_2 g_template_config">
                <input type="radio" name="tem_sli_autorun" id="tem_sli_autorun_on" value="1" {if $fields_value['tem_sli_autorun'] == 1}checked="checked"{/if} />
                <label for="tem_sli_autorun_on">{l s='Yes' mod='g_productinstagram'}</label>
                <input type="radio" name="tem_sli_autorun" id="tem_sli_autorun_off" value="0" {if $fields_value['tem_sli_autorun'] == 0}checked="checked"{/if} />
                <label for="tem_sli_autorun_off">{l s='No' mod='g_productinstagram'}</label>
                <a class="slide-button btn"></a>
            </span>
        </div>
    {else if $input.type == 'switch_ful_autoload'}
        <div class="col-lg-9">
            <span class="switch prestashop-switch fixed-width-lg g_template_config_1 g_template_config">
                <input type="radio" name="tem_ful_autoload" id="tem_ful_autoload_on" value="1" {if $fields_value['tem_ful_autoload'] == 1}checked="checked"{/if} />
                <label for="tem_ful_autoload_on">{l s='Yes' mod='g_productinstagram'}</label>
                <input type="radio" name="tem_ful_autoload" id="tem_ful_autoload_off" value="0" {if $fields_value['tem_ful_autoload'] == 0}checked="checked"{/if} />
                <label for="tem_ful_autoload_off">{l s='No' mod='g_productinstagram'}</label>
                <a class="slide-button btn"></a>
            </span>
        </div>
    {else if $input.type == 'switch_Zoom_img'}
        <div class="col-lg-9">
            <span class="switch prestashop-switch fixed-width-lg">
                <input type="radio" name="gZoomImgHover" id="gZoomImgHover_on" value="1" {if $fields_value['gZoomImgHover'] == 1}checked="checked"{/if} />
                <label for="gZoomImgHover_on">{l s='Yes' mod='g_productinstagram'}</label>
                <input type="radio" name="gZoomImgHover" id="gZoomImgHover_off" value="0" {if $fields_value['gZoomImgHover'] == 0}checked="checked"{/if} />
                <label for="gZoomImgHover_off">{l s='No' mod='g_productinstagram'}</label>
                <a class="slide-button btn"></a>
            </span>
        </div>
    {else if $input.type == 'switch_ShowTag_img'}
        <div class="col-lg-9">
            <span class="switch prestashop-switch fixed-width-lg">
                <input type="radio" name="gShowImgTag" id="gShowImgTag_on" value="1" {if $fields_value['gShowImgTag'] == 1}checked="checked"{/if} />
                <label for="gShowImgTag_on">{l s='Yes' mod='g_productinstagram'}</label>
                <input type="radio" name="gShowImgTag" id="gShowImgTag_off" value="0" {if $fields_value['gShowImgTag'] == 0}checked="checked"{/if} />
                <label for="gShowImgTag_off">{l s='No' mod='g_productinstagram'}</label>
                <a class="slide-button btn"></a>
            </span>
        </div>
    {else if $input.type == 'switch_ShowTagHover_img'}
        <div class="col-lg-9">
            <span class="switch prestashop-switch fixed-width-lg">
                <input type="radio" name="gShowImgTagHover" id="gShowImgTagHover_on" value="1" {if $fields_value['gShowImgTagHover'] == 1}checked="checked"{/if} />
                <label for="gShowImgTagHover_on">{l s='Yes' mod='g_productinstagram'}</label>
                <input type="radio" name="gShowImgTagHover" id="gShowImgTagHover_off" value="0" {if $fields_value['gShowImgTagHover'] == 0}checked="checked"{/if} />
                <label for="gShowImgTagHover_off">{l s='No' mod='g_productinstagram'}</label>
                <a class="slide-button btn"></a>
            </span>
        </div>
    {else if $input.type == 'switch_ShowTagProductHover_img'}
        <div class="col-lg-9">
            <span class="switch prestashop-switch fixed-width-lg">
                <input type="radio" name="ShowTagProductHover_img" id="ShowTagProductHover_img_on" value="1" {if $fields_value['ShowTagProductHover_img'] == 1}checked="checked"{/if} />
                <label for="ShowTagProductHover_img_on">{l s='Yes' mod='g_productinstagram'}</label>
                <input type="radio" name="ShowTagProductHover_img" id="ShowTagProductHover_img_off" value="0" {if $fields_value['ShowTagProductHover_img'] == 0}checked="checked"{/if} />
                <label for="ShowTagProductHover_img_off">{l s='No' mod='g_productinstagram'}</label>
                <a class="slide-button btn"></a>
            </span>
        </div>
    {else if $input.type == 'general_tab_configphoto'}
        <div id="photo">
            <div class="form-group">
                <label class="control-label col-lg-3">
                {l s='Border Radius' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <select name="gborderRadiusImg" class=" fixed-width-xl" id="gborderRadiusImg">
                        <option value="0" {if $fields_value['gborderRadiusImg'] == 0} selected="selected"{/if}>{l s='None border' mod='g_productinstagram'}</option>
                        <option value="5" {if $fields_value['gborderRadiusImg'] == 5} selected="selected"{/if}>5px</option>
                        <option value="10" {if $fields_value['gborderRadiusImg'] == 10} selected="selected"{/if}>10px</option>
                        <option value="15" {if $fields_value['gborderRadiusImg'] == 15} selected="selected"{/if}>15px</option>
                        <option value="20" {if $fields_value['gborderRadiusImg'] == 20} selected="selected"{/if}>20px</option>
                        <option value="25" {if $fields_value['gborderRadiusImg'] == 25} selected="selected"{/if}>25px</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Margin Photo' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <select name="marginimg" class=" fixed-width-xl" id="marginimg">
                        <option value="0" {if $fields_value['marginimg'] == 0} selected="selected"{/if}>0px</option>
                        <option value="2" {if $fields_value['marginimg'] == 2} selected="selected"{/if}>2px</option>marginimg
                        <option value="5" {if $fields_value['marginimg'] == 5} selected="selected"{/if}>5px</option>
                        <option value="10" {if $fields_value['marginimg'] == 10} selected="selected"{/if}>10px</option>
                        <option value="15" {if $fields_value['marginimg'] == 15} selected="selected"{/if}>15px</option>
                        <option value="20" {if $fields_value['marginimg'] == 20} selected="selected"{/if}>20px</option>
                    </select>
                    <p class="help-block">
                        {l s='Customize space between two images of the gallery' mod='g_productinstagram'}
                    </p>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Zoom on Hover?' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="gZoomImgHover" id="gZoomImgHover_on" value="1" {if $fields_value['gZoomImgHover'] == 1} checked="checked"{/if}/>
                        <label for="gZoomImgHover_on">{l s='Yes' mod='g_productinstagram'}</label>
                        <input type="radio" name="gZoomImgHover" id="gZoomImgHover_off" value="0" {if $fields_value['gZoomImgHover'] == 0} checked="checked"{/if}/>
                        <label for="gZoomImgHover_off">{l s='No' mod='g_productinstagram'}</label>
                        <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Show Product Tag' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="gShowImgTag" id="gShowImgTag_on" value="1" {if $fields_value['gShowImgTag'] == 1} checked="checked"{/if}/>
                    <label for="gShowImgTag_on">{l s='Yes' mod='g_productinstagram'}</label>
                    <input type="radio" name="gShowImgTag" id="gShowImgTag_off" value="0" {if $fields_value['gShowImgTag'] == 0} checked="checked"{/if}/>
                    <label for="gShowImgTag_off">{l s='No' mod='g_productinstagram'}</label>
                    <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <div class="form-group ghover-showtag">
                <label class="control-label col-lg-3">
                    {l s='Show Product Tag on hover' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="gShowImgTagHover" id="gShowImgTagHover_on" value="1" {if $fields_value['gShowImgTagHover'] == 1} checked="checked"{/if}/>
                    <label for="gShowImgTagHover_on">{l s='Yes' mod='g_productinstagram'}</label>
                    <input type="radio" name="gShowImgTagHover" id="gShowImgTagHover_off" value="0" {if $fields_value['gShowImgTagHover'] == 0} checked="checked"{/if} />
                    <label for="gShowImgTagHover_off">{l s='No' mod='g_productinstagram'}</label>
                    <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Display call to action button?' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="gcallaction" id="gcallaction_on" value="1" {if $fields_value['gcallaction'] == 1} checked="checked"{/if}/>
                    <label for="gcallaction_on">{l s='Yes' mod='g_productinstagram'}</label>
                    <input type="radio" name="gcallaction" id="gcallaction_off" value="0" {if $fields_value['gcallaction'] == 0} checked="checked"{/if}/>
                    <label for="gcallaction_off">{l s='No' mod='g_productinstagram'}</label>
                    <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Display Instagram Icon?' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="gallicon" id="gallicon_on" value="1" {if $fields_value['gallicon'] == 1} checked="checked"{/if}/>
                    <label for="gallicon_on">{l s='Yes' mod='g_productinstagram'}</label>
                    <input type="radio" name="gallicon" id="gallicon_off" value="0" {if $fields_value['gallicon'] == 0} checked="checked"{/if}/>
                    <label for="gallicon_off">{l s='No' mod='g_productinstagram'}</label>
                    <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <div class="gshow_icon">          
                <div class="form-group hide">
                    <label class="control-label col-lg-3">
                    <b>{l s='Icon:' mod='g_productinstagram'}</b>{l s='Show?' mod='g_productinstagram'}
                    </label>
                    <div class="col-lg-9">
                        <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="icon_show" id="icon_show_on" value="1" checked="checked"/>
                        <label for="icon_show_on">{l s='Yes' mod='g_productinstagram'}</label>
                        <input type="radio" name="icon_show" id="icon_show_off" value="0"/>
                        <label for="icon_show_off">{l s='No' mod='g_productinstagram'}</label>
                        <a class="slide-button btn"></a>
                        </span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">
                        <b>{l s='Icon:' mod='g_productinstagram'}</b>{l s='Color' mod='g_productinstagram'}
                    </label>
                    <div class="col-lg-9">
        				<div class="col-lg-2">
        					<div class="row">
        						<div class="input-group">
        							<input data-hex="true" type="color" name="icon_color" value="{$fields_value['icon_color']|escape:'html':'UTF-8'}" />
        						</div>
        					</div>
        				</div>
        			</div>
                </div>
            </div>
        </div>
    {else if $input.type == 'general_tab_button'}
        <div class="show-button-action">
            <div class="form-group textbt">
                <label class="control-label col-lg-3">
                    {l s='Text for call to action.' mod='g_productinstagram'}
                </label>
                {foreach from=$languages item=language}
    				{if $languages|count > 1}
    					<div class="translatable-field lang-{$language.id_lang|escape:'html':'UTF-8'}" {if $language.id_lang != $defaultFormLanguage}style="display:none"{/if}>
    				{/if}
    					<div class="col-lg-10">
    						<input type="text" class="textshopit" name="textshopit_{$language.id_lang|escape:'html':'UTF-8'}" value="{$textshopit[$language.id_lang]|escape:'html':'UTF-8'}"/>
                            <p class="help-block">
                                {l s='Customize text for your call to action button. By default: it is "Shop It". Leave it empty to hide the button' mod='g_productinstagram'}
                            </p>
                        </div>
    				{if $languages|count > 1}
    					<div class="col-lg-2">
    						<button type="button" class="btn btn-default dropdown-toggle" tabindex="-1" data-toggle="dropdown">
    							{$language.iso_code|escape:'html':'UTF-8'}
    							<span class="caret"></span>
    						</button>
    						<ul class="dropdown-menu">
    							{foreach from=$languages item=lang}
    							<li><a href="javascript:hideOtherLanguage({$lang.id_lang|escape:'html':'UTF-8'});" tabindex="-1">{$lang.name|escape:'html':'UTF-8'}</a></li>
    							{/foreach}
    						</ul>
    					</div>
    				{/if}
    				{if $languages|count > 1}
    					</div>
    				{/if}
    			{/foreach}
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                {l s='Show background?' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="shopit_show_bg" id="shopit_show_bg_on" value="1" {if $fields_value['shopit_show_bg'] == 1}checked="checked"{/if}/>
                    <label for="shopit_show_bg_on">{l s='Yes' mod='g_productinstagram'}</label>
                    <input type="radio" name="shopit_show_bg" id="shopit_show_bg_off" value="0" {if $fields_value['shopit_show_bg'] == 0}checked="checked"{/if}/>
                    <label for="shopit_show_bg_off">{l s='No' mod='g_productinstagram'}</label>
                    <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Background' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
    				<div class="col-lg-2">
    					<div class="row">
    						<div class="input-group">
    							<input data-hex="true" type="color" name="bg_shopit" value="{$fields_value['bg_shopit']|escape:'html':'UTF-8'}" />
    						</div>
    					</div>
    				</div>
    			</div>
                <p class="help-block">
                    {l s='Customize background color for Call to  Action Button "Shop It"' mod='g_productinstagram'}
				</p>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Border color' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
    				<div class="col-lg-2">
    					<div class="row">
    						<div class="input-group">
    							<input data-hex="true" type="color" name="shopit_border_color" value="{$fields_value['shopit_border_color']|escape:'html':'UTF-8'}" />
    						</div>
    					</div>
    				</div>
    			</div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Border size' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <select name="shopit_border_size" class="fixed-width-xl" id="shopit_border_size">
                        <option value="0" {if $fields_value['shopit_border_size'] == 0}selected="selected"{/if}>{l s='None border' mod='g_productinstagram'}</option>
                        <option value="1" {if $fields_value['shopit_border_size'] == 1}selected="selected"{/if}>1px</option>
                        <option value="2" {if $fields_value['shopit_border_size'] == 2}selected="selected"{/if}>2px</option>
                        <option value="3" {if $fields_value['shopit_border_size'] == 3}selected="selected"{/if}>3px</option>
                        <option value="4" {if $fields_value['shopit_border_size'] == 4}selected="selected"{/if}>4px</option>
                        <option value="5" {if $fields_value['shopit_border_size'] == 5}selected="selected"{/if}>5px</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Text color' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
    				<div class="col-lg-2">
    					<div class="row">
    						<div class="input-group">
    							<input data-hex="true" type="color" name="shopit_color_text" value="{$fields_value['shopit_color_text']|escape:'html':'UTF-8'}" />
    						</div>
    					</div>
    				</div>
    			</div>
            </div>
        </div>
    {else if $input.type == 'general_tab_popup'}
        <div id="popup">
            <div class="form-group">
                <label class="control-label col-lg-3">
                {l s='Show product image?' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="showimg" id="showimg_on" value="1" {if $fields_value['showimg'] ==1}checked="checked"{/if}/>
                    <label for="showimg_on">{l s='Yes' mod='g_productinstagram'}</label>
                    <input type="radio" name="showimg" id="showimg_off" value="0" {if $fields_value['showimg'] ==0}checked="checked"{/if}/>
                    <label for="showimg_off">{l s='No' mod='g_productinstagram'}</label>
                    <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                {l s='Show combination?' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="showcombination" id="showcombination_on" value="1" {if $fields_value['showcombination'] ==1}checked="checked"{/if}/>
                    <label for="showcombination_on">{l s='Yes' mod='g_productinstagram'}</label>
                    <input type="radio" name="showcombination" id="showcombination_off" value="0" {if $fields_value['showcombination'] ==0}checked="checked"{/if}/>
                    <label for="showcombination_off">{l s='No' mod='g_productinstagram'}</label>
                    <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                {l s='Show price?' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="showprice" id="showprice_on" value="1" {if $fields_value['showprice'] ==1}checked="checked"{/if}/>
                    <label for="showprice_on">{l s='Yes' mod='g_productinstagram'}</label>
                    <input type="radio" name="showprice" id="showprice_off" value="0" {if $fields_value['showprice'] ==0}checked="checked"{/if}/>
                    <label for="showprice_off">{l s='No' mod='g_productinstagram'}</label>
                    <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                {l s='Show "add to cart" button?' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="showaddcart" id="showaddcart_on" value="1" {if $fields_value['showaddcart'] ==1}checked="checked"{/if}/>
                    <label for="showaddcart_on">{l s='Yes' mod='g_productinstagram'}</label>
                    <input type="radio" name="showaddcart" id="showaddcart_off" value="0" {if $fields_value['showaddcart'] ==0}checked="checked"{/if}/>
                    <label for="showaddcart_off">{l s='No' mod='g_productinstagram'}</label>
                    <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Show Instagram Post Caption?' mod='g_productinstagram'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="ShowTagProductHover_img" id="ShowTagProductHover_img_on" value="1" {if $fields_value['ShowTagProductHover_img'] ==1}checked="checked"{/if}/>
                    <label for="ShowTagProductHover_img_on">{l s='Yes' mod='g_productinstagram'}</label>
                    <input type="radio" name="ShowTagProductHover_img" id="ShowTagProductHover_img_off" value="0" {if $fields_value['ShowTagProductHover_img'] ==0}checked="checked"{/if}/>
                    <label for="ShowTagProductHover_img_off">{l s='No' mod='g_productinstagram'}</label>
                    <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
        </div>
    {else if $input.type == 'NavTabsInstagram'}
        </div>
        </div>
        <div id="{$input.name|escape:'html':'UTF-8'}" class="fromconfigtabs {if isset($input.class)}{$input.class|escape:'html':'UTF-8'}{/if}">

        <div>
        <div>
    {else if $input.type == 'gCloseTab'}
        </div>
    {else if $input.type == 'settingHashtag'}
    {*setting hashtag*}
            <div class="content_setting">
                <div id="setting_hashtags">
                    <div class="form-group">
                        <label class="control-label col-lg-3">
                            {l s='Photo Source:' mod='g_productinstagram'}
                        </label>
                        <div class="col-lg-9">
                            <div class="radio col-lg-4">
                				<label for="getimge_account_on">
                				    <input type="radio" name="getimge_account" id="getimge_account_on" value="1"  checked="checked" onchange="getImgByAccount(true)" />
                                    {l s='From Your Account' mod='g_productinstagram'}
                                </label>
                			</div>
                            <div class="radio col-lg-4" style="display: none;">
                				<label for="getimge_account_off">
                				    <input type="radio" name="getimge_account" id="getimge_account_off" value="0" onchange="getImgByAccount(false)" disabled="disabled"/>
                                    {l s='By Hashtag' mod='g_productinstagram'}
                                </label>
                			</div>
                        </div>
                    </div>
                    <div class="form-group g_Setting_Account" {if $config_account['GLOBO_SET_UID'] == '' && $config_account['GLOBO_SET_TOKEN'] == ''} style="display:block;"{/if}>
                        <div class="form-group">
                            <div class="control-label col-lg-3">
                                {l s='Select Acount Instagram' mod='g_productinstagram'}
                            </div>
                            <div class="col-lg-3">
                                <select class="get_acount" name="id_acount">
                                    <option value="" selected="selected">-- {l s='Choose Acount' mod='g_productinstagram'} --</option>
                                	{foreach from=$list_acount item=acount key=key name=name}
                                		<option value="{$acount.id_account|intval}">{$acount.instagram_user|escape:'htmlall':'UTF-8'}</option>
                                	{/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group g_None_SettingAccount col-lg-4" >
                        <label class="control-label col-lg-3">
                            {l s='Post Type' mod='g_productinstagram'}
                        </label>
                        <div class="col-lg-9">
                            <select name="gtabpost" id="gtabpost" onchange="Gtab_post(this.value)">
                                <option value="g_Toppost" {if $gtabpost == 'g_Toppost' } selected="selected"{/if}>{l s='Top Post' mod='g_productinstagram'}</option>
                                <option value="g_Mostrecent" {if $gtabpost == 'g_Mostrecent' } selected="selected"{/if}>{l s='Most Recent' mod='g_productinstagram'}</option>
                            </select>
                        </div>
                    </div>
                    <div class="g_None_SettingAccount col-lg-8">
                        <div class="form-group col-lg-6">
                            <label class="control-label col-lg-3">
                                {l s='HashTag' mod='g_productinstagram'}
                            </label>
                            <div class="input-group col-lg-9">
                                <input placeholder="{l s='#Hashtag' mod='g_productinstagram'}" type="text" value="{$hashtagssearch|escape:'htmlall':'UTF-8'}" name="hashtagssearch" id="hashtagssearch" autocomplete="on"/>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <button type="button" id="get_imgInstagram " class="btn btn-default" onclick="clickgetImg()">
    							<i class="icon-plus-sign"></i>
    							{l s='Search' mod='g_productinstagram'}
    						</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="shortcode">
                            <div class="panel-heading">{l s='SEARCH RESULT' mod='g_productinstagram'}
                                <div class="g_instagramImg_setting">
                                    <div class="checkbox">
                                        <label for="gcheckAllImg">
                                            <input type="checkbox" name="gcheckAll" id="gcheckAllImg">
                                            {l s='Select All' mod='g_productinstagram'}
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="detail">
                                <p class="help-block text-center no_img">{l s='Sorry, we could not find any results for this search.' mod='g_productinstagram'}<br />{l s='Maybe give one of these a try?' mod='g_productinstagram'}</p>
                                <div class="get_all">
                                    <div class="row margin-bottom g_Account_img_instagram">
                                        <div class="col-lg-12">
                                            <div class="row g_addAccount_img_instagram"></div>
                                            <div class="form-group g_pageAcountnotDiv_newonline">
                                                <span class="g_loading_img"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row margin-bottom g_Toppost_SettingAccount" style="display: block">
                                        <div class="col-lg-12">
                                            <div class="row addTop_img_instagram"></div>
                                            <div class="form-group g_pageTop_newonline" style="display: none;">
                                                <span class="g_loading_img"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row margin-bottom g_Mostrecent_SettingAccount">
                                        <div class="col-lg-12">
                                            <div class="row add_img_instagram"></div>
                                            <div class="form-group g_loadingicon_newonline" style="display: none;">
                                                <span class="g_loading_img"></span>
                                            </div>
                                            <div class="form-group g_Button_loadmore" style="display: block;">
                                                <button type="button" id="g_load_imghashtag" class="btn btn-primary" onclick="gLoadimgTag()">Load More</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="shortcode">
                            <div class="panel-heading">{l s='ACTIVE PHOTOS' mod='g_productinstagram'}</div>
                            <div class="detail gadd_g_Allimg_setting">{if !empty($ImgConfigs)}
                                    {foreach $ImgConfigs  key=kimg item=Itemimg}
                                        <div class="col-md-3 col-sm-4 col-xs-6 {$Itemimg['ins_id']|escape:'htmlall':'UTF-8'} item_" id="{if isset($Itemimg['configman']) && $Itemimg['configman']}{$Itemimg['configman']|escape:'htmlall':'UTF-8'}{/if}">
                                            <div class="margin_bottom_10 g_l_i">
                                                <div class="clickview">
                                                    {if $Itemimg['status'] == 1}
                                                        <button type="button" class="buton_stt" data-status="1">{l s='Remove' mod='g_productinstagram'}</button>
                                                    {else}
                                                        <button type="button" class="buton_stt" data-status="0">{l s='Active' mod='g_productinstagram'}</button>
                                                    {/if}
                                                    <button type="button" class="add_tag_product info-data" data-toggle="modal" data-target="#myModal" data-id-gimg-selected="{$Itemimg['ins_id']|escape:'htmlall':'UTF-8'}" id="{$Itemimg['ins_id']|escape:'htmlall':'UTF-8'}" data-date="{$Itemimg['ins_created_time']|escape:'htmlall':'UTF-8'}" data-link="{$Itemimg['ins_link']|escape:'htmlall':'UTF-8'}" data-like="{$Itemimg['ins_like']|escape:'htmlall':'UTF-8'}" data-caption="{$Itemimg['ins_caption']|escape:'htmlall':'UTF-8'}" data-ins-shortcode="{$Itemimg['ins_shortcode']|escape:'htmlall':'UTF-8'}">{l s='Assign product' mod='g_productinstagram'}</button>
                                                    {if isset($Itemimg['ins_shortcode']) && $Itemimg['ins_shortcode'] !=''}
                                                        <a href="https://www.instagram.com/p/{$Itemimg['ins_shortcode']|escape:'htmlall':'UTF-8'}" target="_blank" class="view_post">{l s='View post' mod='g_productinstagram'}</a>
                                                    {/if}
                                                </div>
                                                <a class="g_bo_link">
                                                    <img src="{$Itemimg['url_img']|escape:'htmlall':'UTF-8'}" onload="checkloadimagead($(this),$('#template').val())"/>
                                                    {if isset($Itemimg['list_product']) && $Itemimg['list_product'] && count($Itemimg['list_product']) > 0}
                                                        {$i = 1}
                                                        {foreach $Itemimg['list_product'] key=kk item=ii}
                                                            <span class="g_item_tag_bo" style="left: {$ii.percentX|escape:'htmlall':'UTF-8'}%; top: {$ii.percentY|escape:'htmlall':'UTF-8'}%;">{$i++|escape:'htmlall':'UTF-8'}</span>
                                                        {/foreach}
                                                    {/if}
                                                </a>
                                            </div>
                                        </div>
                                    {/foreach}
                                {/if}</div>
                            {if empty($ImgConfigs)}
                                <div class="row margin-bottom g_Allimg_setting">
                                    <div class="col-lg-10 col-lg-offset-1 col-md-11 col-md-offset-1 col-sm-12 col-xs-12">
                                        <div class="form-group gno_available_img" {if $countDataproduct <= 0} style="display:block;"{/if}>
                                            <div class="list-empty-msg G_noneset">
                                                <i class="icon-warning-sign list-empty-icon"></i>
                                                {l s='There is no available Image.' mod='g_productinstagram'}
                    						</div>
                                        </div>
                                        <div class="form-group gloading_img">
                                            <span class="g_loading_img"></span>
                                        </div>
                                        {*<div class="form-group g_remove_img_notactive" {if $countDataproduct > 0} style="display:block;"{/if}>
                                            <button type="button" id="g_remove_img_notactive" class="btn btn-primary" onclick="g_remove_imgNotactive()">{l s='Remove All Image Not Active' mod='g_productinstagram'}</button>
                                        </div>*}
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>
                
                <!-- Main Popup -->
                <div id="g_popup_main">
                    <div id="myModal" class="modal fade" role="dialog">
                      <div class="modal-dialog">        
                        <!-- Modal content-->
                        <div class="modal-content">
                          <div class="modal-body" id="g_getcontent_ins">
                                <div class="col-lg-8 col-sm-8 col-xs-12 g_m_i">
                                    <div class="g_img">
                                        <img src="" />
                                        <div class="g_popup_form_pro_tag">
                                            <input type="hidden" class="percentX" value="" />
                                            <input type="hidden" class="percentY" value="" />
                                            <input type="hidden" class="price_comb" value="" />
                                            <form class="hide">
                                                
                                            </form>
                                            <form id="g_form_tag">                                
                                                <input type="hidden" name="g_action_pro" class="g_act_pro" />
                                                <ul>
                                                    <li>
                                                        <label>{l s='Search Product' mod='g_productinstagram'}<span style="color:red">*</span></label>
                                                        <input type="text" placeholder="{l s='Searchable by product name, id, sku.' mod='g_productinstagram'}" name="g_s_pro" class="g_search_pro" />
                                                    </li>
                                                    <li class="_select_cmb_pro">
                                                    </li>
                                                    <li>
                                                        <input type="hidden" class="g_s_id_pro" name="g_s_id_pro" value="" />
                                                    </li>
                                                    <li class="ginsproducted">
                                                        <span class="gimged"></span>
                                                        <span class="gnamed"></span>
                                                        <span class="gcombination"></span>
                                                    </li>
                                                    <li class="g_action_add_tag">
                                                        <button class="btn btn-warning btn-sm g_cancel_tag">{l s='Close' mod='g_productinstagram'}</button>
                                                        <button class="btn btn-info btn-sm g_add_tag add_tag" data-type="add">{l s='Add Product' mod='g_productinstagram'}</button>
                                                        <button class="g_add_tag edit_tag btn" data-type="edit">{l s='Edit Tag' mod='g_productinstagram'}</button>
                                                        <span class="g_waiting_icon" style="display:none" title="{l s='Waiting' mod='g_productinstagram'}"></span>
                                                        <span class="g_success_icon" style="display:none" title="{l s='Add Success' mod='g_productinstagram'}"></span>
                                                        <span class="g_error_icon" style="display:none" title="{l s='Process Error' mod='g_productinstagram'}"></span>
                                                    </li>
                                                </ul>
                                            </form>
                                        </div>
                                        <div class="g_list_tag_pro">
                                        </div>
                                    </div>
                                </div>
                                <div class="g_tag_product col-lg-4 col-sm-4 col-xs-12">
                                    <h4>{l s='List of products assigned to the image' mod='g_productinstagram'}</h4>
                                    <div class="g_list_tag g_maxheight">
                                        <ul>
                                        </ul>
                                    </div>
                                    <div class="g_not_pro_tag" style="display:none">{l s='No tagged products.' mod='g_productinstagram'}</div>
                                    <!-- Get value new tag -->
                                    <div style="display:none" id="g_get_value_tag">
                                        <input type="hidden" class="g_tag_new_note" value="" />
                                        <input type="hidden" class="g_tag_new_url" value="" />
                                        <input type="hidden" class="g_tag_new_id_ins" value="" />
                                        <input type="hidden" class="g_tag_new_id" value="" />
                                        <input type="hidden" class="g_tag_new_x" value="" />
                                        <input type="hidden" class="g_tag_new_y" value="" />
                                        <input type="hidden" class="g_tag_new_img" value="" />
                                        <input type="hidden" class="g_tag_new_name" value="" />
                                        <input type="hidden" class="g_tag_edit_id" value="" />
                                        <input type="hidden" class="g_tag_new_cmb" value="" />
                                        <input type="hidden" class="g_tag_edit_cmb" value="" />
                                        <input type="hidden" class="g_tag_new_id_cmb" value="" />
                                        <input type="hidden" class="g_tag_edit_id_cmb" value="" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                          </div>
                          <div class="modal-footer">
                              <p><code>{l s='Tips: ' mod='g_productinstagram'}</code>{l s='Click to an area of image to assign product' mod='g_productinstagram'}</p>
                            <button type="button" class="btn btn-default" data-dismiss="modal">{l s='Close' mod='g_productinstagram'}</button>
                          </div>
                        </div>
                    
                      </div>
                    </div>
                </div>
                <!-- #Main Popup -->
            </div>
            {*end*}
    {*else if $input.type == 'imgtemplate'}
        <ul class="gimgtemplate col-lg-9">
            <li class="gtem_1 {if $fields_value['template'] == 1 || $fields_value['template'] == ''}gactivetem{/if}"><a><img src="{$fields_value['url_module']|escape:'htmlall':'UTF-8'}/views/img/admin/template/template_1.jpg" /></a></li>
            <li class="gtem_2 {if $fields_value['template'] == 2}gactivetem{/if}"><a><img src="{$fields_value['url_module']|escape:'htmlall':'UTF-8'}/views/img/admin/template/template_2.jpg" /></a></li>
            <li class="gtem_3 {if $fields_value['template'] == 3}gactivetem{/if}"><a><img src="{$fields_value['url_module']|escape:'htmlall':'UTF-8'}/views/img/admin/template/template_3.jpg" /></a></li>
        </ul>
        <style type="text/css">
            .gimgtemplate {
                padding:0;
            }
            .gimgtemplate li {
                list-style: none;
                display: none;
            }
            .gimgtemplate li img {
                max-width: 100%;
            }
            .gimgtemplate .gactivetem {
                display:block !important;
            }
            #gembedinstagram_form .help-block {
                clear:both;
            }
        </style>*}
    {else if $input.type == 'globo_screen_column_f'}
        {if $fields_value['screen_column_f'] == '' || !isset($fields_value['screen_column_f'])}
            {$val_col = ''}    
        {else}
            {$val_col = explode(',',$fields_value['screen_column_f'])}
        {/if}
        <div class="globo_wrap_screen_ins globo_wrap_screen_ins_1 col-lg-9">
            <div>
                <input type="hidden" class="screen_column_f screen_column" name="screen_column_f" value="{if $fields_value['screen_column_f'] != ''}{$fields_value['screen_column_f']|escape:'htmlall':'UTF-8'}{else}{$fields_value['tem_ful_column']|escape:'htmlall':'UTF-8'},5,4,3,2,2{/if}" />
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>1200px</b></span>
                    <input type="text" class="form-control g_template_config_1 g_template_config g_config_screen_col validate_isInt" value="{if $val_col != '' && is_array($val_col)}{$val_col[1]|escape:'htmlall':'UTF-8'}{else}5{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>992px</b></span>
                    <input type="text" class="form-control g_template_config_1 g_template_config g_config_screen_col validate_isInt" value="{if $val_col != '' && is_array($val_col)}{$val_col[2]|escape:'htmlall':'UTF-8'}{else}4{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>768px</b></span>
                    <input type="text" class="form-control g_template_config_1 g_template_config g_config_screen_col validate_isInt" value="{if $val_col != '' && is_array($val_col)}{$val_col[3]|escape:'htmlall':'UTF-8'}{else}3{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>480px</b></span>
                    <input type="text" class="form-control g_template_config_1 g_template_config g_config_screen_col validate_isInt" value="{if $val_col != '' && is_array($val_col)}{$val_col[4]|escape:'htmlall':'UTF-8'}{else}2{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>320px</b></span>
                    <input type="text" class="form-control g_template_config_1 g_template_config g_config_screen_col validate_isInt" value="{if $val_col != '' && is_array($val_col)}{$val_col[5]|escape:'htmlall':'UTF-8'}{else}2{/if}" />
                </div>
            </div>
        </div>
    {else if $input.type == 'globo_screen_column_s'}
        {if $fields_value['screen_column_s'] == '' || !isset($fields_value['screen_column_s']) }
            {$val_col2 = ''}    
        {else}
            {$val_col2 = explode(',',$fields_value['screen_column_s'])}
        {/if}
        <div class="globo_wrap_screen_ins globo_wrap_screen_ins_2 col-lg-9">
            <div>
                <input type="hidden" class="screen_column_s screen_column" name="screen_column_s" value="{if $fields_value['screen_column_s'] != ''}{$fields_value['screen_column_s']|escape:'htmlall':'UTF-8'}{else}{$fields_value['tem_sli_column']|escape:'htmlall':'UTF-8'},4,3,3,2,2{/if}" />
            </div>
            <div class="row">
                <div class="col-lg-2">
                    <div class="input-group">
                        <span class="input-group-addon"><b>1200px</b></span>
                        <input type="text" class="form-control g_template_config_2 g_template_config g_config_screen_col validate_isInt" value="{if $val_col2 != '' && is_array($val_col2)}{$val_col2[1]|escape:'htmlall':'UTF-8'}{else}4{/if}" />
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="input-group">
                        <span class="input-group-addon"><b>992px</b></span>
                        <input type="text" class="form-control g_template_config_2 g_template_config g_config_screen_col validate_isInt" value="{if $val_col2 != '' && is_array($val_col2)}{$val_col2[2]|escape:'htmlall':'UTF-8'}{else}3{/if}" />
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="input-group">
                        <span class="input-group-addon"><b>768px</b></span>
                        <input type="text" class="form-control g_template_config_2 g_template_config g_config_screen_col validate_isInt" value="{if $val_col2 != '' && is_array($val_col2)}{$val_col2[3]|escape:'htmlall':'UTF-8'}{else}3{/if}" />
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="input-group">
                        <span class="input-group-addon"><b>480px</b></span>
                        <input type="text" class="form-control g_template_config_2 g_template_config g_config_screen_col validate_isInt" value="{if $val_col2 != '' && is_array($val_col2)}{$val_col2[4]|escape:'htmlall':'UTF-8'}{else}2{/if}" />
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="input-group">
                        <span class="input-group-addon"><b>320px</b></span>
                        <input type="text" class="form-control g_template_config_2 g_template_config g_config_screen_col validate_isInt" value="{if $val_col2 != '' && is_array($val_col2)}{$val_col2[5]|escape:'htmlall':'UTF-8'}{else}2{/if}" />
                    </div>
                </div>
            </div>
        </div>
    {else if $input.type == 'globo_screen_column_b'}
        {if $fields_value['screen_column_b'] == '' || !isset($fields_value['screen_column_b'])}
            {$val_col3 = ''}    
        {else}
            {$val_col3 = explode(',',$fields_value['screen_column_b'])}
        {/if}
        <div class="globo_wrap_screen_ins globo_wrap_screen_ins_3 col-lg-9">
            <div>
                <input type="hidden" class="screen_column_b screen_column" name="screen_column_b" value="{if $fields_value['screen_column_b'] != ''}{$fields_value['screen_column_b']|escape:'htmlall':'UTF-8'}{else}{$fields_value['tem_box_column']|escape:'htmlall':'UTF-8'},8,7,6,5,3{/if}" />
            </div>
            <div class="col-lg-2" style="padding-left:0">
                <div class="input-group">
                    <span class="input-group-addon"><b>1200px</b></span>
                    <input type="text" class="form-control g_template_config_3 g_template_config g_config_screen_col validate_isInt" value="{if $val_col3 != '' && is_array($val_col3)}{$val_col3[1]|escape:'htmlall':'UTF-8'}{else}8{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>992px</b></span>
                    <input type="text" class="form-control g_template_config_3 g_template_config g_config_screen_col validate_isInt" value="{if $val_col3 != '' && is_array($val_col3)}{$val_col3[2]|escape:'htmlall':'UTF-8'}{else}7{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>768px</b></span>
                    <input type="text" class="form-control g_template_config_3 g_template_config g_config_screen_col validate_isInt" value="{if $val_col3 != '' && is_array($val_col3)}{$val_col3[3]|escape:'htmlall':'UTF-8'}{else}6{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>480px</b></span>
                    <input type="text" class="form-control g_template_config_3 g_template_config g_config_screen_col validate_isInt" value="{if $val_col3 != '' && is_array($val_col3)}{$val_col3[4]|escape:'htmlall':'UTF-8'}{else}5{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>320px</b></span>
                    <input type="text" class="form-control g_template_config_3 g_template_config g_config_screen_col validate_isInt" value="{if $val_col3 != '' && is_array($val_col3)}{$val_col3[5]|escape:'htmlall':'UTF-8'}{else}3{/if}" />
                </div>
            </div>
        </div>
    {else if $input.type == 'globo_screen_column_m'}
        {if $fields_value['screen_column_m'] == '' || !isset($fields_value['screen_column_m'])}
            {$val_col4 = ''}    
        {else}
            {$val_col4 = explode(',',$fields_value['screen_column_m'])}
        {/if}
        <div class="globo_wrap_screen_ins globo_wrap_screen_ins_4 col-lg-9">
            <div>
                <input type="hidden" class="screen_column_m screen_column" name="screen_column_m" value="{if $fields_value['screen_column_m'] != ''}{$fields_value['screen_column_m']|escape:'htmlall':'UTF-8'}{else}{$fields_value['tem_mas_column']|escape:'htmlall':'UTF-8'},8,7,6,5,3{/if}" />
            </div>
            <div class="col-lg-2" style="padding-left:0">
                <div class="input-group">
                    <span class="input-group-addon"><b>1200px</b></span>
                    <input type="text" class="form-control g_template_config_4 g_template_config g_config_screen_col validate_isInt" value="{if $val_col4 != '' && is_array($val_col4)}{$val_col4[1]|escape:'htmlall':'UTF-8'}{else}8{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>992px</b></span>
                    <input type="text" class="form-control g_template_config_4 g_template_config g_config_screen_col validate_isInt" value="{if $val_col4 != '' && is_array($val_col4)}{$val_col4[2]|escape:'htmlall':'UTF-8'}{else}7{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>768px</b></span>
                    <input type="text" class="form-control g_template_config_4 g_template_config g_config_screen_col validate_isInt" value="{if $val_col4 != '' && is_array($val_col4)}{$val_col4[3]|escape:'htmlall':'UTF-8'}{else}6{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>480px</b></span>
                    <input type="text" class="form-control g_template_config_4 g_template_config g_config_screen_col validate_isInt" value="{if $val_col4 != '' && is_array($val_col4)}{$val_col4[4]|escape:'htmlall':'UTF-8'}{else}5{/if}" />
                </div>
            </div>
            <div class="col-lg-2">
                <div class="input-group">
                    <span class="input-group-addon"><b>320px</b></span>
                    <input type="text" class="form-control g_template_config_4 g_template_config g_config_screen_col validate_isInt" value="{if $val_col4 != '' && is_array($val_col4)}{$val_col4[5]|escape:'htmlall':'UTF-8'}{else}3{/if}" />
                </div>
            </div>
        </div>
    {else}
        {$smarty.block.parent}
    {/if}
{/block}