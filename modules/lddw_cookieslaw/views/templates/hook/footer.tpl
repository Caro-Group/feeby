{**
* 2018 http://www.la-dame-du-web.com
*
* @author Nicolas PETITJEAN <n.petitjean@la-dame-du-web.com>
* @copyright 2018 Nicolas PETITJEAN
* @license MIT License
*}
{if !$cookie_setted}
<div id="lddw-cookie-modal-box" class="bg-gray-1000 bottom-0 fixed left-0 p-2 rounded text-center w-[300px] m-[10px] border border-solid z-30">
    <span class="absolute font-body leading-none px-2 py-1 right-0 text-[#6B7280] text-[14px] top-0 z-10 cursor-pointer">✕</span>
    <div class="font-header font-light italic mb-2 text-[20px] text-primary">{$title|escape:'html':'UTF-8'}</div>
    <p class="font-body font-light leading-normal mb-5 text-[#232322] text-[14px]">{$message}</p>
    <p class="flex justify-between">
        <button class="bg-primary border-none font-body font-normal p-2 px-[30px] rounded-[23px] text-white uppercase cursor-pointer"
                id="lddw-cookie-agree">{$text_button|escape:'html':'UTF-8'}</button>
        <a class="border-none font-body font-normal p-2 px-4 uppercase" id="lddw-cookie-more"
           href="{$url}">{$text_more|escape:'html':'UTF-8'}</a>
    </p>
</div>
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