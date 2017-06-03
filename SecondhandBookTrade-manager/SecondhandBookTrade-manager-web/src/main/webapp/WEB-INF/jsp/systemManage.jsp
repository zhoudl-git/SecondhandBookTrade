<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二手书籍交易中心-系统设置</title>
</head>
<link rel="stylesheet" href="/css/zTreeStyle/zTreeStyle.css">
<%@include file="public/commonLayerUIForm.jsp" %>
<script type="text/javascript" src="/js/lib/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="/js/lib/ztree/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="/js/lib/ztree/jquery.ztree.exedit-3.5.js"></script>
<script type="text/javascript" src="/js/systemManage.js"></script>
<script type="text/css" >
body {
    font:16px "microsoft yahei", Arial, Helvetica, sans-serif;
    color:#666;
    /*background:-webkit-gradient(linear, 0% 100%,0% 0%,from(#2960b3), to(#e0e2f7));*/
}
</script>
<body>
 <div class="panel-head"><strong>
  <span class="icon-pencil-square-o"></span>
  	<i class="layui-icon">&#xe620;</i>系统配置</strong>
  	</div>
<div id="test" style="width:100%;height:85%;margin-left:10px;margin-top:30px;">
	<div style="width:90%;height:100%;float:left">
		<div id="treeManage" class="treeManage" >
			<!-- <div >
			<iframe id="iframe"></iframe>
			</div> -->
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
		<div id="treeBody" style="background-color:white;width:98%;height:500px;overflow:auto;border: solid 1px #ccc;">
			<ul id="treeDemo1" class="ztree" style="">
			</ul>
		</div>
	</div>
</div>
</body>
</html>