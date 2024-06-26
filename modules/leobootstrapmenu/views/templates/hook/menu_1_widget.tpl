{*
* @Module Name: Leo Blog
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  Leotheme
* @description: Content Management
*}

{* function genMegaMenuByConfig *}
{if $menu.active == 1}
    <li data-menu-type="{$menu.type}"
        class="nav-item parent  {$menu.menu_class} {$class} {if $hascat}{$align}{/if} {$addwidget} {if isset($smarty.get) && isset($smarty.get.id_category) && $menu.item == $smarty.get.id_category} active {/if}"
        {$model->renderAttrs($menu)}>
        <a class="nav-link dropdown-toggle {if $hascat}has-category{/if} font-body text-main-dark text-base font-normal hidden tablet-medium:block"
            data-toggle="dropdown" href="{$model->getLink($menu)}" target="{$menu.target}">

            {if $menu.icon_class}
                {if $menu.icon_class != $menu.icon_class|strip_tags}
                    <span class="hasicon menu-icon-class">{$menu.icon_class nofilter}
                    {else}
                        <span class="hasicon menu-icon-class"><i class="{$menu.icon_class}"></i>
                        {/if}
                    {elseif $menu.image}
                        <span class="hasicon menu-icon"
                            style="background:url('{$model->image_base_url}{$menu.image}') no-repeat">
                        {/if}

                        {if $menu.show_title}
                            <span class="menu-title font-body text-main-dark text-base font-normal">{$menu.title}</span>
                        {/if}
                        {if $menu.text}
                            <span class="sub-title">{$menu.text}</span>
                        {/if}
                        {if $menu.description}
                            <span class="menu-desc">{$menu.description}</span>
                        {/if}
                        {if $menu.image || $menu.icon_class}
                        </span>
                    {/if}

                    {if $model->is_live_edit && $menu.is_group == 0}<b
                        class="caret before:text-main-dark text-2xl transition"></b>{/if}
        </a>
        {if !$model->is_live_edit && $menu.is_group == 0}<b
            class="caret before:text-main-dark text-2xl transition"></b>{/if}

        {if $menu.sub_with == 'widget'}
            <div class="dropdown-sub {if $menu.is_group == 1}dropdown-mega{else}dropdown-menu tablet-medium:rounded-b-md tablet-medium:shadow-lg {/if}"
                {$style nofilter}>
                <div class="dropdown-menu-inner flex flex-col-reverse tablet-medium:flex-col">
                    {foreach from=$menu.megaconfig->rows item=row}
                        <div class="row">
                            {foreach from=$row->cols item=col}
                                <div class="mega-col col-md-{$col->colwidth}" {$model->getColumnDataConfig($col)}>
                                    <div class="mega-col-inner{if isset($col->colclass)} {$col->colclass}{/if}">
                                        {$model->renderWidgetsInCol($col) nofilter}{* HTML form , no escape necessary *}
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/foreach}
                </div>
            </div>
        {/if}
    </li>
{/if}