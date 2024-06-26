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
    {if $page.page_name != 'module-psgdpr-gdpr' && $page.page_name != 'success' && $page.page_name != 'authentication'  && $page.page_name != 'gdpr' }
     {if $page.page_name == 'cms' && ($cms.id ==  '25' || $cms.id ==  '26')  }
     {else} 
       {* .block is used in js *}
      <div class="block relative bg-newsletter-dashed bg-smaller tablet:bg-small bg-right-bottom bg-no-repeat bg-gray-1000 desktop:rounded-md flex flex-col items-center justify-center max-w-screen-desktop-wide mx-auto px-2 tablet:px-8 py-20 overflow-hidden"> 
        <div class="absolute -left-20 bottom-0 bg-newsletter-plane bg-left-bottom h-3/4 tablet:h-full tablet:left-0 w-full bg-no-repeat bg-contain z-10"></div>
        <span class="mb-2 text-2xl tablet:text-4xl text-gray-main title_block text-center z-20">{l s='Newsletter signup' d='Shop.Theme.Global'}</span>
         {* .block_content is used in js *}
        <div class="block_content w-full tablet:w-3/5 z-20">
          <form action="{$urls.pages.index}#footer" method="post" data-newsletter-form>
            <div>
                {if $conditions}
                  <p class="text-center text-base tablet:text-2xl font-body">{$conditions}</p>
                {/if}
                  <p data-newsletter-alert>
                    {if $msg}
                        {$msg}
                    {/if}
                  </p>
              <div>
                <div class="border-gray-2000 border-solid border flex rounded-full pl-4 bg-white ">
                  <input
                  class="w-full bg-transparent border-0 py-3 outline-none font-body"
                    name="email"
                    type="text"
                    value="{$value}"
                    placeholder="{l s='Your email...' d='Shop.Forms.Labels'}"
                  >
      
                  <button
                  class="bg-main-dark hover:bg-main-hover duration-150 border-0 cursor-pointer rounded-full text-white px-4 uppercase whitespace-nowrap font-body"
                    name="submitNewsletter"
                    type="submit"
                    value="{l s='Subscribe' d='Shop.Theme.Actions'}"
                  >
                  {l s='Subscribe' d='Shop.Theme.Actions'}
                    <i class="ti-arrow-right text-white ml-2"></i></span>
                  </button>
                </div>
                <input type="hidden" name="action" value="0">
                <div class="font-body">
                    {if isset($id_module)}
                      {hook h='displayGDPRConsent' id_module=$id_module}
                    {/if}
                </div>
              </div>
            </div>
            {hook h='displayNewsletterRegistration'}
          </form>
        </div>
      </div>
   
     {/if}
   {/if}
   