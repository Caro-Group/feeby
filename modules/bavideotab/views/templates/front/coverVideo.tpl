{if !empty($infor)}
    <div onclick="popupvideo()" class="absolute bg-white border border-gray-1000 border-solid bottom-0 flex items-center leading-3 p-2 tablet:p-3 right-0 rounded-[5px] text-[12px] cursor-pointer z-30 transition hover:border-main mb-[10px] mr-[10px] tablet:mb-[15px] tablet:mr-[15px]">
        <svg class="hidden tablet:block flex-[0_0_auto] tablet:w-[50px] mr-[10px] h-auto" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 75 55" width="75" height="55" fill="none"><path d="M59.423.964H15.578C6.974.964 0 7.938 0 16.541v21.918c0 8.603 6.974 15.577 15.576 15.577h43.847C68.026 54.036 75 47.062 75 38.459V16.541C75 7.938 68.026.964 59.423.964ZM48.89 28.567l-20.509 9.78a.823.823 0 0 1-1.177-.742V17.43a.823.823 0 0 1 1.195-.735L48.907 27.09a.823.823 0 0 1-.018 1.478Z" fill="#F61C0D"/></svg>
        <svg class="block tablet:hidden flex-[0_0_auto] w-[25px] h-[25px]  mr-[10px] tablet:h-auto" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 75 55" width="35" height="35" fill="none"><path d="M59.423.964H15.578C6.974.964 0 7.938 0 16.541v21.918c0 8.603 6.974 15.577 15.576 15.577h43.847C68.026 54.036 75 47.062 75 38.459V16.541C75 7.938 68.026.964 59.423.964ZM48.89 28.567l-20.509 9.78a.823.823 0 0 1-1.177-.742V17.43a.823.823 0 0 1 1.195-.735L48.907 27.09a.823.823 0 0 1-.018 1.478Z" fill="#F61C0D"/></svg>
        <span class="block whitespace-pre-wrap max-w-[100px] text-sm tablet:text-base leading-none font-medium">{l s='Video presentation' d='Shop.Theme.Catalog'}</span>
    </div>
    {literal}
    <script>
        var textUrl = '{/literal}{$infor[0]['text_url']}{literal}';
        var videoID = '{/literal}{$YouTubeID}{literal}';
        if (videoID == '') {
            var regExp = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
            var match = textUrl.match(regExp);
            if (match && match[2].length == 11) {
                videoID = match[2];
            }
        }
    </script>
    {/literal}
{/if}