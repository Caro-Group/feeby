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
        <a href="{$my_account_url}" data-toggle="dropdown" class="popup-title"
            title="{l s='Account' d='Shop.Theme.Global'}">
            <svg class="fill-current text-main-dark hover:text-main transition" width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                    d="M7 6.49992V6.49997C7 9.53762 9.68646 12 13 12C16.3138 12 19 9.53762 19 6.49997C19 3.46238 16.3138 1 13 1H12.9999C9.68796 1.00354 7.00387 3.46375 7 6.49992ZM18.0769 6.50003C18.0769 9.07019 15.804 11.1538 13 11.1538C10.1961 11.1538 7.92309 9.07019 7.92309 6.49997C7.92309 3.92981 10.1961 1.84616 12.9999 1.84616C15.8027 1.84902 18.0737 3.93102 18.0769 6.50003Z"
                     />
                <path
                    d="M3 23.608C3 23.6071 3 23.6062 3 23.6053C3 21.2324 3.98805 19.0459 5.78071 17.4476C7.18762 16.1935 8.98469 15.387 10.9509 15.1087L10.9555 15.108L10.9556 15.1093L10.9561 15.1092L10.956 15.1079L10.9669 15.1064C10.9628 15.1071 10.9593 15.108 10.9563 15.1092C10.9596 15.1079 10.9632 15.107 10.9669 15.1064L10.9684 15.1062C11.4714 15.0353 11.9817 14.9996 12.4942 15V15.0002L12.5058 15C13.0183 14.9996 13.5286 15.0353 14.0316 15.1062L14.0491 15.1087C16.0153 15.387 17.8124 16.1934 19.2193 17.4476C21.0119 19.0459 22 21.2324 22 23.6053C22 23.8233 21.7971 24 21.5473 24H6.74924V24C6.50326 23.9959 6.30498 23.8205 6.30498 23.6051C6.30498 23.387 6.50796 23.2101 6.7579 23.2101C6.76339 23.2101 6.76882 23.2102 6.7742 23.2103H21.0845C20.9824 21.1996 20.0995 19.3614 18.5721 17.9995C16.9743 16.5755 14.8182 15.7907 12.5 15.7895C10.1818 15.7907 8.02572 16.5755 6.42789 17.9995C4.90045 19.3614 4.01759 21.1996 3.91545 23.2103L3.89293 23.6107C3.89293 23.8237 3.6963 23.997 3.45275 24L3.45269 24C3.45162 24 3.4506 24 3.44958 24C3.44856 24 3.44748 24 3.44647 24C3.20003 24 3 23.8256 3 23.6107C3 23.6098 3 23.6089 3 23.608ZM14.0958 15.1655C14.0961 15.1641 14.0962 15.1627 14.0964 15.1613C14.0984 15.1395 14.0837 15.1196 14.0613 15.1117C14.0844 15.1203 14.0812 15.1416 14.0713 15.1619L14.0958 15.1655ZM10.9605 15.1573L10.9561 15.1092L10.9556 15.1094L10.9602 15.1573H10.9605ZM10.9796 15.1546C10.9801 15.1296 10.9783 15.1049 10.969 15.1061L10.9669 15.1064L10.9716 15.1557L10.9796 15.1546Z"
                     />
            </svg>

            <span class="hidden">{l s='My account' d='Shop.Theme.Global'}</span>
        </a>
    {else}
        {if Configuration::get('LEOQUICKLOGIN_ENABLE')}
            <a class="signin leo-quicklogin" data-enable-sociallogin="enable" data-type="popup" data-layout="login"
                href="javascript:void(0)" title="Konto" rel="nofollow"> <i class="ti-user"></i> </a>
        {else}
            <a href="javascript:void(0)" data-toggle="dropdown" class="popup-title"
                title="{l s='Account' d='Shop.Theme.Global'}">
                <svg class="fill-current text-main-dark hover:text-main transition" width="25" height="25" viewBox="0 0 25 25"  xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M7 6.49992V6.49997C7 9.53762 9.68646 12 13 12C16.3138 12 19 9.53762 19 6.49997C19 3.46238 16.3138 1 13 1H12.9999C9.68796 1.00354 7.00387 3.46375 7 6.49992ZM18.0769 6.50003C18.0769 9.07019 15.804 11.1538 13 11.1538C10.1961 11.1538 7.92309 9.07019 7.92309 6.49997C7.92309 3.92981 10.1961 1.84616 12.9999 1.84616C15.8027 1.84902 18.0737 3.93102 18.0769 6.50003Z"
                         />
                    <path
                        d="M3 23.608C3 23.6071 3 23.6062 3 23.6053C3 21.2324 3.98805 19.0459 5.78071 17.4476C7.18762 16.1935 8.98469 15.387 10.9509 15.1087L10.9555 15.108L10.9556 15.1093L10.9561 15.1092L10.956 15.1079L10.9669 15.1064C10.9628 15.1071 10.9593 15.108 10.9563 15.1092C10.9596 15.1079 10.9632 15.107 10.9669 15.1064L10.9684 15.1062C11.4714 15.0353 11.9817 14.9996 12.4942 15V15.0002L12.5058 15C13.0183 14.9996 13.5286 15.0353 14.0316 15.1062L14.0491 15.1087C16.0153 15.387 17.8124 16.1934 19.2193 17.4476C21.0119 19.0459 22 21.2324 22 23.6053C22 23.8233 21.7971 24 21.5473 24H6.74924V24C6.50326 23.9959 6.30498 23.8205 6.30498 23.6051C6.30498 23.387 6.50796 23.2101 6.7579 23.2101C6.76339 23.2101 6.76882 23.2102 6.7742 23.2103H21.0845C20.9824 21.1996 20.0995 19.3614 18.5721 17.9995C16.9743 16.5755 14.8182 15.7907 12.5 15.7895C10.1818 15.7907 8.02572 16.5755 6.42789 17.9995C4.90045 19.3614 4.01759 21.1996 3.91545 23.2103L3.89293 23.6107C3.89293 23.8237 3.6963 23.997 3.45275 24L3.45269 24C3.45162 24 3.4506 24 3.44958 24C3.44856 24 3.44748 24 3.44647 24C3.20003 24 3 23.8256 3 23.6107C3 23.6098 3 23.6089 3 23.608ZM14.0958 15.1655C14.0961 15.1641 14.0962 15.1627 14.0964 15.1613C14.0984 15.1395 14.0837 15.1196 14.0613 15.1117C14.0844 15.1203 14.0812 15.1416 14.0713 15.1619L14.0958 15.1655ZM10.9605 15.1573L10.9561 15.1092L10.9556 15.1094L10.9602 15.1573H10.9605ZM10.9796 15.1546C10.9801 15.1296 10.9783 15.1049 10.969 15.1061L10.9669 15.1064L10.9716 15.1557L10.9796 15.1546Z"
                         />
                </svg>

                <span class="hidden">{l s='My account' d='Shop.Theme.Global'}</span>
                <i class="fa fa-angle-down" aria-hidden="true"></i>
            </a>
        {/if}
    {/if}
