<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二手书籍交易系统-购物车</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico">
<%@include file="public/commonLayerUIForm.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
 <table id="cartTable">
    <thead>
    <tr>
        <th>
            <label>
                <input class="check-all check" type="checkbox"/>&nbsp;全选
            </label>
        </th>
        <th>商品</th>
        <th>单价</th>
        <th>数量</th>
        <th>小计</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="shopCartData">
    <!-- <tr>
        <td class="checkbox">
            <input class="check-one check" type="checkbox"/>
        </td>
        <td class="goods"><img src="images/1.jpg" alt=""/><span>Casio/卡西欧 EX-TR350</span></td>
        <td class="price">5999.88</td>
        <td class="count">
            <span class="reduce"></span>
            <input class="count-input" type="text" value="1"/>
            <span class="add">+</span></td>
        <td class="subtotal">5999.88</td>
        <td class="operation"><span class="delete">删除</span></td>
    </tr>
    <tr>
        <td class="checkbox">
            <input class="check-one check" type="checkbox"/>
        </td>
        <td class="goods"><img src="images/2.jpg" alt=""/><span>Canon/佳能 PowerShot SX50 HS</span></td>
        <td class="price">3888.50</td>
        <td class="count"><span class="reduce"></span>
            <input class="count-input" type="text" value="1"/><span class="add">+</span></td>
        <td class="subtotal">3888.50</td>
        <td class="operation"><span class="delete">删除</span></td>
    </tr>
    <tr>
        <td class="checkbox">
            <input class="check-one check" type="checkbox"/>
        </td>
        <td class="goods"><img src="images/3.jpg" alt=""/><span>Sony/索尼 DSC-WX300</span></td>
        <td class="price">1428.50</td>
        <td class="count"><span class="reduce"></span>
            <input class="count-input" type="text" value="2"/><span class="add">+</span></td>
        <td class="subtotal">1428.50</td>
        <td class="operation"><span class="delete">删除</span></td>
    </tr>
    <tr>
        <td class="checkbox">
            <input class="check-one check" type="checkbox"/>
        </td>
        <td class="goods"><img src="images/4.jpg" alt=""/><span>Fujifilm/富士 instax mini 25</span></td>
        <td class="price">640.60</td>
        <td class="count"><span class="reduce"></span>
            <input class="count-input" type="text" value="1"/><span class="add">+</span></td>
        <td class="subtotal">640.60</td>
        <td class="operation"><span class="delete">删除</span></td>
    </tr> -->
    </tbody>
</table>
<div class="foot" id="foot">
    <label class="fl select-all">
        <input type="checkbox" class="check-all check"/>&nbsp;全选</label>
    <a class="fl delete" id="deleteAll" href="javascript:;">删除</a>

    <div class="fr closing" style="background:#FF3030" id="addOrder">结 算</div>
    <div class="fr total">合计：￥<span id="priceTotal">0.00</span></div>
    <div class="fr selected" id="selected">已选商品
        <span id="selectedTotal">0</span>件
        <span class="arrow up">︽</span>
        <span class="arrow down">︾</span>
    </div>
    <div class="selected-view">
        <div id="selectedViewList" class="clearfix">
            <!--<div><img src="images/1.jpg"><span data-index="">取消选择</span></div>-->
        </div>
        <span class="arrow">◆<span>◆</span></span>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/booktrade_shopcart.js"></script>
</body>
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js">
        </script>
        <script src="${pageContext.request.contextPath}/js/shoppingcart.js">
        </script>
        <!-- <script type="text/javascript" src="js/script.js"></script> -->
</html>

        
