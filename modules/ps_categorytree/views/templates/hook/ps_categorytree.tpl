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
          {if isset($node.id) && $node.id != 595 && $node.id != 583 && $node.id != 584 && $node.id != 585 && $node.id != 587 && $node.id != 586 && $node.id != 588 && $node.id != 589 && $node.id != 590 && $node.id != 594 && $node.id != 591 && $node.id != 592 && $node.id != 592 && $node.id != 593 && $node.id != 612 && $node.id != 615 && $node.id != 616 && $node.id != 670 && $node.id != 704 && $node.id != 671 && $node.id != 672 && $node.id != 673 && $node.id != 702 && $node.id != 703 && $node.id != 705 && $node.id != 706 && $node.id != 707 && $node.id != 708 && $node.id != 709 && $node.id != 711 && $node.id != 712 && $node.id != 713 && $node.id != 714 && $node.id != 715 && $node.id != 716 && $node.id != 717 && $node.id != 718 && $node.id != 719 && $node.id != 720 && $node.id != 721 && $node.id != 722 && $node.id != 724 && $node.id != 727 && $node.id != 728 && $node.id != 773 && $node.id != 775 && $node.id != 787  && $node.id != 787  && $node.id != 790 && !$node.desc|strstr:"<!-- ARTYSTA -->"}
          <li data-depth="{$depth}" {if isset($node.id)}data-cat-id="{$node.id}"{/if}>
            {if $depth===0}
              <a href="{$node.link}" {if isset($category.id) && $node.id == $category.id}class="selected"{/if}>{$node.name}</a>
              {if $node.children}
                <div class="navbar-toggler collapse-icons" data-toggle="collapse" data-target="#exCollapsingNavbar{$node.id}">
                  <i class="fa fa-caret-right add"></i>
                  <i class="fa fa-caret-down remove"></i>
                </div>
                <div class="collapse" id="exCollapsingNavbar{$node.id}">
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

<div class="block-categories block block-highlighted hidden-sm-down">
  <h4 class="title_block"><a href="{$categories.link nofilter}">{$categories.name}</a></h4>
  <div class="block_content">
    <ul class="category-top-menu">
      <li data-id="">{categories nodes=$categories.children}</li>
    </ul>
  </div>
</div>
