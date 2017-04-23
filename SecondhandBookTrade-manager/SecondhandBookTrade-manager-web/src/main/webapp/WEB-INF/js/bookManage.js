$(function () {
	// 书籍列表grid对象
	var bookGrid = {};
	// 书籍列表grid数据对象
	//var jsonObjDataFile = {};
	// 获取dataGrid数据
	getDataFieldGrid();
});
function getDataFieldGrid(){
	var url = "/item/list.do";
	$.axse(url,null,
		function(oData){
			setDataFieldGrid(ligerUIDataGrid(oData));
		},function(msg){
			pop("请求失败 +" + msg,0);
		}
	);
}



// 按钮点击事件绑定
// 添加
$("#book-add").on("click",function (){
	window.location.href = "book-add";
});
// 批量删除
$("#book-deletes").on("click",function (){
	// 获取选中行
	var selecteds = bookGrid.getSelecteds();
	if(selecteds != null){
		var selectIds = [];
		for(var i=0;i<selecteds.length;i++){
			selectIds.push(selecteds[i].id);
		}
		pop("确定删除？",3,deleteBooksByIdsOK,selectIds);
	}else{
		pop("请选择要删除的数据",0);
	}
});
//批量删除
function deleteBooksByIdsOK(bookIds){
	var url = "/item/deleteBooksById.do?bookIds="+bookIds;
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
//利用LigerUI Grid创建书籍列表
function setDataFieldGrid(jsonObjDataFile){
	bookGrid = $("#dataFieldGrid").ligerGrid({
			checkbox: true,
			rownumbers: true,
			pageSizeOptions: [10, 20, 30, 40, 50],
			usePager: true,
			pageSize: 15,
			data: jsonObjDataFile,
			hideLoadButton: true,
			width: '95%',
			columns: [/*{
				display: '书籍条形码',
				name: 'barcode',
				width: 100
			}, */{
				display: 'cid',
				name: 'cid',
				width: 100
			}, {
				display: '图片',
				name: 'image',
				width: 100
			}, {
				display: '数量',
				name: 'num',
				width: 100,
			},{
				display: '价格',
				name: 'price',
				width: 100,
				render: function(row) {
					return fen2yuan(row.price);
				}
			}, {
				display: '状态',
				name: 'status',
				width: 60,
				render: function(row) {
					if(row.status != null && row.status != '') {
						if(row.status == 1){
							return "在架";
						}else if(row.status == 2){
							return "下架";
						}else{
							return "删除";
						}
					} else {
						return '';
					}
				}
			}, {
				display: '名称',
				name: 'title',
				minWidth: 100
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
					var html = "<img src='images/update.png' onclick='editBookById("+row.id+")' title='编辑'  style='cursor:pointer'/>";
					    html += "<img src='images/delete.png' onclick='javascript:deleteBookById("+row.id+")' title='删除'  style='cursor:pointer'/>";
					return html;
				}
			}]
		});
}
//删除按钮
function deleteBookById(bookId){
	pop("确定删除？",3,deleteBookByIdOK,bookId);
}
//删除书籍 确定 点击事件
function deleteBookByIdOK(bookId){
	var url = "/item/deleteBookById.do?bookId="+bookId;
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
function editBookById(bookId){
	pop("功能尚在开发中，敬请期待！",1);
}

	