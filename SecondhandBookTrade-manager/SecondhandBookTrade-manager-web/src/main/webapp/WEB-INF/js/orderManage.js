// 全局grid对象
var UserGrid = {}; 
$(function () {
	// 获取dataGrid数据
	getDataFieldGrid();
	// 按钮点击事件绑定
	// 添加
	/*$("#user-add").on("click",function (){
		window.location.href = "user-add";
	});
	// 批量禁用用户
	$("#user-deletes").on("click",function (){
		// 获取选中行
		var selecteds = UserGrid.getSelecteds();
		if(selecteds != null && selecteds.length > 0){
			var selectIds = [];
			for(var i=0;i<selecteds.length;i++){
				selectIds.push(selecteds[i].id);
			}
			pop("确定禁用？",3,deleteUsersByIdsOK,selectIds);
		}else{
			pop("请选择要禁用的数据",0);
		}
	});*/
});
function getDataFieldGrid(){
	var url = "/order/getAllOrder.do";
	var selectData = {};
	// 增加搜索条件
	$.axse(url,null,
		function(oData){
			setDataFieldGrid(ligerUIDataGrid(oData));
		},function(msg){
			pop("请求失败 +" + msg,0);
		}
	);
}
//批量禁用
function deleteUsersByIdsOK(userIds){
	var url = "/user/deleteUsersById.do?userIds="+userIds;
	$.axse(url,null,
		function(oData){
			if(oData.data != 0){
				pop("禁用成功！" ,1);
			}else if(oData.data == 0){
				pop("禁用失败！" ,0);
			}
			getDataFieldGrid();
		},function(msg){
			pop("请求失败 + " + msg,0);
		}
	);
	
}
//利用LigerUI Grid创建用户列表
function setDataFieldGrid(jsonObjDataFile){
	/*CREATE TABLE tb_user (
			  id BIGINT(20) NOT NULL AUTO_INCREMENT,
			  username VARCHAR(50) NOT NULL COMMENT '用户名',
			  PASSWORD VARCHAR(32) NOT NULL COMMENT '密码，加密存储',
			  phone VARCHAR(20) DEFAULT NULL COMMENT '注册手机号',
			  email VARCHAR(50) DEFAULT NULL COMMENT '注册邮箱',
			  created DATETIME NOT NULL,
			  updated DATETIME NOT NULL,*/
	UserGrid = $("#dataFieldGrid").ligerGrid({
			checkbox: true,
			rownumbers: true,
			pageSizeOptions: [10, 20, 30, 40, 50],
			usePager: true,
			pageSize: 15,
			data: jsonObjDataFile,
			hideLoadButton: true,
			width: '95%',
			columns: [/*{
				display: '用户条形码',
				name: 'barcode',
				width: 100
			}, */{
				display: '订单编号',
				name: 'orderId',
				width: 100
			}, {
				display: '收货人昵称',
				name: 'buyerNick',
				width: 100
			},{
				display: '收货人ID',
				name: 'userId',
				width: 100
			},{
				display: '支付方式',
				name: 'paymentType',
				width: 100,
				render: function(row) {
					if(row.paymentType == 1){
						return "货到付款";
					}else if(row.paymentType == 0){
						return "在线支付";
					}else{
						return "";
					}
				}
			}, {
				display: '支付金额',
				name: 'payment',
				width: 100,
				render: function(row) {
					return "￥ "+row.payment;
				}
			},{
				display: '订单状态',
				name: 'status',
				width: 100,
				render: function(row) {
					if(row.status == 1){
						return "已下单";
					}else if(row.status == 5){
						return "已付款";
					}else{
						return "";
					}
				}
			},{
				display: '收货地址',
				name: 'addressdetail',
				width: 400,
			},{
				display: '创建时间',
				name: 'createTime',
				minWidth: 100,
				render: function(row) {
					return new Date(row.createTime).toLocaleString();
				}
			}/*,  {
				display: '操作',
				name: 'id',
				width: 100,
				align: 'center',
				render: function(row) {
					var html = "<img src='images/update.png' onclick='editUserById("+row.id+")' title='订单详情'  style='cursor:pointer'/>";
					   // html += "<img src='images/deleteUser.png' onclick='javascript:deleteUserById("+row.id+")' title='禁用'  style='cursor:pointer'/>";
					    // html += "<img src='images/user_tb.png' onclick='javascript:setRole("+row.id+")' title='授予角色'  style='cursor:pointer'/>";
					return html;
				}
			}*/]
		});
}
//禁用按钮
function deleteUserById(userId){
	pop("确定禁用？",3,deleteUserByIdOK,userId);
}
//禁用用户 确定 点击事件
function deleteUserByIdOK(userId){
	var url = "/user/deleteUserById.do?userId="+userId;
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
//编辑按钮
function editUserById(userId){
	pop("确定激活该用户？",3,updateUserByIdOK,userId);
}
//激活用户 确定 点击事件
function updateUserByIdOK(userId){
	var url = "/user/updateUserById.do?userId="+userId;
	$.axse(url,null,
		function(oData){
			if(oData.data == 1){
				pop("激活成功！" ,1);
				getDataFieldGrid();
				//window.location.reload();
			}else if(oData.data == 0){
				pop("激活失败！" ,0);
			}else{
				pop("激活失败，服务器错误",0);
			}
		},function(msg){
			pop("请求失败 + " + msg,0);
		}
	);
}
function setRole(userId){
	var url = "/user/selectRole.do?userId="+userId;
	$.axse(url,null,
		function(oData){
			buttonIds = oData.data;
			if(oData.data != null){
				var html = "<div style='margin-top:40px;margin-left:20px;'>";
				for(var i=0;i<oData.data.length;i++){
					html += "<button class='layui-btn layui-btn-normal' style='margin-top:10px;margin-left:10px;' id='"+oData.data[i].id+"' onclick='buttonClick("+oData.data[i].id+")' >"+oData.data[i].name+"</button>";
				}
					html += "</div>";
					html +="<div style='margin-top:150px;margin-left:220px;'><button class='layui-btn layui-btn-warm layui-btn-radius' onclick='setRoleByUser("+userId+")'>提交</button>";
					//html +="<button class='layui-btn layui-btn-primary layui-btn-radius' onclick='close()'>取消</button>";
					html +="</div>";
				layer.open({
					  type: 1,
					  title: false,
					  title: '请选择一个要授予的角色',
					  closeBtn: 1,
					  shadeClose: true,
					  area: ['350px', '450px'],
					  skin: 'yourclass',
					  content: html
					});
			}else{
				layer.msg("抱歉，该系统中暂时没有配置角色信息，请添加角色后再试！");
			}
		},function(msg){
			pop("请求失败 + " + msg,0);
		}
	);
}
var buttonIds = [];
function buttonClick(buttonId){
	$("#"+buttonId).attr("class", "layui-btn layui-btn-normal");
	for(var i=0;i<buttonIds.length;i++){
		if(buttonId != buttonIds[i].id){
			$("#"+buttonIds[i].id).attr("class", "layui-btn layui-btn-disabled");
		}
	}
}
function close(){
	 layer.closeAll();
}
function setRoleByUser(userId){
	var temp = 0;
	var tempRoleId;
	for(var i=0;i<buttonIds.length;i++){
		var $class = $("#"+buttonIds[i].id).attr("class");
		if($class == "layui-btn layui-btn-normal"){
			temp ++;
			tempRoleId = buttonIds[i].id;
		}
	}
	if(temp == 1){
		var url = "/user/setRoleByUser.do;"
		var data = {"userId":userId,"roleId":tempRoleId};
		$.axse(url,data,
			function(oData){
				if(oData.data == 1){
					layer.msg("分配角色成功",{icon:1});
				}else if(oData.data == -1){
					layer.msg("该用户已经在该角色上，无需重复分配");
				}else{
					layer.msg("分配失败");
				}
			},function(msg){
				layer.msg("请求失败 + " + msg,0);
			}
		);
	}else{
		layer.msg("抱歉，只能选择一个角色");
	}
}

	