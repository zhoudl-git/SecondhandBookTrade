/*广告图片数组*/
function getAllImage(){
	var url = "/image/getAllImageUseIndex.do";
	$.ajax({
	    url:url,
	    type:'POST', //GET
	    async:true,    //或false,是否异步
	    dataType: "json",
	    success:function (oData){
	    	var data = oData.data;
	    	if( data!= null && data.length >0){
				imgs.length = 0;
				for(var i=0;i<data.length;i++){
					var x = {"i":i,"img":data[i].url};
					imgs.push(x);
				}
			}else{
				
			}
	    },error:function (){
	    	alert("失败");
	    }
	});
}
var imgs=[
	{"i":0,"img":"images/index/index/banner_01.jpg"},
    {"i":1,"img":"images/index/index/banner_02.jpg"},
    {"i":2,"img":"images/index/index/banner_03.jpg"},
    {"i":3,"img":"images/index/index/banner_04.jpg"},
    {"i":4,"img":"images/index/index/banner_05.jpg"},
];
try{
	getAllImage();
}catch(e){}

var slider={
	LIWIDTH:0,//保存每个li的宽度其实就是#slider的初始宽
	DURATION:1000,//动画的总时间
	WAIT:3000,//自动轮播之间的等待时间
	timer:null,
	canAuto:true,//保存是否可以自动轮播
	init:function(){
		this.LIWIDTH=parseFloat($("#slider").css("width"));
		this.updateView();
		//为id为indexs的ul添加鼠标进入事件代理，只有不是hover的li才能响应
		$("#indexs").on("mouseover","li:not(.hover)",function(e){
			//获得目标元素target
			var $target=$(e.target);
			//调用move方法，传入要移动的个数：
			//目标元素的内容-目标元素的兄弟中的class为hover的li内容
			this.move($target.html()-$target.siblings(".hover").html());
			}.bind(this));
			//当鼠标进入#slider时，将canAuto改为false
			//当鼠标移出#slider时，将canAuto改为false
			$("#slider").hover(
				function(){this.canAuto=false;}.bind(this),
				function(){this.canAuto=true;}.bind(this)	
			);
			//启动自动轮播
			this.autoMove();
	},
	autoMove:function(){//启动自动轮播
		//启动一次性定时器
		this.timer=setTimeout(function(){
			if(this.canAuto){
				this.move(1)
			}else{
				this.autoMove();
			}
		}.bind(this),
		this.WAIT
		);
	},
	move:function(n){
		//停止一次性定时器
		clearTimeout(this.timer);
		this.timer=null;
		//停止动画，防止叠加
		$("imgs").stop(true);
		//获得#imgs当前的left转为浮点数
		var left=parseFloat($("#imgs").css("left"));
		//如果n<0
		if(n<0){
			//将n转为正数
			n*=-1;
			//先修改数组
			imgs=imgs.splice(imgs.length-n,n).concat(imgs);
			//更新界面
			this.updateView();
			//修改#imgs的left为left-n*LIWIDTH
			$("#imgs").css("left",left-n*this.LIWIDTH);
			//启动动画，在DURATION时间内，left移动到0
			$("#imgs").animate({left:0},this.DURATION);
			//启动自动轮播
			this.autoMove();
		//否则
		}else{//左移，先移动，再改数组
			//让id为imgs的ul在DURATION时间内，left变为-n*LIWIDTH
			$("#imgs").animate(
				{left:-n*this.LIWIDTH+"px"},
				this.DURATION,
				//在动画结束后调用endMove，替换this，传入参数n
				this.endMove.bind(this,n)
			);
		}
	},
	endMove:function(n){
		//删除imgs数组开头的n个元素,再拼到结尾
		imgs=imgs.concat(imgs.splice(0,n));
		//更新页面
		this.updateView();
		//设置#imgs的left为0
		$("#imgs").css("left",0);
		//启动自动轮播
		this.autoMove();
	},
	updateView:function(){//将数组中的元素更新到页面
		//遍历imgs数组中每个图片对象,同时声明空字符串html
		for(var i=0,html="",idxs="";i<imgs.length;i++){
			html+="<li><img src='"+imgs[i].img+"'></li>";
			idxs+="<li>"+(i+1)+"</li>";
		}
		//设置id为imgs的内容为html
		$("#imgs").html(html)
				  .css("width",this.LIWIDTH*imgs.length+"px");
		//设置id为indexs的内容为idxs
		$("#indexs").html(idxs);
		//获得#indexs下的和imgs中的第一个元素的i属性对应的li,设置其class属性为hover，选择兄弟中的class为hover的li ,移除其属性
		$("#indexs>li:eq("+imgs[0].i+")").addClass("hover")
										.siblings(".hover")
										.removeClass("hover");
	},
	
}
slider.init();