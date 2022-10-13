document.addEventListener("DOMContentLoaded", function () {
  const popupToggleButton = document.querySelector("#shopswitch-toggle");
  const shopChangeButton = document.querySelector("#shopswitch-toggle button");
  const popupModal = document.querySelector("#shopswitch-popup");
  const popupForm = document.querySelector("#shopswitch-popup form");

  popupToggleButton.addEventListener("click", () => {
    popupModal.classList.toggle("popup-hidden");
  });

  shopChangeButton.addEventListener("click", () => {
    let formData = new FormData(popupForm);
    window.location = "https://feeby.webo.design/en/";
  });
});
