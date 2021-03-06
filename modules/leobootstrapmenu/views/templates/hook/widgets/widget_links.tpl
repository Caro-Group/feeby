{* 
* @Module Name: Leo Bootstrap Menu
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  Leotheme
*}

<div class="leo-widget" data-id_widget="{$id_widget}">
{if isset($links)}
    <div class="widget-links mb-4">
	{if isset($widget_heading)&&!empty($widget_heading)}
	<div class="menu-title font-body text-main-dark text-base tablet-medium:font-header tablet-medium:italic tablet-medium:uppercase pb-1 mb-5 border-0 tablet-medium:border-b-[3px] rounded-b-sm border-main border-solid tablet-medium:w-min ">
		{$widget_heading}
	</div>
	{/if}
	<div class="widget-inner">	
		<div id="tabs{$id}" class="panel-group">
			<ul class="nav-links">
				{foreach $links as $key => $ac}  
					<li><a href="{$ac.link}" class="font-body text-base font-light mt-2 tablet-medium:hover:text-main transition duration-200 {if $page_name == 'category'}{if $category.id == $ac.cat_id || $category.id_parent == $ac.cat_id}text-main{else}text-main-dark{/if}{else}text-main-dark{/if}" {if isset($ac.cat_id)}data-category-id="{$ac.cat_id}"{/if}>{$ac.text}</a></li>
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