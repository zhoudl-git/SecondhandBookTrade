<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>二手书籍交易中心-系统角色管理</title>
     <script src="js/lib/jquery.js"></script>
    <link href="/js/lib/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
	<link href="/js/lib/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/js/lib/layui/css/layui.css">
	<link rel="stylesheet" href="/css/bookManage.css">
	<script src="/js/lib/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="/js/lib/ligerui/lib/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
	<script type="text/javascript" src="/js/lib/ligerui/lib/json2.js"></script>
	<script src="/js/commons/ajaxEncapsulation.js"></script> 
	<script src="/js/commons/jsUtils.js"></script>
    <script src="/js/lib/layer/layer.js"></script>
	<!-- 弹出框核心包 -->
	<script type="text/javascript" src="/js/lib/layer/mobile/layer.js"></script>
	<script type="text/javascript" src="/js/lib/layer/layer.js"></script> 
	<!-- <!-- 弹出层封装JS -->
	<script type="text/javascript" src="/js/commons/pop.js"></script> 
	<script src="/js/roleManage.js"></script> 
</head>
<body>
<input type="hidden" id="per">
<div class="panel admin-panel">
  <div class="panel-head"><strong>
  <span class="icon-pencil-square-o"></span>
  	<i class="layui-icon">&#xe620;</i>角色列表</strong>
 <span class="button-span">
 	<span class="layui-btn" id="role-add">添加</span>
 	<span class="layui-btn" id="role-deletes">批量操作</span>
 </span>	
 </div>
  <div class="body-content">
	<div id="dataFieldGrid"></div>
  </div>
</div>
</body></html>