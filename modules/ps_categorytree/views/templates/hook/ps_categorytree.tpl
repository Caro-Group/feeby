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
            {assign var="activeNested" value=false}
            {if $node.children}
                {if $c_tree_path && in_array($node.id, $c_tree_path)}
                  {assign var="activeNested" value=true}
                {/if}
            {/if}
          <li class="border-0 border-white border-solid border-t flex justify-between items-center flex-wrap" data-depth="{$depth}" {if isset($node.id)}data-cat-id="{$node.id}"{/if}>
            {if $depth===0}
              <a href="{$node.link}" class="{if $node.children} max-w-[calc(100%_-_32px)] {/if} {if isset($category.id) && $node.id == $category.id}selected{/if}">{$node.name}</a>
              {if $node.children}
                <div class="grow navbar-toggler collapse-icons float-right cursor-pointer p-3 pr-5 {if isset($category.id) && $node.id != $category.id && $activeNested == false } collapsed {/if}" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="!block !ml-auto material-icons select-none text-3xl text-main-dark transition transform rotate-180"></i>
                </div>
                <div class="w-full bg-gray-1000 {if isset($category.id) && $node.id == $category.id || $activeNested == true} collapse in {else} collapse {/if}" id="exCollapsingNavbar{$node.id}">
                  {categories nodes=$node.children depth=$depth+1}
                </div>
              {/if}
            {else}
              <a class="category-sub-link {if $node.children} max-w-[calc(100%_-_32px)] {/if} {if isset($category.id) && $node.id == $category.id}selected{/if}" href="{$node.link}">{$node.name}</a>
              {if $node.children}
                <div class="grow navbar-toggler collapse-icons float-right cursor-pointer p-3 pr-5 {if isset($category.id) && $node.id != $category.id && $activeNested == false } collapsed {/if}" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="!block !ml-auto material-icons select-none text-3xl text-main-dark transition transform rotate-180"></i>
                </div>
                <div class="w-full bg-white bg-opacity-50 {if isset($category.id) && $node.id == $category.id || $activeNested == true } collapse in {else} collapse {/if} " id="exCollapsingNavbar{$node.id}">
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

<div class="hidden-sm-down pt-3">
  <span class="inline-block text-2xl font-light text-main-dark mb-3">{l s='Categories' d='Shop.Theme.Catalog'}</span>
  <div class="block_content">
    {if !empty($categories.children)}
      {foreach from=$categories.children item=categoryLvl2}
        {if $c_tree_path && in_array($categoryLvl2.id, $c_tree_path) || ($category.level_depth == 2 && $category.id == $categoryLvl2.id)}
          {if $categoryLvl2|count && !empty($categoryLvl2.children)}
            <ul class="category-sub-menu">
              {categories nodes=$categoryLvl2.children}
            </ul>
          {/if}
        {/if}
      {/foreach}
    {/if}
  </div>
</div>

