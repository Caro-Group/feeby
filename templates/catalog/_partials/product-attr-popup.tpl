<span class="text-inherit ml-2 hover:underline hover:text-main cursor-pointer transition duration-200" data-attr-popup-open>
    {l s='Look' d='Shop.Theme.Global'}
</span>
<div class="fixed z-[9999] inset-0 max-h-screen flex justify-center items-center p-5 bg-[#282828]/50 transition duration-300 pointer-events-none opacity-0" data-attr-popup>
    <div class="relative w-full max-w-[468px] bg-white rounded-[5px] py-7 transition duration-300 max-h-full flex flex-col">
        <div class="ml-auto mr-7 mb-2 w-min cursor-pointer group">
            <svg class="text-main-dark group-hover:text-main fill-current transition duration-200" width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg" data-attr-popup-close>
                <path d="M0.703126 27.2031C0.314801 26.8148 0.314801 26.1852 0.703126 25.7969L25.7969 0.703135C26.1852 0.314809 26.8148 0.314809 27.2031 0.703134C27.5914 1.09146 27.5914 1.72106 27.2031 2.10938L2.10937 27.2031C1.72105 27.5914 1.09145 27.5914 0.703126 27.2031Z"></path>
                <path d="M27.2031 27.2031C27.5914 26.8148 27.5914 26.1852 27.2031 25.7969L2.10939 0.703135C1.72106 0.314809 1.09146 0.314809 0.703135 0.703134C0.314811 1.09146 0.314811 1.72106 0.703136 2.10938L25.7969 27.2031C26.1852 27.5914 26.8148 27.5914 27.2031 27.2031Z"></path>
            </svg>
        </div>
        <div class="w-full px-7 overflow-y-auto [&_img]:w-full [&_img]:h-auto grid grid-cols-1 tablet:grid-cols-2 gap-5">
            {assign var=attr_images value=CMS::getCMSContent($content_id)}
            {$attr_images.content nofilter}
        </div>
    </div>
</div>