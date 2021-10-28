<div class="flex flex-col">
    {foreach from=$blocks item=$block key=$key}
        <div class="flex flex-row items-center mb-4" {if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])} style="cursor:pointer;" onclick="window.open('{$block['link']}')"{/if}>
            <span class="flex w-10 h-10 mr-4">
                {if $block['icon'] != 'undefined'}
                    {if $block['icon']}
                    <img class="svg" src="{$block['icon']}">
                    {elseif $block['custom_icon']}
                    <img {if $block['is_svg']} class="svg" {/if} src="{$block['custom_icon']}">
                    {/if}
                {/if}
            </span>
            <div class="flex flex-col">
                {if empty($block['description'])}
                <p class="font-bold uppercase" style="color:{$textColor};">{$block['title']}</p>
                {else}
                <span class="font-bold uppercase" style="color:{$textColor};">{$block['title']}</span>
                <p class="text-xs" style="color:{$textColor};">{$block['description'] nofilter}</p>
            </div>
            {/if}
        </div>
    {/foreach}
    <div class="clearfix"></div>
</div>