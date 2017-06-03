<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE HTML>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二手书籍交易系统-详情页</title>
 <%@include file="public/commonLayerUIForm.jsp" %>
<link rel="icon" href="/images/favicon.ico">
<link href="css/detail/common.css" type="text/css" rel="Stylesheet" />
<link href="css/detail/detail.css" type="text/css" rel="Stylesheet" />
<link href="css/detail/product_right.css" type="text/css" rel="Stylesheet" />
</head>
<body>
<input type="hidden" id="itemIdUserMessage">
        <!--页面顶部! -->
        <header id="top">
            <div id="top_box">
                <img src="images/star.jpg" />
               <!--  <a href="#">收藏物尽其用</a> -->
		        <div class="rt">   
		            <ul>
			            <li>您好，欢迎来到二手书籍交易系统！<a href="/" >[登录]</a> <a href="javascript:register()">[免费注册]</a></li> 
			            <li><b></b><a href="userCenter" >我的订单</a></li> 
			           <!--  <li class="vip"><b></b><a href="#" >会员俱乐部</a></li> 
                        <li class="dakehu"><b></b><a href="#" >企业频道</a></li>  -->
<!-- <li class="app_jd">
	<b></b><a href="#" >手机京东</a>
	<div id="app_jd_items">
		<div class="app">
			<h3>京东客户端</h3>
			<a href="javascript:;" class="app"></a>
			<a href="javascript:;" class="android"></a>
		</div>
		<div class="bank">
			<h3>网银钱包客户端</h3>
				<a href="javascript:;" class="app"></a>
				<a href="javascript:;" class="android"></a>
		</div>
	</div>
</li> -->
<li class="service">
	<b></b><a> 客户服务</a>
	<ul id="service_items">
		<li><a href="#">帮助中心</a></li>
		<li><a href="#">售后服务</a></li>
		<li><a href="#">在线客服</a></li>
		<li><a href="#">投诉中心</a></li>
		<li><a href="#">客服邮箱</a></li>
	</ul>
