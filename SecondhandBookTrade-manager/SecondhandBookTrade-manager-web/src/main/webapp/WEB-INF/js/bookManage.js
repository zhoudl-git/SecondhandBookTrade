$(function () {
	// 书籍列表grid对象
	var bookGrid = {};
	// 书籍列表grid数据对象
	//var jsonObjDataFile = {};
	var url = "/item/list.do";
	// 获取dataGrid数据
	getDataFieldGrid();
	
	function getDataFieldGrid(){
		$.axse(url,null,
			function(data){
				setDataFieldGrid(ligerUIDataGrid(data));
			},function(){
				pop("调用失败",0);
			}
		);
	}
	
	// 利用LigerUI Grid创建书籍列表
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
						var html = "<img src='images/update.png' onclick='javascript:editBookById("+row.id+")' title='编辑'  style='cursor:pointer'/>";
						    html += "<img src='images/delete.png' onclick='javascript:deleteBookById("+row.id+")' title='删除'  style='cursor:pointer'/>";
						return html;
					}
				}]
			});
	}
	
	// 按钮点击事件绑定
	// 添加
	$("#book-add").on("click",function (){
		window.location.href = "book-add";
	});
	// 批量删除
	$("#book-deletes").on("click",function (){
		var selected = bookGrid.getSelected();
		if(selected != null){
			
		}else{
			pop("请选择要删除的数据",0);
		}
	});
	
});
	//删除按钮
	function deleteBookById(bookId){
		pop("确定删除？",3,deleteBookByIdOK);
	}
	function deleteBookByIdOK(){
	}
	// 编辑按钮
	function editBookById(bookId){
		pop("功能尚在开发中，敬请期待！",1);
	}