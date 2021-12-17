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

<div class="userinfo-selector block user-block-header ApRawHtml" id="_desktop_user_info">
{if $logged}
  <a href="{$my_account_url}" data-toggle="dropdown" class="popup-title" title="{l s='Account' d='Shop.Theme.Global'}">
  <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="none"><path d="M10.144 20.84a.123.123 0 0 1-.014-.011c-1.185-1.134-6.835-6.795-6.835-6.795a.445.445 0 0 1-.07-.092v.001l-.003-.005-.003-.002h.002-.002C1.807 12.643 1 10.755 1 8.73 1 5.021 3.68 2 6.976 2c2.547 0 4.65 2.36 5.5 3.472l.024.03.023-.03C13.374 4.36 15.477 2 18.025 2 21.32 2 24 5.02 24 8.731c0 1.69-.563 3.305-1.589 4.556l-.002.002-.001.003a.439.439 0 0 1-.08.107l-.01.004-.034.016a.057.057 0 0 0 .043-.02 3.92 3.92 0 0 1-.23.233l-.096.092-9.182 9.144A.45.45 0 0 1 12.5 23h-.002a.45.45 0 0 1-.088-.009.406.406 0 0 1-.216-.108.448.448 0 0 1 .015-.678c1.567-1.602 9.266-9.225 9.266-9.225l.001-.001c.05-.047.099-.092.144-.144l.002-.002v-.002c.01-.015.021-.03.033-.044v.001a.056.056 0 0 0 .012.08.057.057 0 0 1-.018-.07v-.001a.047.047 0 0 1 .007-.01l.001-.002c.929-1.1 1.44-2.54 1.44-4.054 0-3.217-2.276-5.832-5.073-5.832-1.106 0-2.148.574-3.002 1.267a11.617 11.617 0 0 0-2.143 2.356l-.047.026.047-.026a.446.446 0 0 1-.379.191.446.446 0 0 1-.38-.191l.048.026-.047-.026a11.615 11.615 0 0 0-2.143-2.356c-.854-.693-1.896-1.267-3.002-1.267-2.797 0-5.074 2.615-5.074 5.832 0 1.823.74 3.512 2.03 4.634a.45.45 0 0 1 .105.134l.002.005 6.718 6.679a.448.448 0 0 1-.287.797.451.451 0 0 1-.326-.14Zm-6.842-6.885.004.006a.058.058 0 0 1-.032.01s.014-.005.028-.016Zm-.063-.012.019.007-.019-.007Zm.794-.365-.004-.004c.011-.01.021-.024.02-.04a.057.057 0 0 1-.016.044Zm18.221-.184.014-.014.016.039a.057.057 0 0 1-.038-.016l.008-.009Zm.017-.018.017.039-.017-.04Zm.09-.062-.003-.007h-.001l.004.007Zm-.673-.477c-.009-.029-.021-.062-.028-.055l-.003.004a.053.053 0 0 0-.008.013c-.01.023.007.045.024.06a.366.366 0 0 1 .015-.022ZM12.81 6.521a.303.303 0 0 1-.012.014c.015.01.033.013.034.013 0-.001-.01-.014-.022-.027Z" fill="#232322"/></svg>
    <span class="hidden">{l s='My account' d='Shop.Theme.Global'}</span>
 </a>
{else}
  {if Configuration::get('LEOQUICKLOGIN_ENABLE')}
	<a class="signin leo-quicklogin" data-enable-sociallogin="enable" data-type="popup" data-layout="login" href="javascript:void(0)" title="Konto" rel="nofollow"> <i class="ti-user"></i> </a>
  {else}
   <a href="javascript:void(0)" data-toggle="dropdown" class="popup-title" title="{l s='Account' d='Shop.Theme.Global'}">
   <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="none"><path d="M10.144 20.84a.123.123 0 0 1-.014-.011c-1.185-1.134-6.835-6.795-6.835-6.795a.445.445 0 0 1-.07-.092v.001l-.003-.005-.003-.002h.002-.002C1.807 12.643 1 10.755 1 8.73 1 5.021 3.68 2 6.976 2c2.547 0 4.65 2.36 5.5 3.472l.024.03.023-.03C13.374 4.36 15.477 2 18.025 2 21.32 2 24 5.02 24 8.731c0 1.69-.563 3.305-1.589 4.556l-.002.002-.001.003a.439.439 0 0 1-.08.107l-.01.004-.034.016a.057.057 0 0 0 .043-.02 3.92 3.92 0 0 1-.23.233l-.096.092-9.182 9.144A.45.45 0 0 1 12.5 23h-.002a.45.45 0 0 1-.088-.009.406.406 0 0 1-.216-.108.448.448 0 0 1 .015-.678c1.567-1.602 9.266-9.225 9.266-9.225l.001-.001c.05-.047.099-.092.144-.144l.002-.002v-.002c.01-.015.021-.03.033-.044v.001a.056.056 0 0 0 .012.08.057.057 0 0 1-.018-.07v-.001a.047.047 0 0 1 .007-.01l.001-.002c.929-1.1 1.44-2.54 1.44-4.054 0-3.217-2.276-5.832-5.073-5.832-1.106 0-2.148.574-3.002 1.267a11.617 11.617 0 0 0-2.143 2.356l-.047.026.047-.026a.446.446 0 0 1-.379.191.446.446 0 0 1-.38-.191l.048.026-.047-.026a11.615 11.615 0 0 0-2.143-2.356c-.854-.693-1.896-1.267-3.002-1.267-2.797 0-5.074 2.615-5.074 5.832 0 1.823.74 3.512 2.03 4.634a.45.45 0 0 1 .105.134l.002.005 6.718 6.679a.448.448 0 0 1-.287.797.451.451 0 0 1-.326-.14Zm-6.842-6.885.004.006a.058.058 0 0 1-.032.01s.014-.005.028-.016Zm-.063-.012.019.007-.019-.007Zm.794-.365-.004-.004c.011-.01.021-.024.02-.04a.057.057 0 0 1-.016.044Zm18.221-.184.014-.014.016.039a.057.057 0 0 1-.038-.016l.008-.009Zm.017-.018.017.039-.017-.04Zm.09-.062-.003-.007h-.001l.004.007Zm-.673-.477c-.009-.029-.021-.062-.028-.055l-.003.004a.053.053 0 0 0-.008.013c-.01.023.007.045.024.06a.366.366 0 0 1 .015-.022ZM12.81 6.521a.303.303 0 0 1-.012.014c.015.01.033.013.034.013 0-.001-.01-.014-.022-.027Z" fill="#232322"/></svg>
    <span class="hidden">{l s='My account' d='Shop.Theme.Global'}</span>
    <i class="fa fa-angle-down" aria-hidden="true"></i>
   </a>
  {/if}
{/if}
</div>