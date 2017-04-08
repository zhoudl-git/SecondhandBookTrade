var lab = {};
lab.loading = false;
lab.PrevImage = function (rootpath, paths)
{
    for (var i in paths)
    {
        $('<img />').attr('src', rootpath+paths[i]);
    }
}; 

lab.tip = function (message)
{
    if (window.wintip)
    {
        window.wintip.set('content', message);
        window.wintip.show();
    }
    else
    {
        window.wintip = $.ligerDialog.tip({ content: message });
    }
    setTimeout(function ()
    {
        window.wintip.hide()
    }, 4000);
}; 
//显示loading
lab.showLoading = function (message) {
    message = message || "正在加载中..."; 
    $('body').append("<div class='jloading'>" + message + "</div>");
    $.ligerui.win.mask();
};
//隐藏loading
lab.hideLoading = function (message) { 
    $('body > div.jloading').remove();
    $.ligerui.win.unmask({ id: new Date().getTime() });
}
lab.ajax = function (options)
{ 
    var p = options || {}; 
    $.ajax({
        cache: false,
        url: p.url,
        data: p.data,
        dataType: 'json', type: 'post',
        beforeSend: function () {
            lab.loading = true;
            lab.showLoading(p.loading);
        },
        complete: function () {
            lab.loading = false;
            lab.hideLoading();
        },
        success: function (result) {
            if (!result.Error) {
                if (p.success)
                    p.success(result.Data, result.Message);
            }
            else {
                if (p.error)
                    p.error(result.Message);
            }
        },
        error: function (result) {
            lab.tip('发现系统错误:' + result);
        }
    });
};


//填充表单数据
lab.loadForm = function (mainform, data, prefix)
{
    //根据返回的属性名，找到相应ID的表单元素，并赋值
    prefix = prefix || "";
    if (data)
    {
        for (var p in data)
        {
            $("#" + prefix + p).val(data[p]);
        }
    }
    //下面是更新表单的样式
    var managers = $.ligerui.find($.ligerui.controls.Input);
    for (var i = 0, l = managers.length; i < l; i++)
    {
        //改变了表单的值，需要调用这个方法来更新ligerui样式
        managers[i].updateStyle();
    }
};




//带验证、带loading的提交
lab.submitForm = function (mainform, success)
{
    if (!mainform)
        mainform = $("form:first");
    if (mainform.valid())
    {
        mainform.ajaxSubmit({
            dataType: 'json',
            success: success,
            beforeSend: function ()
            {
                $('body').append("<div class='jloading'>正在保存数据中...</div>");
                $.ligerui.win.mask();
            },
            complete: function ()
            {
                $('body > div.jloading').remove();
                $.ligerui.win.unmask();
            }
        });
    }
    else
    {
        lab.showInvalid();
    }
};

//提示 验证错误信息
lab.showInvalid = function (validator)
{
    validator = validator || lab.validator;
    if (!validator) return;
    var message = '<div class="invalid">存在' + validator.errorList.length + '个字段验证不通过，请检查!</div>'; 
    $.ligerDialog.error(message);
};

//表单验证
lab.validate = function (form, options)
{
    if (typeof (form) == "string")
        form = $(form);
    else if (typeof (form) == "object" && form.NodeType == 1)
        form = $(form);

    options = $.extend({
        errorPlacement: function (lable, element)
        {
            if (!element.attr("id"))
                element.attr("id", new Date().getTime());
            if (element.hasClass("l-textarea"))
            {
                element.addClass("l-textarea-invalid");
            }
            else if (element.hasClass("l-text-field"))
            {
                element.parent().addClass("l-text-invalid");
            }
            $(element).removeAttr("title").ligerHideTip();
            $(element).attr("title", lable.html()).ligerTip({
                distanceX: 5,
                distanceY: -3,
                auto: true
            });
        },
        success: function (lable)
        {
            if (!lable.attr("for")) return;
            var element = $("#" + lable.attr("for"));

            if (element.hasClass("l-textarea"))
            {
                element.removeClass("l-textarea-invalid");
            }
            else if (element.hasClass("l-text-field"))
            {
                element.parent().removeClass("l-text-invalid");
            }
            $(element).removeAttr("title").ligerHideTip();
        }
    }, options || {});
    lab.validator = form.validate(options);
    return lab.validator;
};




//附加表单搜索按钮：搜索、高级搜索
lab.appendSearchButtons = function (form, grid, filterbtn,callback)
{
    if (!form) return;
    form = $(form);
    var container = $('<ul><li id="btn1container"></li><li id="btn2container"></li></ul><div class="l-clear"></div>').appendTo(form);
    if (!filterbtn) container.find("#btn2container").remove();
    lab.addSearchButtons(form, grid, container.find("li:eq(0)"), filterbtn ? container.find("li:eq(1)") : null,callback);

};

//创建过滤规则
lab.bulidFilterGroup = function (form)
{
    if (!form) return null;
    var group = { op: "and", rules: [] };
    $(":input", form).not(":submit, :reset, :image,:button, [disabled]")
        .each(function ()
        {
            if (!this.name) return;
            //field ： 标示为搜索用到的字段
            if (!$(this).hasClass("field")) return;
            if ($(this).val() == null || $(this).val() == "") return;
            var op = $(this).attr("op") || "like";
            //get the value type(number or date)
            var vt = $(this).attr("vt") || "string";
            group.rules.push({
                op: op,
                field: this.name,
                value: $(this).val()
            });
        });
    return group;
};
//创建按钮
lab.createButton = function (options)
{
    var p = $.extend({
        appendTo: $('body')
    }, options || {});
    var btn = $('<div class="button button2 buttonnoicon" style="width:60px"><div class="button-l"> </div><div class="button-r"> </div> <span></span></div>');
    if (p.icon)
    {
        btn.removeClass("buttonnoicon");
        btn.append('<div class="button-icon"> <img src="../' + p.icon + '" /> </div> ');
    }
    //绿色皮肤
    if (p.green)
    {
        btn.removeClass("button2");
    }
    if (p.width)
    {
        btn.width(p.width);
    }
    if (p.click)
    {
        btn.click(p.click);
    }
    if (p.text)
    {
        $("span", btn).html(p.text);
    }
    if (typeof (p.appendTo) == "string") p.appendTo = $(p.appendTo);
    btn.appendTo(p.appendTo);
};

//创建表单搜索按钮：搜索、高级搜索
lab.addSearchButtons = function (form, grid, btn1Container, btn2Container, callback)
{
    if (!form) return;
    if (btn1Container)
    {
        lab.createButton({
            appendTo: btn1Container,
            text: '搜索',
            click: function ()
            {
                var rule = lab.bulidFilterGroup(form);
                loadClientData(rule);

                function loadClientData(data)
                {
                    //filterTranslator 在demos/filter/ligerGrid.showFilter.js中定义
                    var fnbody = ' return  ' + filterTranslator.translateGroup(data);
                    grid.loadData(new Function("o", fnbody));
                    if (callback) callback();
                }
            }
        });
    }
    if (btn2Container)
    {
        lab.createButton({
            appendTo: btn2Container,
            text: '高级搜索>>',
            click: function ()
            {
                //showFilter 在demos/filter/ligerGrid.showFilter.js中定义
                grid.showFilter();
            }
        });
    }
};