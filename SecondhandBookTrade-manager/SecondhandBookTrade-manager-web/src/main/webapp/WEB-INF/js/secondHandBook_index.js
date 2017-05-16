var imageArr=[
  "/images/img/slide01.png",
  "/images/img/slide02.jpg",
  "/images/img/slide03.jpg",
  "/images/img/slide04.jpg",
];
//定义一个改变图片的方法
var count=1;
var timer;
function change(){
  var image=document.getElementById("slider_img");
  image.src=imageArr[count];

//  更新图片
  if(count==imageArr.length-1){
    count=0;
  }else{
    count++;
  }
}
//定义一个轮播的方法
function move(){
  timer=window.setInterval(change,2000);
}
$(function () {
	//调轮播方法
	window.onload=move();
	//绑定点击事件
	$("#login").on("click",function (){
		window.location.href="login";
	});
	$("#register").on("click",function (){
		pop("点击了注册",1);
	});
	$("#myOrder").on("click",function (){
		pop("点击了我的订单",1);
	});
});