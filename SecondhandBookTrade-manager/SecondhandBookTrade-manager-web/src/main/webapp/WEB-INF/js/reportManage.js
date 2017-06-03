// 全局grid对象
var UserGrid = {}; 
$(function () {
	// 获取dataGrid数据
	getDataFieldGrid();
	// 按钮点击事件绑定
	// 添加
	$("#user-add").on("click",function (){
		//iframe窗
	    layer.open({
	    	type: 2,
	        title: '二手书籍交易管理中心-公告管理',
	        shadeClose: true,
	        shade: [0.8, '#393D49'],
	        maxmin: true, //开启最大化最小化按钮
	        area: ['600px', '500px'],
	        content: 'report-add' //iframe的url，no代表不显示滚动条
	    });
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
			pop("确定删除所选数据？",3,deleteUsersByIdsOK,selectIds);
		}else{
			pop("请选择要删除的数据",0);
		}
	});
});
// 供子页面调用
function exportData(shownum,splitstr){
	window.location.href = "/";
}
function getDataFieldGrid(){
	var url = "/report/queryReport.do";
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
	var url = "/report/deleteReports.do?reportIds="+userIds;
	$.axse(url,null,
		function(oData){
			if(oData.data != 0){
				pop("删除成功！" ,1);
			}else if(oData.data == 0){
				pop("删除失败！" ,0);
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
				display: '公告ID',
				name: 'id',
				width: 100
			}, {
				display: '公告标题',
				name: 'title',
				width: 200
			}, {
				display: '发布人',
				name: 'userName',
				width: 100,
			},{
				display: '公告状态',
				name: 'isdelte',
				width: 100,
				render: function(row) {
					if(row.isdelte == 1){
						return "已删除";
					}else{
						return "正在公告";
					}
				}
			},{
				display: '公告内容',
				name: 'content',
				width: 400,
				render: function(row) {
					if(row.content.length > 100){
						return row.content.substring(0,100)+"......";
					}else{
						return row.content;
					}
				}
			},{
				display: '发布时间',
				name: 'createTime',
				minWidth: 100,
				render: function(row) {
					return new Date(row.createTime).toLocaleString();
				}
			}, {
				display: '操作',
				name: 'id',
				width: 100,
				align: 'center',
				render: function(row) {
					//var html = "<img src='images/update.png' onclick='editUserById("+row.id+")' title='编辑'  style='cursor:pointer'/>";
					  var html = "<img src='images/deleteUser.png' onclick='javascript:deleteUserById("+row.id+")' title='删除'  style='cursor:pointer'/>";
					    //html += "<img src='images/user_tb.png' onclick='javascript:setRole("+row.id+")' title='授予角色'  style='cursor:pointer'/>";
					return html;
				}
			}]
		});
}
//禁用按钮
function deleteUserById(userId){
	pop("确定删除？",3,deleteUserByIdOK,userId);
}
//禁用用户 确定 点击事件
function deleteUserByIdOK(userId){
	var url = "/report/deleteReportById.do?reportId="+userId;
	$.axse(url,null,
		function(oData){
			if(oData.data == 1){
				pop("删除成功！" ,1);
				getDataFieldGrid();
				//window.location.reload();
			}else if(oData.data == 0){
				pop("删除失败！" ,0);
			}else{
				pop("删除失败，服务器错误",0);
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

	