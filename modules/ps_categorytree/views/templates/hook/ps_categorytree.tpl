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

{function name="categories" nodes=[] depth=0}
  {strip}
    {if $nodes|count}
      <ul class="category-sub-menu">
        {foreach from=$nodes item=node}
          {if $node.desc|strstr:"<!-- ARTYSTA -->" !== "<!-- ARTYSTA -->"}
          <li data-depth="{$depth}" {if isset($node.id)}data-cat-id="{$node.id}"{/if}>
            {if $depth===0}
              <a href="{$node.link}" {if isset($category.id) && $node.id == $category.id}class="selected"{/if}>{$node.name}</a>
              {if $node.children}
                <div class="navbar-toggler collapse-icons float-right relative bottom-2" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="material-icons text-3xl text-main-dark transition transform rotate-180"></i>
                </div>
                <div class="collapse mt-5 bg-gray-1000" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {else}
              <a class="category-sub-link" href="{$node.link}" {if isset($category.id) && $node.id == $category.id}class="selected"{/if}>{$node.name}</a>
              {if $node.children}
                <span class="arrows" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="fa fa-caret-right arrow-right"></i>
                  <i class="fa fa-caret-down arrow-down"></i>
                </span>
                <div class="collapse" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {/if}
          </li>
         {/if}
        {/foreach}
      </ul>
    {/if}
  {/strip}
{/function}

<div class="hidden-sm-down pt-12">
  <h4 class="title_block mb-3"><a class="text-2xl font-light text-main-dark" href="{$categories.link nofilter}">{$categories.name}</a></h4>
  <div class="block_content">
    <ul class="category-top-menu">
      <li class="border-0 border-gray-1000 border-solid border-t pl-5 py-[18px]" data-id="">{categories nodes=$categories.children}</li>
    </ul>
  </div>
</div>
