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
    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="none">
      <path fill="#232322" d="M7 6.5C7 9.538 9.686 12 13 12s6-2.462 6-5.5S16.314 1 13 1c-3.312.004-5.996 2.464-6 5.5Zm11.077 0c0 2.57-2.273 4.654-5.077 4.654S7.923 9.07 7.923 6.5 10.196 1.846 13 1.846c2.803.003 5.074 2.085 5.077 4.654ZM3 23.608v-.003c0-2.373.988-4.56 2.78-6.157 1.408-1.255 3.205-2.061 5.17-2.34h.006v.001-.001l.01-.002h.002c.503-.07 1.014-.106 1.526-.106h.012c.512 0 1.023.035 1.526.106l.017.003c1.966.278 3.763 1.084 5.17 2.339C21.012 19.046 22 21.232 22 23.605c0 .218-.203.395-.453.395H6.75c-.246-.004-.444-.18-.444-.395 0-.218.203-.395.453-.395h14.326c-.102-2.01-.985-3.849-2.512-5.21-1.598-1.424-3.754-2.21-6.072-2.21s-4.474.786-6.072 2.21c-1.528 1.361-2.41 3.2-2.513 5.21l-.022.4c0 .214-.197.387-.44.39h-.007C3.2 24 3 23.826 3 23.61v-.002Zm11.096-8.443v-.004c.002-.021-.012-.041-.035-.05.023.01.02.03.01.05l.025.005Zm-3.136-.008-.004-.048.004.048Zm.02-.002c0-.025-.002-.05-.011-.049h-.002l.005.05.008-.001Z" />
    </svg>
  </a>
  {else}
    {if Configuration::get('LEOQUICKLOGIN_ENABLE')}
      <a class="signin leo-quicklogin" data-enable-sociallogin="enable" data-type="popup" data-layout="login" href="javascript:void(0)" title="{l s='Account' d='Shop.Theme.Global'}" rel="nofollow">
        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="none">
          <path fill="#232322" d="M7 6.5C7 9.538 9.686 12 13 12s6-2.462 6-5.5S16.314 1 13 1c-3.312.004-5.996 2.464-6 5.5Zm11.077 0c0 2.57-2.273 4.654-5.077 4.654S7.923 9.07 7.923 6.5 10.196 1.846 13 1.846c2.803.003 5.074 2.085 5.077 4.654ZM3 23.608v-.003c0-2.373.988-4.56 2.78-6.157 1.408-1.255 3.205-2.061 5.17-2.34h.006v.001-.001l.01-.002h.002c.503-.07 1.014-.106 1.526-.106h.012c.512 0 1.023.035 1.526.106l.017.003c1.966.278 3.763 1.084 5.17 2.339C21.012 19.046 22 21.232 22 23.605c0 .218-.203.395-.453.395H6.75c-.246-.004-.444-.18-.444-.395 0-.218.203-.395.453-.395h14.326c-.102-2.01-.985-3.849-2.512-5.21-1.598-1.424-3.754-2.21-6.072-2.21s-4.474.786-6.072 2.21c-1.528 1.361-2.41 3.2-2.513 5.21l-.022.4c0 .214-.197.387-.44.39h-.007C3.2 24 3 23.826 3 23.61v-.002Zm11.096-8.443v-.004c.002-.021-.012-.041-.035-.05.023.01.02.03.01.05l.025.005Zm-3.136-.008-.004-.048.004.048Zm.02-.002c0-.025-.002-.05-.011-.049h-.002l.005.05.008-.001Z" />
        </svg>
      </a>
    {else}
    <a href="javascript:void(0)" data-toggle="dropdown" class="popup-title" title="{l s='Account' d='Shop.Theme.Global'}">
      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="none">
        <path fill="#232322" d="M7 6.5C7 9.538 9.686 12 13 12s6-2.462 6-5.5S16.314 1 13 1c-3.312.004-5.996 2.464-6 5.5Zm11.077 0c0 2.57-2.273 4.654-5.077 4.654S7.923 9.07 7.923 6.5 10.196 1.846 13 1.846c2.803.003 5.074 2.085 5.077 4.654ZM3 23.608v-.003c0-2.373.988-4.56 2.78-6.157 1.408-1.255 3.205-2.061 5.17-2.34h.006v.001-.001l.01-.002h.002c.503-.07 1.014-.106 1.526-.106h.012c.512 0 1.023.035 1.526.106l.017.003c1.966.278 3.763 1.084 5.17 2.339C21.012 19.046 22 21.232 22 23.605c0 .218-.203.395-.453.395H6.75c-.246-.004-.444-.18-.444-.395 0-.218.203-.395.453-.395h14.326c-.102-2.01-.985-3.849-2.512-5.21-1.598-1.424-3.754-2.21-6.072-2.21s-4.474.786-6.072 2.21c-1.528 1.361-2.41 3.2-2.513 5.21l-.022.4c0 .214-.197.387-.44.39h-.007C3.2 24 3 23.826 3 23.61v-.002Zm11.096-8.443v-.004c.002-.021-.012-.041-.035-.05.023.01.02.03.01.05l.025.005Zm-3.136-.008-.004-.048.004.048Zm.02-.002c0-.025-.002-.05-.011-.049h-.002l.005.05.008-.001Z" />
      </svg>
      <i class="fa fa-angle-down" aria-hidden="true"></i>
    </a>
    {/if}
  {/if}
</div>
