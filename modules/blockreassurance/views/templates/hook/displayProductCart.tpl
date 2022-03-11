
<div class="flex flex-wrap pb-11 tablet:pb-0 tablet:pl-[95px] -mx-5 tablet:mx-0">
{foreach from=$blocks item=$block key=$key}
    <div class="flex items-center justify-center mt-7 tablet:mt-0 mx-auto desktop-presta:w-1/2 w-full" {if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])} style="cursor:pointer;" onclick="window.open('{$block['link']}')"{/if}>
        <div class="flex flex-col tablet:flex-row items-center justify-start w-[200px] max-w-full">
            {if $block['icon'] != 'undefined'}
                <span class="flex item-product items-center tablet:mr-2">
                    {if $block['icon']}
                        <img class="w-[45px] h-[45px] tablet:w-[40px] tablet:h-[40px]" src="{$block['icon']}" width="40" height="40">
                    {elseif $block['custom_icon']}
                        <img class="w-[45px] h-[45px] tablet:w-[40px] tablet:h-[40px]" src="{$block['custom_icon']}" width="40" height="40">
                    {/if}
                </span>
            {/if}
            <div class="flex flex-col items-start">
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