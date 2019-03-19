<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理中心</title>  
<!-- 引入公共页面 -->
<link rel="stylesheet" href="/css/pintuer.css">
<link rel="icon" href="/images/favicon.ico">
<%@include file="public/commonHead.jsp" %>
<script src="/js/index.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main" id="head">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="/index" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a href="shouye/index.html" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="javascript:void(0)" id="logout"><span class="icon-power-off" ></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <!-- <h2><span class="icon-cog"></span>基本设置</h2>
  <ul style="display:block">
    <li><a href="bookManage" target="right"><span class="icon-caret-right"></span>系统设置</a></li>
    <li><a href="updatePass" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
    <li><a href="pageManage" target="right"><span class="icon-caret-right"></span>单页管理</a></li>  
    <li><a href="indexManage" target="right"><span class="icon-caret-right"></span>首页轮播</a></li>   
    <li><a href="talkManage" target="right"><span class="icon-caret-right"></span>留言管理</a></li>     
    <li><a href="columnManage" target="right"><span class="icon-caret-right"></span>栏目管理</a></li>
	<li><a href="userManage" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
  </ul>  
	<h2><span class="icon-book"></span>书籍管理</h2>  
	<ul>
    <li><a href="bookManage" target="right"><span class="icon-caret-right"></span>书籍列表</a></li>
    <li><a href="bookManageCat" target="right"><span class="icon-caret-right"></span>书籍类目</a></li>
    <li><a href="talkManage" target="right"><span class="icon-caret-right"></span>留言管理</a></li>        
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
  <ul>
    <li><a href="contentManage" target="right"><span class="icon-caret-right"></span>内容管理</a></li>
    <li><a href="addContent" target="right"><span class="icon-caret-right"></span>添加内容</a></li>
    <li><a href="classify" target="right"><span class="icon-caret-right"></span>分类管理</a></li>        
  </ul> 
	<h2><span class="icon-users"></span>用户管理</h2>  
	<ul>
    <li><a href="userManage" target="right"><span class="icon-caret-right"></span>用户列表</a></li>
    <li><a href="permissionManage" target="right"><span class="icon-caret-right"></span>权限管理</a></li>
    <li><a href="talk" target="right"><span class="icon-caret-right"></span>留言管理</a></li>        
  </ul>  -->
</div>
<script type="text/javascript">
</script>
<ul class="bread">
  <li><a href="{:U('/')}" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
  <!-- <li><b>当前语言：</b><span style="color:red;">中文</php></span> 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> </li>-->
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="statisticalAnalysis" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
<!-- <p>来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p> -->
</div>
</body>
</html>