<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二手书籍交易系统-登录</title>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <jsp:include page="./public/lib.jsp"/>
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
   
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:100px;margin-top:20%;">
            <div class="text-center margin-big padding-big-top" style="border:1px solid transparet;">
           <%-- <h1 style="width: 800px;position: absolute;top: 80px;left: -200px;">
            二手书籍交易系统
            </h1>--%>
            </div> 
            </div>
            <div class="media media-y margin-big-bottom">
            </div>
            <form action="" method="post">
            <div class="panel loginbox" style="padding:10px 0;">
                <!-- <div class="text-center margin-big padding-big-top"><h1>欢迎来到校园旧书交易管理系统</h1></div> -->
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;margin-top:50px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input id="username" type="text" class="input input-big" name="name" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                           	<input id="password" type="password" class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" />
                           	<span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field" style="margin-top:10%;">
                        <div style="float:left; display:inline;">
							<input type="text" id="code_input" value="" placeholder="请输入验证码"/ style="height:45px;width:220px;">
                        </div>
                         <div style="float:left; display:inline;margin-left:5px;">
                            <span id="v_container" ></span>
                        </div>
                          	<!--  <img src="images/passcode.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">   -->
                        </div>
                    </div>
                </div>
                <div style="padding:30px;margin-top:10%;"><input type="button" id="login" class="button button-block bg-main text-big input-big" value="登录">
                </div>
                <div style="padding-left:180px;">
                 	<a href="javascript:void(0)" id="clear">
                		<input type="button" id="login" class="button  bg-main text-small input-small" value="重置">
                	</a>
                	<a href="javascript:void(0)" id="register">
                		<input type="button" id="login" class="button  bg-main text-small input-small" value="未注册？点击注册">
                	</a>
                </div>
            </div>
            </form>          
        </div>
    </div>
</div>

</body>
</html>