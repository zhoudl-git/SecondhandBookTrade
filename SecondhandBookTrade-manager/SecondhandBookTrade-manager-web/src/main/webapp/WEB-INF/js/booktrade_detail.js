var itemId;
$(function () {
	var sContextPath = latool.getContextPath();
	// 获取首页传参  商品ID
	itemId  = latool.getQueryString('itemId');
	$("#itemIdUserMessage").val(itemId);
    // 初始化页面点击事件
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
    	//window.location.href = "booktrade_shopcart";
    });
    $("#addShopCart").on("click",function (){
    	addShopCart(itemId);
    });
    $("#addMessage").on("click",function (){
    	addMessage(itemId);
    });
    // 初始化地址选择联动框
    $("#city_2").citySelect({
        prov: "甘肃",
        city: "兰州",
        dist: "七里河区",
        nodata: "none"
    });
    queryItem(itemId);
    queryItemDetail(itemId);
    queryMessageData(itemId);
});
function refreshMessage(){
	var itemId = $("#itemIdUserMessage").val();
	queryMessageData(itemId);
}
function queryMessageData(itemId){
	var url = "/message/queryMessageByItemId.do";
	var data = {"itemId":itemId};
	$.axse(url,data,
		function(oData){
			var data = oData.data;
			var html = "";
			$("#messageData").empty();
			if(data != null && data.length > 0){
				for(var i=0;i<data.length;i++){
				  html+="<tr>";	
	                html+= "<td class='col1'>";
	                   html+="<b class='topic shai'></b>";
	                   html+="<a href='javascript:void(0)' onclick='messageDetail("+data[i].id+")'>"+data[i].content+"</a></td>"; 
	                html +="<td>0/0</td>";
	                html +="<td><a href='javascript:void(0)'>"+data[i].issUserName+"</a></td>";
	                html +="<td style='width:200px;'>"+new Date(data[i].createTime).toLocaleString()+"</td>";
	              html += "</tr>";
				}
				$("#messageData").append(html);
			}
		},function(msg){
			pop("请求失败 +" + msg,0);
		}
	);
}
function messageDetail(messageId){
	layer.open({
    	type: 2,
        title: '二手书籍交易管理中心-讨论区',
        shadeClose: true,
        shade: [0.8, '#393D49'],
        maxmin: true, //开启最大化最小化按钮
        area: ['600px', '500px'],
        content: 'message-detail' //iframe的url，no代表不显示滚动条
    });
}
function addMessage(itemId){
	//iframe窗
    layer.open({
    	type: 2,
        title: '二手书籍交易管理中心-留言发布',
        shadeClose: true,
        shade: [0.8, '#393D49'],
        maxmin: true, //开启最大化最小化按钮
        area: ['600px', '500px'],
        content: 'message-add' //iframe的url，no代表不显示滚动条
    });
}
function queryItem(itemId){
	var url = "/item/selectBookByItemId.do";
	var data = {"itemId":itemId};
	$.axse(url,data,
		function(oData){
			var data = oData.data;
			// 商品左侧信息
			$("#title").empty();
			$("#title").html("<b>"+data[0].title+"</b>");
			$("#price").empty();
			$("#price").append("<b>"+data[0].price+"</b>");
			$("#itenNum").empty();
			$("#itenNum").append("<span>"+data[0].id+"</span>");
			// 一本书对应多张图片
			var srcs = data[0].image.split(",");
			$("#mImg").attr('src',srcs[0]);
			var html = "";
			for(var i=0;i<srcs.length;i++){
				html += "<li><img src='"+srcs[i]+"' onclick=\"selectImage('"+srcs[i]+"')\"/></li>";
			}
			$("#icon_list").empty();
			$("#icon_list").append(html);
			var htmlShow = "";
			htmlShow +="<li>商品名称："+data[0].title+"</li>";
			htmlShow +="<li>上架时间："+new Date(data[0].created).toLocaleString()+"</li>";
			htmlShow +="<li>类别："+data[0].cid+"</li>";
			htmlShow +="<li>商品买点："+data[0].sellPoint+"</li>";
			$("#itemShow").empty();
			$("#itemShow").append(htmlShow);
			// 商品介绍
		},function(msg){
			pop("请求失败 +" + msg,0);
		}
	);
}
function queryItemDetail(itemId){
	var url = "/item/selectBookDetailByItemId.do";
	var data = {"itemId":itemId};
	$.axse(url,data,
		function(oData){
			var data = oData.data;
			$("#bookDetail").append(data[0].itemDesc);
		},function(msg){
			pop("请求失败 +" + msg,0);
		}
	);
}
function selectImage(src){
	$("#mImg").attr('src',src);
}
function exportData(shownum,splitstr){
	window.location.href = "/";
}
function addShopCart(itemId){
	var url = "/cat/addShopCat.do";
	var data = {"itemId":itemId,"num":1};
	$.axse(url,data,
		function(oData){
			var data = oData.data;
			if(data == -2){
				layer.msg("请登录系统之后添加购物车");
				window.location.href = "/";
			}else if(data == -1){
				layer.msg("数据库中不存在该商品，请浏览其它商品");
				window.location.href = "index";
			}else if(data == 1){
				layer.msg("添加成功！",{icon:1});
			}else{
				layer.msg("添加失败");
			}
		},function(msg){
			pop("请求失败 +" + msg,0);
		}
	);
}