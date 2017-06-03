$(function () {
	// 初始化富文本编辑器
	layui.use('layedit', function(){
		  var layedit = layui.layedit;
		  var index =  layedit.build('demo'); //建立编辑器
		  //编辑器外部操作
		  var active = {
		    content: function(){
		     var content2 = layedit.getContent(index); //获取编辑器内容
		     var title = $("input[name='title']").val();
		     var url = "/report/addReport.do";
		     var data = {"title":title,"content":content2};
		     // 提交公告内容到数据库
     		 $.axse(url,data,
    			function(oData){
     			 var data = oData.data;	
     			 if(data == 1){
     				layer.msg("发布成功",{icon:1});
     				window.parent.getDataFieldGrid();
     			 }else if(data == -1){
     				 layer.msg("您尚未登录，无法发布公告");
     				 window.parent.exportData($('#shownum').val(),$('#splitstr').val());
     			 }else{
     				 layer.msg("发布失败");
     			 }
    			},function(msg){
    				pop("请求失败 +" + msg,0);
    			}
    		 );
		    }
		    ,text: function(){
		      alert(layedit.getText(index)); //获取编辑器纯文本内容
		    }
		    ,selection: function(){
		      alert(layedit.getSelection(index));
		    }
		  };
		  $('.site-demo-layedit').on('click', function(){
			    var type = $(this).data('type');
			    active[type] ? active[type].call(this) : '';
			  });
		});
})
