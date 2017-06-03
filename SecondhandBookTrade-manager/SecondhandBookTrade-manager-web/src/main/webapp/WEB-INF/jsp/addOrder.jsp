<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.booktrade.pojo.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/jd.css">
 <%@include file="public/commonLayerUIForm.jsp" %>
<link rel="icon" href="/images/favicon.ico">
 <link rel="stylesheet" href="css/order/jd.css">
<link rel="stylesheet" href="css/order/addorder.css">
<style type="text/css">
        .t1
        {
            clear: both;
            border: 1px solid #c9dae4;
        }
        .t1 tr th
        {
            color: #0d487b;
            background: #f2f4f8 url(../CSS/Table/images/sj_title_pp.jpg) repeat-x left bottom;
            line-height: 28px;
            border-bottom: 1px solid #9cb6cf;
            border-top: 1px solid #e9edf3;
            font-weight: normal;
            text-shadow: #e6ecf3 1px 1px 0px;
            padding-left: 5px;
            padding-right: 5px;
        }
        .t1 tr td
        {
            border-bottom: 1px solid #e9e9e9;
            padding-bottom: 5px;
            padding-top: 5px;
            color: #444;
            border-top: 1px solid #FFFFFF;
            padding-left: 5px;
            padding-right: 5px;
            word-break: break-all;
        }
        /* white-space:nowrap; text-overflow:ellipsis; */
        tr.alt td
        {
            background: #ecf6fc; /*这行将给所有的tr加上背景色*/
        }
        tr.over td
        {
            background: #bcd4ec; /*这个将是鼠标高亮行的背景色*/
        }
    </style>
    <script type="text/javascript">
        /* $(document).ready(function () { //这个就是传说的ready  
            $(".t1 tr").mouseover(function () {
                //如果鼠标移到class为stripe的表格的tr上时，执行函数  
                $(this).addClass("over");
            }).mouseout(function () {
                //给这行添加class值为over，并且当鼠标一出该行时执行函数  
                $(this).removeClass("over");
            }) //移除该行的class  
            $(".t1 tr:even").addClass("alt");
            //给class为stripe的表格的偶数行添加class值为alt
        }); */
    </script>