</div>
{literal}
    <style>
        @media(min-width: 992px) {
            .ApColumn .block.user-block-header {
                margin: 0;
                display: flex;
                align-items: center;
            }


            .user-block-header .signin.leo-quicklogin,
            .user-block-header a {
                min-width: 40px;
                text-align: center;
                height: 80px;
                line-height: 80px;
                display: block;
                position: relative;
            }

            .user-block-header .ti-user {
                font-size: 21px;
                color: #000;
                vertical-align: middle;
            }
        }


        @media(max-width: 991px) {
            .bottomnav .userinfo-selector a {
                color: #000;
                display: block;
                font-size: 19px;
                line-height: 19px;
                margin-right: 10px;
            }

            .bottomnav .box-top {
                position: static;
            }

            .bottomnav .user-block-header .signin.leo-quicklogin {
                height: 40px;
                line-height: 40px;
            }

            .bottomnav .box-top .col-info .popup-over a.popup-title,
            .box-top .col-info .wislish-button .ap-btn-wishlist,
            .box-top .col-info #_desktop_cart .header {
                height: 40px;
                line-height: 40px;
            }

            .box-top .col-info #_desktop_cart .header .cart-products-count {
                top: 5%;
                left: 70%;
            }

            .box-top .col-info .wislish-button .ap-btn-wishlist .ap-total {
                top: 5%;
                left: 70%;
            }

            #leo_search_block_top {
                display: block;
                border: 0;
            }

            #leo_search_block_top .form-control {
                box-shadow: none;
                border: 0;
                border-radius: 0;
            }

            #leo_search_block_top .btn {
                border-radius: 0;
            }
        }
    </style>
{/literal}