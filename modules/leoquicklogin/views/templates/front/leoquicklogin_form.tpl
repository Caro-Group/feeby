{* 
* @Module Name: Leo Quick Login
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright Leotheme
*}
<div class="leo-quicklogin-form row{if isset($leo_form_type) && $leo_form_type != ''} {$leo_form_type|escape:'html':'UTF-8'}{/if}">
	{if isset($leo_navigation_style) && $leo_navigation_style}
		<ul class="lql-action{if $leo_form_layout != 'both'} lql-active{else} lql-inactive{/if}">
			<li class="lql-action-bt">
				<p class="lql-bt lql-bt-login font-normal text-xl{if $leo_form_layout == 'login'} lql-active{/if}">{l s='Login' d='Modules.Leoquicklogin.Shop'}</p>
			</li>
			<li class="lql-action-bt">
				<p class="lql-bt lql-bt-register font-normal text-xl{if $leo_form_layout == 'register'} lql-active{/if}">{l s='Register' d='Modules.Leoquicklogin.Shop'}</p>
			</li>
		</ul>
	{/if}
	<div class="leo-form leo-login-form col-sm-{if $leo_form_layout == 'both'}6{else}12{/if}{if $leo_form_layout == 'login' || $leo_form_layout == 'both'} leo-form-active{else} leo-form-inactive{/if}{if $leo_form_layout != 'both'} full-width{/if}">
		<span class="leo-login-title block capitalize mb-3 my-1 text-main-dark text-sm">			
			<span class="title-both">
				{l s='Existing Account Login' d='Modules.Leoquicklogin.Shop'}
			</span>
		
			<span class="title-only">
				{l s='Login to your account' d='Modules.Leoquicklogin.Shop'}
			</span>		
		</span>
		<form class=" leo-login-form-content" action="#" method="post">
			<div class="form-group lql-form-mesg has-success">					
			</div>			
			<div class="form-group lql-form-mesg has-danger">					
			</div>
			<div class="form-group lql-form-content-element">
				<input type="email" autocomplete="email" class="form-control lql-email-login font-body text-sm border-gray-2000 border-solid border flex rounded-full pl-4 bg-white w-full focus:border-gray-3000 focus:ring-0" name="lql-email-login" required="" placeholder="{l s='Email Address' d='Modules.Leoquicklogin.Shop'}">
			</div>
			<div class="form-group lql-form-content-element">
				<input type="password" autocomplete="current-password" class="form-control lql-pass-login font-body text-sm border-gray-2000 border-solid border flex rounded-full pl-4 bg-white w-full focus:border-gray-3000 focus:ring-0" name="lql-pass-login" required="" placeholder="{l s='Password' d='Modules.Leoquicklogin.Shop'}">
			</div>
			<div class="form-group row lql-form-content-element">				
				<div class="col-xs-6">
					{if $leo_check_cookie}
						<input type="checkbox" class="lql-rememberme cursor-pointer bg-white border-2 border-gray-3000 border-solid checked:bg-main-dark checked:focus:bg-main-dark checked:hover:bg-main-dark focus:ring-0 focus:ring-transparent form-checkbox opacity-100 outline-none rounded transition" name="lql-rememberme">
						<label class="form-control-label"><span>{l s='Remember Me' d='Modules.Leoquicklogin.Shop'}</span></label>
					{/if}
				</div>				
				<div class="col-xs-6 text-sm-right">
					<a role="button" href="#" class="leoquicklogin-forgotpass">{l s='Forgot Password' d='Modules.Leoquicklogin.Shop'}</a>
				</div>
			</div>
			<div class="form-group text-right">
				<button type="submit" class="form-control-submit lql-form-bt lql-login-bt btn bg-main-dark border-0 cursor-pointer duration-150 font-body hover:text-white hover:bg-black max-w-[320px] mb-3 px-8 py-3 rounded-full text-white text-lg uppercase w-full whitespace-nowrap">			
					<span class="leoquicklogin-loading leoquicklogin-cssload-speeding-wheel"></span>
					<i class="leoquicklogin-icon leoquicklogin-success-icon material-icons">&#xE876;</i>
					<i class="leoquicklogin-icon leoquicklogin-fail-icon material-icons">&#xE033;</i>
					<span class="lql-bt-txt w-full flex justify-between items-center">					
						{l s='Login' d='Modules.Leoquicklogin.Shop'}
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"></path></svg>
					</span>
				</button>
			</div>
			<div class="form-group lql-callregister">
				<a role="button" href="#" class="lql-callregister-action">{l s='No account? Create one here' d='Modules.Leoquicklogin.Shop'}</a>
			</div>
		</form>
		<div class="leo-resetpass-form">
			<span class="text-main-dark text-main-dark text-sm">{l s='Reset Password' d='Modules.Leoquicklogin.Shop'}</span>
			<form class="lql-form-content leo-resetpass-form-content" action="#" method="post">
				<div class="form-group lql-form-mesg has-success">					
				</div>			
				<div class="form-group lql-form-mesg has-danger">					
				</div>
				<div class="form-group lql-form-content-element">
					<input type="email" class="form-control lql-email-reset font-body text-sm border-gray-2000 border-solid border flex rounded-full pl-4 bg-white w-full focus:border-gray-3000 focus:ring-0" name="lql-email-reset" required="" placeholder="{l s='Email Address' d='Modules.Leoquicklogin.Shop'}">
				</div>
				<div class="form-group">					
					<button type="submit" class="form-control-submit lql-form-bt leoquicklogin-reset-pass-bt bg-main-dark border-0 cursor-pointer duration-150 font-body hover:text-white hover:bg-black max-w-[320px] mb-3 px-5 py-3 rounded-full tablet:max-w-[300px] text-white text-xs  tablet:text-sm uppercase w-full whitespace-nowrap">			
						<span class="leoquicklogin-loading leoquicklogin-cssload-speeding-wheel"></span>
						<i class="leoquicklogin-icon leoquicklogin-success-icon material-icons">&#xE876;</i>
						<i class="leoquicklogin-icon leoquicklogin-fail-icon material-icons">&#xE033;</i>
						<span class="lql-bt-txt w-full flex justify-between items-center">					
							{l s='Reset Password' d='Modules.Leoquicklogin.Shop'}
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" fill="none" class="ml-2 flex-0"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z" fill="#fff"></path></svg>
						</span>
					</button>
				</div>
				
			</form>
		</div>
	</div>
	
	<div class="leo-form leo-register-form col-sm-{if $leo_form_layout == 'both'}6{else}12{/if}{if $leo_form_layout == 'register' || $leo_form_layout == 'both'} leo-form-active{else} leo-form-inactive{/if}{if $leo_form_layout != 'both'} full-width{/if}">
		<span class="leo-register-title block capitalize mb-3 my-1 text-main-dark text-sm">
			{l s='New Account Register' d='Modules.Leoquicklogin.Shop'}
		</span>
		<form class="leo-register-form-content" action="#" method="post">
			<div class="form-group lql-form-mesg has-success">					
			</div>			
			<div class="form-group lql-form-mesg has-danger">					
			</div>
			<div class="form-group lql-form-content-element">
				<input type="text" class="form-control lql-register-firstname font-body text-sm border-gray-2000 border-solid border flex rounded-full pl-4 bg-white w-full focus:border-gray-3000 focus:ring-0" name="lql-register-firstname"  placeholder="{l s='First Name' d='Modules.Leoquicklogin.Shop'}">
			</div>
			<div class="form-group lql-form-content-element">
				<input type="text" class="form-control lql-register-lastname font-body text-sm border-gray-2000 border-solid border flex rounded-full pl-4 bg-white w-full focus:border-gray-3000 focus:ring-0" name="lql-register-lastname" required="" placeholder="{l s='Last Name' d='Modules.Leoquicklogin.Shop'}">
			</div>
			<div class="form-group lql-form-content-element">
				<input type="email" autocomplete="email" class="form-control lql-register-email font-body text-sm border-gray-2000 border-solid border flex rounded-full pl-4 bg-white w-full focus:border-gray-3000 focus:ring-0" name="lql-register-email" required="" placeholder="{l s='Email Address' d='Modules.Leoquicklogin.Shop'}">
			</div>
			<div class="form-group lql-form-content-element">
				<input type="password" autocomplete="current-password" class="form-control lql-register-pass font-body text-sm border-gray-2000 border-solid border flex rounded-full pl-4 bg-white w-full focus:border-gray-3000 focus:ring-0" name="lql-register-pass" required="" placeholder="{l s='Password' d='Modules.Leoquicklogin.Shop'}">
			</div>
			{if $leo_check_terms }
			<div class="form-group lql-form-content-element leo-form-chk">
				<label class="form-control-label">
		            <input type="checkbox" class="lql-register-check cursor-pointer bg-white border-2 border-gray-3000 border-solid checked:bg-main-dark checked:focus:bg-main-dark checked:hover:bg-main-dark focus:ring-0 focus:ring-transparent form-checkbox opacity-100 outline-none rounded transition" name="lql-register-check">
		            <a href="{Configuration::get('LEOQUICKLOGIN_ENABLE_URL_GDPR')}">{l s='I agree to the terms.' d='Modules.Leoquicklogin.Shop'}</a> <span style="color:red">*</span>
		        </label>
			</div>
			{/if}
			<div class="form-group text-right">				
				<button type="submit" name="submit" class="form-control-submit lql-form-bt lql-register-bt bg-main-dark border-0 cursor-pointer duration-150 font-body hover:text-white hover:bg-black max-w-[320px] mb-3 px-5 py-3 rounded-full text-white text-lg uppercase w-full whitespace-nowrap">			
					<span class="leoquicklogin-loading leoquicklogin-cssload-speeding-wheel"></span>
					<i class="leoquicklogin-icon leoquicklogin-success-icon material-icons">&#xE876;</i>
					<i class="leoquicklogin-icon leoquicklogin-fail-icon material-icons">&#xE033;</i>
					<span class="lql-bt-txt">					
						{l s='Create an Account' d='Modules.Leoquicklogin.Shop'}
					</span>
				</button>
			</div>
			<div class="form-group lql-calllogin">
				<div>{l s='Already have an account?' d='Modules.Leoquicklogin.Shop'}</div>
				<a role="button" href="#" class="lql-calllogin-action">{l s='Log in instead' d='Modules.Leoquicklogin.Shop'}</a>
				{l s='Or' d='Modules.Leoquicklogin.Shop'}
				<a role="button" href="#" class="lql-calllogin-action lql-callreset-action">{l s='Reset password' d='Modules.Leoquicklogin.Shop'}</a>
			</div>
		</form>
	</div>
</div>

