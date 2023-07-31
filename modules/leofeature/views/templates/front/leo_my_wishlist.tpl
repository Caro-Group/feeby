{* 
* @Module Name: Leo Feature
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  2007-2018 Leotheme
* @description: Leo feature for prestashop 1.7: ajax cart, review, compare, wishlist at product list 
*}
{extends file=$layout}

{block name='content'}
	<section id="main">
		<div id="mywishlist">
			<h1>{l s='New wishlist' d='Modules.Leofeature.Shop'}</h1>
			<div class="new-wishlist mt-7">
				<div class="form-group">
					<label class="text-sm tablet:text-base" for="wishlist_name">{l s='Name' d='Modules.Leofeature.Shop'}</label>
					<div class="flex flex-wrap tablet:flex-nowrap">
					<input type="text" class="form-control form-input tablet:mr-5 font-body text-sm border-gray-2000 border-solid border flex rounded-full pl-4 bg-white w-full focus:border-gray-3000 focus:ring-0" id="wishlist_name" placeholder="{l s='Enter name of new wishlist' d='Modules.Leofeature.Shop'}">
					<button type="submit" class="bg-main border-0 cursor-pointer duration-150 hover:bg-main-hover leo-save-wishlist-bt mt-5 tablet:mt-0  ml-auto p-2 px-4 rounded-full tablet:w-auto text-white uppercase w-full whitespace-nowrap leo-save-wishlist-bt">
						<span class="leo-save-wishlist-loading cssload-speeding-wheel"></span>
						<span class="leo-save-wishlist-bt-text">
							{l s='Save' d='Modules.Leofeature.Shop'}
						</span>
					</button>
					</div>
				</div>
				<div class="form-group has-success">
					<div class="form-control-feedback"></div>			 
				</div>
				<div class="form-group has-danger">		 
				  <div class="form-control-feedback"></div>		 
				</div>
			</div>
			
				<div class="list-wishlist">
					<table class="table table-striped">
					  <thead class="wishlist-table-head">
						<tr class="border border-solid border-[#eceeef]">
						  <th>{l s='Name' d='Modules.Leofeature.Shop'}</th>
						  <th>{l s='Quantity' d='Modules.Leofeature.Shop'}</th>
						  <th>{l s='Viewed' d='Modules.Leofeature.Shop'}</th>
						  <th class="wishlist-datecreate-head">{l s='Created' d='Modules.Leofeature.Shop'}</th>
						  <th>{l s='Direct Link' d='Modules.Leofeature.Shop'}</th>
						  <th>{l s='Default' d='Modules.Leofeature.Shop'}</th>
						  <th>{l s='Delete' d='Modules.Leofeature.Shop'}</th>
						</tr>
					  </thead>
					  <tbody>
						{if $wishlists}
							{foreach from=$wishlists item=wishlists_item name=for_wishlists}
								<tr>					 
									<td><a href="javascript:void(0)" class="view-wishlist-product" data-name-wishlist="{$wishlists_item.name}" data-id-wishlist="{$wishlists_item.id_wishlist}"><i class="material-icons transition ">&#xE8EF;</i>{$wishlists_item.name}</a><div class="leo-view-wishlist-product-loading leo-view-wishlist-product-loading-{$wishlists_item.id_wishlist} cssload-speeding-wheel"></div></td>
									<td class="wishlist-numberproduct wishlist-numberproduct-{$wishlists_item.id_wishlist}">{$wishlists_item.number_product|intval}</td>
									<td>{$wishlists_item.counter|intval}</td>
									<td class="wishlist-datecreate">{$wishlists_item.date_add}</td>							
									<td><a class="view-wishlist" data-token="{$wishlists_item.token}" target="_blank" href="{$view_wishlist_url}{if $leo_is_rewrite_active}?{else}&{/if}token={$wishlists_item.token}" title="{l s='View' d='Modules.Leofeature.Shop'}">{l s='View' d='Modules.Leofeature.Shop'}</a></td>
									<td>
										
											<label class="form-check-label">
												<input class="default-wishlist checked:relative form-check-input cursor-pointer after:absolute after:content-[''] after:h-[10px] after:m-[3px] after:rounded-sm after:transition after:w-[10px] appearance-none border-2 border-gray-3000 border-solid checked:after:bg-main checked:bg-white checked:border-main checked:focus:bg-white bg-white checked:focus:border-main checked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-5 outline-none ring-transparent rounded transition transition-all w-5" data-id-wishlist="{$wishlists_item.id_wishlist}" type="radio" {if $wishlists_item.default == 1}checked="checked"{/if}>
											</label>
									
									</td>
									<td><a class="delete-wishlist" data-id-wishlist="{$wishlists_item.id_wishlist}" href="javascript:void(0)" title="{l s='Delete' d='Modules.Leofeature.Shop'}"><i class="material-icons">&#xE872;</i></a></td>
								</tr>
							{/foreach}
						{/if}
					  </tbody>
					</table>
				</div>
			<div class="send-wishlist">
				<a class="leo-send-wishlist-button btn btn-info" href="javascript:void(0)" title="{l s='Send this wishlist' d='Modules.Leofeature.Shop'}">
					<i class="material-icons">&#xE163;</i>
					{l s='Send this wishlist' d='Modules.Leofeature.Shop'}
				</a>
			</div>
			<section id="products">
				<div class="leo-wishlist-product products row">
				
				</div>
			</section>
		</div>
	</section>
{/block}

