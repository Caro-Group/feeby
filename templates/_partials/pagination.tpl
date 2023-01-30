{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<nav class="pagination flex justify-center">

  {* <div class="col-xs-12 col-md-6 col-lg-4 text-md-left text-xs-center">
    {block name='pagination_summary'}
      {l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=['%from%' => $pagination.items_shown_from ,'%to%' => $pagination.items_shown_to, '%total%' => $pagination.total_items]}
    {/block}
  </div> *}

  <div class="col-xs-12 col-md-6 col-lg-8 mt-8 mb-[53px] tablet:mt-16 tablet:mb-[90px] mx-auto">
    {block name='pagination_page_list'}
      {if $pagination.should_be_displayed}
        <ul class="page-list clearfix text-md-right text-xs-center flex justify-center">
          {foreach from=$pagination.pages item="page"}
            {if $page.type === 'spacer'}
              <li class="hidden">
                <span class="spacer text-gray-3000 text-base">&hellip;</span>
              </li>
            {else if $page.type != 'previous' && $page.type != 'next'}
              <li
                class="{if $page.current}current relative after:-ml-4 after:absolute after:bg-main after:block
                  after:-bottom-2 after:content-[''] after:h-1 after:left-1/2 after:rounded-full after:w-8 js-search-link text-inherit {/if} font-normal hover:text-main-dark text-base text-gray-3000 hidden transition">
                <a rel="nofollow" href="{$page.url}"
                  class="text-inherit p-1 mx-2.5 {['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}">
                  {$page.page}
                </a>
              </li>
            {/if}
          {/foreach}
        </ul>

        <div class="flex flex-col">
          {foreach from=$pagination.pages item="page"}
            {if $page.type === 'previous'}
              <div class="w-full flex justify-center order-1">
                <a rel="previous" href="{$page.url}"
                  class="flex items-center border-0 border-b-[1px] border-black font-medium font-normal p-2 px-[30px] uppercase cursor-pointer transition duration-150 js-search-link prev {['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}">
                  {l s='Load Previous Products' d='Shop.Theme.Actions'}
                </a>
              </div>
            {elseif $page.type === 'next'}
              <div class="w-full flex justify-center order-2">
                <a rel="next" href="{$page.url}"
                  class="flex items-center bg-main hover:bg-main-hover border-none font-medium font-normal p-2 px-[30px] rounded-[23px] text-white hover:text-white uppercase cursor-pointer transition duration-150 next {['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}">
                  {l s='Load More Products' d='Shop.Theme.Actions'}
                </a>
              </div>
            {/if}
            
          {/foreach}
        </div>
      {/if}
    {/block}
  </div>

</nav>

{literal}
<script>
window.addEventListener('popstate', function (event) {
   location.reload();
});
</script>
{/literal}