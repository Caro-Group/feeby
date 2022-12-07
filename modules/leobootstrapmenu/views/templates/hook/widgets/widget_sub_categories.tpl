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
        <div class="widget-heading px-4 pb-4 pt-[14px] tablet-wide:px-0 tablet-medium:pt-0 relative tablet-medium:font-header tablet-medium:pb-1 my-0 tablet-medium:mb-5 border-0 tablet-medium:w-min border-0 border-b-2 border-gray-2000 tablet-medium:border-main border-solid tablet-medium:border-b-[3px] tablet-medium:rounded-b-sm"
        data-toggle="dropdown" aria-expanded="false"
        >
             <span class="inline-block font-body tablet-medium:font-header tablet-medium:italic tablet-medium:uppercase text-xl tablet-medium:text-base text-main-dark font-normal tablet-medium:font-light">{$widget_heading}</span>
             <b class=" tablet-wide:hidden caret before:text-main-dark text-2xl transition"></b>   
        </div>
        {/if}
        <div class="widget-inner {if isset($widget_heading)&&!empty($widget_heading)} dropdown-menu {/if} ">
            {if $cat->id_category != ''}
                <ul class="col-count-mob-one text-base" style="{if $id_widget == '1638828508'}column-count:3;{/if}{if $id_widget == '1638828714'}column-count:3;{/if}{if $id_widget == '1638836284'}column-count:3;{/if}{if $id_widget == '1638836384' || $id_widget == '1643878774' || $id_widget == '1643879539' || $id_widget == '1643880292'}column-count:2;{/if}">
			{$count_sub = 0}
                {foreach from=$subcategories item=subcategory name=subcategory}
                    {if $subcategory.description|strstr:"<!-- ARTYSTA -->" !== "<!-- ARTYSTA -->"}
					   {$count_sub = $count_sub + 1}
                        <li class="{if isset($subcategory.id_category) && (($id_widget == '1638828714' && $subcategory.id_category == 194) || ($id_widget == '1638836284' && $subcategory.id_category == 312) || ($id_widget == '1638836384' && $subcategory.id_category == 413))}hidden{/if} clearfix {if isset($subcategory.subsubcategories)}level2 dropdown relative border-0 border-b border-gray-2000 border-solid tablet-medium:border-b-0 {/if} {if $id_widget == '1643877669' && $count_sub > 6}tablet-wide:hidden{/if}">
                            <a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{$subcategory.name|escape:'htmlall':'UTF-8'}" class="img font-normal mr-2 inline-block !px-4 !py-[18px] tablet-medium:!px-0 tablet-medium:!py-0 transition hover:text-main tablet-medium:mb-2 font-body text-main-dark text-base tablet-medium:font-light uppercase tablet-medium:normal-case " {if $id_widget == '1638828714' && isset($subcategory.id_category) && ($subcategory.id_category == 389 || $subcategory.id_category == 59 || $subcategory.id_category == 617)}style="
                                text-transform: uppercase;
                                font-weight: 400;
                            "{/if} {if isset($subcategory.id_category)}data-category-id="{$subcategory.id_category}"{/if}>
                                    {$subcategory.name|escape:'htmlall':'UTF-8'}
                            </a>
                            {if isset($subcategory.subsubcategories) && $subcategory.subsubcategories}
                                <b class=" {if $level3_only_mobile}tablet-wide:hidden{/if} caret before:text-main-dark text-2xl transition"></b>  
                                <ul class="dropdown-sub dropdown-menu {if $level3_only_mobile}hidden-lg-up{/if}" style="display:none;">
					               {$count_subsub = 0}  
                                    {foreach from=$subcategory.subsubcategories item=subsubcategory name=subsubcategory}
                                        {if $subsubcategory.description|strstr:"<!-- ARTYSTA -->" !== "<!-- ARTYSTA -->"}
										  {$count_subsub = $count_subsub + 1}
                                            <li class="clearfix level3 text-base my-3 ml-5 tablet-medium:ml-0 {if $id_widget == '1643877669' && $count_subsub > 6}tablet-wide:hidden{/if}" {if $show_widget_bo == 'admin'}style="margin-left: 20px;"{/if}>
                                                <a href="{$link->getCategoryLink($subsubcategory.id_category, $subsubcategory.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{$subsubcategory.name|escape:'htmlall':'UTF-8'}" class="img font-light text-main-dark" {if isset($subsubcategory.id_category)}data-category-id="{$subsubcategory.id_category}"{/if}>
                                                    {$subsubcategory.name|escape:'htmlall':'UTF-8'} 
                                                </a>
                                            </li>
                                        {/if}
                                    {/foreach}
                                </ul>
                            {/if}
                        </li>
                    {/if}
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
		<style>@media(max-width:992px){.col-count-mob-one{column-count:1!important;}}@media(min-width:992px){.tablet-wide\:hidden{display:none;}}</style>
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
