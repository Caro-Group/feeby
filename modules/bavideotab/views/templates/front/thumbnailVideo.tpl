{if !empty($infor)}
    <div onclick="popupvideo()"
        class="swiper-custom-slide w-auto h-full relative thumb-container h-[100px] w-[100px] tablet:h-[200px] tablet:w-[200px] flex items-center justify-center">
        <img data-yt-thumb class="w-full h-full opacity-5" />
        <svg class="absolute inset-0 m-auto w-12" style="margin:auto;" xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 75 55" width="75" height="55" fill="none">
            <path
                d="M59.423.964H15.578C6.974.964 0 7.938 0 16.541v21.918c0 8.603 6.974 15.577 15.576 15.577h43.847C68.026 54.036 75 47.062 75 38.459V16.541C75 7.938 68.026.964 59.423.964ZM48.89 28.567l-20.509 9.78a.823.823 0 0 1-1.177-.742V17.43a.823.823 0 0 1 1.195-.735L48.907 27.09a.823.823 0 0 1-.018 1.478Z"
                fill="#F61C0D" />
        </svg>
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