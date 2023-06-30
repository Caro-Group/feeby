
<div class="flex flex-wrap pb-11 tablet:pb-0 ">
{foreach from=$blocks item=$block key=$key}
    <div class="flex items-center desktop-presta:justify-center mx-auto w-full desktop-presta:w-1/2" >
        <div class="flex items-center justify-start desktop-presta:w-[224px] max-w-full group" {if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])} style="cursor:pointer;" onclick="window.open('{$block['link']}')"{/if} >
            {if $block['icon'] != 'undefined'}
                <span class="flex item-product items-center mr-[30px] desktop-presta:mr-2">
                    {if $block['icon']}
                        <img class="w-[25px] h-[25px] desktop-presta:w-[40px] desktop-presta:h-[40px]" src="{$block['icon']}" width="40" height="40" alt="{$block.title}">
                    {elseif $block['custom_icon']}
                        <img class="w-[25px] h-[25px] desktop-presta:w-[40px] desktop-presta:h-[40px]" src="{$block['custom_icon']}" width="40" height="40" alt="{$block.title}">
                    {/if}
                </span>
            {/if}
            <div class="flex flex-col items-start {if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])} group-hover:underline {/if}">
                {if empty($block['description'])}
                    <p class="text-base text-main-dark font-body text-center">{$block['title']}</p>
                {else}
                    <span class="block-title" style="color:{$textColor};">{$block['title']}</span>
                    <p class="text-main-dark">{$block['description'] nofilter}</p>
                {/if}
            </div>
        </div>
    </div>
{/foreach}
</div>