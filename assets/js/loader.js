document.addEventListener("DOMContentLoaded", function() {
    
    const body = document.querySelector('body');
    
    window.addEventListener('beforeunload',function(){
        body.insertAdjacentHTML('afterbegin','     <div class="loader backdrop-blur-sm bg-main-dark bg-opacity-50 fixed left-0 top-0 w-full h-full "><div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 "><span class="w-[75px] h-[75px] block border-[2px] border-white border-opacity-60 border-t-main border-solid rounded-full animate-spin " ></span></div></div> ')
        
    })

});