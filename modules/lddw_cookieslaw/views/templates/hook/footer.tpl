{**
* 2018 http://www.la-dame-du-web.com
*
* @author Nicolas PETITJEAN <n.petitjean@la-dame-du-web.com>
* @copyright 2018 Nicolas PETITJEAN
* @license MIT License
*}
{if !$cookie_setted}
<div id="lddw-cookie-modal-box" class="hidden bg-gray-1000 bottom-0 fixed right-0 trusted-breakpoint:right-auto p-2 rounded text-center w-[300px] m-[10px] border border-solid z-50">
    <span class="absolute font-body leading-none px-2 py-1 right-0 text-[#6B7280] text-[14px] top-0 z-10 cursor-pointer hover:color-black" id="lddw-cookie-close">✕</span>
    <div class="font-body font-normal mb-2 text-[20px] text-main">{$title|escape:'html':'UTF-8'}</div>
    <p class="font-body font-light leading-normal mb-5 text-[#232322] text-[14px]">{$message}</p>
    <p class="flex justify-between">
        <button class="flex items-center bg-main-dark hover:bg-main-hover transition border-none font-body font-normal p-2 px-[30px] rounded-[23px] text-white uppercase cursor-pointer"
                id="lddw-cookie-agree">{$text_button|escape:'html':'UTF-8'}<i class="ti-arrow-right ml-2"></i></button>
        <a class="border-none font-body font-normal p-2 px-4 uppercase" id="lddw-cookie-more"
           href="{$url}">{$text_more|escape:'html':'UTF-8'}</a>
    </p>
</div>
<style>
@media(max-width: 768px){
    .page-product #lddw-cookie-modal-box{
        bottom: 150px;
    }
}   
</style>
{/if}
{literal}
    <script>
		window.lddw_cookieslaw = {
			expire: '{/literal}{$expiry}{literal}',
			domain: '{/literal}{$domain}{literal}',
			direction: '{/literal}{$direction}{literal}'
		}
    </script>
{/literal}