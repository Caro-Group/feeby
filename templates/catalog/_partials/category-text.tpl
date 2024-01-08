{**
 *  PrestaShop.
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
 * @copyright  PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{capture name="displayCategoryDescription"}
    {hook h="displayCategoryDescription"}
{/capture}
 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-6 tablet:mb-[15px] ">
    <div id="category_description" class="{if $smarty.capture.displayCategoryDescription|strip_tags:false|count_paragraphs > 3}collapse{/if} !visible !block pb-5 mt-2 tablet:mt-10 relative overflow-hidden after:absolute after:content-[''] after:bottom-0 after:inset-x-0 after:h-4 after:from-white after:to-transparent after:bg-gradient-to-t" {if $smarty.capture.displayCategoryDescription|strip_tags:false|count_paragraphs > 3}aria-expanded="false"{/if}>
        <div class="[&>p]:font-body [&>p]:font-light max-w-screen-tablet-wide [&>p]:text-main-dark [&>p]:!text-[13px] title_block">
          {$smarty.capture.displayCategoryDescription nofilter}
        </div>
    </div>
    {if $smarty.capture.displayCategoryDescription|strip_tags:false|count_paragraphs > 3}
        <a href="#category_description" class="collapse-text text-main-dark font-body text-sm tablet:text-base uppercase text-xs tablet:text-sm collapsed" aria-controls="category_description" data-toggle="collapse">
            <div class="down">{l s='Expand' d='Shop.Theme.Global'}<i style="margin-left:5px;" class="ti-arrow-down" aria-hidden="true"></i></div>
            <div class="up">{l s='Collapse' d='Shop.Theme.Global'}<i style="margin-left:5px;" class="ti-arrow-up" aria-hidden="true"></i></div>
        </a>
    {/if}
</div>