{if $breadcrumb.count < 3}
    <a class="tablet:hidden block mt-6 mb-5 text-main-dark" href="{$breadcrumb.links[0]['url']}" title="{$breadcrumb.links[0]['title']}">
      <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" class="mr-2 fill-current"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" ></path></svg>
    </a>
   {else}
    <a class="tablet:hidden block mt-6 mb-5 text-main-dark" href="{$breadcrumb.links[count($breadcrumb.links)-2]['url']}" title="{$breadcrumb.links[count($breadcrumb.links)-2]['title']}">
      <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" class="mr-2 fill-current"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" ></path></svg>
    </a>
{/if}