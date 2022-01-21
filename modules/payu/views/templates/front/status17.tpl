{*
 * @author    PayU
 * @copyright Copyright (c) 2014-2017 PayU
 * @license   http://opensource.org/licenses/LGPL-3.0  Open Software License (LGPL 3.0)
 *
 * http://www.payu.com
*}
{extends file=$layout}

{block name='breadcrumb'}{/block}

{block name='content'}


    <section id="main">
        <div class="flex flex-col tablet:flex-row">    
            <div class="w-full tablet:w-1/2 border-0 border-b border-gray-3000 border-solid flex flex-col items-start mb-0 my-14 pb-11 px-0 mx-5 tablet:px-5 tablet:mx-0 tablet-wide:px-24 tablet:border-b-0 tablet:border-r tablet:mb-8 tablet:my-20">
                <h2 class="text-2xl tablet:text-3xl font-normal mb-7 tablet:mb-10">
                    {l s='Thank you for shopping on www.feeby.pl' d='Modules.PayU.Shop'}
                </h2>
                <p class="font-light text-sm tablet:text-base mb-6 ">
                    {l s='Order status' d='Modules.PayU.Shop'} {$orderPublicId} - {$orderStatus} 
                </p>
                <p class="font-light text-sm tablet:text-base mb-6">
                    {l s='Confirmation and order summary has been sent on: ' d='Modules.PayU.Shop'} <br> <span class="font-medium mt-3 tablet:mt-5"> {l s='%email%.' sprintf=['%email%' => $customer.email]} </span>
                </p>
                <p class="font-light text-sm tablet:text-base mb-10 tablet:mb-12 ">
                    {l s='Order number: ' d='Modules.PayU.Shop'} <a href="{$redirectUrl}" class="font-medium"> {l s='%s' sprintf=[$reference]} </a>
                </p>
                <a href="{$urls.pages.index}" class="text-black bg-transparent border-0 uppercase mb-2 flex items-center justify-between cursor-pointer">
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" fill="none" class="mr-2"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z" fill="#181828"></path></svg>
                    {l s='Back to homepage' d='Modules.PayU.Shop'}
                </a>


            </div>
            <div class="w-full tablet:w-1/2 flex flex-col items-start mb-0 my-14 pb-11 px-0 mx-5 tablet:px-5 tablet:mx-0 tablet-wide:px-24 tablet:mb-8 tablet:my-20">
            </div>
        </div>
    </section>



    {* <section id="main">
        <div class="text-xs-center">
            <img src="{$payuLogo}"> {l s='Thanks for choosing PayU payment' d='Modules.PayU.Shop'}
            <h2 style="margin: 30px 0">
                {l s='Order status' d='Modules.PayU.Shop'} {$orderPublicId} - {$orderStatus} <br/>
            </h2>

            {$HOOK_ORDER_CONFIRMATION nofilter}
            {$HOOK_PAYMENT_RETURN nofilter}

            <div class="cart_navigation">
                <a class="bg-main hover:bg-main-hover duration-150 border-0 rounded-full text-white px-4 uppercase whitespace-nowrap font-body py-2 hover:text-white" href="{$redirectUrl}">
                    {l s='Order details' d='Modules.PayU.Shop'}
                </a>
                <a href="{$urls.pages.register}" class="account-link">
                    <i class="material-icons">&#xE5CB;</i>
                    <span>{l s='Create account' d='Modules.PayU.Shop'}</span>
                </a>
                <a href="{$urls.pages.index}" class="account-link">
                    <i class="material-icons">&#xE5CB;</i>
                    <span>{l s='Back to homepage' d='Modules.PayU.Shop'}</span>
                </a>
            </div>
        </div>
    </section> *}

{/block}