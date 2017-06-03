$(function () {
	// 初始化页面点击事件
	    //window.location.href = "booktrade_shopcart";
		//iframe窗
		$("#settle_up").on("click",function (){
	    	 layer.open({
	 	    	type: 2,
	 	        title: '二手书籍交易管理中心-购物车',
	 	        shadeClose: true,
	 	        shade: [0.8, '#393D49'],
	 	        maxmin: true, //开启最大化最小化按钮
	 	        area: ['1000px', '600px'],
	 	        content: 'booktrade_shopcart' //iframe的url，no代表不显示滚动条
	 	    });
	});
	$("#searchButton").on("click",function (){
		exeData(1,null,null,"research");
	})
	// 从后台获得书籍类目
	getItemCat();
	// 初始化公告栏
	getAllReport();
	// 初始化导航栏目
	// 初始化热搜书籍
	queryHotSerarch();
	//InitTreeData();
	// 初始化刚进入页面未选择导航时主题数据
	clcikMenu();
});
function queryHotSerarch(){
	var url = "/item/queryHotSerarch.do";
	// 增加搜索条件
	$.axse(url,null,
		function(oData){
			var data = oData.data;
			if(data != null && data.length > 0){
				var html = "<ul>";
				$("#hotSearch").empty();
				for(var i=0;i<data.length;i++){
					var srcs = data[i].image.split(",");
					if((i+1)%3 == 0){
						html += "<li style='width:50%;height:100%;'><a href='javascript:void(0)' onclick=\"queryDetail('"+data[i].id+"')\"><img style='width:100%;height:100%;' src='"+srcs[0]+"'></a></li></ul>";
						html = "<ul>"
					}else{
		                html += "<li style='width:50%;height:100%;'><a href='javascript:void(0)' onclick=\"queryDetail('"+data[i].id+"')\"><img style='width:100%;height:100%;inline-block;' src='"+srcs[0]+"'></a></li>";
					}
				}
				html += "</ul>";
				$("#hotSearch").append(html);
			}
		},function(msg){
			layer.msg("请求失败 +" + msg,0);
		}
	);
}
function exportData(shownum,splitstr){
	window.location.href = "/";
}
function getAllReport(){
	var url = "/report/queryReportUserIndex.do";
	var html = "<ul class='lf'>";
	// 增加搜索条件
	$.axse(url,null,
		function(oData){
			var data = oData.data;
			if(data != null && data.length > 0){
				for(var i=0;i<data.length;i++){
					html +=  "<li><a href='javascript:void(0)' onclick='lookReport("+data[i].id+")'>"+data[i].title+"</a></li>";
					html += "<input type='hidden' id='"+data[i].id+"' value='"+data[i].content+"'>";
					html += "<input type='hidden' name='"+data[i].id+"' value='"+data[i].userName+"'>"
				}
				html += "</ul>";
				$("#context").empty();
				$("#context").append(html);
			}else{
				layer.msg("查询公告失败");
			}
		},function(msg){
			layer.msg("请求失败 +" + msg,0);
		}
	);
}
function lookReport(id){
	$("#whrx").val(id);
	//iframe窗
    layer.open({
    	type: 2,
        title: '二手书籍交易系统-公告详情',
        shadeClose: true,
        shade: [0.8, '#393D49'],
        maxmin: true, //开启最大化最小化按钮
        area: ['600px', '600px'],
        content: 'report-look' //iframe的url，no代表不显示滚动条
    });
}
// 动态生成左侧导航栏
function getItemCat(){
	var url = '/item/cat/listIndex.do';
	$.axse(url,null,
		function(oData){
			var data = oData.data;
			var html = "";
			html += "<ul class='layui-nav layui-nav-tree' lay-filter='test'>";
			for(var i=0;i<data.length;i++){
				if(data[i].parentId == 1){// 是否二级节点
					 html += "<li class='layui-nav-item'>";
					 html += "<a href='javascript:;'>"+data[i].name+"</a>";
					 // 添加子节点
					 html += "<dl class='layui-nav-child'>";
					 for(var j=0;j<data.length;j++){
						 if(data[j].parentId == data[i].id){
							 html += "<dd><a href='javascript:void(0)' onclick='clcikMenu("+data[j].id+")'>"+data[j].name+"</a></dd>";
						 }
					 }
					 html += "</dl>";
				}
			}
			html += "</li>";
			html += "</ul>";
			$("#cate_box").append(html);
			layui.use('element', function(){
				 var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
				 //监听导航点击
				 element.on('nav(demo)', function(elem){
				  //console.log(elem)
				  layer.msg(elem.text());
				 });
				});
		},function(msg){
			layer.msg("请求失败 + " + msg,0);
		}
	);
}
function InitTreeData(){
	  $('#nav_items').tree({
	  url:'/item/cat/list.do',
	  checkbox:true,
	  onClick:function(node){
	    alert(node.text);
	  },
	  onContextMenu: function(e, node){  
          e.preventDefault();  
          $('#nav_items').tree('select', node.target);  
          $('#mm').menu('show', {  
                  left: e.pageX,  
                  top: e.pageY  
              });  
          }  
	    });
}
function clcikMenu(catId,idSearch){
	$("#yccatid").val(catId);
	exeData(1, null,catId,idSearch)
}
function queryDetail(itemId){
	window.location.href = "booktrade_detail?itemId="+itemId;
}
/*function register(){
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
}*/