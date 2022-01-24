{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
{extends file='customer/_partials/address-form.tpl'}

{block name='form_field'}
  {if $field.name eq "alias"}
    {* we don't ask for alias here *}
  {elseif $field.name eq "phone"}
    {$smarty.block.parent}
       <div class="flex flex-auto flex-col desktop-presta:flex-row mb-form -mt-form">
         <label class="font-body font-normal ml-5 mt-3 tablet-medium:ml-0 desktop-presta:w-[220px] text-base tablet:text-xl text-main-dark text-left "></label>
          <div class=" flex-1 ">
           <span class="font-body text-[12px] mx-5">{l s='For courier delivery' d='Shop.Theme.Checkout'}</span>
          </div>
       </div>
  {else}
    {$smarty.block.parent}
  {/if}
{/block}

{block name="address_form_url"}
    <form
      method="POST"
      action="{url entity='order' params=['id_address' => $id_address]}"
      data-id-address="{$id_address}"
      data-refresh-url="{url entity='order' params=['ajax' => 1, 'action' => 'addressForm']}"
    >
{/block}

{block name='form_fields' append}
  <input type="hidden" name="saveAddress" value="{$type}">
  {if $type === "delivery" || $customer.addresses|count === 1}
    <div class="form-group row hide">
      <div class="col-md-9 col-md-offset-3">
        <input name = "use_same_address" id="use_same_address" type = "checkbox" value = "1" {if $use_same_address} checked {/if}>
        <label for="use_same_address">{l s='Use this address for invoice too' d='Shop.Theme.Checkout'}</label>
      </div>
    </div>
  {/if}
{/block}

{block name='form_buttons'}
  {if !$form_has_continue_button}
    <div class="flex flex-wrap">
      <a class="js-cancel-address cancel-address cursor-pointer flex items-center justify-between mb-2 text-main-dark uppercase whitespace-nowrap" href="{url entity='order' params=['cancelAddress' => {$type}]}"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="mr-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" fill="#181828"></path></svg> {l s='Cancel' d='Shop.Theme.Actions'}</a>
      <button type="submit" class="bg-main hover:bg-main-hover duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer">{l s='Save' d='Shop.Theme.Actions'}</button>
    </div>
  {else}
    <form>
      {if $customer.addresses|count > 0}
        <a class="js-cancel-address cancel-address cursor-pointer flex items-center justify-between mb-2 text-main-dark uppercase whitespace-nowrap" href="{url entity='order' params=['cancelAddress' => {$type}]}"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="mr-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" fill="#181828"></path></svg>{l s='Cancel' d='Shop.Theme.Actions'}</a>
      {/if}
      <button type="submit" class="continue ml-auto bg-main hover:bg-main-hover duration-150 border-0 rounded-full text-white p-2 px-4 uppercase whitespace-nowrap mb-2 flex items-center justify-between cursor-pointer" name="confirm-addresses" value="1">
          {l s='Continue' d='Shop.Theme.Actions'}
      </button>
    </form>
  {/if}
{/block}
