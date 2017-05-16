// 全局grid对象
var UserGrid = {}; 
$(function () {
	// 获取dataGrid数据
	getDataFieldGrid();
	// 按钮点击事件绑定
	// 添加
	$("#user-add").on("click",function (){
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
	});
});
function getDataFieldGrid(){
	var url = "/user/list.do";
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
				display: '用户名',
				name: 'username',
				width: 100
			}, {
				display: '用户状态',
				name: 'status',
				width: 100,
				render: function(row) {
					if(row.status == 1){
						return "<span style='color:blue'>正常</span>";
					}else if(row.status == 0){
						return "<span style='color:red'>禁用</span>";
					}else{
						return "";
					}
				}
			}, {
				display: '联系电话',
				name: 'phone',
				width: 100,
			},{
				display: '出生日期',
				name: 'birthday',
				width: 100,
			},{
				display: '用户详细地址',
				name: 'addressDetail',
				width: 100,
			},{
				display: '用户爱好',
				name: 'interest',
				width: 100,
			},{
				display: '邮箱',
				name: 'email',
				width: 100,
				render: function(row) {
					if(row.email != null){
						return row.email;
					}else{
						return "";
					}
				}
			},
			{
				display: '创建时间',
				name: 'created',
				minWidth: 100,
				render: function(row) {
					return new Date(row.created).toLocaleString();
				}
			}, {
				display: '更新时间',
				name: 'updated',
				minWidth: 100,
				render: function(row) {
					return new Date(row.updated).toLocaleString();
				}
			}, {
				display: '操作',
				name: 'id',
				width: 100,
				align: 'center',
				render: function(row) {
					var html = "<img src='images/update.png' onclick='editUserById("+row.id+")' title='编辑'  style='cursor:pointer'/>";
					    html += "<img src='images/delete.png' onclick='javascript:deleteUserById("+row.id+")' title='禁用'  style='cursor:pointer'/>";
					return html;
				}
			}]
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

	