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
				        	<i class="ti-user"></i>
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
			        	<i class="ti-heart"></i>
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
