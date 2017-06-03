/**
 * Created by xuliang on 15/10/29.
 */
(function () {
    //兼容ie8，使用className获取元素
    if (!document.getElementsByClassName) {
        document.getElementsByClassName = function (cls) {
            var clsList = [];
            var allNodes = document.getElementsByTagName("*");
            var i;
            var len = allNodes.length;
            for (i = 0; i < len; i++) {
                if (allNodes[i].className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'))) {
                    clsList.push(allNodes[i]);
                }
            }
            return clsList;
        }
    }
    //兼容addEventListener,removeEventListener
    function addEvent(ele, type, fn) {
        if (ele.addEventListener) {
            ele.addEventListener(type, fn, false);//现代浏览器
        } else if (ele.attachEvent) {
            ele.attachEvent(ele, 'on' + type, false);//IE8;
        } else {
            ele['on' + 'type'] = fn;
        }
    }

    function removeEvent(ele, type, fn) {
        if (ele.removeEventListener) {
            ele.removeEventListener(type, fn, false);//现代浏览器
        } else if (ele.detachEvent) {
            ele.detachEvent(ele, 'on' + type, false);//IE8;
        } else {
            ele['on' + 'type'] = null;
        }
    }

    /*以下是业务代码*/
    //获取各种元素
    var cartTable = document.getElementById('cartTable');//获取整个table
    var tr = cartTable.children[1].rows;//获取tbody中的所有tr
    var checkInputs = document.getElementsByClassName('check');//获取所有复选框
    var checkAllInputs = document.getElementsByClassName('check-all');//获取所有全选框
    var selectedTotal = document.getElementById('selectedTotal');//商品总数
    var priceTotal = document.getElementById('priceTotal');//商品总价
    var selected = document.getElementById('selected');//悬浮层显示隐藏按钮
    var selectedViewList = document.getElementById('selectedViewList');//悬浮框商品列表
    var foot = document.getElementById('foot');
    var deleteAll = document.getElementById('deleteAll');

    //计算商品总数及总价
    function getTotal() {
        var selected = 0;
        var price = 0;
        var HTMLstr = '';//悬浮层HTML内容
        var i;
        var len = tr.length;
        for (i = 0; i < len; i++) {
            if (tr[i].getElementsByTagName('input')[0].checked) {
                tr[i].className = 'on';//已选则背景变色
                selected += parseInt(tr[i].getElementsByTagName('input')[1].value);
                price += parseFloat(tr[i].cells[4].innerHTML);
                HTMLstr += '<div><img src="' + tr[i].getElementsByTagName('img')[0].src + '"><span class="del" data-index="' + i + '">取消选择</span></div>';
            } else {
                tr[i].className = '';
            }
        }
        selectedTotal.innerHTML = selected;
        priceTotal.innerHTML = price.toFixed(2);
        selectedViewList.innerHTML = HTMLstr;
        //如果取消全部选中的商品，悬浮层消失
        if (selected === 0) {
            foot.className = 'foot';
        }
    }

    // 价格小计（单价*商品数量）
    // 因为是通过点击加减按钮调用的，而加减按钮的事件绑定在tr上，所以传入的参数是tr，
    // 通过点击指定行的tr，获取指定行的price和count
    function getSubTotal(tr) {
        var tds = tr.cells;
        var price = parseFloat(tds[2].innerHTML);
        var count = parseInt(tds[3].getElementsByTagName('input')[0].value);
        var subTotal = parseFloat(price * count);
        tds[4].innerHTML = subTotal.toFixed(2);
    }


    //复选框点击事件回调函数
    function checkClick() {
        if (this.className.match(new RegExp('(\\s|^)' + 'check-all' + '(\\s|$)'))) {
            for (var j = 0; j < checkInputs.length; j++) {
                checkInputs[j].checked = this.checked;
            }
        }
        //全选后，有一个点击取消后，全选按钮变成false
        if (this.checked === false) {
            for (var k = 0; k < checkAllInputs.length; k++) {
                checkAllInputs[k].checked = false;
            }
        }
        getTotal();//每次点击重新计算总量与价格
    }

    //给复选框添加点击事件
    for (var i = 0, len = checkInputs.length; i < len; i++) {
        addEvent(checkInputs[i], 'click', checkClick);
    }

    //悬浮层的隐藏和显示(此处使用className,实际运用中建议使用hasClass、addClass与removeClass)
    addEvent(selected, 'click', function () {
        if (foot.className === 'foot') {
            if (selectedTotal.innerHTML != 0) {
                foot.className = 'foot show';
            }
        } else {
            foot.className = 'foot';
        }
    });

    //添加selectedVieewList的事件代理，因为selectViewList下面的元素是动态生成的
    addEvent(selectedViewList, 'click', function (e) {
        e = e || window.event;
        var el = e.target || e.srcElement;
        if (el.className === 'del') {
            var dataIndex = el.getAttribute('data-index');
            var input = tr[dataIndex].getElementsByTagName('input')[0];
            input.checked = false;
            checkClick.call(input);
        }
    });


    for (var i = 0, len = tr.length; i < len; i++) {
        //给商品数量加减按钮添加事件
        addEvent(tr[i], 'click', function (e) {
            e = e || window.event;
            var el = e.target || e.srcElement;
            var cls = el.className;
            var input = this.getElementsByTagName('input')[1];
            var val = parseInt(input.value);
            var reduce = this.getElementsByTagName('span')[1];
            switch (cls) {
                //增加单品数量
                case 'add':
                    input.value = val + 1;
                    reduce.innerHTML = '-';
                    getSubTotal(this);
                    break;
                //减少单品数量
                case 'reduce':
                    if (val > 1) {
                        input.value = val - 1;
                    }
                    if (input.value <= 1) {
                        reduce.innerHTML = '';
                    }
                    getSubTotal(this);
                    break;
                //单项删除
                case 'delete':
                    var conf = confirm('确定要删除吗？');
                    if (conf) {
                        this.parentNode.removeChild(this);
                    }
                    break;
                default:
                    break;
            }
            getTotal();
        });
        //给商品数量输入框添加事件
        var singleSelectedTotal = tr[i].getElementsByTagName('input')[1];
        addEvent(singleSelectedTotal, 'keyup', function () {
            var val = parseInt(this.value);
            var tr = this.parentNode.parentNode;
            var reduce = tr.getElementsByTagName('span')[1];
            if (val <= 0 || isNaN(val)) {
                val = 1;
            }
            this.value = val;
            if (val <= 1) {
                reduce.innerHTML = '';
            } else {
                reduce.innerHTML = '-';
            }
            getSubTotal(tr);
            getTotal();
        });
        addEvent(singleSelectedTotal, 'click', function () {
            this.select();
        })
    }
    //给底部删除按钮添加点击事件
    addEvent(deleteAll, 'click', function () {
        if (selectedTotal.innerHTML != '0') {//数量不等于0时才触发
            var conf = confirm('确定删除吗？');
            if (conf) {
                for (var i = 0; i < tr.length; i++) {
                    var input = tr[i].getElementsByTagName('input')[0];
                    if (input.checked) {
                        tr[i].parentNode.removeChild(tr[i]);
                        i--;
                    }
                }
            }
        }
        //点击后取消全选以及重新计算价格
        for (var k = 0; k < checkAllInputs.length; k++) {
            checkAllInputs[k].checked = false;
        }
        getTotal();
    });
    checkAllInputs[0].checked = true;
    //购物车默认全选
    checkClick.call(checkAllInputs[0]);

    //进入购物车页面如果已经有商品选择数量大于一件
    for (var i = 0, len = tr.length; i < len; i++) {
        getSubTotal(tr[i]);
        getTotal();
    }
})();