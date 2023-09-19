<hr class="mb-5 tablet:mb-2.5 bg-gray-2000">
<div class="flex flex-wrap">
{foreach from=$blocks item=$block key=$key}
    <div class="flex items-center mx-auto w-full desktop-presta:w-1/2" >
        <div class="flex items-center justify-start desktop-presta:w-full max-w-full group" {if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])} style="cursor:pointer;" onclick="window.open('{$block['link']}')"{/if} >
                <span class="flex item-product items-center mr-[5px] desktop-presta:mr-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="25" viewBox="0 0 24 25" fill="none">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M18.726 7.26794C19.0911 7.62544 19.0914 8.20536 18.7266 8.56322L9.38255 17.7314C9.20735 17.9033 8.96963 17.9999 8.72173 18C8.47382 18.0001 8.23606 17.9036 8.06077 17.7317L4.27372 14.0197C3.90881 13.662 3.90881 13.0821 4.27372 12.7244C4.63863 12.3667 5.23026 12.3667 5.59517 12.7244L8.72116 15.7885L17.4045 7.26859C17.7693 6.91072 18.3609 6.91043 18.726 7.26794Z" fill="#232322"/>
                    </svg>
                </span>
            <div class="flex flex-col items-start {if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])} group-hover:underline {/if}">
                {if empty($block['description'])}
                    <p class="text-base text-main-dark font-body font-normal text-center tablet:text-left">{$block['title']}</p>
                {else}
                    <span class="block-title" style="color:{$textColor};">{$block['title']}</span>
                    <p class="text-main-dark">{$block['description'] nofilter}</p>
                {/if}
            </div>
        </div>
    </div>
{/foreach}
</div>