<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> new document </title>
<link rel="stylesheet" type="text/css" href="/css/secondHandBook_index.css" >
<link rel="icon" href="/images/favicon.ico"><!-- hw.ico -->
<script src="js/lib/jquery.js"></script>
<script type="text/javascript" src="js/secondHandBook_index.js"></script>
<!-- 弹出框核心包 -->
<script type="text/javascript" src="/js/lib/layer/layer.js"></script> 
<!-- 弹出层封装JS -->
<script type="text/javascript" src="/js/commons/pop.js"></script>
<!-- layer UI 核心包 --> 
<script src="/js/lib/layui/layui.js"></script>
<script src="/js/lib/layui/lay/dest/layui.all.js"></script>
<!-- ajax封装JS -->
<script src="/js/commons/ajaxEncapsulation.js"></script> 
<!-- 系统工具类 -->
<script src="/js/commons/jsUtils.js"></script>
</head>
<body>
<!-- 页面顶部 -->
<!-- 顶部容器 ：width:100% -->
<header id="top">
    <!-- 内容显示区域 ：width : 1211px -->
    <div id="top_box">
        <ul class="lf">
            <!-- <li><a href="#">华为官网</a></li>
            <li><a href="#">华为荣耀</a></li>
            <li>
                <a href="#">软件应用</a>
                鼠标移入移出事件
            </li>
            <li><a href="#">花粉俱乐部</a></li>
            <li><a href="#">Select Region</a></li> -->
        </ul>
        <ul class="rt">
            <li><a href="#" id="login">登录</a></li>
            <li><a href="#" id="register">注册</a></li>
            <li><a href="#" id="myOrder">我的订单</a></li>
            <!-- <li><a href="#">V码(优购码)</a></li>
            <li><a href="#">手机版</a></li> -->
            <li>
                <a href="#">网站导航</a>
                <!--鼠标移入移出事件-->
            </li>
        </ul>
    </div>
</header>
<!-- logo 和 搜索框 -->
<div id="top_main">
    <div class="lf  top_main_left">
        <img src="/images/img/image/newLogo.png" alt="" />
    </div>
    <div class="lf search_box">
        <div class="search">
            <input type="text" class="text" id="txtSearch"/>
            <input type="button" class="button" value="搜索"/>
        </div>
        <div class="hot_words">
            <span>热门搜索：</span>
            <a href="#"> 5C</a>
            <a href="#"> HUAWEI P9</a>
            <a href="#"> 5X</a>
            <a href="#">荣耀7</a>
            <a href="#"> Mate 8</a>

        </div>
    </div>
    <div class="lf" id="my_hw">我的商城</div>
    <div class="lf" id="settle_up">我的购物车</div>
    <div class="lf" id="weixin">
        <img src="/images/img/qrcode_vmall_wechat01.jpg" style="width:75px;height:75px;" alt=""/>
        <p>微信关注我们</p>
    </div>
</div><!--top_main-->

<!-- 导航 -->
<nav id="nav">
    <div id="category">
        <a href="#">全部商品</a>
    </div>
    <ul id="nav_items" class="lf">
        <li><a href="#">首页</a></li>
        <li><a href="#">华为专区</a></li>
        <li><a href="#">荣耀专区</a></li>
        <li><a href="#">荣耀畅玩5C</a><s></s></li>
        <li><a href="#">HUAWEI P9 Plus</a></li>
        <li><a href="#">荣耀7</a></li>
        <li><a href="#">精彩页面</a></li>
    </ul>
</nav>
<!-- banner 广告 -->
<div id="banner">
    <ul id="cate_box" class="lf">
        <li>
            <h3><a href="#">手机</a></h3>
            <p><span>荣耀</span><span>畅玩</span><span>华为</span><span>Mate/P系列</span></p>
        </li>
        <li>
            <h3><a href="#">平板 & 穿戴</a></h3>
            <p><span>平板电脑 </span><span>手环</span><span>手表</span></p>
        </li>
        <li>
            <h3><a href="#">智能家居</a></h3>
            <p><span>电力猫</span><span>路由器 </span><span>电视盒子</span></p>
        </li>
        <li>
            <h3><a href="#">必备配件</a></h3>
            <p><span>入耳式耳机</span><span>保护壳</span><span>保护套</span></p>
        </li>
        <li>
            <h3><a href="#">潮流配件</a></h3>
            <p><span>支架 </span><span>自拍杆/器 </span><span>智能开关/插座</span></p>
        </li>
        <li>
            <h3><a href="#">应用市场</a></h3>
            <p><span>手机游戏 </span><span>手机应用</span></p>
        </li>
    </ul>
    <!--图片轮播 -->
    <form>
        <div class="slider">
            <img id="slider_img" class="img_slider" src="/images/img/slide01.png" alt=""/>
        </div>
    </form>

