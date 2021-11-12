(function ($) {
    "use strict";

    $(document).ready(function () {
        window.gmParcelLockerChoose = function (eventField) {
            var modalMap = window.easyPack.modalMap(function (point, modal) {
                var pointData = point.name + '| ' + point.address.line1 + '| ' + point.address.line2;
                $.ajax({
                    url: gmParcelLockerAjaxUrl,
                    type: 'POST',
                    crossDomain: true,
                    data: {cartId: gmCartId, pointData: pointData},
                    async: true,
                    dataType: "json",
                    headers: {"cache-control": "no-cache"},
                    success: function (data) {
                        //console.log(data);
                        if (data.msg == 'OK') {
                            $('.chosen-parcel').html(pointData.split('|').join(','));
                            $(eventField).find('input').trigger('click');
                            modal.closeModal();
                        }
                    },
                    error: function (jqXHR, textStatus) {
                        console.log(jqXHR.responseText);
                    }
                });
            }, {width: 1200, height: 600});
            return false;
        };
        window.easyPackAsyncInit = function () {
            window.easyPack.init({
                points: {
                    types: ['parcel_locker_only']
                },
                map: {
                    initialTypes: ['parcel_locker_only'],
                }
            });
        };
        window.setInterval(function () {
            if ($('.gmparcellocker-button').is(':visible')) {
                window.checkGmParcellocker = true;
                if ($('.chosen-parcel').text().length > 3) {
                    $('button[name="confirmDeliveryOption"]').attr('disabled', false);
                } else {
                    $('button[name="confirmDeliveryOption"]').attr('disabled', true);
                }
            } else {
                if (window.checkGmParcellocker) {
                    $('button[name="confirmDeliveryOption"]').attr('disabled', false);
                    window.checkGmParcellocker = false;
                }
            }
        }, 500);
    });
})(jQuery);