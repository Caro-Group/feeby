// https://polyfill.io/v3/polyfill.min.js?features=Element.prototype.classList%2CIntersectionObserver%2CNodeList.prototype.forEach
// default image: data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==

;(function ($, document) {
  var elementLazySelector = '[data-lazy]'

  function lazyLoad(elements) {
    if (elements.length) {
      elements.lazy({ effect: 'fadeIn' })
    }
  }

  $(document).ready(function () {
    $(function () {
      lazyLoad($(`${elementLazySelector}`))
    })

    $(document).ajaxComplete(function () {
      lazyLoad($(`${elementLazySelector}`))
    })
  })
})(jQuery, document)