</div>
<div class="hr-2"></div>
<!-- 网页主体 -->
<section id="main">
    <div class="layout">
        <div class="fl u-4-3 lf">
            <ul>
                <li class="channel-pro-item">
                    <!--<i class="p-tag"><img src="/images/img/new_ping.png" style="padding-left: 0" alt=""/></i>-->
                    <div class="p-img">
                        <img src="/images/img/phone01.png" alt=""/>
                    </div>
                    <div class="p-name lf"><a href="#">HUAWEI P9 Plus</a></div>
                    <div class="p-shining">
                        <div class="p-slogan">一上手，就爱不释手</div>
                        <div class="p-promotions">5月6日10:08 火爆开售</div>
                    </div>
                    <div class="p-price">
                        <em>¥</em>
                        <span>3988</span>
                    </div>
                    <div class="p-button lf">
                        <a href="#">立即抢购</a>
                    </div>
                </li>
                <li class="channel-pro-item" style="background-color:#E2F9FB"><!--荣耀畅玩5C-->
                    <!--<i class="p-tag"><img src="/images/img/new_ping02.png" alt=""/></i>-->
                    <div class="p-img">
                        <img src="/images/img/phone02.png" alt=""/>
                    </div>
                    <div class="p-name lf"><a href="#">荣耀畅玩5C</a></div>
                    <div class="p-shining">
                        <div class="p-slogan">16纳米8核芯千元普及风暴</div>
                        <div class="p-promotions">5月10日10:08震撼开售</div>
                    </div>
                    <div class="p-price">
                        <em>¥</em>
                        <span>899</span>
                    </div>
                    <div class="p-button lf">
                        <a href="#">立即抢购</a>
                   </div>
                </li>
                <div class="hr-2"></div>
                <li class="channel-pro-item" style="background-color:#FFFCE7"><!--荣耀畅玩5C-->
                    <!--<i class="p-tag"><img src="/images/img/hot_but.png" alt=""/></i>-->
                    <div class="p-img">
                        <img src="/images/img/phone05.png" alt=""/>
                    </div>
                    <div class="p-name lf"><a href="#">荣耀7</a></div>
                    <div class="p-shining">
                        <div class="p-slogan">智灵键，创新语音控制</div>
                        <div class="p-promotions">移动增强版原价1999直降200</div>
                    </div>
                    <div class="p-price">
                        <em>¥</em>
                        <span>1799</span>
                    </div>
                    <div class="p-button lf">
                        <a href="#">立即抢购</a>
                    </div>
                </li>
                <li class="channel-pro-item" style="background-color:#FFECEF"><!--荣耀畅玩5C-->
                    <!--<i class="p-tag"><img src="/images/img/hot_but.png" alt=""/></i>-->
                    <div class="p-img">
                        <img src="/images/img/phone06.png" alt=""/>
                    </div>
                    <div class="p-name lf"><a href="#">荣耀畅玩5X</a></div>
                    <div class="p-shining">
                        <div class="p-slogan">腾讯视频VIP特权免费领</div>
                        <div class="p-promotions">5月4日至8日 每天10:08/20:00准点开售</div>
                    </div>
                    <div class="p-price">
                        <em>¥</em>
                        <span>899</span>
                    </div>
                    <div class="p-button lf">
                        <a href="#">立即抢购</a>
                    </div>
                </li>
            </ul>
        </div><!-- u-4-3结束-->
        <div class="lf fr u-4-1">
            <div class="channel-sale">
                <img src="/images/img/phone03.jpg" alt=""/>
            </div>
            <div class="hr-2"></div>
            <ul class="h-tab">
                <li class="current" id="tab-notice">
                    <a href="#">公告</a>
                </li>
                <li id="tab-news" class="">
                    <a href="#">评测 </a>
                </li>
                <div class="b">
                    <ul id="tab-notice-content" style="display:block;">
                        <li>
                            <a href="#">HUAWEI G9 青春版震撼首发，全款预订赢好礼</a>
                        </li>
                        <li>
                            <a href="#">荣耀畅玩5C，真芯不怕！ 5月5日10:08震撼首发！</a>
                        </li>
                        <li>
                            <a href="#">参与互动赢荣耀畅玩5C，与“胖红”一起怒FUN！</a>
                        </li>
                        <li>
                            <a href="#">【中奖名单】HUAWEI WATCH星月系列购机抽奖</a>
                        </li>
                    </ul>
                </div>
            </ul>
        </div>
        <div class="hr-2"></div>
        <div class="banner">
            <img class="rt" src="/images/img/vip.jpg" alt=""/>
            <div class="hr-2"></div>
        </div>
    </div><!--layout HUAWEI P9 Plus结束-->
</section>
<div class="hr-2"></div>
<div id="banner_img">
        <div class="banner-slideshow">
            <img src="/images/img/p9.jpg" width="100%" alt=""/>
        </div>
    </div>
