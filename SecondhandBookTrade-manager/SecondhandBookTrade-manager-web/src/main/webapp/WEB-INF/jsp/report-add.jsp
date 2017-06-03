<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二手书籍交易系统-公告添加</title>
 <!-- 引入公共页面 -->
    <%@include file="public/commonHead.jsp" %>
    <!-- layer UI 核心包 --> 
	<script src="/js/lib/layui/layui.js"></script>
	<!-- <script src="/js/lib/layui/lay/dest/layui.all.js"></script> -->
	<script src="/js/lib/layui/lay/modules/form.js"></script>
	<script src="/js/report-add.js"></script>
</head>
<body>
<form class="layui-form" action="" style="margin-top:5%;">
  <div class="layui-form-item">
    <label class="layui-form-label">公告标题</label>
    <div class="layui-input-block">
      <input type="text" name="title" id="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" style="width:80%;">
    </div>
  </div>
 </form>
	<textarea id="demo" style="display: none;width:80%;"></textarea>
	<div class="site-demo-button" style="margin-left: 88%;">
	<button class="layui-btn site-demo-layedit" data-type="content">发布</button>
	</div>
	<!-- <button class="layui-btn layui-btn-normal" style="margin-left:85%;" id="publish" data-type="content">发布</button> -->
</body>
</html>