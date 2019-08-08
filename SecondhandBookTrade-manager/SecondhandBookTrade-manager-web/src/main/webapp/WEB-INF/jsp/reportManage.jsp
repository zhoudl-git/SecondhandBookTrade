<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>二手书籍交易系统-公告列表</title> 
    <!-- 引入公共页面 -->
    <%@include file="public/commonHead.jsp" %>
    <!-- layer UI 核心包 --> 
	<script src="${pageContext.request.contextPath}/js/lib/layui/layui.js"></script>
	<!-- <script src="/js/lib/layui/lay/dest/layui.all.js"></script> -->
	<script src="${pageContext.request.contextPath}/js/lib/layui/lay/modules/form.js"></script>
    <link rel="stylesheet" href="/css/bookManage.css"> 
	<script src="${pageContext.request.contextPath}/js/reportManage.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong>
  <span class="icon-pencil-square-o"></span>
  	<i class="layui-icon">&#xe620;</i>公告列表</strong>
 <span class="button-span">
 	<span class="layui-btn" id="user-add">添加</span>
 	<span class="layui-btn" id="user-deletes">批量操作</span>
 </span>	
 </div>
  <div class="body-content">
	<div id="dataFieldGrid"></div>
  </div>
</div>
</body></html>