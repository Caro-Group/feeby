document.addEventListener("DOMContentLoaded", function () {
  let popupOpen = document.querySelectorAll("#shopswitch-toggle");
  const popupClose = document.querySelector("#shopswitch-popup-close");
  const popupModal = document.querySelector("#shopswitch-popup");
  const popupForm = document.querySelector("#shopswitch-popup form");
  const shopChangeButton = document.querySelector("#shopswitch-popup button");

  moveSwitcher(window.innerWidth,popupOpen)
  popupOpen.forEach((element) => {
    element.addEventListener("click", () => {
      togglePopup(popupModal);
    });
  });

  window.addEventListener('resize',()=>{
    moveSwitcher(window.innerWidth,popupOpen)  
  })

  popupClose.addEventListener("click", () => {
    togglePopup(popupModal);
  });

  shopChangeButton.addEventListener("click", () => {
    let formData = new FormData(popupForm);
    let langPart = formData.get("language");
    let currPart = formData.get("currency");
    togglePopup(popupModal);
    if (langPart && currPart && prestashop) {
      window.location.href = langPart + "?SubmitCurrency=1&id_currency=" + currPart;
    }
  });
});

window.addEventListener("pageshow", () => {
  document.querySelector("#shopswitch-popup form").reset();
});

function togglePopup(popup) {
  popup.classList.toggle("popup-hidden");
}

function moveSwitcher(windowWidth,switcher){
  const mobilePlaceholder = document.querySelector(".off-canvas-nav-megamenu #shopswitch-mobile")
  const desktopPlaceholder = document.querySelector("#Webo-shopswitch")

  if (switcher.length>0) {
    if (!mobilePlaceholder && windowWidth < 992  ) {
      switcher.forEach((element)=>{
        element.classList.add('hidden')
      })     
      document.querySelector('button.navbar-toggler').addEventListener('click',()=>{
        moveSwitcher(windowWidth,switcher)
        switcher.forEach((element)=>{
          element.classList.remove('hidden')
        })     

      })

    }
  if (windowWidth < 992 && mobilePlaceholder.querySelector('#shopswitch-toggle') == null) {
    switcher.forEach((element)=>{
      mobilePlaceholder.appendChild(element)
    })     
  }else if(windowWidth >= 992 && desktopPlaceholder.querySelector('#shopswitch-toggle') == null){
    switcher.forEach((element)=>{
      element.classList.remove('hidden')
      desktopPlaceholder.appendChild(element)
    })     
    
  }
}

}
