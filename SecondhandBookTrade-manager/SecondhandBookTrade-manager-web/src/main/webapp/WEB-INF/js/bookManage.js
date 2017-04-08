$(function () {
	// 书籍列表grid对象
	var dataFieldGrid = {};
	// 书籍列表grid数据对象
	//var jsonObjDataFile = {};
	var url = "/item/list.do";
	// 获取dataGrid数据
	getDataFieldGrid();
	function getDataFieldGrid(){
		/*$.ax(url,null,null,null,null, 
				function(data){
					var jsonObjDataFile = {};
					jsonObjDataFile.Rows = data.rows;
					jsonObjDataFile.total = data.total;
					setDataFieldGrid(jsonObjDataFile);
				}, function(){
					alert("出错了");
				}
		);*/
		/*$.axs(url,null,function(data){
			var jsonObjDataFile = {};
			jsonObjDataFile.Rows = data.rows;
			jsonObjDataFile.total = data.total;
			setDataFieldGrid(jsonObjDataFile);
		});*/
		$.axse(url,null,function(data){
			var jsonObjDataFile = {};
			jsonObjDataFile.Rows = data.rows;
			jsonObjDataFile.total = data.total;
			setDataFieldGrid(jsonObjDataFile);
		},function(){
			pop("调用失败",0);
		});
		
	}
	// 利用LigerUI Grid创建书籍列表
	function setDataFieldGrid(jsonObjDataFile){
		$("#dataFieldGrid").ligerGrid({
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
					minWidth: 100
				}, {
					display: '更新时间',
					name: 'updated',
					minWidth: 100
				}, {
					display: '操作',
					name: 'id',
					width: 100,
					align: 'center',
					render: function(row) {
						var html = "<img src='images/update.png' onclick='javascript:editDataField("+row.id+")' title='编辑'  style='cursor:pointer'/>";
							html += '<a href="javascript:deleteDateFieldsById(' + row.id + ');" class="btn-small  btn-icon" data-click-data="' + row.id + '" data-click="delete"><img src="images/delete.png" title="删除"/></a> ';
						return html;
					}
				}]
			});
	}
	
});