$(function () {
    $("[data-toggle='tooltip']").tooltip();  
})

$.reload = function () {
    window.location.reload();
    return false;
}
$.loading = function (bool, text) {
    var $loadingpage = $("#loadingPage");
    var $loadingtext = $loadingpage.find('.loading-content');

    if (bool) {
        layer.closeAll();
        $loadingpage.show();
    } else {
        if ($loadingtext.attr('istableloading') == undefined) {
            $loadingpage.hide();
        }
    }
    if (!!text) {
        $loadingtext.html(text);
    } else {
        $loadingtext.html("正在操作，请稍后…");
    }
    $loadingtext.css("left", ($('body').width() - $loadingtext.width()) / 2 - 50);
    $loadingtext.css("top", ($('body').height() - $loadingtext.height()) / 2);
}

$.modalClose = function () {
    var isLayui = window.name.indexOf("layui") > -1;
    if (isLayui) {
        var index = isLayui ? parent.layer.getFrameIndex(window.name) : layer.getFrameIndex(window.name);
        /*先得到当前iframe层的索引*/
        var $IsdialogClose = $("#layui-layer" + index).find('.layui-layer-btn').find("#IsdialogClose");
        var IsClose = $IsdialogClose.is(":checked");
        if ($IsdialogClose.length == 0) {
            IsClose = true;
        }

        if (IsClose && isLayui) {
            parent.location.reload(); /* 父页面刷新*/
            parent.layer.close(index);
        } else {
            window.location.reload();
        }
    } else {
        window.location.reload(); /* 父页面刷新*/
        /* parent.layer.close(index);*/
    }
}

$.modalMsg = function (content, type) {
    if (type != undefined) {
        var icon = "";
        if (type == 'success') {
            icon = "fa-check-circle";
        }
        if (type == 'error') {
            icon = "fa-times-circle";
        }
        if (type == 'warning') {
            icon = "fa-exclamation-circle";
        }

        layer.alert(content, { icon: icon, shift: 5, move: false }, function () {
            $.modalClose();
        });
        /*$(".layui-layer-msg").find('i.' + icon).parents('.layui-layer-msg').addClass('layui-layer-msg-' + type);*/
    } else {
        layer.alert(content);
    }
}

$.modalAlert = function (content, type) {
    var icon = "";
    if (type == 'success') {
        icon = "fa-check-circle";
    }
    if (type == 'error') {
        icon = "fa-times-circle";
    }
    if (type == 'warning') {
        icon = "fa-exclamation-circle";
    }
    layer.alert(content, {
        icon: icon,
        title: "系统提示",
        btn: ['确认'],
        btnclass: ['btn btn-primary'],
    });
}

/*提示信息*/
$.modalConfirm = function (content, callback) {
    layer.confirm(content, {
        icon: "fa-exclamation-circle",
        title: "系统提示",
        btn: ['确认', '取消'],
        move: false,
        //offset: '25%',
        fix: true,
        btnclass: ['btn btn-primary', 'btn btn-danger'],
    }, function () {
        callback(true);
    }, function () {
        callback(false)
    });
}

$.modalOpen = function (options) {
    var defaults = {
        id: null,
        title: '系统窗口',
        width: "100px",
        height: "100px",
        url: '',
        shade: 0.3,
        btn: ['确认', '关闭'],
        btnclass: ['btn btn-primary', 'btn btn-danger'],
        callBack: null
    };
    var options = $.extend(defaults, options);
    var _width = $(window).width() > parseInt(options.width.replace('px', '')) ? options.width : $(window).width() + 'px';
    var _height = $(window).height() > parseInt(options.height.replace('px', '')) ? options.height : $(window).height() + 'px';
    layer.open({
        id: options.id,
        move: false,
        type: 2,
        shade: options.shade,
        title: options.title,
        fix: true,
        //offset: '10%',
        area: [_width, _height],
        content: options.url,
        btn: options.btn,
        btnclass: options.btnclass,
        yes: function () {
            options.callBack(options.id)
        }, cancel: function () {
            return true;
        }
    });
}

/*删除*/
$.modalDelete = function (options) {
    var defaults = {
        prompt: "注：您确定要删除该项数据吗？",
        url: "",
        param: [],
        loading: "正在删除数据...",
        success: null,
        close: true
    };
    $.modalConfirm(options.prompt, function (r) {
        if (r) {
            $.loading(true, options.loading);
            window.setTimeout(function () {
                $.ajax({
                    url: options.url,
                    data: options.param,
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        if (data.state == "success") {
                            options.success(data);
                            $.modalMsg(data.message, data.state);
                        } else {
                            $.modalAlert(data.message, data.state);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.loading(false);
                        $.modalMsg(errorThrown, "error");
                    },
                    beforeSend: function () {
                        $.loading(true, options.loading);
                    },
                    complete: function () {
                        $.loading(false);
                    }
                });
            }, 500);
        }
    });
}

