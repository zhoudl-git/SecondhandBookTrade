$(function(){
	$("#myMessage").on("click",function(){
		myMessage();
	});
	// 初始化页面订单内容区域
	queryOrderDetail();
});
function queryOrderDetail(){
	var url = "/order/queryOrder.do";
	$.axse(url,null,
		function(oData){
			var data = oData.data;
			if(data != null){
				if(data == -1){
					layer.msg("你尚未登录，请登录系统后再查询订单");
					window.location.href = "/";
					//window.parent.exportData($('#shownum').val(),$('#splitstr').val());
				}else{
					var html = "";
					for(var i=0;i<data.length;i++){
						html += "<tr>";
							html += "<td colspan='6'>"+data[i].orderId+"：1234567890<span>京东自营</span></td>";
						html += "</tr>";
						
						html += "<tr>";
							html += "<td>";
							var srcs = data[0].buyerMessage.split(",");
							for(var j=0;j<srcs.length;j++){
								html += "<a href='#'><img src='"+srcs[j]+"'></a>";
							}
							html += "</td>";
							html += "<td>"+data[i].buyerNick+"</td>";
							html += "<td>￥"+(data[i].payment)+" 货到付款</td>";
							html += "<td>"+new Date(data[i].createTime).toLocaleString()+"</td>";
							html += "<td>已经付款</td>";
							html += "<td><a href=''>查看</a></td>";
						html += "</tr>";
					}
					$("#orderTable").empty();
					$("#orderTable").append(html);
				}
			}else{
				layer.msg("订单查询失败，请稍后重试");
			}
		},function(msg){
			pop("请求失败 +" + msg,0);
		}
	);
}
function myMessage(){
	var url = "/message/queryMessage.do?userId="+userId;
	$.axse(url,null,
		function(oData){
			if(oData.data == 1){
				pop("禁用成功！" ,1);
				getDataFieldGrid();
				//window.location.reload();
			}else if(oData.data == 0){
				pop("禁用失败！" ,0);
			}else{
				pop("禁用失败，服务器错误",0);
			}
		},function(msg){
			pop("请求失败 + " + msg,0);
		}
	);
}