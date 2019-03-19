/**
 * 系统提示信息通用框
 * @param str 提示文本内容
 * @param status 状态标记 0 黑色无确认 1 对号图标无确认 2 需确认 3 询问框
 * @param method 询问框点击确认后执行的方法名称(其他提示信息无需该参数)
 */
function pop(str,status,method,params){
	if(status == 0){
		top.layer.msg(str);
	}else if(status == 1){
        top.layer.msg(str, {icon: 1});
	}else if(status == 2){
        top.layer.alert(str, {
			  skin: 'layui-layer-molv' 
				  // 样式类名 
				  // layui-layer-molv 墨绿 
				  // layui-layer-lan 深蓝
			  ,closeBtn: 0
			  ,anim: 4 //动画类型
			});
	}else if(status == 3){
        top.layer.confirm(str, {
			  btn: ['确定','取消'] //按钮
			}, function(){
				var flag = true;
				try {
					method(params);// 调用点击确定后的操作方法
				} catch (e) {
					flag = false;
					var fName = getFName(method.toString());
					pop("调用方法 "+fName+" 异常,异常原因为："+e.name + ": " + e.message,2);
				}
				/*if(flag){
					pop("执行成功",1);
				}*/
			});
	}else if(status == 4){
        top.layer.msg(str, {icon: 1});
	}else if(status == 5){
        top.layer.msg(str, {icon: 1});
	}
}
/**
 * 加载中...
 * @returns
 */
function loading(){
	var index = top.layer.load(1, {
		shade: [0.1,'#fff'] //0.1透明度的白色背景
	});
	return index;
}
/**
 * 加载中...
 * @returns
 */
function loadingTO(){
	var index = top.layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
	return index;
}
/**
 * 关闭 加载中...
 * @param index
 */
function loadindClose(index){
    top.layer.close(index);
}
/**
 * 正则式匹配出当前正在执行的方法名称
 * @param str 当前正在执行方法的字符串形式
 * @returns
 */
function getFName(str){
	var re = /function\s*(\w*)/i;
	var matches = re.exec(str);
	return matches[1];
}