</li> 
			            <li><b></b><a >网站导航</a></li> 
			        </ul> 
                </div>
            </div>
        </header>
        <!--LOGO和搜索框! -->
        <div id="top_main">
            <a href="#" class="lf"><img src="images/booktrade_logo.jpg" alt="LOGO" style="width:200px;"/></a>
            <div id="search_box" class="lf">
                <div class="search">
                    <input id="txtSearch" type="text" class="text" />
                    <input class="button" name="" type="button" value="搜索" />
                </div>
                <div class="hot_words">
                    <span>热门搜索：</span> <a href="#">家纺11月大促</a> <a href="#">彩虹电热毯</a> <a href="#">博洋家纺</a>
                    <a href="#">霞珍</a> <a href="#">床垫床褥</a> <a href="#">九洲鹿被子</a> <a href="#">南极人家纺</a>
                </div>
            </div>
            <!-- <div id="my_jd" class="lf">我的京东<b></b></div> -->
            <div id="settle_up" class="lf">去购物车结算<b></b></div>
        </div>
        <!--主导航-->
        <nav id="nav">
            <div id="category">
                <!-- <a href="#">全部商品分类</a>
                <b></b> -->
                <ul id="cate_box">
                    <li>
                        <h3>
                            <a href="#">图书</a>、<a href="#">音像</a>、<a href="#">数字商品</a>
                        </h3>
                        <div class="sub_cate_box">
                            <div class="sub_cate_items">
                                <div>
                                    <a href="#">电子书</a>
                                    <p>
                                        <a href="#">免费</a>
                                        <a href="#">小说</a>
                                        <a href="#">励志与成功</a>
                                        <a href="#">婚恋/两性</a>
                                        <a href="#">文学</a>
                                        <a href="#">经营</a>
                                        <a href="#">畅读VIP</a>
                                    </p>
                                </div>
                                <div>
                                    <a href="#">数字音乐</a>
                                    <p>
                                        <a href="#">通俗流行</a>
                                        <a href="#">古典音乐</a>
                                        <a href="#">摇滚说唱</a>
                                        <a href="#">爵士蓝调</a>
                                        <a href="#">乡村民谣</a>
                                        <a href="#">有声读物</a>
                                    </p>
                                </div>
                                <div>
                                    <a href="#">音像</a>
                                    <p>
                                        <a href="#">音乐</a>
                                        <a href="#">影视</a>
                                        <a href="#">教育音像</a>
                                        <a href="#">游戏</a>
                                    </p>
                                </div>
                                <div>
                                    <a href="#">文艺</a>
                                    <p>
                                        <a href="#">小说</a>
                                        <a href="#">文学</a>
                                        <a href="#">青春文学</a>
                                        <a href="#">传记</a>
                                        <a href="#">艺术</a>
                                    </p>
                                </div>
                            </div>
                            <div class="sub_cate_banner">
                                <div><img src="images/cate_banner_01.jpg" /></div>
                                <div><img src="images/cate_banner_02.jpg" /></div>
                                <div>
                                    <h4>推荐品牌出版商/书店</h4>
                                    <ul>
                                        <li><a href="#">中华书局</a></li>
                                        <li><a href="#">人民邮电出版社</a></li>
                                        <li><a href="#">上海世纪出版股份有限公司</a></li>
                                        <li><a href="#">电子工业出版社</a></li>
                                        <li><a href="#">三联书店</a></li>
                                        <li><a href="#">浙江少年儿童出版社</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="close">×</div>
                        </div>
                    </li>
                    <li>
                        <h3>
                            <a href="#">家用电器</a>
                        </h3>
                        <div class="sub_cate_box">
                            <div class="sub_cate_items">
                                <div><a href="javascript:;">大家电</a>
                                    <p><a href="javascript:;">家电爆品</a>
                                        <a href="javascript:;">平板电视</a>
                                        <a href="javascript:;">空调</a>
                                        <a href="javascript:;">冰箱</a>
                                        <a href="javascript:;">洗衣机</a>
                                        <a href="javascript:;">家庭影院</a>
                                        <a href="javascript:;">DVD</a>
                                        <a href="javascript:;">迷你音响</a>
                                        <a href="javascript:;">烟机/灶具</a>
                                        <a href="javascript:;">热水器</a>
                                        <a href="javascript:;">消毒柜/洗碗机</a>
                                        <a href="javascript:;">酒柜/冷柜</a>
                                        <a href="javascript:;">家电配件</a></p>
                                </div>
                                <div><a href="javascript:;">生活电器</a>
                                    <p><a href="javascript:;">取暖电器</a>
                                        <a href="javascript:;">净化器加湿器</a>
                                        <a href="javascript:;">扫地机器人</a>
                                        <a href="javascript:;">吸尘器</a></p>
                                </div>
                                <div><a href="javascript:;">厨房电器</a>
                                    <p><a href="javascript:;">电压力锅</a>
                                        <a href="javascript:;">电饭煲</a>
                                        <a href="javascript:;">豆浆机</a></p>
                                </div>
                                <div><a href="javascript:;">五金家电</a>
                                    <p><a href="javascript:;">电动工具</a>
                                        <a href="javascript:;">手动工具</a>
                                        <a href="javascript:;">仪器仪表</a>
                                        <a href="javascript:;">浴霸/排气扇</a>
                                        <a href="javascript:;">灯具</a>
                                        <a href="javascript:;">洁身器</a>
                                        <a href="javascript:;">LED灯</a>
                                        <a href="javascript:;">水槽</a>
                                        <a href="javascript:;">淋浴花洒</a>
                                        <a href="javascript:;">厨卫五金</a>
                                        <a href="javascript:;">家具五金</a>
                                        <a href="javascript:;">门铃</a>
                                        <a href="javascript:;">电气开关</a>
                                        <a href="javascript:;">插座</a>
                                        <a href="javascript:;">电工电料</a>
                                        <a href="javascript:;">监控安防</a>
                                        <a href="javascript:;">电线/线缆</a></p>
                                </div>
                            </div>
                            <div class="sub_cate_banner"></div>
                        </div>
                    </li>
                </ul>
            </div>
            <ul id="nav_items">
                <li><a href="index">首页</a></li>
                <!-- <li><a href="#">服装城</a></li>
                <li><a href="#">食品</a></li>
                <li><a href="#">团购</a></li>
                <li><a href="#">夺宝岛</a></li>
                <li><a href="#">闪购</a></li>
                <li><a href="#">金融</a></li> -->
            </ul>
        </nav>
        <!--主体内容! -->
        <section id="main" class="clear">
            <!--产品的类别导航路径-->
            <!-- <div class="bread-crumb">
                <a href="#"><b>家居家装</b></a>
                <a href="#">清洁用品</a>
                <span>&gt;</span>
                <a href="#">衣物清洁</a>
                <span>&gt;</span>
                <a href="#">卫新</a>
                <span>&gt;</span>
                <a href="#">卫新洗衣液</a>
            </div> -->

            <!--产品简介-->
            <div id="product_intro">
			<div id="preview">
				<div id="mediumDiv">
					<img id="mImg" src="images/product-s1-m.jpg"/>
					<div id="mask"></div>
					<div id="superMask"></div>
				</div>
				<div id="largeDiv"></div>
				<h1>
					<a class="backward_disabled"></a>
					<a class="forward"></a>
				<ul id="icon_list">
					<li><img src="images/products/product-s1.jpg" /></li>
					<li><img src="images/products/product-s2.jpg" /></li>
					<li><img src="images/products/product-s3.jpg" /></li>
					<li><img src="images/products/product-s4.jpg" /></li>
					<li><img src="images/products/product-s1.jpg" /></li>
					<li><img src="images/products/product-s2.jpg" /></li>
					<li><img src="images/products/product-s3.jpg" /></li>
					<li><img src="images/products/product-s4.jpg" /></li>
				</ul>
			</h1>
