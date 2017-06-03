var html_top = "'<div class='leftnav'>"+
  "<div class='leftnav-title'>";
var html_base = "<h2><span class='icon-cog'></span>基本设置</h2>";
var html_base_next = "<ul style='display:block'>" +
		"<li><a href='bookManage' target='right'><span class='icon-caret-right'></span>系统设置</a></li>";
var tempHtml = "<strong><span class='icon-list'></span>菜单列表</strong></div>";

$(function(){
	queryMenu();
	$("#logout").on("click",function (){
		logout();
	});
});
function queryMenu(){
	var url = "/function/queryAllMenu.do";
	var html = "";
	$(".leftnav-title").empty();
	$(".leftnav-title").append(tempHtml);
	//$(".leftnav-title").append(html_base + html_base_next);
	$.axse(url,null,
		function(oData){
			var menu = oData.data;
			if(menu != "index"){
				for(var i=0;i<menu.length;i++){
					if(menu[i].parentId == "0"){
						html += "<h2><span class='icon-cog'></span>"+menu[i].name+"</h2>";
					}else{
						html += "<ul style='display:block'><li><a href="+menu[i].url+" target='right'><span class='icon-caret-right'></span>"+menu[i].name+"</a></li>";
					}
				}
				$(".leftnav-title").append(html);
				  $(".leftnav h2").click(function(){
					  $(this).next().slideToggle(200);	
					  $(this).toggleClass("on"); 
				  })
				  $(".leftnav ul li a").click(function(){
					    $("#a_leader_txt").text($(this).text());
				  		$(".leftnav ul li a").removeClass("on");
						$(this).addClass("on");
				  })
			}else{
				window.location.href = "/";
			}
		},function(msg){
			pop("请求失败 +" + msg,0);
		}
	);
	
}
function logout(){
	window.location.href = "/";
}
