{*
* Do not edit the file if you want to upgrade the module in future.
* 
* @author    Globo Jsc <contact@globosoftware.net>
* @copyright 2016 Globo., Jsc
* @link	     http://www.globosoftware.net/
* @license   please read license in file license.txt
*/
*}

<input type="hidden" class="controller_searchProduct" value="{$link->getAdminLink('AdminGetInformation')|addslashes|escape:'htmlall':'UTF-8'}&searchProduct" />
<input type="hidden" class="controller_getOneIns" value="{$link->getAdminLink('AdminGetInformation')|addslashes|escape:'htmlall':'UTF-8'}&getOneIns" />
<input type="hidden" class="controller_getCombination1" value="{$link->getAdminLink('AdminGetInformation')|addslashes|escape:'htmlall':'UTF-8'}&getCombination" />
<input type="hidden" class="controller_addTag" value="{$link->getAdminLink('AdminProcessInfo')|addslashes|escape:'htmlall':'UTF-8'}&addTag" />
<input type="hidden" class="controller_changeStatus" value="{$link->getAdminLink('AdminProcessInfo')|addslashes|escape:'htmlall':'UTF-8'}&changeStatus" />
<input type="hidden" class="confirm_del" value="{l s='Are you sure!' mod='g_productinstagram'}" />
<input type="hidden" class="g_load_more" value="{l s='Load more' mod='g_productinstagram'}" />
<input type="hidden" class="g_title_hide" value="{l s='Enable, click to hide the image on FO' mod='g_productinstagram'}" />
<input type="hidden" class="g_title_approve" value="{l s='Disable, click to show the image on FO' mod='g_productinstagram'}" />
<input type="hidden" class="g_not_active" value="{$get_not_active|escape:'htmlall':'UTF-8'}"/>
<input type="hidden" class="g_taged_active" value="{$get_taged_active|escape:'htmlall':'UTF-8'}"/>
<input type="hidden" class="g_count_itemins" value=""/>
<input type="hidden" class="g_ins_uid" value="{Configuration::get('GLOBO_SET_UID',null,null,$id_shop)|escape:'htmlall':'UTF-8'}" />
<input type="hidden" class="g_ins_access" value="{Configuration::get('GLOBO_SET_TOKEN',null,null,$id_shop)|escape:'htmlall':'UTF-8'}" />
<div class="alert alert-info" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    <i class="material-icons"></i><p class="alert-text">{l s='Click on an image to tag product' mod='g_productinstagram'}</p>
</div>
<div id="g_manager_ins">
    <div class="panel">
        <div class="panel-heading"><i class="icon-list"></i>{l s=' Manager Instagram' mod='g_productinstagram'}</div>
        <div class="alert alert-warning g_error_api" style="display:none">
            <span>{l s='The Access_token or User ID provided is invalid.' mod='g_productinstagram'}</span> 
        </div>        
        <div class="alert alert-warning g_error_shop" style="display:none">
            <span>{l s='Please, you check again ShopMultipe.' mod='g_productinstagram'}</span> 
        </div>
        <div class="alert alert-warning g_api_null" style="display:none">
            <span>{l s='Null' mod='g_productinstagram'}</span> 
        </div>
        <!-- Get list Ins -->
        <div id="g_list_ins">
            <div class="g_overflow"></div>
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
                                            <button class="g_add_tag edit_tag" data-type="edit">{l s='Edit Tag' mod='g_productinstagram'}</button>
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
                        <div class="g_not_pro_tag" style="display:none">{l s='Not Products Tag' mod='g_productinstagram'}</div>
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