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
<div id="_desktop_cart">
  <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
    <div class="header">
      {if $cart.products_count > 0}
        <a rel="nofollow" href="{$cart_url}">
      {/if}
        <svg class="fill-current text-gray-main hover:text-main transition" width="25" height="25" viewBox="0 0 25 25" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" clip-rule="evenodd" d="M4.4223 8.63599L4.42187 8.63795C4.37954 8.85706 4.52695 9.06857 4.7509 9.11003C4.9748 9.15144 5.19098 9.00723 5.23336 8.78812C5.23586 8.7752 5.23771 8.76229 5.2389 8.74942C5.23885 8.74974 5.24863 8.69584 5.24863 8.69584L5.2502 8.68696C5.31643 8.26294 5.68996 7.95027 6.1283 7.95197H7.78524V10.3263C7.78524 10.5492 7.96981 10.7298 8.19762 10.7298C8.42548 10.7298 8.61005 10.5492 8.61005 10.3263V7.95197H16.3896V10.3263C16.3896 10.5492 16.5744 10.7298 16.8019 10.7298C17.0298 10.7298 17.2143 10.5492 17.2143 10.3263V7.95197H18.8713C19.3095 7.95043 19.6832 8.26294 19.7494 8.68696L19.7508 8.69478C19.7508 8.69478 22.1289 21.828 22.1751 22.0837C22.1548 23.2533 21.1805 24.1919 19.9843 24.1931H5.01566C3.81961 24.1919 2.84534 23.2534 2.82486 22.0839C2.82486 22.0837 4.79328 11.2111 4.79328 11.2111C4.79442 11.2059 4.79545 11.2007 4.79637 11.1955C4.83576 10.9761 4.68565 10.7667 4.46142 10.7282C4.2372 10.6897 4.02319 10.8365 3.98385 11.0559C3.98309 11.0603 3.98233 11.0647 3.98173 11.0692L2.00647 21.9794C2.00212 22.0026 2 22.0262 2 22.0497C2 22.0497 2 22.0497 2 22.0497C2.00212 23.6783 3.35095 24.9981 5.01555 25H19.9844C21.6491 24.9981 22.9981 23.6783 23 22.0497C23 22.0497 23 22.0497 23 22.0497C23 22.0261 22.9979 22.0028 22.9938 21.9794C22.9938 21.9793 22.9938 21.9793 22.9938 21.9792L20.5636 8.55769C20.4343 7.74206 19.7148 7.14177 18.8711 7.14506H17.2143V5.61236C17.2143 3.06496 15.1037 1 12.5 1C9.89628 1 7.78568 3.06496 7.78568 5.61236V7.14506H6.12896C5.28519 7.14177 4.56579 7.74206 4.43638 8.55769L4.4223 8.63599ZM8.61043 5.61236C8.61043 3.51078 10.3519 1.80696 12.5 1.80696C14.6483 1.80696 16.3896 3.51078 16.3896 5.61236V7.14506H8.61043V5.61236Z"/>
        </svg>
        <span class="cart-products-count">{$cart.products_count}</span>
      {if $cart.products_count > 0}
        </a>
      {/if}
    </div>
  </div>
</div>
