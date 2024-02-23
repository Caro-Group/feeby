document.addEventListener("DOMContentLoaded", function () {
  let popupOpen = document.querySelectorAll("#shopswitch-toggle");
  const popupModal = document.querySelector("#shopswitch-popup");

  popupOpen.forEach((element) => {
    element.addEventListener("click", () => {
      togglePopup(popupModal);
    });
  });

  window.addEventListener("resize", () => {
    moveSwitcher(window.innerWidth, popupOpen);
  });

  moveSwitcher(window.innerWidth, popupOpen);

  document.addEventListener('click',(e)=>{
    if (popupModal.classList.contains('is-active')) {
      togglePopup(popupModal);      
    }
  })
});


function togglePopup(popup) {
  popup.classList.toggle("is-active");
}

function moveSwitcher(windowWidth, switcher) {
  const mobilePlaceholder = document.querySelector(
    ".off-canvas-nav-megamenu #shopswitch-mobile"
  );
  const desktopPlaceholder = document.querySelector("#Webo-shopswitch");

  if (switcher.length > 0) {
    if (!mobilePlaceholder && windowWidth < 992) {
      switcher.forEach((element) => {
        element.classList.add("hidden");
      });
      document
        .querySelector("button.navbar-toggler")
        .addEventListener("click", () => {
          moveSwitcher(windowWidth, switcher);
          switcher.forEach((element) => {
            element.classList.remove("hidden");
          });
        });
    }
    if (
      windowWidth < 992 &&
      mobilePlaceholder.querySelector("#shopswitch-toggle") == null
    ) {
      switcher.forEach((element) => {
        mobilePlaceholder.appendChild(element);
      });
    } else if (
      windowWidth >= 992 &&
      desktopPlaceholder.querySelector("#shopswitch-toggle") == null
    ) {
      switcher.forEach((element) => {
        element.classList.remove("hidden");
        desktopPlaceholder.appendChild(element);
      });
    }
  }
}
