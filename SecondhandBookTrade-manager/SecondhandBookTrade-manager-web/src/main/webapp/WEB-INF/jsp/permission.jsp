<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二手书籍交易管理中心-角色权限配置</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zTreeStyle/zTreeStyle.css">
<%@include file="public/commonLayerUIForm.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/ztree/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/ztree/jquery.ztree.exedit-3.5.js"></script>
<!-- <!-- 弹出层封装JS -->
<script src="${pageContext.request.contextPath}/js/commons/ajaxEncapsulation.js"></script>
<script src="${pageContext.request.contextPath}/js/commons/jsUtils.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commons/pop.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/permission.js"></script>
<body>
<div class="panel admin-panel">
  <div class="panel-head">
 <span class="button-span" style="margin-left:50%;margin-top:5%">
 	<span class="layui-btn" id="role-add-function">授权</span>
 	<span class="layui-btn" id="role-deletes-function">取消授权</span>
 </span>
 </div>
  <div class="body-content">
	<div id="dataFieldGrid"></div>
  </div>
</div>
<div id="treeBody" style="background-color:white;overflow:auto;margin-top:10%;border: solid 1px #ccc;">
	<ul id="treeDemo1" class="ztree" style="">
	</ul>
</div>
</body>
</html>