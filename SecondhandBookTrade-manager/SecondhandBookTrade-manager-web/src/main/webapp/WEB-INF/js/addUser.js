var flag = false;
$(function (){
	layui.use(['form', 'layedit', 'laydate'], function(){
		  var form = layui.form()
		  ,layer = layui.layer
		  ,layedit = layui.layedit
		  ,laydate = layui.laydate;
		  form1 = form;
		  //创建一个编辑器
		  var editIndex = layedit.build('LAY_demo_editor');
		 
		  //自定义验证规则
		  form.verify({
		    title: function(value){
		      if(value.length < 5){
		        return '标题至少得5个字符啊';
		      }
		    }
		    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
		    ,content: function(value){
		      layedit.sync(editIndex);
		    }
		  });
		  
		  //监听指定开关
		  form.on('switch(switchTest)', function(data){
		    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
		      offset: '6px'
		    });
		    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
		  });
		//监听提交
		  form1.on('submit(demo1)', function(data){
		  	 var data = JSON.stringify(data.field);
		  	 // 
		  	parent.layer.closeAll();
		  	 //alert(data);
		    /*layer.alert(JSON.stringify(data.field), {
		      title: '最终的提交信息'
		    })*/
		  	//functionSubmit(data);
		    return true;
		  }); 
		});
	/*$("#city_2").citySelect({
        prov: "南京",
        nodata: "none"
    });*/
	/*$("#register").on("click",function (){
		alert("提交");
	});*/
});
function functionSubmit(data){
	var url = "/user/addUser.do";
  	$.axse(url,data,
  		function(oData){
  			if(oData.data == 1){
  				layer.msg("注册成功！将返回登录页面",{icon:1});
  				window.location.href = "/";
  			}
  		},function(msg){
  			layer.msg("请求失败 +" + msg,0);
  		}
  	);
}
function addUser(){
	var username = $("input[name='username']").val();
	alert(username);
}
//});
	