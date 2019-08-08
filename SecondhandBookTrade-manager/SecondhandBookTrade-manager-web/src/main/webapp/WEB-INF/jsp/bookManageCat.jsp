<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>书籍类目信息管理</title> 
    <!-- 引入公共页面 -->
    <%@include file="public/commonHead.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookManage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zTreeStyle/zTreeStyle.css">
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/lib/kindeditor-4.1.10/kindeditor-all-min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/lib/kindeditor-4.1.10/lang/zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
	<script src="${pageContext.request.contextPath}/js/bookManageCat.js"></script>
	<style type="text/css">
		body {
			font-size:18px;
			font-family:"Microsoft YaHei",微软雅黑,"MicrosoftJhengHei",华文细黑,STHeiti,MingLiu
		}
	</style>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong>
  <span class="icon-pencil-square-o"></span>
  	<i class="layui-icon">&#xe620;</i>类目列表</strong>
 <!-- <span>
 	<span class="self-button-add" id="book-add">添加</span>
 	<span class="self-button-delete" id="book-deletes">批量删除</span> 
 </span> -->	
 </div>
 <!-- <div>
	 <div id="treeManage" class="treeManage" >
		<div >
		<iframe id="iframe"></iframe>
		</div>
		<span style="float:left;">材料管理目录</span>
		<a href="javascript:sortFile()"
			style="width:30px;height:25px;background:url(/images/px.png) no-repeat center center;float:right" title="切换右侧视图"></a>
	    <a href="javascript:deletejd('treeNode')"
			style="width:30px;height:25px;background:url(/images/e7.png) no-repeat center center;float:right"></a>
		<a href="javascript:lrShift('r');"
			style="width:30px;height:25px;background:url(/images/e6.png) no-repeat center center;float:right"></a>
		<a href="javascript:lrShift('l');"
			style="width:30px;height:25px;background:url(/images/e5.png) no-repeat center center;float:right"></a>
		<a href="javascript:tdShift('x');"
			style="width:30px;height:25px;background:url(/images/e4.png) no-repeat center center;float:right"></a>
		<a href="javascript:tdShift('s');"
			style="width:30px;height:25px;background:url(/images/e3.png) no-repeat center center;float:right"></a>
		<a href="javascript:editjd()"
			style="width:30px;height:25px;background:url(/images/e2.png) no-repeat center center;float:right" title="编辑目录"></a> 
		<a href="javascript:addjd()"
			style="width:30px;height:25px;background:url(/images/e1.png) no-repeat center center;float:right" title="添加目录"></a>
	</div>
	<div id="treeBody" style="background-color:white;width:98%;height:90%;overflow:auto;border: solid 1px #ccc;">
		<ul id="treeDemo1" class="ztree" style="">
		</ul>
	</div> -->
</div>
<div style="margin-top:3%">
 <ul id="tree"></ul>
  <div id="mm" class="easyui-menu" style="width: 120px;">
      <div onclick="append()" iconcls="icon-add">
          添加节点</div>
      <div onclick="remove()" iconcls="icon-remove">
          删除节点</div>
      <div onclick="update()" iconcls="icon-edit">修改节点</div>
  </div>
  <!-- <div class="body-content">
	<div id="dataFieldGrid"></div>
  </div> -->
</div>
</body></html>