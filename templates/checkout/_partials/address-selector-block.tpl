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
{block name='address_selector_blocks'}
  {foreach $addresses as $address}
    <article
      class="address-item {if $address.id == $selected} selected {/if} bg-gray-1000 mb-5 p-2 pb-4 rounded-md  "
      id="{$name|classname}-address-{$address.id}"
    >
      <header >
        <label class="radio-block">
          <span class="mr-5 align-[-3px]" >
            <input
              class="after:absolute after:bg-white after:content-[''] after:h-[10px] after:m-[3px] after:rounded-sm after:transition after:w-[10px] appearance-none border-2 border-gray-3000 border-solid checked:after:bg-main checked:bg-white checked:border-main checked:focus:bg-white checked:focus:border-main checked:focus:ring-transparent checked:focus:shadow-none checked:hover:bg-white checked:hover:border-main checked:ring-0 checked:ring-transparent focus:ring-0 focus:ring-offset-0 focus:ring-transparent h-5 outline-none ring-transparent rounded transition transition-all w-5"
              type="radio"
              name="{$name}"
              value="{$address.id}"
              {if $address.id == $selected}checked{/if}
            >
          </span>
          <span class="font-body font-medium tablet:text-xl text-base">{$address.alias}</span>
          <div class="font-body font-light pt-3 tablet:p-5 phablet:ml-8 tablet:text-base text-sm">{$address.formatted nofilter}</div>
        </label>
      </header>
      <hr>
      <footer class="address-footer">
        {if $interactive}
          <a
            class="font-body font-normal hover:text-main mr-5 tablet:text-sm text-main-dark text-xs transition uppercase"
            data-link-action="delete-address"
            href="{url entity='order' params=['id_address' => $address.id, 'deleteAddress' => true, 'token' => $token]}"
          >
            {l s='Delete' d='Shop.Theme.Actions'}
          </a>
          <a
            class="border-2 border-main-dark border-solid font-body font-normal hover:bg-main-dark hover:text-white px-6 py-3 rounded-full text-main-dark text-sm transition uppercase whitespace-nowrap"
            data-link-action="edit-address"
            href="{url entity='order' params=['id_address' => $address.id, 'editAddress' => $type, 'token' => $token]}"
          >
            {l s='Edit' d='Shop.Theme.Actions'}
          </a>
          
        {/if}
      </footer>
    </article>
  {/foreach}
  {if $interactive}
    <p>
      <button class="ps-hidden-by-js form-control-submit center-block" type="submit">{l s='Save' d='Shop.Theme.Actions'}</button>
    </p>
  {/if}
{/block}
