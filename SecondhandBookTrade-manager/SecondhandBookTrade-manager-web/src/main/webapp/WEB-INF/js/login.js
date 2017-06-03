var verifyCode;
$(function(){
	// 初始化图形验证码
	try{
		verifyCode = new GVerify("v_container");
	}catch(err){}
	$("#login").on("click",function (){
		login();
	});
	$("#register").on("click",function (){
		register();
	});
	$("#clear").on("click",function (){
		clear();
	});
});
function clear(){
	$("#username").val("");
	$("#password").val("");
	$("#v_container").val("");
}
function login(){
	var username = $("#username").val();
	var password = $("#password").val();
	var url = "/user/login.do";
	var data = {"username":username,"password":password};
	// 校验验证码
	var res = verifyCode.validate(document.getElementById("code_input").value);
	if(res){
		$.axse(url,data,
				function(oData){
					var data = oData.data;
					if(data == "afterIndex"){// 系统管理人员
						layer.msg("登录成功",{icon: 1});
					}else if(data == "index"){// 普通用户
						layer.msg("登录成功",{icon: 1});
					}else if(data == "exception"){
						layer.msg("用户状态异常，登录失败，请联系客服人员");
						return;
					}else{
						layer.msg("登录失败，用户名或密码错误，请重新登录或稍后重试");
						return;
					}
					window.location.href = data;
				},function(msg){
					layer.msg("请求失败 +" + msg,0);
				}
			);
	}else{
		layer.msg("验证码错误");
	}
	
}
function register(){
	//iframe窗
    layer.open({
    	type: 2,
        title: '二手书籍交易管理中心-用户注册',
        shadeClose: true,
        shade: [0.8, '#393D49'],
        maxmin: true, //开启最大化最小化按钮
        area: ['600px', '700px'],
        content: 'user-add' //iframe的url，no代表不显示滚动条
    });
}
