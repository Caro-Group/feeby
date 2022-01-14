{*
* Do not edit the file if you want to upgrade the module in future.
* 
* @author    Globo Jsc <contact@globosoftware.net>
* @copyright 2016 Globo., Jsc
* @link	     http://www.globosoftware.net/
* @license   please read license in file license.txt
*/
*}
{if isset($data)}
{*<span class="gfancybox-load prev-gload snptico-left-gload " ng-click="loadPreviousItem()"><i class="fa fa-chevron-left" aria-hidden="true"></i></span>
<span class="gfancybox-load next-gload snptico-right-gload" ng-click="loadNextItem()"><i class="fa fa-chevron-right" aria-hidden="true"></i></span>*}
<div class="gmainpopup_ins">
    <div class="gimg_ins">
        <div class="gwrapimgins">
            <img src="{$data['ins_img']|escape:'htmlall':'UTF-8'}"/>
            <div class="g_list_tag_pro">
                {$i = 1}
                {foreach $list_product as $k => $list_products}
                    <a target="_blank" href="{$list_products['url']|escape:'htmlall':'UTF-8'}" rel="nofollow" id="g_tag_point_{$k|escape:'htmlall':'UTF-8'}" data-id="{$data['ins_id']|escape:'htmlall':'UTF-8'}" data-id1="{$k|escape:'htmlall':'UTF-8'}" class="g_item_tag" data-x="{$list_products['percentX']|escape:'htmlall':'UTF-8'}" data-y="{$list_products['percentY']|escape:'htmlall':'UTF-8'}" style="left: {$list_products['percentX']|escape:'htmlall':'UTF-8'}%; top: {$list_products['percentY']|escape:'htmlall':'UTF-8'}%;">
                        <div>{$i|escape:'htmlall':'UTF-8'}</div>
                        <div class="fs-overlink-text g_arrow_{$k|escape:'htmlall':'UTF-8'}">       
                            <div class="fs-arrow-up"></div>{$list_products['name']|escape:'htmlall':'UTF-8'}{if $list_products['combination']|escape:'htmlall':'UTF-8'} - {$list_products['combination']|escape:'htmlall':'UTF-8'}{/if}
                        </div>
                    </a>
                    {$i = $i + 1}
                {/foreach}
            </div>
        </div>
    </div>

    <div class="gproduct_ins">
        {*<h4>{l s='Products' mod='g_productinstagram'}</h4>*}
        {if isset($data.ins_shortcode) && $data.ins_shortcode != ''}
            <div class="author_instagram">
                <input type="hidden" class="ins_shortcode" value="{$data.ins_shortcode|escape:'htmlall':'UTF-8'}">
                <input type="hidden" class="id_g_productinstagram" value="{$data.id_g_productinstagram|escape:'htmlall':'UTF-8'}"/>
                <div class="author_thumb"><a href="" target="_blank"><img src=""/></a></div>
                <div class="author_name">
                    <a href="" target="_blank"><h3>{l s='Not user name' mod="g_productinstagram"}</h3></a>
                    <p>{l s='Not user full name' mod="g_productinstagram"}</p>
                </div>
                <a class="btn btn-default follow" href="" target="_blank">{l s='follow' mod="g_productinstagram"}</a>
            </div>
        {/if}
        <div class="g_list_tag g_maxheight_ins">
            {if count($list_product) > 0 }
                {$i = 1}
                <h3>{l s='Related products' mod='g_productinstagram'}</h3>
                <ul>
                    {foreach $list_product as $k => $list_products}
                        <li>
                            <div class="g_pro_selected" data-id="{$k|escape:'htmlall':'UTF-8'}" id="_{$k|escape:'htmlall':'UTF-8'}" data-id-pro="{$list_products['id']|escape:'htmlall':'UTF-8'}" data-url="{$list_products['url']|escape:'htmlall':'UTF-8'}" data-x="{$list_products['percentX']|escape:'htmlall':'UTF-8'}" data-y="{$list_products['percentY']|escape:'htmlall':'UTF-8'}">
                                <div class="g_pro_selected_change">
                                    <div class="gimgleft">
                                        <span class="gindex_ins">{$i|escape:'htmlall':'UTF-8'}</span>
                                        {if $data['showimg'] == 1}
                                        <a href="{$list_products['url']|escape:'htmlall':'UTF-8'}" target="_blank">
                                            <img src="{$list_products['img']|escape:'htmlall':'UTF-8'}" width="70" />
                                        </a>
                                        {/if}
                                    </div>
                                    <div class="gmetaright">
                                        <a href="{$list_products['url']|escape:'htmlall':'UTF-8'}" target="_blank" class="g_name_tag">{$list_products['name']|escape:'htmlall':'UTF-8'}</a>
                                        {if $data['showcombination'] == 1}
                                            <span class="combi">{$list_products['combination']|escape:'htmlall':'UTF-8'}</span>
                                        {/if}
                                        <div class="g_instagram-variants">
                                        {if $list_products['AttributesGroups']}
                                            <select class="form-control form-control-select" name="group_attribute" data-id-product="{$list_products['id']|escape:'htmlall':'UTF-8'}"> 
                                                {foreach from=$list_products['AttributesGroups'] item=combination}
                                                    <option value="{$combination['id_product_attribute']|escape:'html':'UTF-8'}" {$combination['selected']|escape:'html':'UTF-8'}>
                                                        {$combination['attributes']|escape:'html':'UTF-8'}
                                                    </option> 
                                                {/foreach}
                                            </select>
                                        {else}
                                            <span class="g_instagram-variants-notitem"></span>
                                        {/if}
                                        </div>
                                        {if $data['showprice'] == 1}
                                            <b class="extraprice">{$list_products['price']|escape:'htmlall':'UTF-8'}</b>
                                        {/if}
                                        {if $data['showaddcart'] == 1}
                                            <div class="button-container">
                                                {if $list_products['addtocart'] == 1}                                        
                                                    <a href="{$list_products['linkaddcart']|escape:'htmlall':'UTF-8'}" data-id-product="{$list_products['id']|escape:'htmlall':'UTF-8'}" data-id-product-attribute="{$list_products['id_combination']|escape:'htmlall':'UTF-8'}" rel="nofollow" title="Add to cart" class="gaddcartins ajax_add_to_cart_button">{l s='Add To Cart' mod='g_productinstagram'}</a>
                                                {else}
                                                    <a href="{$list_products['linkaddcart']|escape:'htmlall':'UTF-8'}" data-id-product="{$list_products['id']|escape:'htmlall':'UTF-8'}" rel="nofollow" title="View Product" class="gaddcartins">{l s='View Product' mod='g_productinstagram'}</a>
                                                {/if}
                                            </div>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                        </li>
                        {$i = $i + 1}
                    {/foreach}
                </ul>
            {else}
                <h5>{l s='No tagged products.' mod='g_productinstagram'}</h5>
            {/if}
        </div>
        {if $data['ShowTagProductHover_img'] == 1 && $data["ins_caption"] !=''}
            <div class="caption_g">
            	<p class="ins_caption list-inline no-print">
                    {assign var="ins_captionArray" value=$data["ins_caption"]|replace:'%20':' '|replace:'\n':' <br/> '|replace:'%0A':' <br/> '}
                    {assign var="ins_captions" value=" "|explode:$ins_captionArray}
                    {foreach $ins_captions key=Kins_caption item=Iins_captions}
                        {if $Iins_captions == "<br/>"}
                            <br />
                        {else}
                            {if $Iins_captions|strpos:"#" === false}
                                {$Iins_captions|escape:'htmlall':'UTF-8'}
                            {else}
                                {assign var="count_g" value=$Iins_captions|strpos:"#"}
                                {assign var="substr_captions" value=$Iins_captions|substr:$count_g:1000}
                                {assign var="jALl_captions" value="#"|explode:$substr_captions}
                                {if $count_g == 1 || $count_g == 0}
                                    {assign var="substrT_captions" value=$Iins_captions|substr:0:$count_g}
                                    {$substrT_captions|escape:'htmlall':'UTF-8'}
                                {/if}
                                {foreach $jALl_captions key=kalltag item=ialltag}
                                    {if !empty($ialltag)}
                                        <a class="ghashtag" href="https://www.instagram.com/explore/tags/{$ialltag|escape:'htmlall':'UTF-8'}" target="_blank">#{$ialltag|escape:'htmlall':'UTF-8'}</a>
                                    {/if}
                                {/foreach}
                            {/if}
                        {/if}
                    {/foreach}
            	</p>
            </div>
            <div class="date_like">
                <b> <i class="fa fa-heart-o"></i><div class="count_like">{$data['ins_like']|escape:'htmlall':'UTF-8'}</div> {l s='Likes' mod='g_productinstagram'}</b> <span>{$data['ins_created_time']|escape:'htmlall':'UTF-8'}</span>
            </div>
         {/if}
    </div>
</div>
{/if}