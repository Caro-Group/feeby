{* 
* @Module Name: Leo Quick Login
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright Leotheme
*}

<div class="modal lql-social-modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
			<span class="modal-title lql-social-modal-mesg lql-social-loading block">
				<span class="leoquicklogin-cssload-speeding-wheel"></span>
			</span>
			<span class="modal-title lql-social-modal-mesg error-email block">
				<i class="material-icons">&#xE033;</i>
				{l s='Can not login without email!' d='Modules.Leoquicklogin.Shop'}
			</span>
			<span class="modal-title lql-social-modal-mesg error-email block">				
				{l s='Please check your social account and give the permission to use your email info' d='Modules.Leoquicklogin.Shop'}
			</span>
			<span class="modal-title lql-social-modal-mesg error-login block">
				<i class="material-icons">&#xE033;</i>
				{l s='Can not login!' d='Modules.Leoquicklogin.Shop'}
			</span>
			<span class="modal-title lql-social-modal-mesg error-login block">
				{l s='Please contact with us or try to login with another way' d='Modules.Leoquicklogin.Shop'}
			</span>
			<span class="modal-title lql-social-modal-mesg success block">
				<i class="material-icons">&#xE876;</i>
				{l s='Successful!' d='Modules.Leoquicklogin.Shop'}
			</span>
			<span class="modal-title lql-social-modal-mesg success block">			
				{l s='Thanks for logging in' d='Modules.Leoquicklogin.Shop'}
			</span>
		  </div>
		  
		  		 
		</div>
	  </div>
	
</div>