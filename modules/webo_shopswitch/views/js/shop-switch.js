document.addEventListener("DOMContentLoaded", function () {
  const popupToggleButton = document.querySelector("#shopswitch-toggle");
  const popupModal = document.querySelector("#shopswitch-popup");

  popupToggleButton.addEventListener("click", () => {
    popupModal.classList.toggle("popup-hidden");
  });
});
