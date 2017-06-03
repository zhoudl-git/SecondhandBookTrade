<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>二手书籍交易系统-用户中心</title>
  <meta charset="utf-8"/>
  <%@include file="public/commonLayerUIForm.jsp" %>
 <link rel="icon" href="/images/favicon.ico">
 <link href="css/detail/common.css" type="text/css" rel="Stylesheet" />
  <link rel="stylesheet" href="css/order/jd.css">
  <!--<link rel="stylesheet" href="css/usercenter.css">-->
</head>

<body>
<div id="header"></div>
	<div id="top_box">
                <img src="images/star.jpg" />
               <!--  <a href="#">收藏物尽其用</a> -->
		        <div class="rt">   
		            <ul>
			            <li>您好，欢迎来到二手书籍交易系统！<a href="/" >[登录]</a> <a href="javascript:register()">[免费注册]</a></li> 
			            <li><b></b><a href="#" >我的订单</a></li> 
			        </ul> 
                </div>
            </div>
        <!--LOGO和搜索框! -->
        <div id="top_main">
            <a href="#" class="lf"><img src="images/booktrade_logo.jpg" alt="LOGO" style="width:200px;"/></a>
            <div id="search_box" class="lf">
                <div class="search">
                    <input id="txtSearch" type="text" class="text" />
                    <input class="button" name="" type="button" value="搜索" />
                </div>
                <!-- <div class="hot_words">
                    <span>热门搜索：</span> <a href="#">家纺11月大促</a> <a href="#">彩虹电热毯</a> <a href="#">博洋家纺</a>
                    <a href="#">霞珍</a> <a href="#">床垫床褥</a> <a href="#">九洲鹿被子</a> <a href="#">南极人家纺</a>
                </div> -->
            </div>
            <!-- <div id="my_jd" class="lf">我的京东<b></b></div> -->
            <div id="settle_up" class="lf">去购物车结算<b></b></div>
        </div>
        <nav id="nav">
            <div id="category">
                <!-- <a href="#">全部商品分类</a>
                <b></b> -->
                <ul id="cate_box">
            </div>
            <ul id="nav_items">
                <li><a href="index">首页</a></li>
            </ul>
        </nav>
<div id="main">
  <!--左侧的附加导航-->
  <div class="affix">
    <h4>用户中心</h4>
    <ul>
      <li class="active"><a href="#container-my-order">我的订单</a></li>
      <li class="active"><a href="javascript:void(0)" id='myMessage'>我的留言</a></li>
      <!-- <li><a href="#container-buy-stat-canvas">消费统计(Canvas版)</a></li>
      <li><a href="#container-buy-stat-svg">消费统计(SVG版)</a></li>
      <li><a href="#container-luck-lottery">幸运抽奖</a></li> -->
    </ul>
  </div>

  <!--右侧主体区域-->
  <div class="right-body">
    <div class="active" id="container-my-order">
      <table id="order-table">
        <thead>
        <tr>
          <th>订单信息</th>
          <th>收货人</th>
          <th>订单金额</th>
          <th>
            <select id="orderTime">
              <option value="m1">最近一个月</option>
              <option value="m3">最近三个月</option>
              <option value="m6">最近六个月</option>
            </select>
          </th>
          <th>
            <select id="orderStatus">
              <option value="0">所有状态</option>
              <option value="1">待付款</option>
              <option value="2">等待配货</option>
              <option value="3">派货中</option>
              <option value="4">订单完成</option>
            </select>
          </th>
          <th>操作</th>
        </tr>
        </thead>
        <tbody id="orderTable">
       <!--  <tr>
          <td colspan="6">
            订单编号：1234567890
            <span>京东自营</span>
          </td>
        </tr>
        <tr>
          <td>
            <a href="#"><img src="images/phone/phone_01.jpg"></a>
            <a href="#"><img src="images/phone/phone_02.jpg"></a>
            <a href="#"><img src="images/phone/phone_03.jpg"></a>
          </td>
          <td>
            刘强东
          </td>
          <td>
            ￥3580.00<br>
            在线支付
          </td>
          <td>
            2016-10-20<br>
            10:22:35
          </td>
          <td>
            等待付款
          </td>
          <td>
            <a href="#">查看</a><br>
            <a href="#">评价</a>
            <a href="#">晒单</a><br>
            <a href="#">还要买</a>
          </td>
        </tr>
        <tr>
          <td colspan="6">
            订单编号：1234567890
            <span>京东自营</span>
          </td>
        </tr>
        <tr>
          <td>
            <a href="#"><img src="images/phone/phone_02.jpg"></a>
            <a href="#"><img src="images/phone/phone_03.jpg"></a>
          </td>
          <td>
            刘强东
          </td>
          <td>
            ￥3580.00<br>
            在线支付
          </td>
          <td>
            2016-10-20<br>
            10:22:35
          </td>
          <td>
            等待付款
          </td>
          <td>
            <a href="#">查看</a><br>
            <a href="#">评价</a>
            <a href="#">晒单</a><br>
            <a href="#">还要买</a>
          </td>
        </tr>
        <tr>
          <td colspan="6">
            订单编号：1234567890
            <span>京东自营</span>
          </td>
        </tr>
        <tr>
          <td>
            <a href="#"><img src="images/phone/phone_02.jpg"></a>
          </td>
          <td>
            刘强东
          </td>
          <td>
            ￥3580.00<br>
            在线支付
          </td>
          <td>
            2016-10-20<br>
            10:22:35
          </td>
          <td>
            等待付款
          </td>
          <td>
            <a href="#">查看</a><br>
            <a href="#">评价</a>
            <a href="#">晒单</a><br>
            <a href="#">还要买</a>
          </td>
        </tr>
        <tr>
          <td colspan="6">
            订单编号：1234567890
            <span>京东自营</span>
          </td>
        </tr>
        <tr>
          <td>
            <a href="#"><img src="images/phone/phone_02.jpg"></a>
            <a href="#"><img src="images/phone/phone_03.jpg"></a>
          </td>
          <td>
            刘强东
          </td>
          <td>
            ￥3580.00<br>
            在线支付
          </td>
          <td>
            2016-10-20<br>
            10:22:35
          </td>
          <td>
            等待付款
          </td>
          <td>
            <a href="#">查看</a><br>
            <a href="#">评价</a>
            <a href="#">晒单</a><br>
            <a href="#">还要买</a>
          </td>
        </tr> -->
        </tbody>
      </table>
    </div>
    <div id="container-buy-stat-canvas">
      <canvas id="canvas-buy-stat" style="background:#f2f2f2">
        您的浏览器不支持Canvas标签！
      </canvas>
    </div>
    <div id="container-buy-stat-svg">
      此处应该呈现使用FusionCharts绘制的统计图
    </div>
    <div id="container-luck-lottery">
      <button id="bt-lottery" disabled>
        开始抽奖(总抽奖次数:0,剩余抽奖次数:0)
      </button>
      <br><br>
      <canvas id="canvas-lottery" >
        您的浏览器不支持Canvas标签！
      </canvas>
    </div>
  </div>
</div>

<div id="footer"></div>


<script src="js/jquery-1.11.3.js"></script>
<script src="js/fusioncharts.js"></script>
<script src="js/fusioncharts.charts.js"></script>
<script src="js/usercenter.js"></script>
<script src="js/commons/common.js"></script>
</body>
</html>
