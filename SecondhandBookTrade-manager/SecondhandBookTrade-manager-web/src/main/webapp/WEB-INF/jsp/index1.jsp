<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <link href="css/index.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <style>
        body {
            /*margin-top: 50px;*/
            margin-bottom: 50px;
        }
         .carousel > .carousel-inner >.item > img {
             width: 100%;
         }
    </style>
</head>
<body>

<div class="navbar navbar-default" style="background-color: #0f7eb6;">
    <div class="container">
        <!--导航条头部 = brand + toggle-->
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <!-- <img src="img/logo2.jpg" style="margin-top:-8px"> -->
            </a>
            <a data-toggle="collapse" href="#my-menu" class="navbar-toggle">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
        </div>
        <!--导航条折叠部分 = 导航 + 链接 + 表单 + 按钮 ...-->
        <div id="my-menu" class="collapse navbar-collapse">
            <!--导航条中的导航 navbar-nav-->
            <ul class="nav navbar-nav">
                <li><a href="#"  style="color:#fff">首页</a></li>
                <li><a href="#"  style="color:#fff">新闻</a></li>
            </ul>
            <!--导航条中的超链接 navbar-link-->
            <a href="login.html" class="btn btn-success navbar-btn navbar-right">登录</a>
            <!--导航条中的文本 navbar-text-->
            <span class="navbar-text navbar-right">|</span>
            <!--导航条中的按钮 navbar-btn-->
            <a class="btn btn-success navbar-btn navbar-right" href="register.html">去注册</a>
            <!--导航条中的表单 navbar-form-->
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <label class="sr-only" for="kw">搜索：</label>
                    <input class="form-control" id="kw" placeholder="查询书籍..." type="text"/>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-8">
            <div id="ad1" class="carousel slide" data-ride="carousel" data-interval="2000" >
                <!--轮播广告的内容 —— 会滚动-->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="img/11.jpg">
                        <div class="carousel-caption">
                            <h4>java-1</h4>
                            <span>全新的java二手书</span>
                        </div>
                    </div>
                    <div class="item">
                        <img src="img/22.jpg">
                        <div class="carousel-caption">
                            <h4>java-1</h4>
                            <span>书籍的说明</span>
                        </div>
                    </div>
                    <div class="item">
                        <img src="img/33.jpg">
                        <div class="carousel-caption">
                            <h4>java-1</h4>
                            <span>全新的java二手书</span>
                        </div>
                    </div>
                    <div class="item">
                        <img src="img/44.jpg">
                        <div class="carousel-caption">
                            <h4>java-1</h4>
                            <span>全新的java二手书</span>
                        </div>
                    </div>
                </div>
                <!--轮播广告的控制工具 —— 不会滚动-->
                <a class="carousel-control left" data-slide="prev" href="#ad1">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="carousel-control right" data-slide="next" href="#ad1">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
                <ul class="carousel-indicators">
                    <li data-slide-to="0" class="active" data-target="#ad2">1</li>
                    <li data-slide-to="1" data-target="#ad2">2</li>
                    <li data-slide-to="2" data-target="#ad2">3</li>
                    <li data-slide-to="3" data-target="#ad2">4</li>
                </ul>
            </div>
        </div>
        <div class="col-xs-12 col-sm-4 col-md-4">
           <h3> 公告：</h3>
            <ul>
                <li><h4><a href="#">公告标题1</a><span class="rt">[2017-1-10]</span></h4></li>
                <li><h4><a href="#">公告标题2</a><span class="rt">[2017-1-10]</span></h4></li>
                <li><h4><a href="#">公告标题3</a><span class="rt">[2017-1-10]</span></h4></li>
                <li><h4><a href="#">公告标题4</a><span class="rt">[2017-1-10]</span></h4></li>
                <li><h4><a href="#">公告标题5</a><span class="rt">[2017-1-10]</span></h4></li>
                <li><h4><a href="#">公告标题6</a><span class="rt">[2017-1-10]</span></h4></li>
            </ul>
        </div>
    </div>
    <div class="col-md-12 col-sm-12 col-lg-12">&nbsp;</div>

    <div class="con_rec">
        <h3>二手教材推荐</h3>
        <hr/>
        <div class="col-xs-12 col-sm-6 col-md-3">
            <ul>
                <li>
                    <img src="img/T1_fULXeFaXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                </li>
                <li><span>书名及其简介</span></li>
                <li><b>￥价格</b></li>
                <li><a href="#">立即下单</a></li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3">
            <ul>
                <li>
                    <img src="img/T1G.rdFjlfXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                </li>
                <li><span>书名及其简介</span></li>
                <li><b>￥价格</b></li>
                <li><a href="#">立即下单</a></li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3 ">
            <ul>
                <li>
                    <img src="img/T1VTMMXlVfXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                </li>
                <li><span>书名及其简介</span></li>
                <li><b>￥价格</b></li>
                <li><a href="#">立即下单</a></li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3">
            <ul>
                <li>
                    <img src="img/T1xCi3XwRaXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                </li>
                <li><span>书名及其简介</span></li>
                <li><b>￥价格</b></li>
                <li><a href="#">立即下单</a></li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3">
            <ul>
                <li>
                    <img src="img/T1_fULXeFaXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                </li>
                <li><span>书名及其简介</span></li>
                <li><b>￥价格</b></li>
                <li><a href="#">立即下单</a></li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3">
            <ul>
                <li>
                    <img src="img/T1G.rdFjlfXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                </li>
                <li><span>书名及其简介</span></li>
                <li><b>￥价格</b></li>
                <li><a href="#">立即下单</a></li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3 ">
            <ul>
                <li>
                    <img src="img/T1VTMMXlVfXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                </li>
                <li><span>书名及其简介</span></li>
                <li><b>￥价格</b></li>
                <li><a href="#">立即下单</a></li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3">
            <ul>
                <li>
                    <img src="img/T1xCi3XwRaXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                </li>
                <li><span>书名及其简介</span></li>
                <li><b>￥价格</b></li>
                <li><a href="#">立即下单</a></li>
            </ul>
        </div>
    </div>

    <ul class="nav nav-tabs">
        <li><a data-toggle="tab" href="#tc10">二手课本</a></li>
        <li class="active"><a data-toggle="tab" href="#tc20">名人墨迹</a></li>
        <li><a data-toggle="tab" href="#tc30">国学金典</a></li>
        <li><a data-toggle="tab" href="#tc40">其他类</a></li>
    </ul>
    <div class="col-sm-12 col-md-12 col-sm-12">&nbsp;</div>
    <div class="tab-content">
        <div class="tab-pane" id="tc10">
            <div class="col-xs-12 col-sm-6 col-md-3">
                <ul>
                    <li>
                        <img src="img/T1_fULXeFaXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <ul>
                    <li>
                        <img src="img/T1G.rdFjlfXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3 ">
                <ul>
                    <li>
                        <img src="img/T1VTMMXlVfXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                   <ul>
                       <li>
                           <img src="img/T1xCi3XwRaXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                       </li>
                       <li><span>书名及其简介</span></li>
                       <li><b>￥价格</b></li>
                       <li><a href="#">立即下单</a></li>
                   </ul>
            </div>
        </div>
        <div class="tab-pane active" id="tc20">
            <div class="col-xs-12 col-sm-6 col-md-3">
                <ul>
                    <li>
                        <img src="img/T1G.rdFjlfXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <ul>
                    <li>
                        <img src="img/T1_fULXeFaXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3 ">
                <ul>
                    <li>
                        <img src="img/T1VTMMXlVfXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <ul>
                    <li>
                        <img src="img/T1xCi3XwRaXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
        </div>
        <div class="tab-pane" id="tc30">
            <div class="col-xs-12 col-sm-6 col-md-3">
                <ul>
                    <li>
                        <img src="img/T1_fULXeFaXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-3 ">
                <ul>
                    <li>
                        <img src="img/T1VTMMXlVfXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <ul>
                    <li>
                        <img src="img/T1G.rdFjlfXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <ul>
                    <li>
                        <img src="img/T1xCi3XwRaXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
        </div>
        <div class="tab-pane" id="tc40">
            <div class="col-xs-12 col-sm-6 col-md-3">
                <ul>
                    <li>
                        <img src="img/T1_fULXeFaXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <ul>
                    <li>
                        <img src="img/T1G.rdFjlfXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3 ">
                <ul>
                    <li>
                        <img src="img/T1VTMMXlVfXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <ul>
                    <li>
                        <img src="img/T1xCi3XwRaXXXXXXXX_!!0-item_pic.jpg" alt=""/>
                    </li>
                    <li><span>书名及其简介</span></li>
                    <li><b>￥价格</b></li>
                    <li><a href="#">立即下单</a></li>
                </ul>
            </div>
         </div>
    </div>
</div>
<div class="col-md-12 col-sm-12 col-xs-12 footer">
    <ul>
        <li class="lf">联系我们</li>
        <li class="lf">关注我们</li>
        <li class="lf">网站链接</li>
        <li class="lf">网站链接</li>
    </ul>
</div>
<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>