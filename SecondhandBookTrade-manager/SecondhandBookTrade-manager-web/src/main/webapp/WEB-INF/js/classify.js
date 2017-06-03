var tree = "";  
var setting = {  
    check : {  
        chkboxType:{"Y":"ps","N":"ps"},//勾选checkbox对于父子节点的关联关系  
        chkStyle:"checkbox",  
        enable : true   //是否复选框  
    },  
    //数据  
    data : {  
        simpleData : {  
            enable : true  
        }  
    }  
};  
//查询菜单信息  
function queryMenus(roleId){  
    $.post('${ctx}/role/treedata.jhtml', {'roleId':roleId}, function(zNodes) {  
        for (var i = 0; i < zNodes.length; i++) {  
            if (zNodes[i].isParent) {  
  
            } else {  
                //zNodes[i].icon = "${ctxStatic}/images/532.ico";//设置图标  
            }  
        }  
        tree = $.fn.zTree.init($("#tree"), setting, zNodes);  
        tree.expandAll(true);//全部展开  
        //var nodes = treeObj.getNodes();  
    }, 'json');  
}  
//获取选中节点  
function onCheck(){  
     var rid = $("#id").val();  
     var treeObj=$.fn.zTree.getZTreeObj("tree");  
     var nodes=treeObj.getCheckedNodes(true);  
     var ids = new Array();  
     for(var i=0;i<nodes.length;i++){  
        //获取选中节点的值  
         ids.push(nodes[i].id);  
        // v+=nodes[i].id + ",";  
        //alert(nodes[i].id);   
     }  
    ajaxSubmit(rid,ids);       
}  