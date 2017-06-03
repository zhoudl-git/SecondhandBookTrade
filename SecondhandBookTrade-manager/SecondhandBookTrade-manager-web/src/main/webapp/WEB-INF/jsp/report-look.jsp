<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二手书籍交易系统-公告详情页</title>
<%@include file="public/commonLayerUIForm.jsp" %>
<link rel="icon" href="/images/favicon.ico">
<link href="/css/index/common.css" rel="Stylesheet" />
</head>
<body>
<div>
	<img src="/images/report.jpg"  alt="公告栏" style="width:100%;height:20%;" />
</div>
<div style=" border:3px solid #000;height:100%;width:90%;margin:5%;" id="content">

</div>
<div id="username" style="margin-left:80%;">
	
</div>
<script>
$(function (){
	var id = parent.$("#whrx").val();
	var html = parent.$("#"+id).val();
	var userName = parent.$("input[name='"+id+"']").val();
	$("#content").append(html);
	$("#username").append("发布人："+userName);
})
</script>
</body>
</html>