$.fn.formSerialize = function () {
    var postdata = {};
    var element = $(this);
    element.find('input,select,textarea').each(function (r) {
        var $this = $(this);
        var name = $this.attr('name');
        var type = $this.attr('type');
        switch (type) {
            case "checkbox":
            case "radio":
            case "select":
                if ($this.is(":checked")) {
                    var value = $this.val();
                    if (postdata.hasOwnProperty(name)) {
                        postdata[name] += "," + value;
                    } else {
                        postdata[name] = value;
                    }
                }
                break;
            default:
                var value = $this.val() == "" || $this.val() == null || $this.val() == undefined ? "&nbsp;" : $this.val();
                value = value.replace(/&nbsp;/g, '');
                postdata[name] = value;
                break;
        }
    });
    return postdata;
};


$.fn.formSerializeString = function () {
    var postdata = [];
    var element = $(this);
    element.find('input,select,textarea').each(function (r) {
        var $this = $(this);
        var name = $this.attr('name');
        var type = $this.attr('type');
        switch (type) {
            case "checkbox":
            case "radio":
            case "select":
                if ($this.is(":checked")) {
                    var value = $this.val();
                    if (postdata.hasOwnProperty(name)) {
                        postdata[name] += "," + value;
                    } else {
                        postdata.push(name + "=" + value);
                    }
                }
                break;
            default:
                var value = $this.val() == "" || $this.val() == null || $this.val() == undefined ? "&nbsp;" : $this.val();
                value = value.replace(/&nbsp;/g, '');
                postdata.push(name + "=" + value);
                break;
        }
    });
    return postdata;
};



$.modalSubmit = function (options) {
    var defaults = {
        url: "",
        param: [],
        loading: "正在提交数据...",
        success: null,
        close: true
    };
    $.loading(true, options.loading);
    window.setTimeout(function () {
        $.ajax({
            url: options.url,
            data: options.param,
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data.state == "success") {
                    options.success(data);
                    $.modalMsg(data.message, data.state);
                } else {
                    $.modalAlert(data.message, data.state);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $.loading(false);
                $.modalMsg(errorThrown, "error");
            },
            beforeSend: function () {
                $.loading(true, options.loading);
            },
            complete: function () {
                $.loading(false);
            }
        });
    }, 500);
}

$.downLoad = function (options) {

    $.ajax({
        url: options.url,
        data: options.param,
        type: "post",
        dataType: "json",
        success: function (data) {
            alert("下载成功");
        }
    });
}

$.fn.bindSelect = function (options) {
    var defaults = {
        id: "id",
        text: "text",
        search: false,
        url: "",
        param: [],
        change: null
    };
    var options = $.extend(defaults, options);
    var $element = $(this);
    if (options.url != "") {
        $.ajax({
            url: options.url,
            data: options.param,
            dataType: "json",
            async: false,
            success: function (data) {
                $.each(data, function (i) {
                    $element.append($("<option></option>").val(data[i][options.id]).html(data[i][options.text]));
                });
                $element.select2({
                    minimumResultsForSearch: options.search == true ? 0 : -1
                });
                $element.on("change", function (e) {
                    if (options.change != null) {
                        options.change(data[$(this).find("option:selected").index()]);
                    }
                    $("#select2-" + $element.attr('id') + "-container").html($(this).find("option:selected").text().replace(/　　/g, ''));
                });
            }
        });
    } else {
        $element.select2({
            minimumResultsForSearch: -1
        });
    }
}

$.fn.formValid = function () {
    return $(this).valid({
        errorPlacement: function (error, element) {
            element.parents('.formValue').addClass('has-error');
            element.parents('.has-error').find('i.error').remove();
            element.parents('.has-error').append('<i class="form-control-feedback fa fa-exclamation-circle error" data-placement="left" data-toggle="tooltip" title="' + error + '"></i>');
            $("[data-toggle='tooltip']").tooltip();
            if (element.parents('.input-group').hasClass('input-group')) {
                element.parents('.has-error').find('i.error').css('right', '33px')
            }
        },
        success: function (element) {
            element.parents('.has-error').find('i.error').remove();
            element.parent().removeClass('has-error');
        }
    });
}



