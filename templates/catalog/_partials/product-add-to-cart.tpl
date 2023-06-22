{**
 * PrestaShop
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
<div class="product-add-to-cart desktop-wide:!pb-0">
  {if !$configuration.is_catalog}
    {block name='product_quantity'}
      <div class="product-quantity clearfix">
        <div class="flex ">
          <div class="qty clearfix mr-5">
            <span class="control-label sr-only">{l s='Quantity' d='Shop.Theme.Catalog'}</span>
            <input
              type="number"
              name="qty"
              id="quantity_wanted"
              value="{$product.quantity_wanted}"
              class="input-group -mr-5 border border-gray-2000 border-solid float-left focus:ring-0 font-normal h-[50px] pl-1 pr-5 py-3 rounded-md text-center text-lg w-[65px] tablet:w-[75px]"
              min="{$product.minimal_quantity}"
              aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
            >
          </div>

          <div class="add-to-cart-anim add flex-1">
            <button
              class="bg-main border-0 cursor-pointer font-medium h-full hover:bg-main-hover overflow-hidden phone-wide:text-base px-4 relative rounded-full tablet:text-xl text-base text-center text-white transition uppercase w-full duration-200"
              data-button-action="add-to-cart"
              type="submit"
              {if !$product.add_to_cart_url}
                disabled
              {/if}
            >
            <span>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
            <svg class="success" width="27" height="20" viewBox="0 0 27 20" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M26.2442 0.487161C26.8949 1.13717 26.8954 2.19156 26.2454 2.84222L9.59263 19.5117C9.28039 19.8242 8.85673 19.9999 8.41493 20C7.97312 20.0001 7.54938 19.8247 7.23698 19.5123L0.487813 12.7631C-0.162518 12.1127 -0.162518 11.0583 0.487813 10.408C1.13815 9.75766 2.19254 9.75766 2.84287 10.408L8.41392 15.9791L23.8892 0.488338C24.5392 -0.162319 25.5936 -0.162846 26.2442 0.487161Z" fill="white"/>
            </svg>
            <svg class="error" width="23" height="23" viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg">
              <rect x="2.12109" y="0.000244141" width="29" height="3" rx="1" transform="rotate(45 2.12109 0.000244141)" fill="#fff"/>
              <rect y="20.5061" width="29" height="3" rx="1" transform="rotate(-45 0 20.5061)" fill="#fff"/>
            </svg>



              
            </button>
          </div> 

	  
          {hook h='displayProductActions' product=$product}

        </div>

        {block name='product_minimal_quantity'}
          <div class="product-minimal-quantity">
            {if $product.minimal_quantity > 1}
              {l
              s='The minimum purchase order quantity for the product is %quantity%.'
              d='Shop.Theme.Checkout'
              sprintf=['%quantity%' => $product.minimal_quantity]
              }
            {/if}
          </div>
        {/block}

      </div>
    {/block}

  {/if}
</div>
