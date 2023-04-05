/*
 * Async Treeview 0.1 - Lazy-loading extension for Treeview
 *
 * http://bassistance.de/jquery-plugins/jquery-plugin-treeview/
 *
 * Copyright (c) 2007 Jörn Zaefferer
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 *
 * Revision: $Id: jquery.treeview.async.js 8040 2011-08-11 15:21:09Z aFolletete $
 *
 */

;(function ($){
    function load(settings,root,child,container){
        function createNode(parent){
            var id_category = this.id_category;

            var $_input = $('<input/>').attr({
                type: (!use_radio ? 'checkbox' : 'radio'),
                name: inputName
            }).val(id_category).click(function (e){
                clickOnCategoryBox($(e.currentTarget));
            });

            var $_span_label = $('<span/>').addClass('category_label');
            $_span_label.html(this.name);

            var $_span_level = $('<span/>').addClass('category_level').css('display','none');

            $_span_level.html(this.level_depth);

            var $_span_selected = $('<span/>').addClass('nb_sub_cat_selected mleft10').css({
                'font-weight': 'bold'
            }).html(' (<span class="nb_sub_cat_selected_value">' + this.nbSelectedSubCat + '</span> ' + FilterProductsPro.Msg.selectedLabel + ')</span>');

            if (this.nbSelectedSubCat == 0)
                $_span_selected.css('display','none');

            var current = $('<li/>').attr({
                id: id_category
            });

            $_input.appendTo(current);
            $_span_label.appendTo(current);
            $_span_level.appendTo(current);
            $_span_selected.appendTo(current);

            var _level = parseInt(this.level_depth);
            //select levels
            if (this.level_depth > 0 && this.has_children > 0){
                var $span = $('<span/>').css('display','inline-block').addClass('mleft10');
                var $_select_level = $('<select/>').addClass('select_level');

                $('<option/>').val('-1').html(FilterProductsPro.Msg.select_lang).appendTo($_select_level);
                $('<option/>').val('0').html(FilterProductsPro.Msg.none_lang).appendTo($_select_level);

                var _i = 1;
                for (var i = _level; i < FilterProductsPro.max_level_categories; i++){
                    $('<option/>').val(i).html(_i + ' level').appendTo($_select_level);
                    _i++;
                }

                $span.append($_select_level);
                $span.appendTo(current);
            }

            if (this.level_depth > 0){
                var _inlevel = parseInt(this.level_depth) - 1;
                if (typeof _inlevel === 'number'){
                    parent.addClass('inlevel_' + _inlevel);
                }
            }

            current.appendTo(parent);

            if (this.classes){
                current.children("span").addClass(this.classes);
            }
            if (this.has_children > 0){
                var branch = $("<ul/>").hide().appendTo(current);
                current.addClass("hasChildren");
                createNode.call({
                    classes: "placeholder",
                    name: "&nbsp;",
                    children: []
                },branch);
                branch.children().children('.nb_sub_cat_selected').remove();
            }
        }
        $.ajax($.extend(true,{
            url: settings.url,
            dataType: "json",
            data: {
                id_category_parent: root
            },
            success: function (response){
                child.empty();
                //$.each(response,createNode,[child]); solo funciona en versiones jquery menores a 2.2.0
                $.each(response, function(_, arg) {
                    createNode.call(arg, child);
                });
                $(container).treeview({
                    add: child
                });
                readyToExpand = true;
            }
        },settings.ajax));
    }

    var proxied = $.fn.treeview;
    $.fn.treeview = function (settings){

        if (!settings.url){
            return proxied.apply(this,arguments);
        }
        var container = this;
        if (!container.children().size())
            load(settings,"source",this,container);
        var userToggle = settings.toggle;
        return proxied.call(this,$.extend({},settings,{
            collapsed: true,
            toggle: function (){
                var $this = $(this);

                if ($this.hasClass("hasChildren")){
                    var childList = $this.removeClass("hasChildren").find("ul");
                    load(settings,this.id,childList,container);
                }
                if (userToggle){
                    userToggle.apply(this,arguments);
                }
            }
        }));
    };

})(jQuery);
