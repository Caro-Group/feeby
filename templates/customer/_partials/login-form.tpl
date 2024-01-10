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
{block name='login_form'}

  {block name='login_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  <form id="login-form" action="{block name='login_form_actionurl'}{$action}{/block}" method="post">

    <section class="flex flex-col">
      {block name='login_form_fields'}
        {foreach from=$formFields item="field"}
          {block name='form_field'}
            {form_field field=$field theme='col'}
          {/block}
        {/foreach}
      {/block}
      <div class="flex flex-auto flex-col">
        <a class="font-body font-normal ml-5 text-sm text-main-dark underline hover:underline hover:text-main transition" href="{$urls.pages.password}" rel="nofollow">
          {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
        </a>
      </div>
    </section>

    {block name='login_form_footer'}
      <footer class="mt-[30px] text-sm-center clearfix">
        <input type="hidden" name="submitLogin" value="1">
        {block name='form_buttons'}
          <button id="submit-login" class=" ml-auto bg-main-dark border-0 cursor-pointer duration-150 flex font-body hover:text-white hover:bg-black items-center justify-between max-w-[320px] mb-3 px-5 py-3 rounded-full tablet:max-w-[300px] text-white text-xs  tablet:text-sm uppercase w-full whitespace-nowrap" data-link-action="sign-in" type="submit">
            {l s='Sign in' d='Shop.Theme.Actions'}
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"></path></svg>
          </button>
        {/block}
      </footer>
    {/block}

    {block name='display_after_login_form'}
      {hook h='displayCustomerLoginFormAfter'}
    {/block}
    
  </form>
{/block}
