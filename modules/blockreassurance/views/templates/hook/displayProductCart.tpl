
<div class="flex flex-wrap">
    {foreach from=$blocks item=$block key=$key}
        <div class="flex items-center phablet:justify-center mx-auto phablet:w-1/2 w-full" {if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])} style="cursor:pointer;" onclick="window.open('{$block['link']}')"{/if}>
            <div class="flex items-center justify-start w-[200px] max-w-full">
                {if $block['icon'] != 'undefined'}
                    <span class="flex item-product items-center mr-2">
                        {if $block['icon']}
                            <img src="{$block['icon']}" width="40" height="40">
                        {elseif $block['custom_icon']}
                            <img src="{$block['custom_icon']}" width="40" height="40">
                        {/if}
                    </span>
                {/if}
                <div class="flex flex-col items-start">
                    {if empty($block['description'])}
                        <p class="text-base text-[#414042] font-body" style="color:{$textColor};">{$block['title']}</p>
                    {else}
                        <span class="block-title" style="color:{$textColor};">{$block['title']}</span>
                        <p style="color:{$textColor};">{$block['description'] nofilter}</p>
                    {/if}
                </div>
            </div>
        </div>
    {/foreach}
</div>