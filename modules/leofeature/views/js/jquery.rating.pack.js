if (jQuery)
  (function ($) {
    $.fn.rating = function (c) {
      c = $.extend(
        {
          cancel: 'Cancel Rating',
          cancelValue: '',
          required: false,
          readOnly: false,
        },
        c || {},
      )
      var d = {}
      var e = {
        fill: function (n, a, b) {
          this.drain(n)
          $(a)
            .prevAll('.star')
            .andSelf()
            .addClass(b || 'star_hover')
        },
        drain: function (n) {
          $(d[n].valueElem)
            .siblings('.star')
            .removeClass('star_on')
            .removeClass('star_hover')
        },
        reset: function (n) {
          if (!$(d[n].currentElem).is('.cancel')) {
            $(d[n].currentElem).prevAll('.star').andSelf().addClass('star_on')
          }
        },
        click: function (n, a) {
          d[n].currentElem = a
          var b = $(a).children('a').text()
          $(d[n].valueElem).val(b)
          e.drain(n)
          e.reset(n)
          if (c.callback) c.callback.apply(d[n].valueElem, [b, a])
        },
      }
      this.each(function (i) {
        var n = this.name
        if (!d[n])
          d[n] = {
            count: 0,
          }
        i = d[n].count
        d[n].count++
        if (i == 0) {
          c.readOnly = $(this).attr('disabled') || c.readOnly
          d[n].valueElem = $(
            '<input type="hidden" name="' +
              n +
              '" value=""' +
              (c.readOnly ? ' disabled="disabled"' : '') +
              '>',
          )
          $(this).before(d[n].valueElem)
          if (c.readOnly || c.required) {
          } else {
            $(this).before(
              $(
                '<div class="cancel"><a title="' +
                  c.cancel +
                  '">' +
                  c.cancelValue +
                  '</a></div>',
              )
                .on('mouseover', function () {
                  e.drain(n)
                  $(this).addClass('star_on')
                })
                .on('mouseout', function () {
                  e.reset(n)
                  $(this).removeClass('star_on')
                })
                .click(function () {
                  e.click(n, this)
                }),
            )
          }
        }
        eStar = $(
          '<div class="star"><a title="' +
            (this.title || this.value) +
            '">' +
            this.value +
            '</a></div>',
        )
        $(this).after(eStar)
        if (c.readOnly) {
          $(eStar).addClass('star_readonly')
        } else {
          $(eStar)
            .on('mouseover', function () {
              e.drain(n)
              e.fill(n, this)
            })
            .on('mouseout', function () {
              e.drain(n)
              e.reset(n)
            })
            .on('click', function () {
              e.click(n, this)
            })
        }
        if (this.checked) d[n].currentElem = eStar
        $(this).remove()
        if (i + 1 == this.length) e.reset(n)
      })
      for (n in d)
        if (d[n].currentElem) {
          e.fill(n, d[n].currentElem, 'star_on')
          $(d[n].valueElem).val($(d[n].currentElem).children('a').text())
        }
      return this
    }
  })(jQuery)
click
