document.addEventListener("DOMContentLoaded", function () {
  const popupOpen = document.querySelectorAll("#shopswitch-toggle");
  const popupClose = document.querySelector("#shopswitch-popup-close");
  const popupForm = document.querySelector("#shopswitch-popup form");
  const shopChangeButton = document.querySelector("#shopswitch-popup button");

  popupOpen.forEach((element) => {
    element.addEventListener("click", togglePopup);
  });
  popupClose.addEventListener("click", togglePopup);

  shopChangeButton.addEventListener("click", () => {
    let formData = new FormData(popupForm);
    let langPart = formData.get("language");
    let currPart = formData.get("currency");
    togglePopup();
    if (langPart && currPart && prestashop) {
      window.location.href = prestashop.urls.base_url + langPart + "/?SubmitCurrency=1&id_currency=" + currPart;
    }
  });
});

function togglePopup() {
  const popupModal = document.querySelector("#shopswitch-popup");
  popupModal.classList.toggle("popup-hidden");
}
