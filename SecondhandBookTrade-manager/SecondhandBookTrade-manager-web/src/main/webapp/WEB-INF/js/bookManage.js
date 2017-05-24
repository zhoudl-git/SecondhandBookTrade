// 全局grid对象
var bookGrid = {}; 
$(function () {
	// 书籍列表grid对象
	
	// 书籍列表grid数据对象
	//var jsonObjDataFile = {};
	// 获取dataGrid数据
	getDataFieldGrid();
	// 按钮点击事件绑定
	// 添加
	$("#book-add").on("click",function (){
		window.location.href = "book-add";
	});
	// 批量下架
	$("#book-deletes").on("click",function (){
		// 获取选中行
		var selecteds = bookGrid.getSelecteds();
		if(selecteds != null && selecteds.length > 0){
			var selectIds = [];
			for(var i=0;i<selecteds.length;i++){
				selectIds.push(selecteds[i].id);
			}
			pop("确定下架？",3,deleteBooksByIdsOK,selectIds);
		}else{
			pop("请选择要下架的数据",0);
		}
	});
});
function getDataFieldGrid(){
	var url = "/item/list.do";
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

//批量下架
function deleteBooksByIdsOK(bookIds){
	var url = "/item/deleteBooksById.do?bookIds="+bookIds;
	$.axse(url,null,
		function(oData){
			if(oData.data != 0){
				pop("下架成功！" ,1);
			}else if(oData.data == 0){
				pop("下架失败！" ,0);
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
			}, *//*{
				display: 'cid',
				name: 'cid',
				width: 100
			}, */{
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
					if(row.status != null) {
						if(row.status == 1){
							return "<span style='color:blue'>在架</span>";
						}else if(row.status == 0){
							return "<span style='color:red'>下架</span>";
						}else if(row.status == 2){
							return "<span style='color:#e4393c'>热搜</span>";
						}else{
							return "";
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
				display: '上传人',
				name: 'userName',
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
					html += "<img src='images/ct_icon.png' onclick='javascript:addHotSearch("+row.id+")' title='上热搜'  style='cursor:pointer'/>";   
					html += "<img src='images/delete.png' onclick='javascript:deleteBookById("+row.id+")' title='下架'  style='cursor:pointer'/>";
					return html;
				}
			}]
		});
}
function addHotSearch(bookId){
	pop("确定上热搜？",3,addHotSearchOK,bookId);
}
function addHotSearchOK(bookId){
	var url = "/item/addHotSearchOK.do";
	var data = {"bookId":bookId};
	$.axse(url,data,
			function(oData){
				if(oData.data == 1){
					pop("上热搜成功！" ,1);
					getDataFieldGrid();
					//window.location.reload();
				}else if(oData.data == 0){
					pop("上热搜失败！" ,0);
				}else{
					pop("上热搜失败，服务器错误",0);
				}
			},function(msg){
				pop("请求失败 + " + msg,0);
			}
		);
}
//下架按钮
function deleteBookById(bookId){
	pop("确定下架？",3,deleteBookByIdOK,bookId);
}
//下架书籍 确定 点击事件
function deleteBookByIdOK(bookId){
	var url = "/item/deleteBookById.do?bookId="+bookId;
	$.axse(url,null,
		function(oData){
			if(oData.data == 1){
				pop("下架成功！" ,1);
				getDataFieldGrid();
				//window.location.reload();
			}else if(oData.data == 0){
				pop("下架失败！" ,0);
			}else{
				pop("下架失败，服务器错误",0);
			}
		},function(msg){
			pop("请求失败 + " + msg,0);
		}
	);
}
//编辑按钮
function editBookById(bookId){
	pop("确定激活该书籍？",3,updateBookByIdOK,bookId);
}
//激活书籍 确定 点击事件
function updateBookByIdOK(bookId){
	var url = "/item/updateBookById.do?bookId="+bookId;
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

	