var zoom={
	moved:0,//保存左移li的个数
	WIDTH:62,//保存每个li的宽度
	OFFSET:20,//保存ul的起始left值
	MAX:3,//保存可左移的最多li个数
	MSIZE:175,//保存mask的大小
	MAXLEFT:175,MAXTOP:175,//保存mask可移动的最大坐标
	init:function(){
    //为id为preview下的h1添加单击事件代理，仅a能响应事件，事件处理函数为move
	//$("#preview>h1").on("click","a",this.move.bind(this));
    //为id为icon_list的ul添加鼠标进入事件代理，仅li下的img可响应事件，处理函数为changeImgs
	//$("#icon_list").on("mouseover","li>img",this.changeImgs);
    //为id为superMask的div添加hover事件,切换mask的显示和隐藏,再绑定鼠标移动事件处理函数为moveMask
	$("#superMask").hover(this.toggle,this.toggle)
				   .mousemove(this.moveMask.bind(this));
   },
	moveMask:function(e){
     //获得鼠标相对于父元素的x
	var x=e.offsetX;
    //获得鼠标相对于父元素的y
	var y=e.offsetY;
    //计算mask的left: x-MSIZE/2
	var left=x-this.MSIZE/2;
    //计算mask的top: y-MSIZE/2
	var top=y-this.MSIZE/2;
    //如果left越界，要改回边界值
	 left=left<0?0:
         left>this.MAXLEFT?this.MAXLEFT:
         left;
    //如果top越界，要改回边界值
	 top=top<0?0:
        top>this.MAXTOP?this.MAXTOP:
        top;
    //设置id为mask的元素的left为left,top为top
	$("#mask").css({left:left,top:top});
    //设置id为largeDiv的背景图片位置:
	$("#largeDiv").css("backgroundPosition",-left*16/7+"px "+-top*16/7+"px");
   },
	toggle:function(){//切换mask的显示和隐藏
	   $("#mask").toggle();
	   $("#largeDiv").toggle();
		//如果largeDiv的display为block
		if($("#largeDiv").css("display")=="block"){
		 //获得mImg的src
		var src=$("#mImg").attr("src");
		 var i=src.lastIndexOf(".");
		 var newSrc=src.slice(0,i-2)+"-l"+src.slice(i);
		 $("#largeDiv").css("backgroundImage","url("+newSrc+")");
		}
	},

/*
  move:function(e){//移动一次
    var $target=$(e.target);//获得目标元素$target
    var btnClass=$target.attr("class");
    //如果btnClass中没有disabled
    if(btnClass.indexOf("disabled")==-1){
      //如果btnClass以forward开头
        //将moved+1
      //否则
        //将moved-1
      this.moved+=
        btnClass.indexOf("forward")!=-1?1:-1;
      //设置id为icon_list的ul的left为-moved*WIDTH+OFFSET
      $("#icon_list").css(
        "left",-this.moved*this.WIDTH+this.OFFSET);
      this.checkA();//检查a的状态:
    }
  },
  checkA:function(){//检查两个a的状态
    //查找class属性以backward开头的a，保存在$back
	var $back=$("a[class^='backward']");
    //查找class属性以forward开头的a，保存在$for
	var $for=$("a[class^='forward']");
    //如果moved等于0
	if(this.moved==0){
      //设置$back的class为backward_disabled
	  $back.attr("class","backward_disabled");
      //否则，如果moved等于MAX
	}else if(this.moved==this.MAX){
      //设置$for的class为forward_disabled
	  $for.attr("class","forward_disabled");
     //否则
	}else{
      //$back的class为backward
	  $back.attr("class","backward");
      //$for的class为forward
	  $for.attr("class","forward");
	}
  },
  changeImgs:function(e){//根据小图片更换中图片
    //获得目标元素的src属性，保存在变量src中
	var src=$(e.target).attr("src");
    //查找src中最后一个.的位置i
	var i=src.lastIndexOf(".");
    //设置id为mImg的元素的src为:
      //src从开头-i 拼上-m  拼上src从i到结尾
	  $("#mImg").attr("src",src.slice(0,i)+"-m"+src.slice(i));
  }
 */
}
zoom.init();