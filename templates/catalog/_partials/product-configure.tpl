{* -translate-x-1/5 -translate-x-2/5 -translate-x-3/5 -translate-x-4/5  *}
{assign var="imageOriginal" value="{$link->getImageLink($product->link_rewrite, $product.cover.id_image)}"}

<div class="modal" id="productConfigurable" tabindex="-1" role="dialog" aria-hidden="true">
  <div role="document">
    <div class="modal-content">
      <div class="modal-body p-0">
      
        <div data-product-configurable="modal" class="transition fixed inset-0 bg-main-dark bg-opacity-50 z-30 p-0 desktop-presta:px-12  desktop-presta:py-5 overflow-y-auto"  aria-labelledby="modal-title" role="dialog" aria-modal="true">
            <div class="relative flex flex-col desktop-presta:flex-row bg-white h-full overflow-y-auto desktop-presta:overflow-auto w-full content-max:mx-auto content-max:max-w-screen-content-max desktop-presta:rounded-[5px] p-5 desktop-presta:p-[50px] min-h-[640px] full-hd:min-h-[860px] ">
                <button data-dismiss="modal" aria-label="Close" class=" absolute top-5 right-5 desktop-presta:top-[50px] desktop-presta:right-[50px] transition cursor-pointer bg-transparent border-0 ">
                    <i class=" material-icons text-main-dark hover:text-main text-4xl transition select-none"></i>
                </button>
                
                <h1 class="max-w-screen-tablet-wide mx-auto w-full desktop-presta:hidden mt-5 desktop-presta:mt-0 flex-shrink-0 font-header product-detail-name text-xl leading-24px mb-5 pr-[46px]" itemprop="name">
                    {block name='page_title'}
                        {$product.name}
                    {/block}
                </h1>

                <div class="flex justify-between flex-col flex-shrink-0 desktop-presta:flex-shrink bg-gray-1000 rounded-[5px] flex-auto w-full min-h-inherit mx-auto max-w-screen-tablet-wide relative mb-10 desktop-presta:mb-0 overflow-hidden">
                    <div class="w-full pt-5 px-5">
                        <span class="group inline-flex items-center w-8 h-8 desktop-presta:w-10 desktop-presta:h-10 text-gray-3000 hover:text-main">
                            <svg class="fill-current transition z-50" width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M25 3.125C12.9199 3.125 3.125 12.9199 3.125 25C3.125 37.0801 12.9199 46.875 25 46.875C37.0801 46.875 46.875 37.0801 46.875 25C46.875 12.9199 37.0801 3.125 25 3.125ZM25 43.1641C14.9707 43.1641 6.83594 35.0293 6.83594 25C6.83594 14.9707 14.9707 6.83594 25 6.83594C35.0293 6.83594 43.1641 14.9707 43.1641 25C43.1641 35.0293 35.0293 43.1641 25 43.1641Z"/>
                            <path d="M22.6562 16.4062C22.6563 17.0279 22.9032 17.624 23.3427 18.0635C23.7823 18.5031 24.3784 18.75 25 18.75C25.6216 18.75 26.2177 18.5031 26.6573 18.0635C27.0968 17.624 27.3438 17.0279 27.3438 16.4062C27.3438 15.7846 27.0968 15.1885 26.6573 14.749C26.2177 14.3094 25.6216 14.0625 25 14.0625C24.3784 14.0625 23.7823 14.3094 23.3427 14.749C22.9032 15.1885 22.6563 15.7846 22.6562 16.4062V16.4062ZM26.1719 21.875H23.8281C23.6133 21.875 23.4375 22.0508 23.4375 22.2656V35.5469C23.4375 35.7617 23.6133 35.9375 23.8281 35.9375H26.1719C26.3867 35.9375 26.5625 35.7617 26.5625 35.5469V22.2656C26.5625 22.0508 26.3867 21.875 26.1719 21.875Z"/>
                        </svg>
                            <div class="invisible group-hover:visible hover:visible flex justify-center items-center rounded-[5px] absolute bg-gray-1000/90 duration-200 h-full inset-0 opacity-0 group-hover:opacity-100 hover:opacity-100 hover:opacity-100 z-0 group-hover:z-40 hover:z-40 transition w-full py-[50px] ">
                                <div class="h-full p-5 tablet-medium:p-12 overflow-y-auto text-main-dark font-body font-normal">
                                    {hook h='displayApSC' sc_key=sc2244738648}
                                </div>
                            </div>
                        </span>
                    </div>
                    <div class="max-w-[700px] desktop-wide:max-w-[650px] full-hd:max-w-[800px] w-full py-5 mx-auto z-10 ">
                        <div class="swiper" data-product-configurable="swiper">
                            <div class="swiper-wrapper items-center">
                                    <div class="swiper-slide size flex-1 phone-wide:flex-[0_1_30px]">
                                        <span class="font-body text-main-dark tablet:text-base font-light transform -rotate-90 block"> 300m </span>
                                    </div>  
                                {for $part=1 to 5}
                                    <div class="swiper-slide w-[100px] phablet:w-[150px] overflow-hidden " data-product-configurable="{$part}">
                                        <img class=" select-none w-[500%] max-w-none tablet:object-cover object-cover {if $part> 1 } -translate-x-{$part - 1}/5 {/if}" src="{$imageOriginal}" alt="{$product.name} part {$part}">
                                        <div class="text-center flex flex-col py-2">
                                            <span class="part-name text-main-dark font-body tablet:text-base font-normal transition">
                                                {if $part == 1}{l s='Panel A' d='Shop.Theme.Catalog'}{/if}
                                                {if $part == 2}{l s='Panel B' d='Shop.Theme.Catalog'}{/if}
                                                {if $part == 3}{l s='Panel C' d='Shop.Theme.Catalog'}{/if}
                                                {if $part == 4}{l s='Panel D' d='Shop.Theme.Catalog'}{/if}
                                                {if $part == 5}{l s='Panel E' d='Shop.Theme.Catalog'}{/if}
                                            </span>
                                            <span class=" text-main-dark font-body tablet:text-base font-light">{l s='100cm' d='Shop.Theme.Catalog'}</span>
                                        </div>
                                    </div>        
                                {/for}
                            </div>
                        </div>   
                    </div>
                    <div class=" flex justify-between items-center flex-wrap-reverse gap-y-2.5 w-full pb-5 px-5 z-10 ">
                        <div>
                            <p class="text-[10px] tablet:text-xs text-gray-3000 font-body font-normal mb-1">
                                {l s='1. Rekomendujemy zamówienie próbki' d='Shop.Theme.Catalog'}
                            </p>
                            
                            <p class="text-[10px] tablet:text-xs text-gray-3000 font-body font-normal">
                                {l s='2. Prezentowany podział jest tylko w celach poglądowych' d='Shop.Theme.Catalog'}
                            </p>
                            
                        </div>
                        <a href="#" data-product-configurable="pdf" class="p-1 focus:text-gray-3000 focus:hover:text-main flex-[0_0_auto] flex items-center text-sm text-gray-3000 hover:text-main transition font-body font-normal tablet:text-base">
                            {l s='Pobierz PDF' d='Shop.Theme.Catalog'}
                            <svg class="ml-2 fill-current " width="20" height="26" viewBox="0 0 20 26"  xmlns="http://www.w3.org/2000/svg">
                                <path d="M18.2734 23.5622C18.5822 23.5623 18.8795 23.6796 19.1052 23.8904C19.3308 24.1013 19.4681 24.3899 19.4891 24.698C19.5102 25.0061 19.4135 25.3107 19.2186 25.5503C19.0237 25.7899 18.7451 25.9465 18.4392 25.9886L18.2734 26H1.21853C0.909704 25.9999 0.612426 25.8826 0.386765 25.6718C0.161104 25.4609 0.0238862 25.1723 0.0028366 24.8642C-0.018213 24.5561 0.0784758 24.2515 0.273366 24.0119C0.468255 23.7723 0.746815 23.6157 1.05276 23.5736L1.21853 23.5622H18.2734ZM9.75735 0.00162528C10.0516 0.00203008 10.3358 0.108877 10.5574 0.302443C10.7791 0.496008 10.9232 0.763223 10.9632 1.05476L10.9746 1.22053V17.7862L15.795 12.9594C16.0012 12.7527 16.2747 12.6269 16.5658 12.6048C16.8568 12.5827 17.1462 12.6659 17.3812 12.8391L17.5193 12.9561C17.7262 13.1626 17.852 13.4365 17.8737 13.728C17.8955 14.0194 17.8118 14.309 17.638 14.5439L17.5209 14.6805L10.6252 21.5876L10.5114 21.69L10.3619 21.7858L10.3034 21.82L10.1555 21.8817L9.9605 21.9305L9.84673 21.9435L9.74922 21.9467C9.66674 21.9466 9.58449 21.9379 9.50382 21.9207L9.3738 21.8834C9.21933 21.8337 9.07665 21.7529 8.9545 21.6461L1.98238 14.6821C1.76372 14.4649 1.63548 14.1729 1.62346 13.8649C1.61143 13.5569 1.71653 13.2558 1.91758 13.0222C2.11864 12.7886 2.40072 12.6399 2.70705 12.6059C3.01339 12.5719 3.32121 12.6552 3.56857 12.8391L3.70509 12.9577L8.53682 17.7797V1.2189C8.53682 0.89563 8.66524 0.585597 8.89383 0.357008C9.12242 0.12842 9.43245 0 9.75572 0L9.75735 0.00162528Z"/>
                            </svg>
                        </a>
                    </div>
                </div>

                <div class="flex flex-col desktop-presta:flex-[0_0_320px] desktop-wide:flex-[0_0_610px] max-w-screen-tablet-wide mx-auto w-full desktop-presta:pl-5 desktop-wide:pl-[50px]">
                    <h1 class="hidden desktop-presta:block mt-5 desktop-presta:mt-0 flex-shrink-0 font-header product-detail-name text-[35px] leading-24px mb-5 pr-[46px]" itemprop="name">
                        {block name='page_title'}
                            {$product.name}
                        {/block}
                    </h1>
                    <div class="min-h-12 flex-1 desktop-presta:mr-2 desktop-presta:overflow-x-hidden desktop-presta:overflow-y-auto">
                        {hook h='displayApSC' sc_key=sc3078189027}
                    </div>  
                    <div class="floating-bar bg-white bottom-0 fixed desktop-presta:static left-0 px-5 desktop-presta:px-0  w-full border-0 border-t border-solid border-gray-2000 desktop-presta:border-t-0 z-10">
                        <div class=" flex desktop-presta:block flex-shrink-0 items-center justify-between max-w-screen-tablet-wide mx-auto w-full">
                            <div class="py-2 desktop-presta:py-6 quickview">
                                <span class="mr-2 text-2xl text-[#232322]" data-product-configurable="quantity">{$product.quantity}</span><span class="mr-2 text-2xl text-[#232322]"> m² / </span>
                                
                                {block name='product_prices'}
                                    {include file='catalog/_partials/product-prices.tpl'}
                                {/block}
                            </div>

                            <div class="flex justify-center w-full max-w-[350px] desktop-presta:max-w-none">
                                <div class="w-full">
                                    <div class="py-2 desktop-presta:py-0 desktop-presta:pb-6 product-add-to-cart">
                                        <div class="add-to-cart-anim add flex-1">
                                            <button class="bg-main border-0 cursor-pointer font-medium h-full hover:bg-main-hover overflow-hidden phone-wide:text-base px-4 relative rounded-full tablet:text-xl text-base text-center text-white transition uppercase duration-200 w-full" data-button-action="add-to-cart" disabled type="submit">
                                                <span>{l s='Dodaj do koszyka' d='Shop.Theme.Catalog'}</span>
                                                <svg class="success" width="27" height="20" viewBox="0 0 27 20" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M26.2442 0.487161C26.8949 1.13717 26.8954 2.19156 26.2454 2.84222L9.59263 19.5117C9.28039 19.8242 8.85673 19.9999 8.41493 20C7.97312 20.0001 7.54938 19.8247 7.23698 19.5123L0.487813 12.7631C-0.162518 12.1127 -0.162518 11.0583 0.487813 10.408C1.13815 9.75766 2.19254 9.75766 2.84287 10.408L8.41392 15.9791L23.8892 0.488338C24.5392 -0.162319 25.5936 -0.162846 26.2442 0.487161Z" fill="white"></path>
                                                </svg>
                                                <svg class="error" width="23" height="23" viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="2.12109" y="0.000244141" width="29" height="3" rx="1" transform="rotate(45 2.12109 0.000244141)" fill="#fff"></rect> <rect y="20.5061" width="29" height="3" rx="1" transform="rotate(-45 0 20.5061)" fill="#fff"></rect>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>           
                    </div>
                    <div class="hidden">
                        <div class="w-full tablet-wide:max-w-[350px] desktop-presta:max-w-none desktop py-2 desktop-presta:py-0 desktop-presta:pb-6 product-add-sample mb-16 desktop-presta:mb-0 mt-2 desktop-presta:mt-0 ">
                            <div class="add-to-cart-anim add flex-1">
                                <button class="bg-transparent hover:bg-main-dark border-2 border-main-dark hover:border-main-dark cursor-pointer font-medium h-full overflow-hidden phone-wide:text-base px-4 relative rounded-full tablet:text-xl text-base text-center text-main-dark hover:text-white transition uppercase duration-200 w-full" data-button-action="add-sample-to-cart" type="button">
                                    <span class="transition duration-150">{l s='Zamów próbkę' d='Shop.Theme.Catalog'}</span>
                                    <svg class="success" width="27" height="20" viewBox="0 0 27 20" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M26.2442 0.487161C26.8949 1.13717 26.8954 2.19156 26.2454 2.84222L9.59263 19.5117C9.28039 19.8242 8.85673 19.9999 8.41493 20C7.97312 20.0001 7.54938 19.8247 7.23698 19.5123L0.487813 12.7631C-0.162518 12.1127 -0.162518 11.0583 0.487813 10.408C1.13815 9.75766 2.19254 9.75766 2.84287 10.408L8.41392 15.9791L23.8892 0.488338C24.5392 -0.162319 25.5936 -0.162846 26.2442 0.487161Z" fill="white"></path>
                                    </svg>
                                    <svg class="error" width="23" height="23" viewBox="0 0 23 23" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="2.12109" y="0.000244141" width="29" height="3" rx="1" transform="rotate(45 2.12109 0.000244141)" fill="#fff"></rect> <rect y="20.5061" width="29" height="3" rx="1" transform="rotate(-45 0 20.5061)" fill="#fff"></rect>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

      </div>
    </div>
  </div>
</div>
