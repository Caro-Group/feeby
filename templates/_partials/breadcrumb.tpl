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

{assign var="leobrbg" value={hook h="pagebuilderConfig" configName="leobrbg"}}
{assign var="leobrcolor" value={hook h="pagebuilderConfig" configName="leobrcolor"}}
{assign var="leobgfull" value={hook h="pagebuilderConfig" configName="leobgfull"}}
{assign var="leobgheight" value={hook h="pagebuilderConfig" configName="leobgheight"}}
{assign var="leobrtext" value={hook h="pagebuilderConfig" configName="leobrtext"}}

{if $leobrbg || $leobrcolor}
<div class="breadcrumb-bg {$leobrtext} {if $leobgfull}breadcrumb-full{/if}" style="{if $leobrbg}background-image: {if $leobrbg}url({if $page.page_name == 'category' && $leobrbg == 'catimg' && $category.image.large.url != ''}{$category.image.large.url}{else}{$leobrbg}{/if}){/if};{/if}{if $leobrcolor} background-color:{$leobrcolor};{/if}{if $leobgheight} min-height:{$leobgheight};{/if} ">
  {if isset($leobgfull) && $leobgfull}
  <div class="container">
  {/if}
  <nav data-depth="{$breadcrumb.count}" class="breadcrumb hidden-sm-down">
    <ol itemscope itemtype="http://schema.org/BreadcrumbList">
      {block name='breadcrumb'}
        {foreach from=$breadcrumb.links item=path name=breadcrumb}
          {block name='breadcrumb_item'}
            <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
              <a itemprop="item" href="{$path.url}">
                <span itemprop="name">{$path.title}</span>
              </a>
              <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
            </li>
          {/block}
        {/foreach}
      {/block}
    </ol>
  </nav>
  {if isset($leobgfull) && $leobgfull}
  </div>
  {/if}
</div>
{else}
<nav data-depth="{$breadcrumb.count}" class="breadcrumb">
  <ol class="py-2 whitespace-nowrap overflow-auto -mx-5 scrollbar-none {if $page.page_name == 'product' } desktop-presta:mb-[30px] px-[30px] {else} desktop-presta:mb-[19px] px-5 {/if}" itemscope itemtype="http://schema.org/BreadcrumbList">
    {block name='breadcrumb'}
      {foreach from=$breadcrumb.links item=path name=breadcrumb}
        {block name='breadcrumb_item'}
          <li class="before:content-['/'] before:px-1 before:font-bold before:italic before:text-gray-300 first:before:hidden text-xs tablet:text-sm text-gray-3000 last:before:text-main last:pointer-events-none last:text-main-dark hover:text-main-dark" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
            <a class="text-inherit transition" itemprop="item" href="{$path.url}">
              <span itemprop="name">{$path.title}</span>
            </a>
            <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
          </li>
        {/block}
      {/foreach}
    {/block}
  </ol>
</nav>
{/if}