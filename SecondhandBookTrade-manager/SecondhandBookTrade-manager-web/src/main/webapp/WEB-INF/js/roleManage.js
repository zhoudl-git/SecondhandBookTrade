// 全局grid对象
var UserGrid = {}; 
$(function () {
	// 获取dataGrid数据
	getDataFieldGrid();
	// 按钮点击事件绑定
	// 添加
	$("#role-add").on("click",function (){
		//editPerMissionById();
		addRole();
		//window.location.href = "user-add";
	});
	// 批量禁用用户
	$("#role-deletes").on("click",function (){
		// 获取选中行
		var selecteds = UserGrid.getSelecteds();
		if(selecteds != null && selecteds.length > 0){
			var selectIds = [];
			for(var i=0;i<selecteds.length;i++){
				selectIds.push(selecteds[i].id);
			}
			pop("确定删除？",3,deleteUsersByIdsOK,selectIds);
		}else{
			pop("请选择要删除的数据",0);
		}
	});
});
//新增角色
function addRole() {
	layer.prompt({title: '请输入要新增的角色名称', formType: 4}, function(pass, index){
		  layer.close(index);
		  var jdname = pass;
		 if(jdname.length == 0){
			layer.msg('名称不能为空');
			return;
		 }
			var str = "&name="+jdname;
			var url = "/role/addRole.do";
			 $.ajax({
				 url:url,
				 async : false,
				 type : 'post',
				 data : str,
				 error:function(oData){
				 	layer.msg('请求失败');
				 },
				 success:function(oData){
				 	if(oData.data == 1){
				 		layer.msg('新增成功', {icon: 1});
				 	}else{
				 		layer.msg('新增失败');
				 	}
				 	getDataFieldGrid();
				 }
				});
				 	
		});
}
function getDataFieldGrid(){
	var url = "/role/list.do";
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
	var url = "/role/deleteRolesById.do?roleIds="+userIds;
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
				display: '角色名称',
				name: 'name',
				width: 400
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
					var html = "<img src='images/update.png' onclick='editPerMissionById("+row.id+")' title='配置权限'  style='cursor:pointer'/>";
					    html += "<img src='images/delete.png' onclick='javascript:deleteUserById("+row.id+")' title='删除'  style='cursor:pointer'/>";
					return html;
				}
			}]
		});
}
//禁用按钮
function deleteUserById(userId){
	pop("确定删除？",3,deleteUserByIdOK,userId);
}
//删除角色 确定 点击事件
function deleteUserByIdOK(userId){
	var url = "/role/deleteRoleById.do?id="+userId;
	$.axse(url,null,
		function(oData){
			if(oData.data == 1){
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
function editPerMissionById(roleId){
	$("#per").val(roleId);
	//iframe窗
    layer.open({
    	type: 2,
        title: '二手书籍交易管理中心-角色权限配置',
        shadeClose: true,
        shade: [0.8, '#393D49'],
        maxmin: true, //开启最大化最小化按钮
        area: ['350px', '450px'],
        content: 'permission' //iframe的url，no代表不显示滚动条
    });
}

/*function openpage() {
    layer.config({
        extend: 'extend/layer.ext.js'
    });
    //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
    layer.ready(function() {
        //官网欢迎页
        layer.open({
            type: 2,
            skin: 'layui-layer-lan',
            title: 'layer弹层组件',
            fix: false,
            shadeClose: true,
            maxmin: true,
            area: ['1000px', '500px'],
            content: 'https://www.baidu.com'
        });
        layer.msg('欢迎使用layer');
    });
}*/

	