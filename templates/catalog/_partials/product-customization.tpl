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
<section class="product-customization">
  {if !$configuration.is_catalog}
    <div class="bg-gray-1000 -mx-[20px] tablet:mx-0 p-5 rounded-md">
      <p class="font-body font-light text-sm tablet:text-base text-main-dark">{l s='Product customization' d='Shop.Theme.Catalog'}</p>
      <p class="font-body font-light text-xs tablet:text-sm text-main-dark">{l s='Don\'t forget to save your customization to be able to add to cart' d='Shop.Forms.Help'}</p>

      {block name='product_customization_form'}
        <form method="post" action="{$product.url}" enctype="multipart/form-data">
          <ul class="clearfix">
            {foreach from=$customizations.fields item="field"}
              <li class="product-customization-item">
                <label class="font-body font-normal text-sm tablet:text-base text-main-dark ml-5"> {$field.label}</label>
                {if $field.type == 'text'}
                  <textarea placeholder="{l s='Your message here' d='Shop.Forms.Help'}" class="product-message" maxlength="250" {if $field.required} required {/if} name="{$field.input_name}"></textarea>
                  <small class="font-body float-right text-[10px] text-gray-3000">{l s='250 char. max' d='Shop.Forms.Help'}</small>
                  {if $field.text !== ''}
                      <h6 class="font-body font-light text-sm tablet:text-base text-main-dark">{l s='Your customization:' d='Shop.Theme.Catalog'}
                          <label class="font-body font-light text-xs tablet:text-sm text-main-dark">{$field.text}</label>
                      </h6>
                  {/if}
                {elseif $field.type == 'image'}
                  {if $field.is_customized}
                    <br>
                    <div class="mb-3">
                      <img class="lazy ml-5" data-src="{$field.image.small.url}">
                      <a class="remove-image ml-2 text-sm text-main-dark group hover:text-main" href="{$field.remove_image_url}" rel="nofollow">
                        <span>
                          {l s='Remove Image' d='Shop.Theme.Actions'}
                          <i class="material-icons"></i>
                        </span>
                      </a>
                    </div>
                  {/if}
                  <span class="border-gray-2000 border-solid border flex rounded-full bg-white relative">
                    <span class="js-file-name pl-5 py-3 text-gray-3000 text-sm italic font-medium font-body ">{l s='No selected file' d='Shop.Forms.Help'}</span>
                    <input class="js-file-input absolute cursor-pointer file:absolute file:bg-main file:border-0 file:cursor-pointer file:duration-150 file:font-body file:m-0 file:px-4 file:py-3 file:right-0 file:rounded-full file:text-white file:uppercase file:whitespace-nowrap focus:outline focus:outline-1 focus:outline-gray-3000 focus:rounded-full h-full hover:file:bg-main-hover left-0 text-transparent w-full z-20" {if $field.required} required {/if} type="file" name="{$field.input_name}">
                    {* <button class="btn btn-primary">{l s='Choose file' d='Shop.Theme.Actions'}</button> *}
                  </span>
                  <small class="float-right font-body text-gray-300- text-[10px] mb-[15px] mr-5">{l s='.png .jpg .gif' d='Shop.Forms.Help'}</small>
                {/if}
              </li>
            {/foreach}
          </ul>
          <div class="clearfix">
            <button class="bg-transparent border-2 border-main-dark border-solid cursor-pointer flex font-body font-normal hover:bg-main-dark hover:text-white items-center justify-between mx-auto tablet:mx-0 tablet:ml-auto px-6 py-3 rounded-full text-main-dark text-sm transition uppercase" type="submit" name="submitCustomizedData">{l s='Save Customization' d='Shop.Theme.Actions'}</button>
          </div>
        </form>
      {/block}

    </div>
  {/if}
</section>
