/**
* 2016-2021 Trusted Shops GmbH
*
* NOTICE OF LICENSE
*  @author    Trusted Shops GmbH
*  @copyright 2016-2021 Trusted Shops GmbH
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*
*
* Don't forget to prefix your containers with your own identifier
* to avoid any conflicts with others containers.
*/
jQuery(document).ready(function() {
    var parent_obj =$('#ts_product_widget').closest(".product-container");
    if (typeof controller != 'undefined') {
        if (controller != 'product') {
            $('#ts_product_widget').insertAfter('.modal.quickview h1');
        } else {
            $('#ts_product_widget').insertAfter(parent_obj.find('h1'));
        }
    } else {
        $('#ts_product_widget').insertAfter(parent_obj.find('h1'));
    }
});