</div>
                <h1><span id="title">卫新 薰衣草洗衣液 4.26kg</span><!-- <b>与威露士一起巩固健康生活</b> --></h1>
                <ul id="summary">
                    <li id="summary_price">
                        <p>跳&nbsp;楼&nbsp;价：</p>
                        <div class="content" id="price">
                            <b>￥39.90</b>
                            <!-- <a href="#">(降价通知)</a> -->
                        </div>                        
                    </li>
                    <li id="summary_market">
                        <p class="title" >商品编号：</p>
                        <div class="content" id="itenNum">
                            <span>960148</span>
                        </div>
                    </li>
                    <!-- <li id="summary_grade">
                        <p>商品评分：</p>
                        <div class="content">
                            <span></span>
                            <a href="#">(已有<b>47662</b>人评价)</a>
                        </div>
                    </li> -->
                    <li id="summary_stock">
                        <p>配送至：</p>
                        <div class="content">
                            <!--送货地址的下拉选择框-->
                            <div id="store_select">
                                <div id="city_2">
				                    <select id="prov"></select> 
				                    <select id="city" disabled="disabled"></select>
				                    <select id="dist" disabled="disabled"></select>
				                </div>
                                <!--弹出部分-->
                                <!-- <div id="store_content">
                                    <ul id="store_tabs">
                                        <li class="hover">北京<b></b></li>
                                        <li >海淀区<b></b></li>
                                        <li >三环以内<b></b></li>
                                    </ul>
                                    <ul id="store_items">
                                        <li><a href="#">北京</a></li>
                                        <li><a href="#">上海</a></li>
                                        <li><a href="#">天津</a></li>
                                        <li><a href="#">重庆</a></li>
                                        <li><a href="#">河北</a></li>
                                        <li><a href="#">山西</a></li>
                                        <li><a href="#">河南</a></li>
                                        <li><a href="#">辽宁</a></li>
                                        <li><a href="#">吉林</a></li>
                                        <li><a href="#">黑龙江</a></li>
                                        <li><a href="#">内蒙古</a></li>
                                        <li><a href="#">江苏</a></li>
                                        <li><a href="#">山东</a></li>
                                        <li><a href="#">安徽</a></li>
                                        <li><a href="#">浙江</a></li>
                                        <li><a href="#">湖北</a></li>
                                        <li><a href="#">福建</a></li>
                                        <li><a href="#">四川</a></li>
                                        <li><a href="#">云南</a></li>
                                        <li><a href="#">新疆</a></li>
                                        <li><a href="#">西藏</a></li>
                                    </ul>
                                </div> -->
                                <div id="store_close"></div>
                            </div>
                            <b>有货</b>，23:00前完成下单，预计<b>明日（12月06日）</b>送达
                        </div>
                    </li>
                    <li id="summary_service">
                        <p>服&nbsp;&nbsp;务：</p>
                        <div class="content">
                            由 <span>物尽其用</span> 发货并提供售后服务
                        </div>
                    </li>
                </ul>
                 <ul id="choose">
                    <!--<li id="choose_color">
                        <p>选择颜色：</p>
                        <div class="content">
                            <a href="#" class="selected">
                                <img src="images\products\p_icon_01.jpg" />
                                <span>薰衣草</span>
                                <b></b>
                            </a>
                            <a href="#">
                                <img src="images\products\p_icon_02.jpg" />
                                <span>索菲亚玫瑰</span>
                                <b></b>
                            </a>
                        </div>
                    </li> -->
                    <li id="choose_amount">
                        <p>购买数量：</p>
                        <div class="content">
                            <a href="#" class="btn_reduce"></a>
                            <input type="text" value="1" />
                            <a href="#" class="btn_add"></a>
                            <button class="layui-btn layui-btn-big" id="addShopCart">加入购物车</button>
                        </div>
                    </li>
                    <li id="choose_btns" class="clear">
                    	
                        <a href="#" class="choose_btn_append"></a>
                        <a href="#" class="choose_mark"></a>
                    </li>
                </ul>
            </div>

            <!--左侧浮动栏-->
            <!-- <div id="left_product">
                相关分类
                <div id="related_sorts">
                    <p>相关分类</p>
                    <ul class="m_content">
                        <li><a href="#">纸品湿巾</a></li>
                        <li><a href="#">衣物清洁</a></li>
                        <li><a href="#">清洁工具</a></li>
                        <li><a href="#">驱虫用品</a></li>
                        <li><a href="#">家庭清洁</a></li>
                        <li><a href="#">皮具护理</a></li>
                        <li><a href="#">一次性用品</a></li>
                    </ul>
                </div>
 
                最终购买
                <div class="view_buy">
                    <p>浏览了该商品的用户最终购买</p>
                    <ul class="m_content">
                        <li>
                            <p><a href="#"><img src="images/products/p001.jpg" /></a></p>
                            <a href="#">卫新 护色洗衣液 2kg 袋装</a>
                            <h2><a href="#">￥22.90</a></h2>
                        </li>
                        <li>
                            <p><a href="#"><img src="images/products/p002.jpg" /></a></p>
                            <a href="#">卫新 护色洗衣液 2kg 袋装</a>
                            <h2><a href="#">￥39.90</a></h2>
                        </li>
                        <li>
                            <p><a href="#"><img src="images/products/p004.jpg" /></a></p>
                            <a href="#">卫新 护色洗衣液 2kg 袋装</a>
                            <h2><a href="#">￥69.90</a></h2>
                        </li>
                        <li class="no_bottom">
                            <p><a href="#"><img src="images/products/p005.jpg" /></a></p>
                            <a href="#">威露士（Walch）2kg+2kg洗衣液（有氧洗）特惠双袋组合装</a>
                            <h2><a href="#">￥39.90</a></h2>
                        </li>
                    </ul>
                </div>

                其他
                <ul id="left_shows">
                    <li>
                        <a><img src="images/products/left_p001.jpg" /></a>
                    </li>
                    <li>
                        <a><img src="images/products/left_p002.jpg" /></a>
                    </li>
                    <li>
                        <a><img src="images/products/left_p003.jpg" /></a>
                    </li>
                </ul>
            </div>
 -->
            <!--右侧产品信息-->
            <div id="right_product">
                <!--优惠套装-->
                <!-- <div id="favorable_suit">
                    <p class="main_tabs">优惠套装</p>
                    <div class="m_content">
                            <div class="master">    
                                <span class="add"></span>                                 
                                <a href="#"><img src="images/products/product_01_m.jpg" /></a>
                                <p><a href="#">卫新 薰衣草洗衣液 4.26kg</a></p>                                                                                           
                            </div>
                            <ul  class="suits">
                                <li >
                                    <span class="add"></span>
                                    <a href="#"><img src="images/products/product_02_m.jpg" /></a>
                                    <p><a href="#">卫新 去静电柔顺剂 清怡樱花袋装 500</a></p>
                                </li>
                                <li>
                                    <span class="add"></span>
                                    <a href="#"><img src="images/products/product_03_m.jpg" /></a>
                                    <p><a href="#">威露士（Walch） 手洗洗衣液单袋装 500ml</a></p>
                                </li>
                                <li>                                        
                                    <a href="#"><img src="images/products/product_04_m.jpg" /></a>
                                    <p><a href="#">威露士（Walch） 衣物家居消毒液 3</a></p>
                                </li>
                            </ul>
                            <div class="infos">
                                <span></span>
                                <h1><a href="#">威露士组合</a></h1>
                                <p>套装价：<b class="empasis">105.30</b></p>
                                <p>京东价：<b class="strike">142.40</b></p>
                                <p>立即节省：<b>37.10</b></p>
                                <div class="btns">
                                    <a href="#" class="btn_buy">购买套装</a>
                                </div>
                            </div>
                    </div>
                </div>  -->               

                <!--产品详细-->
                <div id="product_detail">
                    <!--页签-->
                    <ul class="main_tabs">
                        <li i='0' class="current"><a>商品介绍</a></li>
                        <!-- <li i='1'><a>规格参数</a></li>
                        <li i='2'><a>包装清单</a></li>
                        <li i='-1'><a>商品评价(43390)</a></li>
                        <li i='3'><a>售后保障</a></li> -->
                    </ul>                                      

                    <!--商品介绍-->
                    <div id="product_info" class="show">
                        <ul class="detail_list" id="itemShow">
                            <!-- <li>商品名称：卫新洗衣液</li>
					        <li>商品编号：1039778</li>
					        <li>品牌：<a href="#" target="_blank">卫新</a></li>
					        <li>上架时间：2014-01-23 16:28:06</li>
					        <li>商品毛重：4.55kg</li>
					        <li>商品产地：广东省从化市</li>
                            <li>类别：手洗洗衣液，机洗洗衣液</li>
                            <li>规格：3kg以上</li>
                            <li>香型：香味</li>          -->               
                        </ul>

                        <div class="detail_content" >
                            <!-- <p><a src="#"><img src="images/products/weilushi.jpg" /></a></p> -->
                            <div class="dotted_split" id="bookDetail"></div>
                            <div class="jd_split" >
                                <!-- <b>产品特色</b>
                                <span>Selling Point</span> -->
                            </div>
                           <!--  <p><a src="#"><img src="images/products/product_02.jpg" /></a></p>
                            <div class="dotted_split"></div>
                            <p><a src="#"><img src="images/products/product_03.jpg" /></a></p>
                            <div class="dotted_split"></div>
                            <div class="jd_split">
                                <b>适用范围</b>
                                <span>Heritage</span>
                            </div>
                            <p><a src="#"><img src="images/products/product_04.jpg" /></a></p>
                            <div class="dotted_split"></div>
                            <div class="jd_split">
                                <b>使用说明</b>
                                <span>Instructions</span>
                            </div>
                             <p><a src="#"><img src="images/products/product_05.jpg" /></a></p>                        -->
                        </div>
                    </div>                    
                   
                    <!--规格参数-->
                    <table id="product_data">
                        <thead>
                            <tr>
                                <th colspan="2">主体</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr></tr>
                            <tr>
                                <td>品牌</td>
                                <td>威露士（Walch）</td>
                            </tr>
                            <tr>
                                <td>类别</td>
                                <td>洗衣液</td>
                            </tr>
                            <tr>
                                <td>产品规格（ml/kg）</td>
                                <td>4.26kg</td>
                            </tr>
                            <tr>
                                <td>产品包装尺寸（cm）</td>
                                <td>254*117*326</td>
                            </tr>
                            <tr>
                                <td>香型</td>
                                <td>薰衣草</td>
                            </tr>
                        </tbody>
                    </table>

                    <!--包装清单-->
                    <div id="product_package">
                        <p>卫新 薰衣草洗衣液 4.26kg*1</p>
                    </div>

                    <!--售后保障-->
                    <div id="product_saleAfter">
                        <p>本产品全国联保，享受三包服务，质保期为：无质保</p>
                    </div>
                </div>

                <!--服务承诺-->
                <div id="promise">
                    <b>服务承诺：</b>
                    <p>物尽其用向您保证所售商品均为正品行货，物尽其用自营商品开具机打发票或电子发票。凭质保证书及物尽其用发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由物尽其用联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。物尽其用还为您提供具有竞争力的商品价格和运费政策，请您放心购买！ </p>
                    <p>注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！</p>
                </div>

                <!--权力声明-->
                <div id="state">
                    <span>权利声明：</span>
                    <p>物尽其用上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是物尽其用重要的经营资源，未经许可，禁止非法转载使用。</p>
                    <p><b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>
                </div>   
                
                <!--商品评价-->
                <!-- <div id="comment">
                    <p class="main_tabs">商品评价</p>
                    <div class="m_content">
                        <div class="rate">
                            <span>97</span><b>%</b>
                            <p>好评度</p>
                        </div>
                        <div class="percent">
                            <dl>
                                <dt>好评(<span>97%</span>)</dt>
                                <dd><p style="width:97px;"></p></dd>
                            </dl>
                            <dl>
                                <dt>中评(<span>2%</span>)</dt>
                                <dd><p style="width:2px;"></p></dd>
                            </dl>
                            <dl>
                                <dt>差评(<span>1%</span>)</dt>
                                <dd><p style="width:1px;"></p></dd>
                            </dl>
                        </div>
                        <div class="buyers">
                            <p>买家印象：</p>
                            <ul>
                                <li>比超市便宜<span>(8450)</span></li>
                                <li>味道不错<span>(6931)</span></li>
                                <li>质量不错<span>(5034)</span></li>
                                <li>洗衣效果好<span>(5003)</span></li>
                                <li>洗涤效果好<span>(4834)</span></li>
                                <li>洗衣服干净<span>(4712)</span></li>
                            </ul>
                        </div>
                        <div class="btns">
                            您可对已购商品进行评价
                            <a class="btn_comment" href="#">发评价拿京豆</a>
                        </div>
                    </div>
                </div> -->

                <!--评价详细-->
                <!-- <div id="comment_list">
                    <ul class="main_tabs">
                        <li class="current"><a href="#">全部评价(49639)</a></li>
                        <li><a href="#">好评(48232)</a></li>
                        <li><a href="#">中评(992)</a></li>
                        <li><a href="#">差评(415)</a></li>
                        <li><a href="#">有晒单的评价(962)</a></li>
                    </ul>
                    全部评价
                    <div id="comment_0" >
                        <div class="comment_item" >
                            <ul>
                                <li><a href="#"><img src="images/user_01.jpg" /></a></li>
                                <li>kkngj2008 </li>
                                <li><b>金牌会员</b><span>广东</span></li>
                            </ul>
                            <div>
                                <div class="topic">
                                    <p class="star3"></p>
                                    <a href="#">2014-08-12 19:01</a>
                                </div>
                                <table>
                                    <tr>
                                        <td>标签：</td>
                                        <td class="comment_tag">
                                            <span>比洗衣粉好</span>
                                            <span>去污能力强</span>
                                        </td>                                    
                                    </tr>
                                    <tr>
                                        <td>心得：</td>
                                        <td>味道清香..价格也比较公道</td>
                                    </tr>
                                    <tr>
                                        <td>用户晒单：</td>
                                        <td class="comment_show">
                                            <a href="#"><img src="images/products/show_01.jpg"/></a>
                                            <a href="#"><img src="images/products/show_02.jpg"/></a>
                                            <a href="#"><img src="images/products/show_03.jpg"/></a>
                                            共<b>3</b>张图片<a href="#">查看晒单&gt;</a>                                  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>购买日期：</td>
                                        <td>2014-08-11</td>
                                    </tr>
                                </table>
                                <p class="btns">
                                    <a href="#">有用(3)</a>
                                    <a href="#">回复(0)</a>
                                </p>
                            </div>
                            <div class="corner"></div>
                        </div>
                        <div class="comment_item" >
                            <ul>
                                <li><a href="#"><img src="images/user_01.jpg" /></a></li>
                                <li>kkngj2008 </li>
                                <li><b>金牌会员</b><span>广东</span></li>
                            </ul>
                            <div>
                                <div class="topic">
                                    <p class="star4"></p>
                                    <a href="#">2014-08-12 19:01</a>
                                </div>
                                <table>
                                    <tr>
                                        <td>标签：</td>
                                        <td class="comment_tag">
                                            <span>比洗衣粉好</span>
                                            <span>去污能力强</span>
                                        </td>                                    
                                    </tr>
                                    <tr>
                                        <td>心得：</td>
                                        <td>味道清香..价格也比较公道</td>
                                    </tr>
                                    <tr>
                                        <td>用户晒单：</td>
                                        <td class="comment_show">
                                            <a href="#"><img src="images/products/show_01.jpg"/></a>
                                            <a href="#"><img src="images/products/show_02.jpg"/></a>
                                            <a href="#"><img src="images/products/show_03.jpg"/></a>
                                            共<b>3</b>张图片<a href="#">查看晒单&gt;</a>                                  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>购买日期：</td>
                                        <td>2014-08-11</td>
                                    </tr>
                                </table>
                                <p class="btns">
                                    <a href="#">有用(3)</a>
                                    <a href="#">回复(0)</a>
                                </p>
                            </div>
                            <div class="corner"></div>
                        </div>
                    </div>
                    可能还会有其他评论分类：比如“好评”等
                    页码
                    <div>
                        <a class="comment_show_all" href="#">[查看全部评价]</a>
                        <div id="pages">
                            <a class="current">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">....</a>
                            <a href="#">3421</a>
                            <a href="#">下一页</a>
                        </div>
                    </div>
                </div>
 -->
                <!--咨询-->
                <!-- <div id="consult" class="clear">
                    <ul class="main_tabs">
                        <li class="current"><a href="#">全部购买咨询</a></li>
                        <li><a href="#">商品咨询</a></li>
                        <li><a href="#">库存配送</a></li>
                        <li><a href="#">支付</a></li>
                        <li><a href="#">发票保修</a></li>
                        <li><a href="#">支付帮助</a></li>
                        <li><a href="#">配送帮助</a></li>
                        <li><a href="#">常见问题</a></li>
                        <li>
                            <input type="text" id="txt_consult_search" value="请输入关键词" />
                            <input type="button" value="搜索"  id="btn_consult_search" />
                        </li>
                        <li>
                            <a id="add_consult" href="#">发表咨询</a>
                        </li>
                    </ul>
                    <div class="m_content">
                        <b>温馨提示：</b>因厂家更改产品包装、产地或者更换随机附件等没有任何提前通知，且每位咨询者购买情况、提问时间等不同，为此以下回复仅对提问者3天内有效，其他网友仅供参考！<br />若由此给您带来不便请多多谅解，谢谢！
                    </div>
                    <div id="consult_0">
                        <div id="consult_result">
                            <p>共搜索到<span>14</span>条相关咨询<a>返回</a></p>
                            <h4>声明：以下回复仅对提问者3天内有效，其他网友仅供参考！</h4>
                        </div>
                        <div class="consult_item">
                            <p>网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;友：<b>135*****193_p</b><span>2014-11-23 12:27:13</span></p>
                            <ul class="consult_ask">
                                <li class="consult_title">咨询内容：</li>
                                <li><a href="#">怎么买呀？</a></li>
                            </ul>
                            <ul class="consult_answer">
                                <li class="consult_title">京东回复：</li>
                                <li>您好！请您于京东客服联系。感谢您对京东的支持！祝您购物愉快！</li>
                                <li class="consult_answer_time">2014-11-24 15:25:59</li>
                            </ul>                            
                        </div>
                        <div class="consult_item">
                            <p>网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;友：<b>jd_158998lub</b><span>2014-11-11 14:19:00</span></p>
                            <ul class="consult_ask">
                                <li class="consult_title">咨询内容：</li>
                                <li><a href="#">请问一箱里面装几瓶?</a></li>
                            </ul>
                            <ul class="consult_answer">
                                <li class="consult_title">京东回复：</li>
                                <li>您好！4瓶/箱， 感谢您对京东的支持！祝您购物愉快！</li>
                                <li class="consult_answer_time">2014-11-11 16:44:06</li>
                            </ul>                            
                        </div>
                        <div class="consult_item">
                            <p>网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;友：<b>jd_158998lub</b><span>2014-11-11 14:19:00</span></p>
                            <ul class="consult_ask">
                                <li class="consult_title">咨询内容：</li>
                                <li><a href="#">请问一箱里面装几瓶?</a></li>
                            </ul>
                            <ul class="consult_answer">
                                <li class="consult_title">京东回复：</li>
                                <li>您好！4瓶/箱， 感谢您对京东的支持！祝您购物愉快！</li>
                                <li class="consult_answer_time">2014-11-11 16:44:06</li>
                            </ul>                            
                        </div>
                    </div>
                    <div id="consult_extra">
                        购买之前，如有问题，请咨询<a class="offline" href="#">留言咨询</a>，或<a href="#"> [发表咨询]</a>
                        <p>共<span>101</span>条   <a href="#">浏览所有咨询信息&gt;&gt;</a></p>
                    </div>
                </div> -->

                <!--讨论-->
                <div id="discuss">
                    <ul class="main_tabs">
                        <li class="current"><a href="javascript:void(0)" onclick='addMessage()'>留言</a></li>
                        <!-- <li><a href="#">晒单帖</a></li>
                        <li><a href="#">讨论帖</a></li>
                        <li><a href="#">问答贴</a></li>
                        <li><a href="#">圈子贴</a></li> -->
                    </ul>                    
                    <table id="discuss-datas">
                        <tr class="header">
                            <td class="col1">主题</td>
                            <td class="col2">回复/浏览</td>
                            <td class="col3">作者</td>
                            <td class="col4">时间</td>
                        </tr>
                        <tbody id="messageData">
                            <tr>
                                <td class="col1">
                                    <b class="topic shai"></b>
                                    <a href="#">好大一瓶，不错</a>
                                </td>
                                <td>0/0</td>
                                <td>
                                    <a href="#">2001年冬天</a>
                                </td>
                                <td>2014-11-19</td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <b class="topic lun"></b>
                                    <a href="#">洗衣液超级划算，活动给力</a>
                                </td>
                                <td>0/0</td>
                                <td>
                                    <a href="#">xpx2001</a>
                                </td>
                                <td>2014-11-18</td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <b class="topic lun"></b>
                                    <a href="#">洗衣液超级划算，活动给力</a>
                                </td>
                                <td>0/0</td>
                                <td>
                                    <a href="#">xpx2001</a>
                                </td>
                                <td>2014-11-18</td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <b class="topic shai"></b>
                                    <a href="#">好大一瓶，不错</a>
                                </td>
                                <td>0/0</td>
                                <td>
                                    <a href="#">2001年冬天</a>
                                </td>
                                <td>2014-11-19</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="discuss_extra">
                        <div class="newdiscuss">
                                <span>有问题要与其他用户讨论？</span>
                                <a href="#" >[发表帖子]</a>
                        </div>
                        <div class="totaldiscuss">
                            <span>共900个话题</span>
                            <a href="#">浏览全部话题&gt;&gt;</a>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!--最近浏览-->
        <!-- <footer id="recent_view">
            <p>
                <span class="lf">最近浏览</span>
                <b class="rt">更多浏览记录</b>
            </p>
            <ul>
                <li>
                    <div><a href="#"><img src="images/products/p_small_001.jpg" /></a></div>
                    <h6>￥49.90</h6>
                </li>
                    <li>
                    <div><a href="#"><img src="images/products/p_small_002.jpg" /></a></div>
                    <h6>￥49.90</h6>
                </li>                                   
                <li>
                    <div><a href="#"><img src="images/products/p_small_003.jpg" /></a></div>
                    <h6>￥49.90</h6>
                </li>
                <li>
                    <div><a href="#"><img src="images/products/p_small_004.jpg" /></a></div>
                    <h6>￥49.90</h6>
                </li>
                    <li>
                    <div><a href="#"><img src="images/products/p_small_005.jpg" /></a></div>
                    <h6>￥49.90</h6>
                </li>                                       
                    <li>
                    <div><a href="#"><img src="images/products/p_small_006.jpg" /></a></div>
                    <h6>￥49.90</h6>
                </li>
                <li>
                    <div><a href="#"><img src="images/products/p_small_007.jpg" /></a></div>
                    <h6>￥49.90</h6>
                </li>
                    <li>
                    <div><a href="#"><img src="images/products/p_small_008.jpg" /></a></div>
                    <h6>￥49.90</h6>
                </li>            
                <li>
                    <div><a href="#"><img src="images/products/p_small_009.jpg" /></a></div>
                    <h6>￥49.90</h6>
                </li>
            </ul>
        </footer> -->
        <!--购物指南、配送方式等! -->
        <footer id="foot_box">
            <p class="shopping_guide"></p>
            <ul>
                <li><b>购物指南</b></li>
                <li><a href="#">购物流程</a></li>
                <li><a href="#">会员介绍</a></li>
                <li><a href="#">团购/机票</a></li>
                <li><a href="#">常见问题</a></li>
                <li><a href="#">大家电</a></li>
                <li><a href="#">联系客服</a></li>
            </ul>
	        <p class="send_type"></p>
            <ul>
                <li><b>配送方式</b></li>
                <li><a href="#">上门自提</a></li>
                <li><a href="#">211限时达</a></li>
                <li><a href="#">配送服务查询</a></li>
                <li><a href="#">配送费收取标准</a></li>
                <li><a href="#">海外配送</a></li>
            </ul>
	        <p class="pay_type"></p>
            <ul>
                <li><b>支付方式</b></li>
                <li><a href="#">货到付款</a></li>
                <li><a href="#">在线支付</a></li>
                <li><a href="#">分期付款</a></li>
                <li><a href="#">邮局汇款</a></li>
                <li><a href="#">公司转账</a></li>
            </ul>
	        <p class="sale_service"></p>
            <ul>
                <li><b>售后服务</b></li>
                <li><a href="#">售后政策</a></li>
                <li> <a href="#">价格保护</a></li>
                <li><a href="#">退款说明</a></li>
                <li><a href="#">返修/退换货</a></li>
                <li><a href="#">取消订单</a></li>
            </ul>
	        <p class="special_service"></p>
            <ul>
                <li><b>特色服务</b></li>
                <li><a href="#">夺宝岛</a></li>
                <li><a href="#">DIY装机</a></li>
                <li><a href="#">延保服务</a></li>
                <li><a href="#">京东E卡</a></li>
                <li> <a href="#">节能补贴</a></li>
                <li> <a href="#">京东通信</a></li>
            </ul>
        </footer>
        <!--页面底部! -->
        <footer id="footer">
            <div class="links"><a href="#">关于我们</a>|<a href="#">联系我们</a>|<a href="#">广告服务</a>|<a href="#">友情链接</a></div>
		    <!-- <div class="copyright">北京市公安局朝阳分局备案编号110105014669  |  京ICP证070359号  |  互联网药品信息服务资格证编号(京)-非经营性-2011-0034<br />
			    <a href="#">音像制品经营许可证苏宿批005号 </a> |  出版物经营许可证编号新出发(苏)批字第N-012号  |  互联网出版许可证编号新出网证(京)字150号<br />
			    <a href="#">网络文化经营许可证京网文[2011]0168-061号 </a> Copyright © 2004-2014 京东JD.com 版权所有 <br />
                京东旗下网站：
                <a href="#">English Site</a> <a href="#">拍拍网</a> <a href="#">网银在线</a>
            </div>
		    <div class="authentication">
                <a href=""><img src="images/jy.jpg" width="108" height="40" /></a>
                <a href=""><img src="images/kx.jpg" width="108" height="40" /></a>
                <a href=""><img src="images/cy.jpg" width="108" height="40" /></a>
                <a href=""><img src="images/cx.jpg" width="112" height="40" /></a>
            </div> -->
        </footer>
      <script src="js/jquery-1.11.3.js"></script>
      <script src="js/jd_detail.js"></script>
      <%-- <%@include file="public/commonLayerUIForm.jsp" %> --%>
	  <script src="/js/booktrade_detail.js"></script>
	  <script src="/js/jquery.cityselect.js"></script>
      <script src="/js/login.js"></script>
      <script src="/js/commons/latool.js"></script>
    </body>
</html>
