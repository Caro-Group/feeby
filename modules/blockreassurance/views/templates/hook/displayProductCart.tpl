
<div class="flex flex-wrap">
    {foreach from=$blocks item=$block key=$key}
        <div class="w-full tablet-wide:w-1/2 flex items-center" {if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])} style="cursor:pointer;" onclick="window.open('{$block['link']}')"{/if}>
            <span class="flex item-product items-center">
                {if $block['icon'] != 'undefined'}
                    {if $block['icon']}
                    <img class="svg invisible" src="{$block['icon']}">
                    {elseif $block['custom_icon']}
                    <img {if $block['is_svg']}class="svg invisible" {/if}src="{$block['custom_icon']}">
                    {/if}
                {/if}
            </span>
            <div class="flex flex-col items-start">
                {if empty($block['description'])}
                    <p class="block-title" style="color:{$textColor};">{$block['title']}</p>
                {else}
                    <span class="block-title" style="color:{$textColor};">{$block['title']}</span>
                    <p style="color:{$textColor};">{$block['description'] nofilter}</p>
                {/if}
            </div>
        </div>
    {/foreach}
</div>