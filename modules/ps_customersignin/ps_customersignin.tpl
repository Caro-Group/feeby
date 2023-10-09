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

<div class="userinfo-selector user-block-header ApRawHtml" id="_desktop_user_info">
  {if $logged}
    <a href="{$my_account_url}" data-toggle="dropdown" class="popup-title mr-5 " title="{l s='Account' d='Shop.Theme.Global'}">
    {if $page_name == 'my-account'}
      <svg class="fill-current text-main-dark hover:text-main transition" xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24" fill="none">
        <path d="M6.71973 6.23988C6.71973 9.15603 9.29873 11.52 12.4797 11.52C15.6609 11.52 18.2397 9.15608 18.2397 6.23994C18.2397 3.32385 15.6609 0.959961 12.4797 0.959961C9.30023 0.963363 6.72344 3.32517 6.71973 6.23988Z" fill="#232322"/>
        <path d="M2.87988 22.6641C2.87988 22.6632 2.87988 22.6623 2.87988 22.6615C2.87988 20.3835 3.82841 18.2844 5.54936 16.7501C6.89999 15.5461 8.62518 14.7719 10.5127 14.5047L10.5171 14.5041L10.5281 14.5026L10.5295 14.5023C11.0125 14.4343 11.5023 14.4 11.9943 14.4004H12.0054C12.4975 14.4 12.9873 14.4343 13.4702 14.5023L13.487 14.5047C15.3746 14.7719 17.0998 15.5461 18.4504 16.7501C20.1713 18.2844 21.1199 20.3835 21.1199 22.6615C21.1199 22.8708 20.9251 23.0404 20.6853 23.0404H6.47915C2.72645 22.9787 5.56134 23.0135 3.31452 23.0403C3.31349 23.0403 3.31246 23.0404 3.31148 23.0404C3.3105 23.0404 3.30947 23.0404 3.30849 23.0404C3.07191 23.0404 2.87988 22.8729 2.87988 22.6666C2.87988 22.6658 2.87988 22.6649 2.87988 22.6641ZM13.5318 14.5592C13.5321 14.5579 13.5323 14.5566 13.5324 14.5552C13.5343 14.5343 13.5203 14.5152 13.4988 14.5076C13.5209 14.5159 13.5178 14.5363 13.5084 14.5558L13.5318 14.5592ZM10.5403 14.5488C10.5408 14.5248 10.5385 14.5011 10.5295 14.5023L10.5281 14.5026L10.5326 14.5499L10.5403 14.5488Z" fill="#232322"/>
      </svg>
    {else}
      <svg class="fill-current text-main-dark hover:text-main transition" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="none">
        <path  d="M7 6.5C7 9.538 9.686 12 13 12s6-2.462 6-5.5S16.314 1 13 1c-3.312.004-5.996 2.464-6 5.5Zm11.077 0c0 2.57-2.273 4.654-5.077 4.654S7.923 9.07 7.923 6.5 10.196 1.846 13 1.846c2.803.003 5.074 2.085 5.077 4.654ZM3 23.608v-.003c0-2.373.988-4.56 2.78-6.157 1.408-1.255 3.205-2.061 5.17-2.34h.006v.001-.001l.01-.002h.002c.503-.07 1.014-.106 1.526-.106h.012c.512 0 1.023.035 1.526.106l.017.003c1.966.278 3.763 1.084 5.17 2.339C21.012 19.046 22 21.232 22 23.605c0 .218-.203.395-.453.395H6.75c-.246-.004-.444-.18-.444-.395 0-.218.203-.395.453-.395h14.326c-.102-2.01-.985-3.849-2.512-5.21-1.598-1.424-3.754-2.21-6.072-2.21s-4.474.786-6.072 2.21c-1.528 1.361-2.41 3.2-2.513 5.21l-.022.4c0 .214-.197.387-.44.39h-.007C3.2 24 3 23.826 3 23.61v-.002Zm11.096-8.443v-.004c.002-.021-.012-.041-.035-.05.023.01.02.03.01.05l.025.005Zm-3.136-.008-.004-.048.004.048Zm.02-.002c0-.025-.002-.05-.011-.049h-.002l.005.05.008-.001Z" />
      </svg>
    {/if}
    </a>
  {else}
    {if Configuration::get('LEOQUICKLOGIN_ENABLE')}
      <a class="signin leo-quicklogin mr-5 " data-enable-sociallogin="enable" data-type="popup" data-layout="login" href="javascript:void(0)" title="{l s='Account' d='Shop.Theme.Global'}" rel="nofollow">
        {if $page_name == 'my-account'}
          <svg class="fill-current text-main-dark hover:text-main transition" xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24" fill="none">
            <path d="M6.71973 6.23988C6.71973 9.15603 9.29873 11.52 12.4797 11.52C15.6609 11.52 18.2397 9.15608 18.2397 6.23994C18.2397 3.32385 15.6609 0.959961 12.4797 0.959961C9.30023 0.963363 6.72344 3.32517 6.71973 6.23988Z" fill="#232322"/>
            <path d="M2.87988 22.6641C2.87988 22.6632 2.87988 22.6623 2.87988 22.6615C2.87988 20.3835 3.82841 18.2844 5.54936 16.7501C6.89999 15.5461 8.62518 14.7719 10.5127 14.5047L10.5171 14.5041L10.5281 14.5026L10.5295 14.5023C11.0125 14.4343 11.5023 14.4 11.9943 14.4004H12.0054C12.4975 14.4 12.9873 14.4343 13.4702 14.5023L13.487 14.5047C15.3746 14.7719 17.0998 15.5461 18.4504 16.7501C20.1713 18.2844 21.1199 20.3835 21.1199 22.6615C21.1199 22.8708 20.9251 23.0404 20.6853 23.0404H6.47915C2.72645 22.9787 5.56134 23.0135 3.31452 23.0403C3.31349 23.0403 3.31246 23.0404 3.31148 23.0404C3.3105 23.0404 3.30947 23.0404 3.30849 23.0404C3.07191 23.0404 2.87988 22.8729 2.87988 22.6666C2.87988 22.6658 2.87988 22.6649 2.87988 22.6641ZM13.5318 14.5592C13.5321 14.5579 13.5323 14.5566 13.5324 14.5552C13.5343 14.5343 13.5203 14.5152 13.4988 14.5076C13.5209 14.5159 13.5178 14.5363 13.5084 14.5558L13.5318 14.5592ZM10.5403 14.5488C10.5408 14.5248 10.5385 14.5011 10.5295 14.5023L10.5281 14.5026L10.5326 14.5499L10.5403 14.5488Z" fill="#232322"/>
          </svg>
        {else}
          <svg class="fill-current text-main-dark hover:text-main transition" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="none">
            <path  d="M7 6.5C7 9.538 9.686 12 13 12s6-2.462 6-5.5S16.314 1 13 1c-3.312.004-5.996 2.464-6 5.5Zm11.077 0c0 2.57-2.273 4.654-5.077 4.654S7.923 9.07 7.923 6.5 10.196 1.846 13 1.846c2.803.003 5.074 2.085 5.077 4.654ZM3 23.608v-.003c0-2.373.988-4.56 2.78-6.157 1.408-1.255 3.205-2.061 5.17-2.34h.006v.001-.001l.01-.002h.002c.503-.07 1.014-.106 1.526-.106h.012c.512 0 1.023.035 1.526.106l.017.003c1.966.278 3.763 1.084 5.17 2.339C21.012 19.046 22 21.232 22 23.605c0 .218-.203.395-.453.395H6.75c-.246-.004-.444-.18-.444-.395 0-.218.203-.395.453-.395h14.326c-.102-2.01-.985-3.849-2.512-5.21-1.598-1.424-3.754-2.21-6.072-2.21s-4.474.786-6.072 2.21c-1.528 1.361-2.41 3.2-2.513 5.21l-.022.4c0 .214-.197.387-.44.39h-.007C3.2 24 3 23.826 3 23.61v-.002Zm11.096-8.443v-.004c.002-.021-.012-.041-.035-.05.023.01.02.03.01.05l.025.005Zm-3.136-.008-.004-.048.004.048Zm.02-.002c0-.025-.002-.05-.011-.049h-.002l.005.05.008-.001Z" />
          </svg>
        {/if}
      </a>
    {else}
    <a href="{$urls.pages.authentication}" data-toggle="dropdown" class="popup-title mr-5 " title="{l s='Account' d='Shop.Theme.Global'}">
      {if $page_name == 'my-account'}
        <svg class="fill-current text-main-dark hover:text-main transition" xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24" fill="none">
          <path d="M6.71973 6.23988C6.71973 9.15603 9.29873 11.52 12.4797 11.52C15.6609 11.52 18.2397 9.15608 18.2397 6.23994C18.2397 3.32385 15.6609 0.959961 12.4797 0.959961C9.30023 0.963363 6.72344 3.32517 6.71973 6.23988Z" fill="#232322"/>
          <path d="M2.87988 22.6641C2.87988 22.6632 2.87988 22.6623 2.87988 22.6615C2.87988 20.3835 3.82841 18.2844 5.54936 16.7501C6.89999 15.5461 8.62518 14.7719 10.5127 14.5047L10.5171 14.5041L10.5281 14.5026L10.5295 14.5023C11.0125 14.4343 11.5023 14.4 11.9943 14.4004H12.0054C12.4975 14.4 12.9873 14.4343 13.4702 14.5023L13.487 14.5047C15.3746 14.7719 17.0998 15.5461 18.4504 16.7501C20.1713 18.2844 21.1199 20.3835 21.1199 22.6615C21.1199 22.8708 20.9251 23.0404 20.6853 23.0404H6.47915C2.72645 22.9787 5.56134 23.0135 3.31452 23.0403C3.31349 23.0403 3.31246 23.0404 3.31148 23.0404C3.3105 23.0404 3.30947 23.0404 3.30849 23.0404C3.07191 23.0404 2.87988 22.8729 2.87988 22.6666C2.87988 22.6658 2.87988 22.6649 2.87988 22.6641ZM13.5318 14.5592C13.5321 14.5579 13.5323 14.5566 13.5324 14.5552C13.5343 14.5343 13.5203 14.5152 13.4988 14.5076C13.5209 14.5159 13.5178 14.5363 13.5084 14.5558L13.5318 14.5592ZM10.5403 14.5488C10.5408 14.5248 10.5385 14.5011 10.5295 14.5023L10.5281 14.5026L10.5326 14.5499L10.5403 14.5488Z" fill="#232322"/>
        </svg>
      {else}
        <svg class="fill-current text-main-dark hover:text-main transition" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="none">
          <path  d="M7 6.5C7 9.538 9.686 12 13 12s6-2.462 6-5.5S16.314 1 13 1c-3.312.004-5.996 2.464-6 5.5Zm11.077 0c0 2.57-2.273 4.654-5.077 4.654S7.923 9.07 7.923 6.5 10.196 1.846 13 1.846c2.803.003 5.074 2.085 5.077 4.654ZM3 23.608v-.003c0-2.373.988-4.56 2.78-6.157 1.408-1.255 3.205-2.061 5.17-2.34h.006v.001-.001l.01-.002h.002c.503-.07 1.014-.106 1.526-.106h.012c.512 0 1.023.035 1.526.106l.017.003c1.966.278 3.763 1.084 5.17 2.339C21.012 19.046 22 21.232 22 23.605c0 .218-.203.395-.453.395H6.75c-.246-.004-.444-.18-.444-.395 0-.218.203-.395.453-.395h14.326c-.102-2.01-.985-3.849-2.512-5.21-1.598-1.424-3.754-2.21-6.072-2.21s-4.474.786-6.072 2.21c-1.528 1.361-2.41 3.2-2.513 5.21l-.022.4c0 .214-.197.387-.44.39h-.007C3.2 24 3 23.826 3 23.61v-.002Zm11.096-8.443v-.004c.002-.021-.012-.041-.035-.05.023.01.02.03.01.05l.025.005Zm-3.136-.008-.004-.048.004.048Zm.02-.002c0-.025-.002-.05-.011-.049h-.002l.005.05.008-.001Z" />
        </svg>
      {/if}
    </a>
    {/if}
  {/if}
</div>
