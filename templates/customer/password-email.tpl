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
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <form action="{$urls.pages.password}" class="forgotten-password" method="post">

    <ul class="ps-alert-error">
      {foreach $errors as $error}
        <li class="item">
          <i>
            <svg viewBox="0 0 24 24">
              <path fill="#fff" d="M11,15H13V17H11V15M11,7H13V13H11V7M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20Z"></path>
            </svg>
          </i>
          <p>{$error}</p>
        </li>
      {/foreach}
    </ul>

    <header>
      <p class="send-renew-password-link text-sm tablet:text-base font-body text-main-dark text-center pb-5 tablet:pb-[30px]">{l s='Please enter the email address you used to register. You will receive a temporary link to reset your password.' d='Shop.Theme.Customeraccount'}</p>
    </header>

    <section class="form-fields">
      <div class="form-group center-email-fields row">
        <div class="flex w-full items-center flex-wrap tablet:flex-nowrap">
          <input type="email" name="email" id="email" class="tablet:mr-5 mb-5 tablet:mb-0" placeholder="{l s='Email address' d='Shop.Forms.Labels'}" value="{if isset($smarty.post.email)}{$smarty.post.email|stripslashes}{/if}" class="form-control" required>
          <button class="form-control-submit hidden tablet:flex w-full text-xs tablet:text-sm tablet:w-auto bg-main hover:bg-main-hover duration-150 border-0 rounded-full text-white p-3 px-4 uppercase whitespace-nowrap mb-8 tablet:mb-0 items-center justify-between ml-auto cursor-pointer" name="submit" type="submit">
            {l s='Send reset link' d='Shop.Theme.Actions'}
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"></path></svg>
          </button>
          <button class="form-control-submit tablet:hidden w-full text-xs tablet:text-sm tablet:w-auto bg-main hover:bg-main-hover duration-150 border-0 rounded-full text-white p-3 px-4 uppercase whitespace-nowrap mb-8 tablet:mb-0 flex items-center justify-between ml-auto cursor-pointer" name="submit" type="submit">
            {l s='Send' d='Shop.Theme.Actions'}
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"></path></svg>
          </button>
  
          </div>
      </div>
    </section>

  </form>
{/block}

{block name='page_footer'}
  <a href="{$urls.pages.my_account}" class="flex items-center text-main-dark bg-transparent border-0 uppercase whitespace-nowrap mb-0 cursor-pointer">
  <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="mr-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" fill="#181828"></path></svg>
    <span>{l s='Back to Login' d='Shop.Theme.Actions'}</span>
  </a>
{/block}