<title>二手书籍交易系统-订单页</title>
</head>
<body>
<div id="header"></div>
<div id="main">
  <form id="form-order">
    <input name="uname" value="" type="hidden"/>
  </form>
  <div class="add-order">
    <header class="checkout-tit">
      <span class="tit-txt">填写并核对订单信息</span>
    </header>
    <section class="checkout-steps">
      <div class="step-tit">
        <h3>收货人信息</h3>

        <!-- <div class="extra-r">
          <a href="#none" class="ftx-05">新增收货地址</a>
        </div> -->
      </div>
      <div class="step-cont">
        <div class="addr-detail">
          <!--此处应该从“收货人信息表”中查询当前登录用户可用的收货人信息-->
          <!--<span class="addr-name" limit="6" title="刘强东">刘强东</span>-->
          <!--<span class="addr-info" limit="45" title="北京 海淀区 三环到四环之间 太阳园小区4号楼101室">北京 海淀区 三环到四环之间 太阳园小区4号楼101室</span>-->
          <!--<span class="addr-tel">136****1379</span>-->
          <label for="rcvName">收货人姓名：</label>
            
          <input form="form-order" name="rcvName" id="rcvName" value="<%=session.getAttribute("userName").toString()%>"/>
        </div>
      </div>
      <div class="hr"></div>

      <div class="step-tit">
        <h3>支付方式</h3>
      </div>
      <div class="step-cont">
        <ul class="payment-list">
          <li class="payment-item-selected"><b></b>货到付款</li>
          <!-- <li><b></b>支付宝支付</li>
          <li><b></b>京东支付</li>
          <li><b></b>在线支付</li> -->
        </ul>
        <input form="form-order" type="hidden" name="payment" value="1"/>
      </div>
      <div class="hr"></div>
		<div class="step-tit">
        <h3>配送地址</h3>
	        <div id="store_select ">
	            <div id="city_2" >
	            <select id="prov" style='margin-left:10px;'></select> 
	            <select id="city" disabled="disabled"></select>
	            <select id="dist" disabled="disabled"></select>
	           <!-- <h4> 请输入详细地址：</h4><input type="text" name="addressDetail" id="addressDetail"/> -->
	        </div>
        </div>
      </div>
      
      <div class="step-cont">
        <!-- <ul class="payment-list">
          <li class="payment-item-selected"><b></b>货到付款</li>
          <li><b></b>支付宝支付</li>
          <li><b></b>京东支付</li>
          <li><b></b>在线支付</li>
        </ul>
        <input form="form-order" type="hidden" name="payment" value="1"/> -->
      </div>
      <div class="hr"></div>
      <div class="step-tit">
        <h3>送货清单</h3>
      </div>
      <div class="step-cont">
        <section class="shopping-list">
          <aside>
            <div class="mode-item-tit">
              <h4>配送方式</h4>
            </div>
            <div class="mode-tab-nav">
              <span class="m-txt">京东快递<i class="qmark-icon qmark-tip"></i></span><b></b>
            </div>
            <div class="mode-list">
              <span class="mode-label ftx-03">标&nbsp;&nbsp;准&nbsp;&nbsp;达：</span>
              <br/>

              <div class="mode-infor">预计&nbsp;9月9日[周五]&nbsp;09:00-15:00&nbsp;送达</div>
            </div>
          </aside>
          <div class="goods-list">
            <div class="goods-tit">
              <h4 class="vendor_name_h" id="0">商家：</h4>
            </div>
            <div class="goods-items">
            </div>
            <input form="form-order" name="productList" value="" type="hidden"/>
          </div>
        </section>
        <section class="shopping-list">
          <aside id="orderDetail" style="width:840px;">
            <!-- <div class="mode-item-tit">
              <h4>配送方式</h4>
            </div>
            <div class="mode-tab-nav">
              <span class="m-txt">京东快递<i class="qmark-icon qmark-tip"></i></span><b></b>
            </div>
            <div class="mode-list">
              <span class="mode-label ftx-03">标&nbsp;&nbsp;准&nbsp;&nbsp;达：</span>
              <br/>

              <div class="mode-infor">预计&nbsp;9月9日[周五]&nbsp;09:00-15:00&nbsp;送达</div>
            </div> -->
          </aside>
          <!-- <div class="goods-list">
            <div class="goods-tit">
              <h4 class="vendor_name_h" id="0">商家：</h4>
            </div>
            <div class="goods-items">
            </div>
            <input form="form-order" name="productList" value="" type="hidden"/>
          </div> -->
        </section>
      </div>
      <div class="hr"></div>

      <div class="step-tit">
        <h3>发票信息</h3>
      </div>
      <div class="step-content">
        <div id="part-inv" class="invoice-cont">
          <span class="mr10"> 普通发票（电子） &nbsp; </span>
          <span class="mr10"> 个人&nbsp; </span>
          <span class="mr10"> 明细&nbsp; </span>
        </div>
      </div>
    </section>
    <div class="order-summary">
      <div class="statistic fr">
        <!--<div class="list">
          <span><em class="ftx-01">3</em> 件商品，总商品金额：</span>
          <em class="price" id="warePriceId" v="264">￥264.00</em>
        </div>
        <div class="list">
          <span>运费：</span>
          <em class="price"><i class="freight-icon"></i> ￥0.00</em>
        </div>-->
      </div>
      <div class="clr"></div>
    </div>
    <div class="trade-foot">
      <div class="trade-foot-detail-com">
        <div class="fc-price-info">
          <span class="price-tit">应付总额：</span>
          <span class="price-num" id="price">￥0.0</span>
          <input form="form-order" name="price" value="" type="hidden"/>
        </div>
        <div class="fc-consignee-info">
          <!--<span class="mr20" id="sendAddr">寄送至： 北京 海淀区 三环到四环之间   太阳园小区4号楼101室</span>-->
          <!--<span id="sendMobile">收货人：王春梅 136****1379</span>-->
        </div>
      </div>

      <div id="checkout-floatbar" class="group">
        <div class="checkout-buttons">
          <button type="button" class="checkout-submit" id="submitOrder">
            提交订单<b></b>
          </button>
        </div>
        <span id="submit_message" style="display:none" class="submit-error"></span>

        <div class="submit-check-info" id="submit_check_info_message" style="display:none"></div>
      </div>

    </div>
  </div>

</div>

<div id="footer"></div>


<script src="js/jquery-1.11.3.js"></script>
<script src="js/addorder.js"></script>
<script src="/js/jquery.cityselect.js"></script>
<script src="/js/commons/latool.js"></script>

</body>
</html>