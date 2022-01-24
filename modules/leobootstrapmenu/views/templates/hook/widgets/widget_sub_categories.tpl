{* 
* @Module Name: Leo Bootstrap Menu
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  Leotheme
*}

<div class="leo-widget" data-id_widget="{$id_widget}">
{if isset($subcategories)}
    <div class="widget-subcategories">
        {if isset($widget_heading)&&!empty($widget_heading)}
        <div class="widget-heading show-desktop hide-mobile mb-2 menu-title">
                {$widget_heading}
        </div>
        {/if}
        <div class="widget-inner">
            {if $cat->id_category != ''}
                <ul class="col-count-mob-one text-base" style="{if $id_widget == '1638828508'}column-count:3;{/if}{if $id_widget == '1638828714'}column-count:3;{/if}{if $id_widget == '1638836284'}column-count:3;{/if}{if $id_widget == '1638836384'}column-count:2;{/if}">
                {foreach from=$subcategories item=subcategory}
                    <li class="clearfix {if isset($subcategory.subsubcategories)}level2 dropdown mb-2{/if}">
                        <a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{$subcategory.name|escape:'htmlall':'UTF-8'}" class="img font-normal mr-2 {if $page_name == 'category' && isset($subcategory.id_category)}{if $category.id == $subcategory.id_category || $category.id_parent == $subcategory.id_category}text-main{else}text-main-dark{/if}{else}text-main-dark{/if}" {if isset($subcategory.id_category)}data-category-id="{$subcategory.id_category}"{/if}>
                                {$subcategory.name|escape:'htmlall':'UTF-8'} 
                        </a>
                        {if isset($subcategory.subsubcategories) && $subcategory.subsubcategories}
                            <b class="caret {if $level3_only_mobile}hidden-lg-up{/if}"></b>
                            <ul class="dropdown-sub dropdown-menu tablet-medium:rounded-md tablet-medium:shadow-lg {if $level3_only_mobile}hidden-lg-up{/if}" style="display:none;">
                                {foreach from=$subcategory.subsubcategories item=subsubcategory}
                                    <li class="clearfix level3 text-base" {if $show_widget_bo == 'admin'}style="margin-left: 20px;"{/if}>
                                        <a href="{$link->getCategoryLink($subsubcategory.id_category, $subsubcategory.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{$subsubcategory.name|escape:'htmlall':'UTF-8'}" class="img font-light {if $page_name == 'category' && isset($subsubcategory.id_category)}{if $category.id == $subsubcategory.id_category || $category.id_parent == $subsubcategory.id_category}text-main{else}text-main-dark{/if}{else}text-main-dark{/if}" {if isset($subsubcategory.id_category)}data-category-id="{$subsubcategory.id_category}"{/if}>
                                            {$subsubcategory.name|escape:'htmlall':'UTF-8'} 
                                        </a>
                                    </li>
                                {/foreach}
                                
                            </ul>
                        {/if}
                    </li>
                {/foreach}
                </ul>
            {else}
                <div class="alert alert-warning">
                    {l s='The ID category does not exist' mod='leobootstrapmenu'}
                </div>
            {/if}
        </div>
    </div>
	{literal}
		<style>@media(max-width:992px){.col-count-mob-one{column-count:1!important;}}</style>
	{/literal}
{/if} 
{if $show_widget_bo == 'admin'}
    <div class="w-name">
        <select name="inject_widget" class="inject_widget_name">
            {foreach from=$widgets item=w}
                <option value="{$w['key_widget']}">
                    {$w['name']}
                </option>
            {/foreach}
        </select>
    </div>
{/if}
</div>
