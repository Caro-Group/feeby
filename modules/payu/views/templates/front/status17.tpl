{*
 * @author    Payu
 * @copyright Copyright (c) 2014-2017 Payu
 * @license   http://opensource.org/licenses/LGPL-3.0  Open Software License (LGPL 3.0)
 *
 * http://www.Payu.com
*}
{extends file=$layout}

{block name='breadcrumb'}{/block}

    {assign var="orderApproved" value=true}
    {if $request_uri|strstr:"anulowana"}
        {$orderApproved = false}
    {/if}

{block name='content'}


    <section id="main" class="my-7 tablet:my-14 -mx-[10px] tablet:mx-0">
        <div class="flex flex-col tablet:flex-row bg-gray-1000 tablet:rounded-md">    
            <div class="tablet:w-1/2 border-0 border-b border-gray-3000 border-solid flex flex-col items-start mb-0 my-14 pb-11 px-0 mx-5 tablet:px-5 tablet:mx-0 tablet-wide:px-24 tablet:border-b-0 tablet:border-r tablet:mb-12 tablet:my-20">
            {if $orderApproved}
                <h2 class="text-2xl tablet:text-3xl font-normal mb-7 tablet:mb-10">
                    {l s='Thank you for shopping %s on www.feeby.pl' sprintf=['<br>'] d='Modules.Payu.Shop'}
                </h2>                
            {/if}
            
                <p class="font-medium font-body text-sm tablet:text-base mb-6 ">
                    {l s='Your payment has been' d='Modules.Payu.Shop'} 
                    {if $orderApproved}
                        {l s='%s approved%s. The order has been transferred for realization.' sprintf=['<span class="text-green-400">','</span>'] d='Modules.Payu.Shop'} 
                                
                        </p>

                        <p class="font-light font-body text-sm tablet:text-base mb-6">
                            {l s='Confirmation and order summary has been sent on: ' d='Modules.Payu.Shop'} <br> <span class="font-medium mt-3 tablet:mt-5 underline"> {l s='%email%' sprintf=['%email%' => $customer.email]} </span>
                        </p>
                        <p class="font-light font-body text-sm tablet:text-base mb-0 ">
                            {l s='Order number: ' d='Modules.Payu.Shop'} <a href="{$redirectUrl}" class="font-medium text-main-dark hover:text-main transition"> {$orderPublicId} </a>
                        </p>
                    {else}
                        {l s='%s canceled%s.' sprintf=['<span class="text-red-500">','</span>'] d='Modules.Payu.Shop'} 
                                
                        </p>       

                    {/if}

                <a href="{$urls.pages.index}" class="bg-transparent border-0 cursor-pointer flex items-center justify-between mt-10 tablet:mt-12 mb-2 tablet:text-sm text-main-dark hover:text-main transition text-xs uppercase font-normal">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="14" class="mr-2 fill-current"><path fill-rule="evenodd" clip-rule="evenodd" d="M6.25 13.384 0 7.134V6.25L6.25 0l.884.884L1.95 6.067H15v1.25H1.95L7.135 12.5l-.884.884H6.25Z"></path></svg>
                    {l s='Back to homepage' d='Modules.Payu.Shop'}
                </a>


            </div>
            <div class="tablet:w-1/2 flex flex-col items-start mb-0 my-14 pb-11 px-0 mx-5 tablet:px-5 tablet:mx-0 tablet-wide:px-24 tablet:mb-12 tablet:my-20">
                <h2 class="text-2xl tablet:text-3xl font-normal mb-7 tablet:mb-10">
                    {l s='Stay on feeby %s for longer' sprintf=['<br>'] d='Modules.Payu.Shop'}
                </h2>
                <p class="font-light font-body text-sm tablet:text-base mb-0 ">
                    {l s='Create an account with used order information' d='Modules.Payu.Shop'}
                </p>
                <a href="{$urls.pages.index}" class="bg-transparent border-0 cursor-pointer flex items-center justify-between mt-10 tablet:mt-12 mb-2 tablet:text-sm text-main-dark hover:text-main transition text-xs uppercase font-normal">
                    {l s='Create an account' d='Modules.Payu.Shop'}
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" class="ml-2 flex-0 fill-current"><path fill-rule="evenodd" clip-rule="evenodd" d="m9.25 14.359 6.25-6.25v-.884L9.25.975l-.884.884 5.183 5.184H.5v1.25h13.05l-5.185 5.182.884.884h.001Z"></path></svg>                
                </a>
            </div>
        </div>
    </section>



    {* <section id="main">
        <div class="text-xs-center">
            <img src="{$PayuLogo}"> {l s='Thanks for choosing Payu payment' d='Modules.Payu.Shop'}
            <h2 style="margin: 30px 0">
                {l s='Order status' d='Modules.Payu.Shop'} {$orderPublicId} - {$orderStatus} <br/>
            </h2>

            {$HOOK_ORDER_CONFIRMATION nofilter}
            {$HOOK_PAYMENT_RETURN nofilter}

            <div class="cart_navigation">
                <a class="bg-main hover:bg-main-hover duration-150 border-0 rounded-full text-white px-4 uppercase whitespace-nowrap font-body py-2 hover:text-white" href="{$redirectUrl}">
                    {l s='Order details' d='Modules.Payu.Shop'}
                </a>
                <a href="{$urls.pages.register}" class="account-link">
                    <i class="material-icons">&#xE5CB;</i>
                    <span>{l s='Create account' d='Modules.Payu.Shop'}</span>
                </a>
                <a href="{$urls.pages.index}" class="account-link">
                    <i class="material-icons">&#xE5CB;</i>
                    <span>{l s='Back to homepage' d='Modules.Payu.Shop'}</span>
                </a>
            </div>
        </div>
    </section> *}

{/block}