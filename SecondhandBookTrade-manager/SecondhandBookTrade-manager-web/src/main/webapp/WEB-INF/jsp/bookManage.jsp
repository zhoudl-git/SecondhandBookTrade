<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>书籍信息管理</title> 
    <!-- 引入公共页面 -->
    <%@include file="public/commonHead.jsp" %>
    <link rel="stylesheet" href="/css/bookManage.css"> 
	<script src="/js/bookManage.js"></script> 
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong>
  <span class="icon-pencil-square-o"></span>
  	<i class="layui-icon">&#xe620;</i>书籍列表</strong>
 <span>
 	<span class="self-button-add">添加</span>
 	<span class="self-button-delete">批量删除</span> 
 </span>	
 </div>
  <div class="body-content">
	<div id="dataFieldGrid"></div>
  </div>
</div>
</body></html>