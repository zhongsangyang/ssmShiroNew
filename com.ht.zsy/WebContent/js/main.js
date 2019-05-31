resize();
$(window).resize(function (event) { resize(); });
function resize() {
    setTimeout(function () {
        var header_h = 34;
        var list_ot = 0;
        var h_height = ($(window).height() - header_h),
            width = ($(window).width() - 160);
        /*w_width = (width > 468 ? width : 468) + 'px'; */   
        $('.Maincont').css({ height: h_height + 'px' });
        /*$('.Mainbox').css({height: (h_height - 40)+ 'px'});*/
        $('.siderBar').css({ left: 0, height: h_height + 'px' });
    }, 200);
}
$(function () {
    if ($(".editor_btn").length > 0) { $(".editor_btn").facebox({ showboxclass: ".editorPopup", defaultCloseImgClass: "editor_close" }); }
    if ($(".editor_btnB").length > 0) { $(".editor_btnB").facebox({ showboxclass: ".editorPopupB", defaultCloseImgClass: "editor_closeB" }); }
    if ($(".editor_btnC").length > 0) { $(".editor_btnC").facebox({ showboxclass: ".editorPopupC", defaultCloseImgClass: "editor_closeC" }); }
    if ($(".editor_btnD").length > 0) { $(".editor_btnD").facebox({ showboxclass: ".editorPopupD", defaultCloseImgClass: "editor_close" }); }
    if ($(".editor_btnE").length > 0) { $(".editor_btnE").facebox({ showboxclass: ".editorPopupE", defaultCloseImgClass: "editor_closeE" }); }
    if ($(".editor_btnF").length > 0) { $(".editor_btnF").facebox({ showboxclass: ".editorPopupF", defaultCloseImgClass: "editor_close" }); }

    $('#chosePrice').click(function (e) {
        e ? e.stopPropagation() : event.cancelBubble = true;
        $(this).next('.chosePriceTable').show();
    });
    $('#chosePhoto').click(function (e) {
        e ? e.stopPropagation() : event.cancelBubble = true;
        $(this).next('.photolist').show();
    });
    /*$(".on_ico,.off_ico").click(function(){
      if($(this).attr('class')=='on_ico'){
          $(this).addClass('off_ico').removeClass('on_ico');
      }else if($(this).attr('class')=='off_ico'){
          $(this).addClass('on_ico').removeClass('off_ico');
      }
    });*/
    $('.addannex_btn').click(function (e) {
        e ? e.stopPropagation() : event.cancelBubble = true;
        $(this).next('.addannex').show();
    });
    $(".annex .close").click(function () {
        $(this).parent().hide();
    });


    $("#showUpload").toggle(function () {
        $(this).next('.uploadLayer').show();
    }, function () {
        $(this).next('.uploadLayer').hide();
    });
    $(".js_switch").click(function () {
        if ($(this).text() == '详情') {
            $(this).text('收起');
            $(this).parent().find('.more').show();
        } else if ($(this).text() == '收起') {
            $(this).text('详情');
            $(this).parent().find('.more').hide();
        }
    });

    if ($(".form_datetime").length > 0) {
        $(".form_datetime").datetimepicker({
            language: "zh-CN",
            minView: "day",
            autoclose: true,
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
    }
});

