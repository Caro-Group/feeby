{**
 *  Leo Prestashop Theme Framework for Prestashop 1.5.x
 *
 * @package   leotempcp
 * @version   3.0
 * @author    http://www.leotheme.com
 * @copyright Copyright (C) October 2013 LeoThemes.com <@emai:leotheme@gmail.com>
 *               <info@leotheme.com>.All rights reserved.
 * @license   GNU General Public License version 2
 *
 **}

<!-- Block languages module -->
<div id="leo_block_top" class="popup-over dropdown js-dropdown">
    <a href="javascript:void(0)" data-toggle="dropdown" class="popup-title" title="">
    	{if $enable_userinfo == 1}
    	<i class="ti-user"></i>
    	{else}
	    <i class="ti-settings icons"></i>
	    {/if}
	</a>
	<div class="popup-content dropdown-menu">
		{if $enable_userinfo == 1}
			<ul class="user-info">
		      	{if $logged}
			    <li>
			      <a
			        class="account" 
			        href="{$my_account_url}"
			        title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
			        rel="nofollow"
			      >
			        <i class="ti-user"></i>
			        <span>{l s='Hello' d='Shop.Theme.Global'} {$customerName}</span>
			      </a>
			    </li>
			    <li>
			      <a
			        class="logout"
			        href="{$logout_url}"
			        rel="nofollow"
			        title="{l s='Sign out' d='Shop.Theme.Actions'}"
			      >
			        <i class="ti-unlock"></i>
			        <span>{l s='Sign out' d='Shop.Theme.Actions'}</span>
			      </a>
			    </li>
			    {else}
					  {if Configuration::get('LEOQUICKLOGIN_ENABLE')}
				      <li>
				        <a
						class="signin leo-quicklogin"
						data-enable-sociallogin="enable"
						data-type="popup"
						data-layout="login"
						href="javascript:void(0)"
						title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
						rel="nofollow"
				        >
				          <i class="ti-lock"></i>
				          <span>{l s='Sign in' d='Shop.Theme.Actions'}</span>
				        </a>
				      </li>
				      <li>
				        <a
						class="register leo-quicklogin"
						data-enable-sociallogin="enable"
						data-type="popup"
						data-layout="register"
						href="javascript:void(0)"
						title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
						rel="nofollow"
				        >
				        	<i class="ti-user"></i>
				        	<span>{l s='Register' d='Shop.Theme.Actions'}</span>
				        </a>
				      </li>
				    {else}
				      <li>
				        <a
						href="{$my_account_url}"
						title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
						rel="nofollow"
				        >
				        	<i class="ti-lock"></i>
				        	<span>{l s='Sign in' d='Shop.Theme.Actions'}</span>
				        </a>
				      </li>
				      <li>
				        <a
						href="{$urls.pages.register}" 
						title="{l s='Register' d='Shop.Theme.Customeraccount'}"
						rel="nofollow"
				        >
							<svg class="fill-current text-gray-main hover:text-main transition" width="25" height="25" viewBox="0 0 25 25"  xmlns="http://www.w3.org/2000/svg">
								<path d="M7 6.49992V6.49997C7 9.53762 9.68646 12 13 12C16.3138 12 19 9.53762 19 6.49997C19 3.46238 16.3138 1 13 1H12.9999C9.68796 1.00354 7.00387 3.46375 7 6.49992ZM18.0769 6.50003C18.0769 9.07019 15.804 11.1538 13 11.1538C10.1961 11.1538 7.92309 9.07019 7.92309 6.49997C7.92309 3.92981 10.1961 1.84616 12.9999 1.84616C15.8027 1.84902 18.0737 3.93102 18.0769 6.50003Z"/>
								<path d="M3 23.608C3 23.6071 3 23.6062 3 23.6053C3 21.2324 3.98805 19.0459 5.78071 17.4476C7.18762 16.1935 8.98469 15.387 10.9509 15.1087L10.9555 15.108L10.9556 15.1093L10.9561 15.1092L10.956 15.1079L10.9669 15.1064C10.9628 15.1071 10.9593 15.108 10.9563 15.1092C10.9596 15.1079 10.9632 15.107 10.9669 15.1064L10.9684 15.1062C11.4714 15.0353 11.9817 14.9996 12.4942 15V15.0002L12.5058 15C13.0183 14.9996 13.5286 15.0353 14.0316 15.1062L14.0491 15.1087C16.0153 15.387 17.8124 16.1934 19.2193 17.4476C21.0119 19.0459 22 21.2324 22 23.6053C22 23.8233 21.7971 24 21.5473 24H6.74924V24C6.50326 23.9959 6.30498 23.8205 6.30498 23.6051C6.30498 23.387 6.50796 23.2101 6.7579 23.2101C6.76339 23.2101 6.76882 23.2102 6.7742 23.2103H21.0845C20.9824 21.1996 20.0995 19.3614 18.5721 17.9995C16.9743 16.5755 14.8182 15.7907 12.5 15.7895C10.1818 15.7907 8.02572 16.5755 6.42789 17.9995C4.90045 19.3614 4.01759 21.1996 3.91545 23.2103L3.89293 23.6107C3.89293 23.8237 3.6963 23.997 3.45275 24L3.45269 24C3.45162 24 3.4506 24 3.44958 24C3.44856 24 3.44748 24 3.44647 24C3.20003 24 3 23.8256 3 23.6107C3 23.6098 3 23.6089 3 23.608ZM14.0958 15.1655C14.0961 15.1641 14.0962 15.1627 14.0964 15.1613C14.0984 15.1395 14.0837 15.1196 14.0613 15.1117C14.0844 15.1203 14.0812 15.1416 14.0713 15.1619L14.0958 15.1655ZM10.9605 15.1573L10.9561 15.1092L10.9556 15.1094L10.9602 15.1573H10.9605ZM10.9796 15.1546C10.9801 15.1296 10.9783 15.1049 10.969 15.1061L10.9669 15.1064L10.9716 15.1557L10.9796 15.1546Z"/>
							</svg>
				        	<span>{l s='Register' d='Shop.Theme.Actions'}</span>
				        </a>
				      </li>
				    {/if}
			    {/if}
			  	{if Configuration::get('LEOFEATURE_ENABLE_PRODUCTWISHLIST')}
			  	  <li>
			        <a
			          	class="btn-wishlist"
				        href="{url entity='module' name='leofeature' controller='mywishlist'}"
				        title="{l s='Wishlist' d='Shop.Theme.Global'}"
				        rel="nofollow"
			        >
						<svg class="fill-current text-gray-main hover:text-main transition" width="25" height="25" viewBox="0 0 25 25" xmlns="http://www.w3.org/2000/svg">
							<path d="M10.1437 20.8404C10.1387 20.8368 10.1339 20.8329 10.1295 20.8286C8.94461 19.6949 3.29531 14.0339 3.29531 14.0339C3.26756 14.0063 3.24382 13.9756 3.22442 13.9423L3.22488 13.943L3.22219 13.9384L3.21916 13.9356L3.22099 13.9363L3.22087 13.9361L3.21887 13.9354C1.80654 12.6437 1 10.7562 1 8.73111C1 5.0207 3.67961 2 6.97554 2C9.5231 2 11.6258 4.35978 12.4767 5.47237L12.5 5.50281L12.5233 5.47237C13.3742 4.35978 15.4769 2 18.0245 2C21.3204 2 24 5.0207 24 8.73111C24 10.4217 23.4367 12.0356 22.4111 13.2869L22.4092 13.2891L22.4079 13.2917C22.3871 13.3307 22.3604 13.3666 22.3278 13.3986L22.3181 13.4026L22.2842 13.4186C22.3003 13.4186 22.3158 13.4118 22.3267 13.3998C22.2443 13.4906 22.1708 13.5616 22.0964 13.6315L22.0009 13.7239L12.819 22.8683C12.7309 22.9561 12.6154 23 12.5 23H12.4981C12.4678 23 12.4383 22.997 12.4098 22.9913C12.3284 22.9759 12.2489 22.9396 12.1939 22.8825C12.1034 22.8002 12.0466 22.6818 12.0466 22.5502C12.0466 22.4114 12.1099 22.2871 12.2094 22.2046C13.7762 20.6033 21.4751 12.9799 21.4751 12.9799C21.4754 12.9795 21.4757 12.9793 21.4761 12.9789C21.5252 12.9322 21.5749 12.8865 21.6203 12.8347L21.6205 12.835V12.8349L21.6204 12.8346L21.6218 12.8329L21.6229 12.8311C21.6326 12.816 21.6435 12.8013 21.6553 12.7873L21.6549 12.788C21.6525 12.7909 21.6506 12.794 21.6493 12.797C21.6414 12.8123 21.641 12.8305 21.6484 12.8466C21.6525 12.8555 21.6588 12.863 21.6665 12.8686L21.6666 12.8685C21.659 12.8629 21.6527 12.8555 21.6485 12.8466C21.6413 12.8311 21.6415 12.8135 21.6486 12.7985L21.6493 12.797C21.6511 12.7931 21.6535 12.7895 21.6564 12.7861L21.6571 12.7852C22.5859 11.6853 23.0978 10.2456 23.0978 8.73111C23.0978 5.51427 20.8207 2.89896 18.0245 2.89896C16.9178 2.89896 15.8756 3.47313 15.0223 4.16569C13.7465 5.20128 12.8935 6.50015 12.8794 6.52176L12.8317 6.54758L12.8314 6.54781L12.8794 6.52176C12.7961 6.6499 12.6479 6.71322 12.5 6.71322C12.3521 6.71322 12.2039 6.6499 12.1206 6.52181L12.1684 6.54769L12.1686 6.54781L12.1206 6.52176C12.1065 6.5001 11.2535 5.20128 9.97767 4.16569C9.12444 3.47313 8.08217 2.89896 6.97554 2.89896C4.17926 2.89896 1.90221 5.51421 1.90221 8.73111C1.90221 10.554 2.6421 12.243 3.93221 13.3654C3.93221 13.3654 3.93227 13.3655 3.93233 13.3656C3.97587 13.4037 4.01163 13.4493 4.03714 13.4993L4.03926 13.5035L10.7566 20.1825C10.8575 20.265 10.9219 20.3902 10.9219 20.5302C10.9219 20.7784 10.7196 20.9799 10.4704 20.9799C10.3419 20.9799 10.226 20.9263 10.1437 20.8404ZM3.302 13.9554C3.30343 13.9572 3.30481 13.959 3.30624 13.9608C3.29685 13.9671 3.28564 13.9707 3.27397 13.9707C3.27397 13.9707 3.28793 13.9655 3.302 13.9554ZM3.2393 13.9433L3.23964 13.9435L3.25755 13.9504L3.2393 13.9433ZM4.03285 13.5777L4.02879 13.5736C4.04041 13.5637 4.05007 13.5504 4.04945 13.5333C4.05007 13.542 4.04876 13.5508 4.04527 13.5592C4.04235 13.5663 4.03812 13.5725 4.03285 13.5777ZM22.2541 13.3943L22.2676 13.3798L22.2842 13.4186C22.2696 13.4186 22.2558 13.413 22.2455 13.4035L22.2541 13.3943ZM22.2715 13.3756L22.2709 13.3762L22.2876 13.415L22.2715 13.3756ZM22.3613 13.3144L22.3578 13.3071L22.3567 13.3069L22.3613 13.3144ZM21.6883 12.8374C21.6792 12.808 21.667 12.7751 21.66 12.7822L21.6566 12.7858C21.6533 12.7897 21.6506 12.794 21.6486 12.7985C21.6388 12.8218 21.6557 12.8441 21.6727 12.8594C21.6776 12.8519 21.6828 12.8446 21.6883 12.8374ZM12.809 6.5213C12.8051 6.52603 12.8011 6.53059 12.7969 6.5351C12.8124 6.5457 12.8302 6.54764 12.8314 6.54775C12.8305 6.54672 12.8205 6.53441 12.809 6.5213Z" />
						</svg>
					
				        <span>{l s='Wishlist' d='Shop.Theme.Global'}</span>
				  		(<span class="ap-total-wishlist ap-total"></span>)
			        </a>
			      </li>
			  	{/if}
			    {if Configuration::get('LEOFEATURE_ENABLE_PRODUCTCOMPARE')}
			    <li>
			        <a
			            class="btn-compare"
			            href="{url entity='module' name='leofeature' controller='productscompare'}"
			            title="{l s='Compare' d='Shop.Theme.Global'}"
			            rel="nofollow"
			        >
			            <i class="ti-reload"></i>
			            <span>{l s='Compare' d='Shop.Theme.Global'}</span>
			    		(<span class="ap-total-compare ap-total"></span>)
			        </a>
			    </li>
			    {/if}
		    </ul>
		{/if}
		<div class="language-selector">
			<span>{l s='Language' d='Shop.Theme.Global'}</span>
			<ul class="link">
				{foreach from=$languages item=language}
		          	<li {if $language.id_lang == $current_language.id_lang} class="current" {/if}>
		            	<a href="{url entity='language' id=$language.id_lang}" class="dropdown-item" title="{$language.name_simple}">
		            		<span class="lang-img"><img class="lazy" data-src="{$img_lang_url|escape:'html':'UTF-8'}{$language.id_lang|escape:'html':'UTF-8'}.jpg" alt="{$language.iso_code|escape:'html':'UTF-8'}" width="16" height="11" /></span>
		            		{*<span class="lang-name">{$language.name_simple}</span>*}
		            		<span class="lang-name">{$language.iso_code|escape:'html':'UTF-8'}</span>
		            	</a>
		          	</li>
		        {/foreach}
			</ul>
		</div>
		<div class="currency-selector">
			<span>{l s='Currency' d='Shop.Theme.Global'}</span>
			<ul class="link">
				{foreach from=$currencies item=currency}
		        	<li {if $currency.current} class="current" {/if}>
		          		<a title="{$currency.name}" rel="nofollow" href="{$currency.url}" class="dropdown-item">
		          			<span class="cur-code">{$currency.iso_code}</span>
		          			<span class="cur-name">{$currency.sign}</span>
		          		</a>
		        	</li>
		      	{/foreach}
			</ul>
		</div>
	</div>
</div>

<!-- /Block languages module -->
