function exeData(num, type,catId,idSearch) {
    //loadData(num);
	if(idSearch == undefined){
		if(catId == null){
			catId = $("#yccatid").val();
			if(catId == null || catId.length <= 0){
				catId = 60;
			}
		}
	}else if(idSearch == "research"){
		catId = null;
	}
	var search = $("#txtSearch").val();
	var url = "/item/getAllItemBtCatIdCount.do";
	var data = {"catId":catId,"pageNum":num,"search":search};
	$.axse(url,data,
		function(oData){
			var data = oData.data;
			if(data != null){
				$("#PageCount").val(data);
			}
		},function(msg){
			pop("请求失败 +" + msg,0);
		}
	);
	var url = "/item/selectBookByCatId.do";
	$.axse(url,data,
		function(oData){
			var data = oData.data;
			var html = "";
			if(data != null && data.length>0){
				$("#content").empty();
				for(var i=0;i<data.length;i++){
					var srcs = data[i].image.split(",");
					html += "<dl>";
		            html += "<dt><img src='"+srcs[0]+"'></dt>";
		            html += "<dd><a href='javascript:void(0)' onclick=\"queryDetail('"+data[i].id+"')\">"+data[i].title+"</a></dd>";
		            html += "<dd><b>"+data[i].sellPoint+"</b></dd>";
		            html += "</dl>";
				}
				$("#content").append(html);
			}
		},function(msg){
			pop("请求失败 +" + msg,0);
		}
	);
    loadpage();
}
function loadpage() {
    var myPageCount = parseInt($("#PageCount").val());
    var myPageSize = parseInt($("#PageSize").val());
    var countindex = myPageCount % myPageSize > 0 ? (myPageCount / myPageSize) + 1 : (myPageCount / myPageSize);
    $("#countindex").val(countindex);

    $.jqPaginator('#pagination', {
        totalPages: parseInt($("#countindex").val()),
        visiblePages: parseInt($("#visiblePages").val()),
        currentPage: 1,
        first: '<li class="first"><a href="javascript:;">首页</a></li>',
        prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
        next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
        last: '<li class="last"><a href="javascript:;">末页</a></li>',
        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
        onPageChange: function (num, type) {
            if (type == "change") {
                exeData(num, type);
            }
        }
    });
}

$(function () {
   // loadData(1);
	//exeData(1,null);
    loadpage();
});