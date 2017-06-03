var elevator={
	FHEIGHT:0,//保存楼层的高度
	UPLEVAL:0,//保存亮灯区域上下边界距文档显示区的顶部距离
	DOWNLEVAL:0,
	DURATION:1000,
	init:function(){
		this.FHEIGHT=parseFloat($("#f1").css("height"))+parseFloat($("#f1").css("marginBottom"));
		this.UPLEVAL=(innerHeight-this.FHEIGHT)/2
		this.DOWNLEVAL=this.UPLEVAL+this.FHEIGHT;
		//为document绑定scroll事件为scroll方法
		$(document).scroll(this.scroll.bind(this));
		//为#elevator下的ul添加mouseover事件代理，只有li才能响应事件
		$("#elevator>ul").on("mouseover","li",function(e){
			//获得目标元素$target
			var $target=$(e.target);
			//如果target是a
			if(e.target.nodeName=="A"){
				//就换成其父元素li
				$target=$target.parent();
			}
			//$target中显示第2个a,隐藏第1个a
			$target.children(":first").hide();
			$target.children(":last").show();
		});
		//为#elevator下的ul添加mouseout事件代理，只有li响应事件
		$("#elevator>ul").on("mouseout","li",function(e){
			//获得目标元素$target
			var $target=$(e.target);
			//如果target是a
			if(e.target.nodeName=="A"){
				//就换成其父元素li
				$target=$target.parent();
			}
			//获得$target在ul下的下标
			var i=$target.index("#elevator>ul>li");
			//查找.floor下的header下的span取第i个
			var $span=$(".floor>header>span:eq("+i+")");
			//如果span的class不是hover
			if(!$span.hasClass("hover")){
			//$target中显示第1个a,隐藏第2个a
			$target.children(":first").show();
			$target.children(":last").hide();
			}
		});
		//为#elevator下的ul添加click事件代理，只有li下的class为etitle的a才能响应事件
		$("#elevator>ul").on("click","li>a.etitle",function(e){
			//停止body上的动画，清空队列
			$("body").stop(true);
			//获取目标元素的父元素$li
			var $li=$(e.target).parent();
			//获得$li在所有li中的下标li
			var i=$li.index("#elevator>ul>li");
			//查找.floor下的header下的span中的第i个$span
			var $span=$(".floor>header>span:eq("+i+")");
			//启动动画，让body在DURATION时间内，滚动到$span据页面顶部的总距离-UPLEVAL
			$("body").animate({scrollTop:$span.offset().top-this.UPLEVAL},this.DURATION);

		}.bind(this));
	},
	scroll:function(){//响应document的scroll事件
		//查找floor下的header下的span，对每个元素执行：
		$(".floor>header>span").each(function(i,elem){
			//function(i){i:下标 ， elem:当前DOM元素}
			//获取当前元素距页面顶部的总距离totalTop
			var totalTop=$(elem).offset().top;
			//获取页面滚动多的距离scrollTop
			var scrollTop=$("body").scrollTop();
			//用totalTop-scrollTop,保存在innerTop
			var innerTop=totalTop-scrollTop;
			//如果innerTop>UPLEVAL且<=DOWNLEVAL
			if(innerTop>this.UPLEVAL&&innerTop<=this.DOWNLEVAL){
				//设置当前元素的class为hover
				$(elem).addClass("hover");
				//对应的li中显示第2个a,隐藏第1个a
				$("#elevator>ul>li:eq("+i+")>a:first").hide();
				$("#elevator>ul>li:eq("+i+")>a:last").show();
			//否则
			}else{
				//移除当前元素的hover类
				$(elem).removeClass("hover");
				//对应的li中显示第1个a,隐藏第2个a
				$("#elevator>ul>li:eq("+i+")>a:first").show();
				$("#elevator>ul>li:eq("+i+")>a:last").hide();
			}
		}.bind(this));
		//查找.floor下的header下的span中的class为hover的，如果找到，就设置#elevator下的ul显示，否则就隐藏
		$(".floor>header>span.hover").length>0?$("#elevator").show():$("#elevator").hide();
	},
	liState:function(){//根据span的亮灭检查li

	}

}
elevator.init();