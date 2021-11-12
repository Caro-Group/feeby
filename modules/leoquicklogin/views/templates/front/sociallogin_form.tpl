{* 
* @Module Name: Leo Quick Login
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright Leotheme
*}

<div class="lql-social-login clearfix {if $show_button_text}show-bt-txt{/if}">
	{if $fb_enable && $fb_app_id != ''}
		<!--
		<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false" scope="public_profile,email" onlogin="checkLoginState();"></div>
		-->
		<button class="hover:opcaity-80 duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer facebook-login-bt" onclick="doFbLogin();">{if !$show_button_text}<span class="fa fa-facebook"></span>{/if}{if $show_button_text}{l s='Sign in with Facebook' d='Modules.Leoquicklogin.Shop'}<svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"/></svg>{/if}</button>
		
	{/if}
	<!--
		<div class="g-signin2" data-scope="profile email" data-longtitle="true" data-theme="dark" data-onsuccess="googleSignIn" data-onfailure="googleFail"></div>
	-->
	{if $google_enable && $google_client_id != ''}
		<button class="hover:opcaity-80 duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer google-login-bt">{if !$show_button_text}<span class="fa fa-google"></span>{/if}{if $show_button_text}{l s='Sign in with Google' d='Modules.Leoquicklogin.Shop'}<svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"/></svg>{/if}</button>
	{/if}
	{if $twitter_enable && $twitter_api_key != '' && $twitter_api_secret !== ''}
		<button class="hover:opcaity-80 duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer twitter-login-bt">{if !$show_button_text}<span class="fa fa-twitter"></span>{/if}{if $show_button_text}{l s='Sign in with Twitter' d='Modules.Leoquicklogin.Shop'}<svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"/></svg>{/if}</button>
	{/if}
</div>
{if isset($login_page) && $login_page}
<hr>
{/if}

