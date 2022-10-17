document.addEventListener("DOMContentLoaded", function () {
  const mobilePlaceholder = document.querySelector(".off-canvas-nav-megamenu #shopswitch-mobile")
  const desktopPlaceholder = document.querySelector("#Webo-shopswitch")

  const popupOpen = document.querySelectorAll("#shopswitch-toggle");
  const popupClose = document.querySelector("#shopswitch-popup-close");
  const popupModal = document.querySelector("#shopswitch-popup");
  const popupForm = document.querySelector("#shopswitch-popup form");
  const shopChangeButton = document.querySelector("#shopswitch-popup button");

  window.addEventListener('resize',()=>{
    moveSwitcher(window.innerWidth,mobilePlaceholder,desktopPlaceholder,popupOpen)
  })

  popupOpen.forEach((element) => {
    element.addEventListener("click", () => {
      togglePopup(popupModal);
    });
  });
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

function moveSwitcher(windowWidth,mobilePlaceholder,desktopPlaceholder,switcher){
  if (switcher.length>0) {
  if (windowWidth < 992 && mobilePlaceholder.querySelector('#shopswitch-toggle') == null) {
    switcher.forEach((element)=>{
      mobilePlaceholder.appendChild(element)
    })     
  }else if(desktopPlaceholder.querySelector('#shopswitch-toggle') == null){
    switcher.forEach((element)=>{
      desktopPlaceholder.appendChild(element)
    })     
    
  }
}

}
