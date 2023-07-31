{* 
* @Module Name: Leo Bootstrap Menu
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  Leotheme
*}

<div class="leo-widget" data-id_widget="{$id_widget}">
{if isset($links)}
    <div class="widget-dropdown_container widget-links {if isset($widget_heading)&&!empty($widget_heading)} widget-closed {/if}">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="dropdown-widget menu-title border-0 border-b-2 border-gray-2000 border-solid !my-0 pb-4 pt-[14px] px-4 relative tablet-medium:border-b-[3px] tablet-medium:border-main font-body font-normal tablet-medium:!mb-5 tablet-medium:pb-1 tablet-medium:pt-0 tablet-medium:rounded-b-sm tablet-medium:w-min tablet-wide:px-0 ">
		<span class="inline-block font-body font-normal tablet-medium:uppercase text-xl tablet-medium:text-base text-main-dark ">
			{$widget_heading}
		</span>	
		<b class="caret tablet-wide:hidden caret before:text-main-dark text-2xl transition"></b>   
	</div>
	{/if}
	<div class="widget-inner {if isset($widget_heading)&&!empty($widget_heading)} dropdown-widget-inner {/if}">	
		<div id="tabs{$id}" class="panel-group">
			<ul class="nav-links">
				{foreach $links as $key => $ac}  
				<li class="border-0 border-b-2 border-gray-2000 border-solid tablet-medium:border-b-0"><a href="{$ac.link}" class="font-body text-xl !font-light inline-block !px-4 !pb-4 !pt-[14px] tablet-wide:!px-0 tablet-medium:!py-0 tablet-medium:mt-2 tablet-medium:hover:text-main transition duration-200 {if $page_name == 'category'}{if $category.id == $ac.cat_id || $category.id_parent == $ac.cat_id}text-main{else}text-main-dark{/if}{else}text-main-dark{/if}" {if isset($ac.cat_id)}data-category-id="{$ac.cat_id}"{/if}>{$ac.text}</a></li>
				{/foreach}
			</ul>
		</div>
	</div>
    </div>
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