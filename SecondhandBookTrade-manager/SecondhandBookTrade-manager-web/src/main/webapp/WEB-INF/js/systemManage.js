//定义树状
var setting = {
	view : {
		showIcon : true
	},
	check : {
		enable : false
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
}
var treeNodes;
var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
// 初始化树点击事件
function zTreeClick(event, treeId, treeNode){
	 var nodes = $.fn.zTree.getZTreeObj("treeDemo1").getSelectedNodes();
	 alert(nodes[0].id);
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
function clickjdname(){
	$("#jdnameerror",parent.document).hide();
}

function clickjdms(){
	$("#jdmserror",parent.document).hide();
}

function clickjdname_u(){
	$("#jdnameerror_u",parent.document).hide();
}

function clickjdms_u(){
	$("#jdmserror_u",parent.document).hide();
}
// 左右移
function lrShift(obj){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo1");

	var nodes = treeObj.getSelectedNodes();
	var str = "";
	$("#md", parent.document).empty();
	if (nodes.length == 0) {
		layer.msg('请先选择一个节点');
	}else{
		//判断是左还是右移
		if (obj === "l") {
			var strs = nodes[0].getParentNode();
			if (strs == null) {
				layer.msg("已经是根节点");
				return;
			}
			var fhz = treeObj.moveNode(strs, nodes[0], "prev");
		}else {
			var strs = nodes[0].getNextNode();
			if (strs == null) {
				layer.msg("已经是最下面的节点");
				return;
			}
			
			var fhz = treeObj.moveNode(strs, nodes[0], "inner");
		}
	}
}
// 上下移
function tdShift(obj){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo1");
	var nodes = treeObj.getSelectedNodes();
	var str = "";
	$("#md", parent.document).empty();
	if (nodes.length == 0) {
		layer.msg('请先选择一个节点');
	}else{
		//判断是上移还是下移
		if (obj === "s") {
			var strs = nodes[0].getPreNode();
			if (strs == null) {
				layer.msg("已经是最前面的节点");
				return;
			}
			var fhz = treeObj.moveNode(strs, nodes[0], "prev");
		}else {
			var strs = nodes[0].getNextNode();
			if (strs == null) {
				layer.msg("已经是最下面的节点");
				return;
			}
			var fhz = treeObj.moveNode(strs, nodes[0], "next");
		}
	}
}
//增加新节点
function addjd() {
	var nodes = $.fn.zTree.getZTreeObj("treeDemo1").getSelectedNodes();
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo1");
	var nodes1 = treeObj.getNodes();
	var str = "";
	var allNodes = treeObj.transformToArray(nodes1);
	if (nodes.length == 0) {
		layer.msg('请先选择一个节点');
	} else {
		layer.prompt({title: '请输入要新增的目录名称', formType: 4}, function(pass, index){
		  layer.close(index);
		  var jdname = Trim(pass);
		  var id = nodes[0].id;
		  var level = nodes[0].level;
		  if(jdname.length == 0){
				layer.msg('请输入所要创建的目录名称');
				return;
		  }
		  for(var i=0;i<allNodes.length;i++){
			  if(allNodes[i].name == jdname){
				  layer.msg('创建的目录名称不能重复，请重新输入！'); 
				  return;
			  }
		  }
		  layer.prompt({title: '请输入菜单访问路径', formType: 4}, function(text, index){
			    layer.close(index);
			    var str = "level="+level+"&parent="+id+"&name="+jdname+"&isenabled=1&url="+Trim(text);
				 var url = "/function/saveTreeNode.do";
			    $.ajax({
					 url:url,
					 async : false,
					 type : 'post',
					 //contentType : 'application/json',
					 data : str,
					 error:function(oData){
						 layer.msg("请求失败");
					 },
					 success:function(oData){
					 	showEstimateZtree();
					 	if(oData.data == 1){
					 		layer.msg('新增成功', {icon: 1});
					 		// 刷新父窗口 菜单栏
					 		parent.location.reload();
					 	}else{
					 		layer.msg("新增失败！");
					 	}
					 }
					});
		  });
		});
	}
}
//更新节点
function editjd() {
	var nodes = $.fn.zTree.getZTreeObj("treeDemo1").getSelectedNodes();
	if (nodes.length == 0) {
		layer.msg('请先选择一个节点');
		return;
	}
	layer.prompt({title: '请输入修改后的节点名称', formType: 4}, function(pass, index){
		  layer.close(index);
		  var jdname = pass;
		  var id = nodes[0].id;
		  var level = nodes[0].level;
		  var pId = nodes[0].pId;
		  if(pId == null){
				pId = 0;
		 }
		 if(jdname.length == 0){
			layer.msg('名称不能为空');
			return;
		 }
			var str = "level="+level+"&parentId="+pId+"&name="+jdname+"&isenabled=1"+"&id="+id;
			var url = "/function/updateMenu.do";
			 $.ajax({
				 url:url,
				 async : false,
				 type : 'post',
				 data : str,
				 error:function(oData){
				 	layer.msg('请求失败');
				 },
				 success:function(oData){
				 	showEstimateZtree();
				 	if(oData.data == 1){
				 		layer.msg('修改成功', {icon: 1});
				 		// 刷新父窗口 菜单栏
				 		parent.location.reload();
				 	}else{
				 		layer.msg('修改失败');
				 	}
				 }
				});
				 	
		});
}
//删除节点
function deletejd(){
	var nodes = $.fn.zTree.getZTreeObj("treeDemo1").getSelectedNodes();
	var str = "";
	if (nodes.length == 0 ) {
		layer.msg('请先选择一个节点');
		return;
	}
	layer.confirm('确定删除？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			var id = nodes[0].id;
			var url = "/function/deleteTreeNode.do?id=" + id;
			$.get(url,function(oData){// 0删除失败  1删除成功 -1需要先删除该节点下的责任人
				var data = oData.data;
				if(data == 1){
					layer.msg('删除成功', {icon: 1});
				}else{
					layer.msg('删除失败');
				}
				showEstimateZtree();
			});
		});
}
// 去除前后空格
function Trim(str){
	return str.replace(/\s/g, "");
}
$(function() {
	//初始化树状数据
	showEstimateZtree();
	var jdname = $("#jdname",parent.document);
	var jdms = $("#jdms",parent.document);
});