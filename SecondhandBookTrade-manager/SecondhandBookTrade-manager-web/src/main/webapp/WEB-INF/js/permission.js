//定义树状
var setting = {
	view : {
		showIcon : true
	},
	check : {
		enable : true
	},
	edit: {
		drag: {
			isCopy: true,
			isMove: true
		}
	},
	data : {
		simpleData : {
			enable : true,
			idKey: "id",
			pIdKey: "parentId",
			rootPId: 0
		}
	},
	callback : {
		onClick : zTreeClick
	}
};
//初始化树状
function showEstimateZtree() {
	var url = "/function/queryAllMenu2.do";
	$.ajax({
		async : false,
		type : 'post',
		url : url,// 请求action地址
		dataType:"json",
		error : function(data) {// 返回错误
			layer.msg('请求失败');
		},
		success : function(oData) { // 成功
			// json串转换为json对象
			//treeNodes = eval(data);
			treeNodes = eval(oData.data);
		}
	});
	$.fn.zTree.init($("#treeDemo1"), setting, treeNodes);
	// 初始化已经授权的节点
	/*var treeObj = $.fn.zTree.getZTreeObj("treeDemo1");
	var nodes = treeObj.getNodes();
	for (var i=0, l=nodes.length; i < l; i++) {
		treeObj.checkNode(nodes[i], true, true);
	}*/
}
var treeNodes;
var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
// 初始化树点击事件
function zTreeClick(event, treeId, treeNode){
	 var nodes = $.fn.zTree.getZTreeObj("treeDemo1").getSelectedNodes();
	 //alert(nodes[0].id);
}
function nocheckNode(e) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo1"), nocheck = e.data.nocheck, nodes = zTree
			.getSelectedNodes();
	if (nodes.length == 0) {
		layer.msg("请选择");
	}

	for ( var i = 0, l = nodes.length; i < l; i++) {
		nodes[i].nocheck = nocheck;
		zTree.updateNode(nodes[i]);
	}
}
function setPermission(roleId){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo1");
	// 获取选中节点
	var nodes=treeObj.getCheckedNodes(true);
	if(nodes != null && nodes.length == 0){
		layer.msg("请选择要授权的目录");
		return;
	}
	var roleFunIds = [];
	for(var i=0;i<nodes.length;i++){
		roleFunIds.push(nodes[i].id);
	}
	var roleId = parent.$("#per").val();
	var url = "/permission/setPermission.do?roleFunIds="+roleFunIds;
	$.ajax({
		async : false,
		type : 'post',
		url : url,// 请求action地址
		dataType:"json",
		data:{"roleId":roleId},
		error : function(data) {// 返回错误
			layer.msg('请求失败');
		},
		success : function(oData) { // 成功
			if(oData.data == 1){
				layer.msg('授权成功',{icon: 1});
			}else{
				layer.msg('授权失败');
			}
		}
	});
}
function getPermission(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo1");
	// 获取选中节点
	var nodes=treeObj.getCheckedNodes(true);
	if(nodes != null && nodes.length == 0){
		layer.msg("请选择要取消授权的目录");
		return;
	}
	var roleFunIds = [];
	for(var i=0;i<nodes.length;i++){
		roleFunIds.push(nodes[i].id);
	}
	var roleId = parent.$("#per").val();
	var url = "/permission/getPermission.do?roleFunIds="+roleFunIds;
	$.ajax({
		async : false,
		type : 'post',
		url : url,// 请求action地址
		dataType:"json",
		data:{"roleId":roleId},
		error : function(data) {// 返回错误
			layer.msg('请求失败');
		},
		success : function(oData) { // 成功
			if(oData.data == 1){
				layer.msg('取消授权成功',{icon: 1});
			}else{
				layer.msg('取消授权失败',1);
			}
		}
	});
}
$(function() {
	//初始化树状数据
	showEstimateZtree();
	// 初始化页面点击事件
	$("#role-add-function").on("click",function (){
		setPermission();
	});
	$("#role-deletes-function").on("click",function (){
		getPermission();
	});
});