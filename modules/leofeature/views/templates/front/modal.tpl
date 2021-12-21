{* 
* @Module Name: Leo Feature
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  2007-2018 Leotheme
* @description: Leo feature for prestashop 1.7: ajax cart, review, compare, wishlist at product list 
*}
<div class="modal leo-modal leo-modal-cart fade" tabindex="-1" role="dialog" aria-hidden="true">
	<!--
	<div class="vertical-alignment-helper">
	-->
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
			<span class="modal-title leo-warning leo-alert block text-base text-center">
				<i class="material-icons">info_outline</i>				
				{l s='You must enter a quantity' d='Modules.Leofeature.Shop'}		
			</span>
			
			<span class="modal-title leo-info leo-alert block text-base text-center">
				<i class="material-icons">info_outline</i>				
				{l s='The minimum purchase order quantity for the product is ' d='Modules.Leofeature.Shop'}<strong class="alert-min-qty"></strong>		
			</span>	
			
			<span class="modal-title leo-block leo-alert block text-base text-center">				
				<i class="material-icons">block</i>				
				{l s='There are not enough products in stock' d='Modules.Leofeature.Shop'}
			</span>
		  </div>
		  <!--
		  <div class="modal-body">
			...
		  </div>
		  <div class="modal-footer">
			
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary">Save changes</button>
			
		  </div>
		  -->
		</div>
	  </div>
	<!--
	</div>
	-->
</div>