</div>
<div class="hr-2"></div>
<div class="hr-2"></div>
<div class="channel-floor"><!--手机华为精品手机 -->
    <div class="h">
        <h2><a href="#">平板 & 穿戴</a></h2>
        <em class="channel-subtitle">华为精品平板</em>
        <ul class="rt channel-nav">
            <li><a href="">荣耀</a></li>
            <li><a href="">畅玩</a></li>
            <li><a href="">华为 Mate/P系列</a></li>
            <li><a href="">G/Y系列</a></li>
            <li><a href="">运营商合约</a></li>
        </ul>
    </div>
        <div class="floor_two"> <!-- 华为 M2 青春版 7.0英寸楼层-->
            <ul class="channel-pro-list">
                <li class="channel-pro-1-1">
                    <div><img src="/images/img/hot_but.png"></div>
                    <div class="p-img">
                        <img src="/images/img/phone09.png" alt="">
                    </div>
                    <div class="p-name">
                        <p class="HUAWEIP9">HUAWEI P9</p>
                        <p>瞬间，定格视界的角度</p>
                        <p style="color:#E01D20">全款预售 火爆进行中</p>
                        <p class="HUAWEIP9_p1">
                            <span>¥</span>
                            <span>3188</span>
                            <span class="HUAWEIP9_p1_span">立即抢购</span>
                        </p>
                    </div>
                </li>
                <li  class="channel-pro-1-2">
                    <div><img src="/images/img/hot_but.png" alt="">	</div>
                    <img src="/images/img/phone08.png" class="channel-pro-1-2img">
                    <p class="channel-pro-1-2_p">荣耀畅玩4C <a>可领50元券&送手机壳<br>+膜</a></p>
                    <p class="channel-pro-1-2_p2">¥799</p>
                </li>
                <li  class="channel-pro-1-3">
                    <img src="/images/img/phone11png.png" class="channel-pro-1-2img">
                    <p class="channel-pro-1-2_p">荣耀畅玩4X <a>千万人之选，火爆热销</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:18px;">¥799</p>
                </li>
                <li class="channel-pro-1-4">
                    <div><img src="/images/img/hot_but.png" ></div>
                    <img src="/images/img/phone12.png"  height="190px">
                    <p class="channel-pro-1-2_p">HUAWEI Mate 8 <a>高性能与长续航的<a><br>再次突破</p>
                    <p class="channel-pro-1-2_p2">¥2999</p>
                </li>
                <li class="channel-pro-1-5">
                    <img src="/images/img/phone14.png"  height="190px">
                    <p class="channel-pro-1-2_p">荣耀4A<a> 青春优等生，火爆销售中</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥599</p>
                </li>
                <li class="channel-pro-1-6">
                    <div><img src="/images/img/hot_but.png" ></div>
                    <img src="/images/img/1455415746352.png"  height="190px">
                    <p class="channel-pro-1-2_p">荣耀7i<a> 全网通/移动版直降200！</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥1399</p>
                </li>
                <li class="channel-pro-1-7">
                    <img src="/images/img/1455415746352.png"  height="190px">
                    <p class="channel-pro-1-2_p">荣耀X2 <a>母亲节促销最高减200!</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥1799</p>
                </li>
                <li class="channel-pro-1-8">
                    <img src="/images/img/1454039821497.png"  height="190px">
                    <p class="channel-pro-1-2_p">HUAWEI Mate S <a>商务品质之选</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥4199</p>
                </li>
                <li class="channel-pro-1-9">
                    <div><img src="/images/img/1446367641045.png" ></div>
                    <img src="/images/img/001.png"  height="190px">
                    <p class="channel-pro-1-2_p">华为 畅享5 <a>直降100元</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥799</p>
                </li>
                <li class="channel-pro-1-10">
                    <img src="/images/img/1453455044526.jpg"  height="190px">
                    <p class="channel-pro-1-2_p">华为 麦芒4 <a>无畏生长，磨砺见真我！</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥2299</p>
                </li>
                <li class="channel-pro-1-11">
                    <img src="/images/img/1457936187476.png"  height="190px">
                    <p class="channel-pro-1-2_p">荣耀畅玩4X <a>千万人之选，火爆热销</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥799</p>
                </li>
            </ul>
        </div><!-- 手机华为精品手机-->
    <!-- 平板 & 穿戴华为精品平板开始-->
    <div class="hr-2"></div>
    <div class="channel-floor"><!--智能家居上网必备 -->
        <div class="h">
            <h2><a href="#">平板 & 穿戴</a></h2>
            <em class="channel-subtitle">华为精品平板</em>
            <ul class="rt channel-nav">
                <li><a href="">平板电脑</a></li>
                <li><a href="">手环</a></li>
                <li><a href="">手表</a></li>
            </ul>
        </div>
        <div class="floor_two">
        <div class="floor_two">
            <ul class="channel-pro-list"">
                <li class="channel-pro-1-1 floor_2" style="background-color: #F2FFE8">
                    <div><img src="/images/img/new_ping.png"></div>
                    <div class="p-img">
                        <img src="/images/img/phone09.png" alt="">
                    </div>
                    <div class="p-name">
                        <p class="HUAWEIP9">华为 M2 青春版 7.0英寸</p>
                        <p>平板手机，4G全网通，侧边指纹识别，全款预订</p>
                        <p class="HUAWEIP9_p1">
                            <span>¥</span>
                            <span>1599</span>
                            <span class="HUAWEIP9_p1_span">立即抢购</span>
                        </p>
                    </div>
                </li>
                <li  class="channel-pro-1-2"style="background-color: #FCEFFF">
                    <div><img src="/images/img/new_ping.png" alt="">	</div>
                    <img src="/images/img/1462370371169.png" class="channel-pro-1-2img">
                    <p class="channel-pro-1-2_p">华为手环 B3 <a>腕上私语，动静随心，<br>全款预订</a></p>
                    <p class="channel-pro-1-2_p2">¥999</p>
                </li>
                <li  class="channel-pro-1-3" style="background-color: #FFFCE7">
                    <img src="/images/img/1448853168609.png" class="channel-pro-1-2img">
                    <p class="channel-pro-1-2_p">荣耀手环zero <a>母亲节促销下单立减</a>30元!</p>
                    <p class="channel-pro-1-2_p2" style="margin-top:18px;">¥799</p>
                </li>
                <li class="channel-pro-1-4">
                    <div><img src="/images/img/hot_but.png" ></div>
                    <img src="/images/img/1448853168609.png"  height="190px">
                    <p class="channel-pro-1-2_p">荣耀手环zero <a>母亲节促销下单立减<a><br>30元!</p>
                    <p class="channel-pro-1-2_p2">¥2999</p>
                </li>
                <li class="channel-pro-1-5">
                    <img src="/images/img/phone14.png"  height="190px">
                    <p class="channel-pro-1-2_p">荣耀4A<a> 青春优等生，火爆销售中</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥599</p>
                </li>
                <li class="channel-pro-1-6">
                    <div><img src="/images/img/hot_but.png" ></div>
                    <img src="/images/img/phone09.png"  height="190px">
                    <p class="channel-pro-1-2_p">荣耀7i<a> 全网通/移动版直降200！</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥1399</p>
                </li>
                <li class="channel-pro-1-7">
                    <img src="/images/img/phone12.png"  height="190px">
                    <p class="channel-pro-1-2_p">荣耀X2 <a>母亲节促销最高减200!</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥1799</p>
                </li>
                <li class="channel-pro-1-8">
                    <img src="/images/img/1454039821497.png"  height="190px">
                    <p class="channel-pro-1-2_p">HUAWEI Mate S <a>商务品质之选</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥4199</p>
                </li>
                <li class="channel-pro-1-9">
                    <div><img src="/images/img/1446367641045.png" ></div>
                    <img src="/images/img/1455415746352.png"  height="190px">
                    <p class="channel-pro-1-2_p">华为 畅享5 <a>直降100元</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥799</p>
                </li>
                <li class="channel-pro-1-10">
                    <img src="/images/img/1453455044526.jpg"  height="190px">
                    <p class="channel-pro-1-2_p">华为 麦芒4 <a>无畏生长，磨砺见真我！</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥2299</p>
                </li>
                <li class="channel-pro-1-11">
                    <img src="/images/img/1457936187476.png"  height="190px">
                    <p class="channel-pro-1-2_p">荣耀畅玩4X <a>千万人之选，火爆热销</a></p>
                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥799</p>
                </li>
            </ul>
        </div><!-- 平板 & 穿戴华为精品平板-->
        <!-- 智能家居上网必备-->
        <div class="hr-2"></div>
        <div class="channel-floor"><!--必备配件配件与服务 -->
            <div class="h">
                <h2><a href="#">平板 & 穿戴</a></h2>
                <em class="channel-subtitle">华为精品平板</em>
                <ul class="rt channel-nav">
                    <li><a href="">荣耀</a></li>
                    <li><a href="">畅玩</a></li>
                    <li><a href="">华为 Mate/P系列</a></li>
                    <li><a href="">G/Y系列</a></li>
                    <li><a href="">运营商合约</a></li>
                </ul>
            </div>
            <div class="floor_two"> <!-- 华为 M2 青春版 7.0英寸楼层-->
                <ul class="channel-pro-list">
                    <li class="channel-pro-1-1">
                        <div><img src="/images/img/hot_but.png"></div>
                        <div class="p-img">
                            <img src="/images/img/phone09.png" alt="">
                        </div>
                        <div class="p-name">
                            <p class="HUAWEIP9">HUAWEI P9</p>
                            <p>瞬间，定格视界的角度</p>
                            <p style="color:#E01D20">全款预售 火爆进行中</p>
                            <p class="HUAWEIP9_p1">
                                <span>¥</span>
                                <span>3188</span>
                                <span class="HUAWEIP9_p1_span">立即抢购</span>
                            </p>
                        </div>
                    </li>
                    <li  class="channel-pro-1-2">
                        <div><img src="/images/img/hot_but.png" alt="">	</div>
                        <img src="/images/img/phone08.png" class="channel-pro-1-2img">
                        <p class="channel-pro-1-2_p">荣耀畅玩4C <a>可领50元券&送手机壳<br>+膜</a></p>
                        <p class="channel-pro-1-2_p2">¥799</p>
                    </li>
                    <li  class="channel-pro-1-3">
                        <img src="/images/img/phone11png.png" class="channel-pro-1-2img">
                        <p class="channel-pro-1-2_p">荣耀畅玩4X <a>千万人之选，火爆热销</a></p>
                        <p class="channel-pro-1-2_p2" style="margin-top:18px;">¥799</p>
                    </li>
                    <li class="channel-pro-1-4">
                        <div><img src="/images/img/hot_but.png" ></div>
                        <img src="/images/img/phone12.png"  height="190px">
                        <p class="channel-pro-1-2_p">HUAWEI Mate 8 <a>高性能与长续航的<a><br>再次突破</p>
                        <p class="channel-pro-1-2_p2">¥2999</p>
                    </li>
                    <li class="channel-pro-1-5">
                        <img src="/images/img/phone14.png"  height="190px">
                        <p class="channel-pro-1-2_p">荣耀4A<a> 青春优等生，火爆销售中</a></p>
                        <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥599</p>
                    </li>
                    <li class="channel-pro-1-6">
                        <div><img src="/images/img/hot_but.png" ></div>
                        <img src="/images/img/phone09.png"  height="190px">
                        <p class="channel-pro-1-2_p">荣耀7i<a> 全网通/移动版直降200！</a></p>
                        <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥1399</p>
                    </li>
                    <li class="channel-pro-1-7">
                        <img src="/images/img/phone12.png"  height="190px">
                        <p class="channel-pro-1-2_p">荣耀X2 <a>母亲节促销最高减200!</a></p>
                        <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥1799</p>
                    </li>
                    <li class="channel-pro-1-8">
                        <img src="/images/img/1454039821497.png"  height="190px">
                        <p class="channel-pro-1-2_p">HUAWEI Mate S <a>商务品质之选</a></p>
                        <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥4199</p>
                    </li>
                    <li class="channel-pro-1-9">
                        <div><img src="/images/img/1446367641045.png" ></div>
                        <img src="/images/img/1455415746352.png"  height="190px">
                        <p class="channel-pro-1-2_p">华为 畅享5 <a>直降100元</a></p>
                        <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥799</p>
                    </li>
                    <li class="channel-pro-1-10">
                        <img src="/images/img/1453455044526.jpg"  height="190px">
                        <p class="channel-pro-1-2_p">华为 麦芒4 <a>无畏生长，磨砺见真我！</a></p>
                        <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥2299</p>
                    </li>
                    <li class="channel-pro-1-11">
                        <img src="/images/img/1457936187476.png"  height="190px">
                        <p class="channel-pro-1-2_p">荣耀畅玩4X <a>千万人之选，火爆热销</a></p>
                        <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥799</p>
                    </li>
                </ul>
            </div>
            <div class="hr-2"></div>
            <div class="channel-floor">
                <div class="h">
                    <h2><a href="#">平板 & 穿戴</a></h2>
                    <em class="channel-subtitle">华为精品平板</em>
                    <ul class="rt channel-nav">
                        <li><a href="">荣耀</a></li>
                        <li><a href="">畅玩</a></li>
                        <li><a href="">华为 Mate/P系列</a></li>
                        <li><a href="">G/Y系列</a></li>
                        <li><a href="">运营商合约</a></li>
                    </ul>
                </div>
                <div class="floor_two"> <!-- 智能家居上网必备-->
                    <ul class="channel-pro-list">
                        <li class="channel-pro-1-1">
                            <div><img src="/images/img/hot_but.png"></div>
                            <div class="p-img">
                                <img src="/images/img/phone09.png" alt="">
                            </div>
                            <div class="p-name">
                                <p class="HUAWEIP9">HUAWEI P9</p>
                                <p>瞬间，定格视界的角度</p>
                                <p style="color:#E01D20">全款预售 火爆进行中</p>
                                <p class="HUAWEIP9_p1">
                                    <span>¥</span>
                                    <span>3188</span>
                                    <span class="HUAWEIP9_p1_span">立即抢购</span>
                                </p>
                            </div>
                        </li>
                        <li  class="channel-pro-1-2">
                            <div><img src="/images/img/hot_but.png" alt="">	</div>
                            <img src="/images/img/phone08.png" class="channel-pro-1-2img">
                            <p class="channel-pro-1-2_p">荣耀畅玩4C <a>可领50元券&送手机壳<br>+膜</a></p>
                            <p class="channel-pro-1-2_p2">¥799</p>
                        </li>
                        <li  class="channel-pro-1-3">
                            <img src="/images/img/phone11png.png" class="channel-pro-1-2img">
                            <p class="channel-pro-1-2_p">荣耀畅玩4X <a>千万人之选，火爆热销</a></p>
                            <p class="channel-pro-1-2_p2" style="margin-top:18px;">¥799</p>
                        </li>
                        <li class="channel-pro-1-4">
                            <div><img src="/images/img/hot_but.png" ></div>
                            <img src="/images/img/phone12.png"  height="190px">
                            <p class="channel-pro-1-2_p">HUAWEI Mate 8 <a>高性能与长续航的<a><br>再次突破</p>
                            <p class="channel-pro-1-2_p2">¥2999</p>
                        </li>
                        <li class="channel-pro-1-5">
                            <img src="/images/img/phone14.png"  height="190px">
                            <p class="channel-pro-1-2_p">荣耀4A<a> 青春优等生，火爆销售中</a></p>
                            <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥599</p>
                        </li>
                        <li class="channel-pro-1-6">
                            <div><img src="/images/img/hot_but.png" ></div>
                            <img src="/images/img/phone09.png"  height="190px">
                            <p class="channel-pro-1-2_p">荣耀7i<a> 全网通/移动版直降200！</a></p>
                            <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥1399</p>
                        </li>
                        <li class="channel-pro-1-7">
                            <img src="/images/img/phone12.png"  height="190px">
                            <p class="channel-pro-1-2_p">荣耀X2 <a>母亲节促销最高减200!</a></p>
                            <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥1799</p>
                        </li>
                        <li class="channel-pro-1-8">
                            <img src="/images/img/1454039821497.png"  height="190px">
                            <p class="channel-pro-1-2_p">HUAWEI Mate S <a>商务品质之选</a></p>
                            <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥4199</p>
                        </li>
                        <li class="channel-pro-1-9">
                            <div><img src="/images/img/1446367641045.png" ></div>
                            <img src="/images/img/1455415746352.png"  height="190px">
                            <p class="channel-pro-1-2_p">华为 畅享5 <a>直降100元</a></p>
                            <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥799</p>
                        </li>
                        <li class="channel-pro-1-10">
                            <img src="/images/img/1453455044526.jpg"  height="190px">
                            <p class="channel-pro-1-2_p">华为 麦芒4 <a>无畏生长，磨砺见真我！</a></p>
                            <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥2299</p>
                        </li>
                        <li class="channel-pro-1-11">
                            <img src="/images/img/1457936187476.png"  height="190px">
                            <p class="channel-pro-1-2_p">荣耀畅玩4X <a>千万人之选，火爆热销</a></p>
                            <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥799</p>
                        </li>
                    </ul>
                </div><!-- 平板 & 穿戴华为精品平板-->
                <!-- 智能家居上网必备-->
                <div class="hr-2"></div>
                <div class="channel-floor"><!--每日特价精品推荐 -->
                    <div class="h">
                        <h2><a href="#">平板 & 穿戴</a></h2>
                        <em class="channel-subtitle">华为精品平板</em>
                        <ul class="rt channel-nav">
                            <li><a href="">荣耀</a></li>
                            <li><a href="">畅玩</a></li>
                            <li><a href="">华为 Mate/P系列</a></li>
                            <li><a href="">G/Y系列</a></li>
                            <li><a href="">运营商合约</a></li>
                        </ul>
                    </div>
                    <div class="floor_two"> <!-- 华为 M2 青春版 7.0英寸楼层-->
                        <ul class="channel-pro-list">
                            <li class="channel-pro-1-1">
                                <div><img src="/images/img/hot_but.png"></div>
                                <div class="p-img">
                                    <img src="/images/img/phone09.png" alt="">
                                </div>
                                <div class="p-name">
                                    <p class="HUAWEIP9">HUAWEI P9</p>
                                    <p>瞬间，定格视界的角度</p>
                                    <p style="color:#E01D20">全款预售 火爆进行中</p>
                                    <p class="HUAWEIP9_p1">
                                        <span>¥</span>
                                        <span>3188</span>
                                        <span class="HUAWEIP9_p1_span">立即抢购</span>
                                    </p>
                                </div>
                            </li>
                            <li  class="channel-pro-1-2">
                                <div><img src="/images/img/hot_but.png" alt="">	</div>
                                <img src="/images/img/phone08.png" class="channel-pro-1-2img">
                                <p class="channel-pro-1-2_p">荣耀畅玩4C <a>可领50元券&送手机壳<br>+膜</a></p>
                                <p class="channel-pro-1-2_p2">¥799</p>
                            </li>
                            <li  class="channel-pro-1-3">
                                <img src="/images/img/phone11png.png" class="channel-pro-1-2img">
                                <p class="channel-pro-1-2_p">荣耀畅玩4X <a>千万人之选，火爆热销</a></p>
                                <p class="channel-pro-1-2_p2" style="margin-top:18px;">¥799</p>
                            </li>
                            <li class="channel-pro-1-4">
                                <div><img src="/images/img/hot_but.png" ></div>
                                <img src="/images/img/phone12.png"  height="190px">
                                <p class="channel-pro-1-2_p">HUAWEI Mate 8 <a>高性能与长续航的<a><br>再次突破</p>
                                <p class="channel-pro-1-2_p2">¥2999</p>
                            </li>
                            <li class="channel-pro-1-5">
                                <img src="/images/img/phone14.png"  height="190px">
                                <p class="channel-pro-1-2_p">荣耀4A<a> 青春优等生，火爆销售中</a></p>
                                <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥599</p>
                            </li>
                            <li class="channel-pro-1-6">
                                <div><img src="/images/img/hot_but.png" ></div>
                                <img src="/images/img/phone09.png"  height="190px">
                                <p class="channel-pro-1-2_p">荣耀7i<a> 全网通/移动版直降200！</a></p>
                                <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥1399</p>
                            </li>
                            <li class="channel-pro-1-7">
                                <img src="/images/img/phone12.png"  height="190px">
                                <p class="channel-pro-1-2_p">荣耀X2 <a>母亲节促销最高减200!</a></p>
                                <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥1799</p>
                            </li>
                            <li class="channel-pro-1-8">
                                <img src="/images/img/1454039821497.png"  height="190px">
                                <p class="channel-pro-1-2_p">HUAWEI Mate S <a>商务品质之选</a></p>
                                <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥4199</p>
                            </li>
                            <li class="channel-pro-1-9">
                                <div><img src="/images/img/1446367641045.png" ></div>
                                <img src="/images/img/1455415746352.png"  height="190px">
                                <p class="channel-pro-1-2_p">华为 畅享5 <a>直降100元</a></p>
                                <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥799</p>
                            </li>
                            <li class="channel-pro-1-10">
                                <img src="/images/img/1453455044526.jpg"  height="190px">
                                <p class="channel-pro-1-2_p">华为 麦芒4 <a>无畏生长，磨砺见真我！</a></p>
                                <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥2299</p>
                            </li>
                            <li class="channel-pro-1-11">
                                <img src="/images/img/1457936187476.png"  height="190px">
                                <p class="channel-pro-1-2_p">荣耀畅玩4X <a>千万人之选，火爆热销</a></p>
                                <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥799</p>
                            </li>
                        </ul>
                    </div><!--必备配件配件与服务-->
                    <!-- 智能家居上网必备-->
                    <div class="hr-2"></div>
                    <div class="channel-floor"><!--必备配件配件与服务 -->
                        <div class="h">
                            <h2><a href="#">平板 & 穿戴</a></h2>
                            <em class="channel-subtitle">华为精品平板</em>
                            <ul class="rt channel-nav">
                                <li><a href="">荣耀</a></li>
                                <li><a href="">畅玩</a></li>
                                <li><a href="">华为 Mate/P系列</a></li>
                                <li><a href="">G/Y系列</a></li>
                                <li><a href="">运营商合约</a></li>
                            </ul>
                        </div>
                        <div class="floor_two"> <!-- 华为 M2 青春版 7.0英寸楼层-->
                            <ul class="channel-pro-list">
                                <li class="channel-pro-1-1">
                                    <div><img src="/images/img/hot_but.png"></div>
                                    <div class="p-img">
                                        <img src="/images/img/phone09.png" alt="">
                                    </div>
                                    <div class="p-name">
                                        <p class="HUAWEIP9">HUAWEI P9</p>
                                        <p>瞬间，定格视界的角度</p>
                                        <p style="color:#E01D20">全款预售 火爆进行中</p>
                                        <p class="HUAWEIP9_p1">
                                            <span>¥</span>
                                            <span>3188</span>
                                            <span class="HUAWEIP9_p1_span">立即抢购</span>
                                        </p>
                                    </div>
                                </li>
                                <li  class="channel-pro-1-2">
                                    <div><img src="/images/img/hot_but.png" alt="">	</div>
                                    <img src="/images/img/phone08.png" class="channel-pro-1-2img">
                                    <p class="channel-pro-1-2_p">荣耀畅玩4C <a>可领50元券&送手机壳<br>+膜</a></p>
                                    <p class="channel-pro-1-2_p2">¥799</p>
                                </li>
                                <li  class="channel-pro-1-3">
                                    <img src="/images/img/phone11png.png" class="channel-pro-1-2img">
                                    <p class="channel-pro-1-2_p">荣耀畅玩4X <a>千万人之选，火爆热销</a></p>
                                    <p class="channel-pro-1-2_p2" style="margin-top:18px;">¥799</p>
                                </li>
                                <li class="channel-pro-1-4">
                                    <div><img src="/images/img/hot_but.png" ></div>
                                    <img src="/images/img/phone12.png"  height="190px">
                                    <p class="channel-pro-1-2_p">HUAWEI Mate 8 <a>高性能与长续航的<a><br>再次突破</p>
                                    <p class="channel-pro-1-2_p2">¥2999</p>
                                </li>
                                <li class="channel-pro-1-5">
                                    <img src="/images/img/phone14.png"  height="190px">
                                    <p class="channel-pro-1-2_p">荣耀4A<a> 青春优等生，火爆销售中</a></p>
                                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥599</p>
                                </li>
                                <li class="channel-pro-1-6">
                                    <div><img src="/images/img/hot_but.png" ></div>
                                    <img src="/images/img/phone09.png"  height="190px">
                                    <p class="channel-pro-1-2_p">荣耀7i<a> 全网通/移动版直降200！</a></p>
                                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥1399</p>
                                </li>
                                <li class="channel-pro-1-7">
                                    <img src="/images/img/phone12.png"  height="190px">
                                    <p class="channel-pro-1-2_p">荣耀X2 <a>母亲节促销最高减200!</a></p>
                                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥1799</p>
                                </li>
                                <li class="channel-pro-1-8">
                                    <img src="/images/img/1454039821497.png"  height="190px">
                                    <p class="channel-pro-1-2_p">HUAWEI Mate S <a>商务品质之选</a></p>
                                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥4199</p>
                                </li>
                                <li class="channel-pro-1-9">
                                    <div><img src="/images/img/1446367641045.png" ></div>
                                    <img src="/images/img/1455415746352.png"  height="190px">
                                    <p class="channel-pro-1-2_p">华为 畅享5 <a>直降100元</a></p>
                                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥799</p>
                                </li>
                                <li class="channel-pro-1-10">
                                    <img src="/images/img/1453455044526.jpg"  height="190px">
                                    <p class="channel-pro-1-2_p">华为 麦芒4 <a>无畏生长，磨砺见真我！</a></p>
                                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥2299</p>
                                </li>
                                <li class="channel-pro-1-11">
                                    <img src="/images/img/1457936187476.png"  height="190px">
                                    <p class="channel-pro-1-2_p">荣耀畅玩4X <a>千万人之选，火爆热销</a></p>
                                    <p class="channel-pro-1-2_p2" style="margin-top:20px;">¥799</p>
                                </li>
                            </ul>
                        </div><!--每日特价精品推荐-->
    </div>
   <div class="hr-2"></div>
       <div id="banner_img">
        <div class="banner-slideshow">
            <img src="/images/img/p9.jpg" width="100%" alt=""/>
            </div>
        </div>
    </div>
   <div class="hr-2"></div>
     <div class="hr-40"></div>
     <div class="follow">
        <div class="layout">
            <ul>
                <li><a href=""><img src="/images/img/follow_hwsoft_application.png" alt=""/></a></li>
                <li><a href=""><img src="/images/img/follow_sina.png" alt=""/></a></li>
                <li><a href=""><img src="/images/img/follow_qzone.png" alt=""/></a></li>
                <li><a href=""><img src="/images/img/follow_android.png" alt=""/></a></li>
            </ul>
        </div>
    </div>
   <div class="slogan">
       <ul>
           <li class="s1"><i>500强企业 品质保证</i></li>
           <li class="s1"><i>7天退货 15天换货 </i></li>
           <li class="s1"><i>99元起免运费</i></li>
           <li class="s1"><i>448家维修网点 全国联保</i></li>
       </ul>
   </div>
     <div class="service">
         <dl class="s1">
             <dt>帮助中心</dt>
             <dd>
                 <ol>
                     <li><a href="">购物指南</a></li>
                     <li><a href="">配送方式</a></li>
                     <li><a href="">购物指南</a></li>
                     <li><a href="">购物指南</a></li>
                 </ol>
             </dd>
         </dl>
        <dl class="s2">
            <dt>
                售后服务
                <dd>
                    <ol>
                        <li><a href="">保修政策</a></li>
                        <li><a href="">退换货政策</a></li>
                        <li><a href="">退换货流程</a></li>
                        <li><a href="">保修状态查询</a></li>
                    </ol>
                </dd>
            </dt>
        </dl>
         <dl class="s2">
             <dt>
                 技术支持
             <dd>
                 <ol>
                     <li><a href="">售后网点</a></li>
                     <li><a href="">预约维修</a></li>
                     <li><a href="">手机寄修服务</a></li>
                     <li><a href="">软件下载</a></li>
                 </ol>
             </dd>
             </dt>
         </dl><dl class="s2">
         <dt>
             <i></i>
             关于商城
         <dd>
             <ol>
                 <li><a href="">公司介绍</a></li>
                 <li><a href="">华为商城简介</a></li>
                 <li><a href="">联系客服</a></li>
             </ol>
         </dd>
         </dt>
     </dl>
         </dl><dl class="s2">
         <dt>
             <i></i>
             关注我们
         <dd>
             <ol>
                 <li><a href="">新浪微博</a></li>
                 <li><a href="">腾讯微博</a></li>
                 <li><a href="">花粉社区</a></li>
                 <li><a href="">商城手机版</a></li>
             </ol>
         </dd>
         </dt>
     </dl>

     </div>
