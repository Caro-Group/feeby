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
    <i class="ti-user"></i>
    <span class="hidden">{l s='My account' d='Shop.Theme.Global'}</span>
 </a>
{else}
  {if Configuration::get('LEOQUICKLOGIN_ENABLE')}
	<a class="signin leo-quicklogin" data-enable-sociallogin="enable" data-type="popup" data-layout="login" href="javascript:void(0)" title="Konto" rel="nofollow"> <i class="ti-user"></i> </a>
  {else}
   <a href="javascript:void(0)" data-toggle="dropdown" class="popup-title" title="{l s='Account' d='Shop.Theme.Global'}">
    <i class="ti-user"></i>
    <span class="hidden">{l s='My account' d='Shop.Theme.Global'}</span>
    <i class="fa fa-angle-down" aria-hidden="true"></i>
   </a>
  {/if}
{/if}
</div>
{literal}
<style>
@media(min-width: 992px){
.ApColumn .block.user-block-header{    
	margin: 0;display: flex;
    align-items: center;
}


.user-block-header .signin.leo-quicklogin,
.user-block-header a{ 
	min-width: 40px;
    text-align: center;
    height: 80px;
    line-height: 80px;
    display: block;
    position: relative;  }

.user-block-header .ti-user{     font-size: 21px;
    color: #000;
    vertical-align: middle; }
}


@media(max-width: 991px){
.bottomnav .userinfo-selector a{
	    color: #000;
    display: block;
    font-size: 19px;
    line-height: 19px;
    margin-right: 10px;
}

.bottomnav .box-top{
    position:static;
}

.bottomnav .box-top .col-info{
    width: auto;
    position: absolute;
    right: 15px;
    top: 45px;
}

.bottomnav .user-block-header .signin.leo-quicklogin{
    height: 40px;
    line-height: 40px;
}

.bottomnav .box-top .col-info .popup-over a.popup-title, .box-top .col-info .wislish-button .ap-btn-wishlist, .box-top .col-info #_desktop_cart .header{
    height: 40px;
    line-height: 40px;
}

.box-top .col-info #_desktop_cart .header .cart-products-count{
  top: 5%;
    left: 70%;
}

.box-top .col-info .wislish-button .ap-btn-wishlist .ap-total{
    top: 5%;
    left: 70%;
}

#leo_search_block_top{
    display: block;
    border: 0;
}

#leo_search_block_top .form-control{
    box-shadow: none;
    border: 0;
    border-radius: 0;
}
#leo_search_block_top .btn{
    border-radius: 0;
}
}
</style>
{/literal}