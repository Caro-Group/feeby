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

 {* .block is used in js *}
<div class="block bg-newsletter bg-contain bg-left bg-gray-default desktop:rounded-md flex flex-col items-center justify-center max-w-screen-desktop-wide mx-auto px-8 py-20"> 
  <h3 class="title_block">{l s='Newsletter signup' d='Shop.Theme.Global'}</h3>
   {* .block_content is used in js *}
  <div class="block_content w-3/5">
    <form action="{$urls.pages.index}#footer" method="post">
      <div>
          {if $conditions}
            <p class="text-center text-lg">{$conditions}</p>
          {/if}
        {* .col_form is used in js *}
        <div class="col-form">
          <div class="input-text bg-white">
            <input
              name="email"
              type="text"
              value="{$value}"
              placeholder="{l s='Your email...' d='Shop.Forms.Labels'}"
            >

            {* .btn is used in js *}
            <button
              class="btn"
              name="submitNewsletter"
              type="submit"
              value="{l s='Subscribe' d='Shop.Theme.Actions'}"
            >
              <i class="ti-arrow-right"></i></span>
            </button>
          </div>
          <input type="hidden" name="action" value="0">
        </div>
      </div>
    </form>
  </div>
</div>
