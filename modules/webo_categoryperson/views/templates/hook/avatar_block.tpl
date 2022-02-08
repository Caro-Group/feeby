
<a href="{$avatarLink}" class="flex flex-row flex-wrap border-2 border-solid border-gray-default p-[10px] rounded-[5px] mb-[40px] hover:border-main group transition float-left">
    <img src="{$avatarImage}" class="rounded-full mr-[10px]" width="55px" height="55px"/>

    <span class="flex flex-col flex-wrap justify-center">
        <span class="block text-base text-gray-3000 leading-none font-normal">{l s='Designer' d='Shop.Theme.Catalog'}</span>
        <span class="font-header text-main-dark italic font-light text-base leading-normal">{$category->name}</span>
    </span>
    <svg class="ml-4 my-auto mr-3 group-hover:ml-7 transition-all" xmlns="http://www.w3.org/2000/svg" width="7" height="14" fill="none"><path d="M7 6.175.868 0H.867L0 .873l5.782 5.739-5.78 5.737.866.873L7 7.048v-.873Z" fill="#232322"/></svg>
</a>
<div class="clearfix"></div>