<footer id="foot_box">
    <div class="footer-otherLink">
        <p style="text-align:left; text-align: center">
            友情链接 | 华为官网 | 华为消费者业务 | 荣耀官网 | 花粉俱乐部 | 莫塞尔商城 | 爱旅官网 | 华为应用市场 | 万表网 | 手机之家 | 中商情报网 | 钻石小鸟 | 刷机精灵 | 安卓市场 | 优购物官网 | 移动叔叔 | 奥特莱斯 |

        </p>
        <p style="text-align:left;text-align: center"">
            中关村商城 | 酷狗音乐 | 华为商城手机版 | 手机世界 | 百信手机网 | 一呼百应网 | 卡宝宝网 | 多特软件下载 | 嗨淘网 | 同步助手 | 蜂鸟摄影网 | 奇珀论坛 | 家具商城 | 世界名表 | 拍鞋网商城 | 欧宝丽珠宝 | 寻购网 |
        </p>
        <p style="text-align:left; text-align: center"">
            九块邮官网 | 安卓游戏 | 阿里巴巴生意经 | 手机大全 | 安卓软件园 | 卓大师刷机 | 智机论坛 | 电子产品世界 | 历趣网 | 网购返利 | 中国供应商 | Apple110 | 91.手机门户网 | 添翼圈社区 | 易购官网 | 美乐乐家具网 |
        </p>
        <p style="text-align:left; text-align: center"">
            智能电视网 | 快递查询 | 亿智蘑菇手机网 | UC浏览器 | 以旧换新 | 华为P9 | 携程租车 | 安卓市场 | 申请链接 >>
        </p>
    </div>
    </div>
    </div>
    </div>
    <div class="footer-warrant-area">
        <p style="text-align:left; text-align: center">
            隐私政策 服务协议 Copyright © 2012-2016 VMALL.COM 版权所有 保留一切权利
        </p>
        <p style="text-align:left; text-align: center">
            <img src="/images/img/20160226162651249.png" alt=""/>
            苏公网安备 32011402010009号 | 苏ICP备09062682号-9 | 增值电信业务经营许可证：苏B2-20130048 | 网络文化经营许可证：苏网文[2012]0401-019号
        </p>
        <p style="text-align:left; text-align: center" class="footer-img">
            <img src="/images/img/20160226162415360.png" alt=""/>
            <img src="/images/img/20160226162521265.png" alt=""/>
            <img src="/images/img/20160226162531395.png" alt=""/>
        </p>
    </div>
</footer>
        <!-- <script src="js/jquery-1.11.3.js"></script>
        <script src="js/bootstrap.js"></script> -->

</body>
</html>