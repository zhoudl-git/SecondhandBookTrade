$(function(){ 
	// 初始化树状
	InitTreeData();
});
 function InitTreeData(){
	  $('#tree').tree({
	  url:'/item/cat/list.do',
	  checkbox:true,
	  onClick:function(node){
	    alert(node.text);
	  },
	  onContextMenu: function(e, node){  
            e.preventDefault();  
            $('#tree').tree('select', node.target);  
            $('#mm').menu('show', {  
                    left: e.pageX,  
                    top: e.pageY  
                });  
            }  
	    });
 }
 function  remove(){
     var nodes = $('#tree').tree('getSelected');/*getChecked*/
     var ids = '';
     var tempIds = [];
     if(nodes/*!= null && nodes.length > 0*/){
    	 // 从页面中删除树节点
	     /*for(var i=0; i<nodes.length; i++){
	    	 tempIds.push(nodes[i].id);
	        if (ids != '') ids += ',';
	        ids += nodes[i].id;
	         	$('#tree').tree('remove',nodes[i].target);
	     }*/
	     // 从数据库中删除树节点
	     var url = "/item/cat/deleteById.do?tempIds="+nodes.id/*tempIds*/;
	 	$.axse(url,null,
	 		function(oData){
	 			if(oData.data != 0){
	 				pop(oData.msg ,1);
	 			}else if(oData.data == 0){
	 				pop(oData.msg ,0);
	 			}
	 		},function(msg){
	 			pop("请求失败 + " + msg,0);
	 		}
	 	);
     }else{
    	 pop("请选中至少一个节点",0); 
     }
 }
 function update(){
    var node = $('#tree').tree('getSelected');
    if (node){
    	//prompt层
    	layer.prompt({title: '请输入修改后的类目名称', formType: 0}, function(pass, index){
    	  layer.close(index);
    	  //alert(pass);
    	  //node.text = pass;  //-->txt-->DB
          //node.iconCls = 'icon-save'; //-->sel-->DB
          //$('#tree').tree('update', node);
       // 从数据库中更新树节点
 	     var url = "/item/cat/updateById.do";
 	     var data = {"name":pass,"id":node.id};
 	 	 $.axse(url,data,
 	 		function(oData){
 	 			if(oData.data != 0){
 	 				pop(oData.msg ,1);
 	 			}else if(oData.data == 0){
 	 				pop(oData.msg ,0);
 	 			}
 	 			InitTreeData();
 	 		},function(msg){
 	 			pop("请求失败 + " + msg,0);
 	 		}
 	 	);
    	});
    }else{
    	pop("请选中一个节点",0);
    }
   
 }
 function  append(){
    var node = $('#tree').tree('getSelected');
    if (node){
    	//prompt层
    	layer.prompt({title: '请输入要增加的类目名称', formType: 0}, function(pass, index){
    	  layer.close(index);
    	  /*$('#tree').tree('append',{
    	        parent: (node?node.target:null),
    	        data:
    	        [
    	         	{
    		            text:'new1',//  -->txt-->DB
    		            id:'1',
    	                checked:true
    	            } 
    	        ]
    	     });*/
       // 从数据库中更新树节点
 	     var url = "/item/cat/addTreeNode.do";
 	     // isParent sortOrder status
 	     var data = {"name":pass,"parentId":node.id};
 	 	 $.axse(url,data,
 	 		function(oData){
 	 			if(oData.data != 0){
 	 				pop(oData.msg ,1);
 	 			}else if(oData.data == 0){
 	 				pop(oData.msg ,0);
 	 			}
 	 			InitTreeData();
 	 		},function(msg){
 	 			pop("请求失败 + " + msg,0);
 	 		}
 	 	);
    	});
    }else{
    	pop("请选中一个节点",0);
    }
    
 }
