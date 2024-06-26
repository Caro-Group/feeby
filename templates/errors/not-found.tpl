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
{block name='breadcrumb'}{/block}
  
<section id="content" class="page-content page-not-found">
  {block name='page_content'}
    <div class="image-404">
      <img class="lazy" data-src="{$urls.img_url}404-image.png">
    </div>
    <h1>4 0 4</h1>
    <div class="content">
    <p>{l s='Oops, it looks like you are lost ...' d='Shop.Theme.Global'}</p> 
    
    </div>

    <a class="bg-main-dark hover:bg-main-hover duration-150 border-0 rounded-full text-white px-4 uppercase whitespace-nowrap font-body py-2 hover:text-white" href="{$urls.base_url}">{l s='Back to Home' d='Shop.Theme.Global'}</a>
{*
    {block name='search'}
      {hook h='displaySearch'}
    {/block}

    {block name='hook_not_found'}
      {hook h='displayNotFound'}
    {/block}
*}


  {/block}
</section>
