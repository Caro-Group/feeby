(function ($) {
    "use strict";
    $(document).ready(function () {
        window.easyPack.init({
            instance: 'pl',
            mapType: 'osm',
            searchType: 'osm',
            points: {
                types: ['parcel_locker'],
            },
            map: {
                useGeolocation: true,
                initialTypes: ['parcel_locker']
            }
        });
        window.onload = function () {
            window.easyPack.dropdownWidget('easypack-widget', function (point) {
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
                        }
                    },
                    error: function (jqXHR, textStatus) {
                        console.log(jqXHR.responseText);
                    }
                });
            });

        }
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