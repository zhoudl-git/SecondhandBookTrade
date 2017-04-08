/*
 * 提示信息
 */
function pop(str,status,method){
	if(status == 0){
		// 黑色提示 一般用于失败信息提示 提示完毕自动消失
		layer.msg(str);
	}else if(status == 1){
		// 对号图标 一般用于操作成功提示 提示完毕自动消失
		layer.msg(str, {icon: 1});
	}else if(status == 2){
		// 需要确认的提示信息框 提示完毕需要点击确定活关闭按钮才消失
		layer.alert(str, {
			  skin: 'layui-layer-molv' 
				  // 样式类名 
				  // layui-layer-molv 墨绿 
				  // layui-layer-lan 深蓝
			  ,closeBtn: 0
			  ,anim: 4 //动画类型
			});
	}else if(status == 3){
		// 询问框 一般用于删除等操作
		layer.confirm(str, {
			  btn: ['确定','取消'] //按钮
			}, function(){
				var flag = true;
				try {
					method();// 调用点击确定后的操作方法
				} catch (e) {
					flag = false;
					var fName = getFName(method.toString());
					pop("调用方法 "+fName+" 异常,异常原因为："+e.name + ": " + e.message,2);
				}
				if(flag){
					pop("执行成功",1);
				}
			});
	}else if(status == 4){
		layer.msg(str, {icon: 1});
	}else if(status == 5){
		layer.msg(str, {icon: 1});
	}
}
/*加载中...*/
function loading(){
	var index = layer.load(1, {
		shade: [0.1,'#fff'] //0.1透明度的白色背景
	});
	return index;
}
function loadingTO(){
	var index = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
	return index;
}
function loadindClose(index){
	layer.close(index); 
}
/*正则式匹配出当前正在执行的方法名称*/
function getFName(str){
	var re = /function\s*(\w*)/i;
	var matches = re.exec(str);
	return matches[1];
}