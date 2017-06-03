<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <title>二手书籍交易系统-首页</title>
        <meta charset="utf-8" />
        <%@include file="public/commonLayerUIForm.jsp" %>
        <link rel="icon" href="/images/favicon.ico">
        <link href="/css/index/common.css" rel="Stylesheet" />
        <link href="/css/index/index.css" rel="Stylesheet" />
        <link href="/css/index/animation.css" rel="Stylesheet" />
		<script src="/js/booktrade_index.js"></script>
       <script src="/js/login.js"></script>
       <link href="/js/res/bootstrap1.min.css" rel="stylesheet" type="text/css" />
	    <script src="/js/res/jqPaginator.min.js" type="text/javascript"></script>
	    <link href="/js/res/myPage.css" rel="stylesheet" type="text/css" />
       <!-- <script src="js/jquery-1.11.3.js"></script> -->
		<script src="js/jd_index.js"></script>
    </head>
    <body>
    <input type="hidden" id="whrx">
    <input type="hidden" id="yccatid">
        <!--页面顶部! -->
        <header id="top">
            <div id="top_box">
                <img src="images/index/star.jpg" />
               <!--  <a href="#">收藏京东</a> -->
		        <div class="rt">   
		            <ul>
			            <li>您好，欢迎来到二手书交易系统！<a href="/" >[登录]</a> <a href="javascript:register()" >[免费注册]</a></li> 
			            <li><b></b><a href="userCenter" >我的订单</a></li> 
			            <!-- <li class="vip"><b></b><a href="#" >会员俱乐部</a></li> 
                        <li class="dakehu"><b></b><a href="#" >企业频道</a></li> 
			            <li class="app_jd"><b></b><a href="#" >手机京东</a></li> 
                        <li class="service"><b></b><a>客户服务</a></li>
			            <li><b></b><a >网站导航</a></li>  -->
			        </ul> 
                </div>
            </div>
        </header>
        <!--LOGO和搜索框! -->
        <div id="top_main">
        <a href="#" class="lf">
            <img src="images/booktrade_logo.jpg" alt="LOGO" style="height:40px;width:300px;"/></a>
        <div id="search_box" class="lf">
            <div class="search">
                <input id="txtSearch" type="text" class="text" />
                <input class="button" name="" type="button" id="searchButton" value="搜索" />
            </div>
            <!-- <div class="hot_words">
                <span>热门搜索：</span> <a href="#">家纺11月大促</a> <a href="#">彩虹电热毯</a> <a href="#">博洋家纺</a>
                <a href="#">霞珍</a> <a href="#">床垫床褥</a> <a href="#">九洲鹿被子</a> <a href="#">南极人家纺</a>
            </div> -->
        </div>
        <!-- <div id="my_jd" class="lf">
            我的京东<b></b></div> -->
        <div id="settle_up" class="lf">
            去购物车结算<b></b></div>
    </div>
        <!--主导航 -->
        <nav id="nav">
            <div id="category">
                <a href="#">全部书籍分类</a>
                <b></b>
            </div>
            <!-- <div style="margin-top:3%">
			 <ul id="tree"></ul>
			  <div id="mm" class="easyui-menu" style="width: 120px;">
			      <div onclick="append()" iconcls="icon-add">
			          添加节点</div>
			      <div onclick="remove()" iconcls="icon-remove">
			          删除节点</div>
			      <div onclick="update()" iconcls="icon-edit">修改节点</div>
			  </div>
			  </div> -->
            	
                <!-- <li><a href="#">首页</a></li>
                <li><a href="#">服装城</a></li>
                <li><a href="#">食品</a></li>
                <li><a href="#">团购</a></li>
                <li><a href="#">夺宝岛</a></li>
                <li><a href="#">闪购</a></li>
                <li><a href="#">金融</a></li> -->
        </nav>
    <!--banner部分-->
    <article id="banner">
            <ul id="cate_box">
                <!-- <ul class="layui-nav layui-nav-tree" lay-filter="test">
				侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side">
			  <li class="layui-nav-item layui-nav-itemed">
			    <a href="javascript:;">默认展开</a>
			    <dl class="layui-nav-child">
			      <dd><a href="javascript:;">选项1</a></dd>
			      <dd><a href="javascript:;">选项2</a></dd>
			      <dd><a href="">跳转</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item">
			    <a href="javascript:;">解决方案</a>
			    <dl class="layui-nav-child">
			      <dd><a href="">移动模块</a></dd>
			      <dd><a href="">后台模版</a></dd>
			      <dd><a href="">电商平台</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item"><a href="">产品</a></li>
			  <li class="layui-nav-item"><a href="">大数据</a></li>
			</ul> -->
                    <!-- <h3>
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
                            <div><img src="images/index/cate_banner_01.jpg" /></div>
                            <div><img src="images/index/cate_banner_02.jpg" /></div>
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
                </li>-->
            </ul> 
            <div id="slider_box">
<div id="slider">
	<ul id="imgs">
	</ul>
    <ul id="indexs">
    </ul>
</div>
                <div class="ad" id="hotSearch" style="height:390px;">
                    <!-- <span class="preview"><a href="#"></a></span> -->
                    <ul>
                      <li><a href="#"><img src="images/index/index/ad_01.jpg"></a></li>
                      <li><a href="#"><img src="images/index/index/ad_02.jpg"></a></li>
                      <li class="li_last"><a href="#"><img src="images/index/index/ad_03.jpg"></a></li>
                    </ul>
                    <ul>
                      <li><a href="#"><img src="images/index/index/ad_01.jpg"></a></li>
                      <li><a href="#"><img src="images/index/index/ad_02.jpg"></a></li>
                      <li class="li_last"><a href="#"><img src="images/index/index/ad_03.jpg"></a></li>
                    </ul>
                    <!-- <span class="next"><a href="#"></a></span> -->
                </div>
            </div>
            <div id="focus_extra">
                <div class="ad"><a href="#"><img src="images/index/index/ad_focus.jpg" /></a></div>
                <div id="news">
                    <div class="title">
                        <span>系统公告</span>
                        <a href="#">更多公告&nbsp;&gt;</a>
                    </div>
                    <div class="context" id="context">
                        <ul class="lf">
                            <li><a href="#">松鼠好年货2折开抢！</a></li>
                            <li><a href="#">名酒春晚 茅台888</a></li>
                            <li><a href="#">四国鲜花定制款低至5折</a></li>
                            <li><a href="#">家居年货大采购 低至9.9</a></li>
                        </ul>
                        <ul class="lf">
                            <li><a href="#">松鼠好年货2折开抢！</a></li>
                            <li><a href="#">名酒春晚 茅台888</a></li>
                            <li><a href="#">四国鲜花定制款低至5折</a></li>
                            <li><a href="#">家居年货大采购 低至9.9</a></li>
                        </ul>
                        <ul class="lf">
                            <li><a href="#">松鼠好年货2折开抢！</a></li>
                            <li><a href="#">名酒春晚 茅台888</a></li>
                            <li><a href="#">四国鲜花定制款低至5折</a></li>
                            <li><a href="#">家居年货大采购 低至9.9</a></li>
                        </ul>
                    </div>
                 </div>
               <!--  <div id="virtuals">
                    <ul>
                        <li id="huafei"><a href="#"><s></s>话费<i></i></a></li>
                        <li id="jipiao"><a><s></s>机票<i></i></a></li>
                        <li id="caipiao"><a><s></s>彩票<i></i></a></li>
                        <li id="youxi"><a href="#"><s></s>游戏<i></i></a></li>
                        <li id="lvxing"><a href="#"><s></s>旅行</a></li>
                        <li id="dianyingpiao"><a href="#"><s></s>电影票</a></li>
                        <li id="licai"><a href="#"><s></s>理财</a></li>
                        <li id="shuidianmei"><a href="#"><s></s>水电煤</a></li>
                    </ul>
                  </div> -->
            </div>
        </article>
        <!--主体内容! -->
        <section id="main" class="clear">
             <!--广告-->
            <!--<div id="show_box">
                <p>生活的橱窗<span>每一天展示精彩！</span></p>
                <ul>
                    <li class="pinpaijie">
                        <b></b>
                        <div>
                            <h3>品牌街</h3>
                            <h4>三星note</h4>
                            <p>赠500京东E卡</p>
                            <ul>
                                <li><i></i>更多品牌</li>
                                <li><i></i>进入品牌街</li>
                            </ul>
                        </div>                    
                    </li>
                    <li class="dijia">
                        <b></b>
                        <div>
                            <h3>天天低价</h3>
                            <h4>坚果礼盒</h4>
                            <span>95.8 元秒杀</span>
                        </div>                    
                    </li>
                    <li class="haodongxi">
                        <b></b>
                        <div>
                            <h3>好东西</h3>
                            <h4>罗技蓝牙键盘</h4>
                            <p>舒适键入249</p>
                            <ul>
                                <li><i></i>键鼠送红包</li>
                                <li><i></i>逛更多&gt;&gt;</li>
                            </ul>
                        </div>                    
                    </li>
                    <li class="tuangou">
                        <b></b>
                        <div>
                            <h3>今日团购</h3>
                            <h4>100元代金券</h4>
                            <div>
                                团购价<span>￥89</span>
                            </div>
                        </div>                    
                    </li>
                    <li class="shoufa">
                        <b></b>
                        <div>
                            <h3>京东首发</h3>
                            <h4>MOTO X</h4>
                            <span>强势回归现货抢</span>
                        </div>                    
                    </li>
                    <li class="youhuiquan">
                        <b></b>
                        <div>
                            <h3>优惠券</h3>
                            <h4>意尔康男鞋</h4>
                            <p>百元神券限量送</p>
                        </div>                    
                    </li>
                    <li class="yushou">
                        <b></b>
                        <div>
                            <h3>京东预售</h3>
                            <h4>磁带蓝牙音箱</h4>
                            <span>送小米手环</span>
                        </div>                    
                    </li>
                    <li class="jinrong">
                        <b></b>
                        <div>
                            <h3>金融精选</h3>
                            <h4>打白条0元购</h4>
                            <p>iPhone 6分期购</p>
                        </div>                    
                    </li>
                </ul>
            </div> -->
            
            <ul id="ad_box" class="clear">
                <li><a href="#"><img src="images/index/index/ad_small_01.jpg" /></a></li>
                <li><a href="#"><img src="images/index/index/ad_small_02.jpg" /></a></li>
                <li class="last"><a href="#"><img src="images/index/index/ad_small_03.jpg" /></a></li>
            </ul>
           <!--  <div class="elevator" id="elevator">
                <ul>
                    <li class="handler">
                        <a href="javascript:;">1F</a>
                        <a class="etitle" href="javascript:;">家电通讯</a>
                    </li>
                    <li class="handler">
                        <a href="javascript:;">2F</a>
                        <a class="etitle" href="javascript:;">个护美妆</a>
                    </li>
                    <li class="handler">
                        <a href="javascript:;">3F</a>
                        <a class="etitle" href="javascript:;">居家生活</a>
                    </li>
                </ul>
            </div> -->
            <!--第一楼-->
            <div class="floor" id="f1">
                <!--头部-->
                <header>
                    <!-- <span>1F</span>
                    <p>家电通讯</p> -->
                    <!-- <ul class="tab">
                        <li><a href="＃">特价商品</a></li>
                        <li><a href="＃">大家电</a></li>
                        <li><a href="＃">小家电</a></li>
                        <li><a href="＃">手机通讯</a></li>
                        <li><a href="＃">汽车五金</a></li>
                    </ul> -->
                    <!-- <ul class="link">
                        <li><a href="#">大家电配送</a></li>
                        <li><a href="#">合约计划说明</a></li>
                    </ul> -->
                </header>
                 <!--左侧-->
                <!--<aside>
                    <ul>
                        <li><a href="#">手机</a></li>
                        <li><a href="#">空调</a></li>
                        <li><a href="#">手机配件</a></li>
                        <li><a href="#">平板电视</a></li>
                        <li><a href="#">话费补贴</a></li>
                        <li><a href="#">冰箱</a></li>
                        <li><a href="#">生活电器</a></li>
                        <li><a href="#">洗衣机</a></li>
                        <li><a href="#">厨房电器</a></li>
                        <li><a href="#">热水器</a></li>
                        <li><a href="#">个护健康</a></li>
                        <li><a href="#">烟机/灶具</a></li>
                        <li><a href="#">五金家装</a></li>
                        <li><a href="#">家庭影院</a></li>
                        <li><a href="#">冰柜/冰吧</a></li>
                        <li><a href="#">汽车用品</a></li>
                    </ul>
                    <span><img src="images/index/index/fl_01.jpg" /></span>
                </aside> -->
                <!--中间栏-->
                <section style="width:100%;margin-left:10%" id="content">
                    <!-- <dl>
                        <dt><img src="images/index/index/fl_dl_01.jpg"></dt>
                        <dd><a href="#">48英寸智能电视2499,55英寸智能电视3499</a></dd>
                        <dd><b>送澳门风云2电影票</b></dd>
                    </dl>
                    <dl>
                        <dt><img src="images/index/index/fl_dl_01.jpg"></dt>
                        <dd><a href="#">48英寸智能电视2499,55英寸智能电视3499</a></dd>
                        <dd><b>送澳门风云2电影票</b></dd>
                    </dl>
                    <div><a href="#"><img src="images/index/index/fl_ad_01.jpg" width="473" height="180"></a></div>
                    <dl>
                        <dt><img src="images/index/index/fl_dl_02.jpg"></dt>
                        <dd><a href="#">moto新品首发</a></dd>
                        <dd><b>2月5日10:30抢</b></dd>
                    </dl>
                    <dl>
                        <dt><img src="images/index/index/fl_dl_03.jpg"></dt>
                        <dd><a href="#">小家电--加一元即享买一赠一</a></dd>
                        <dd><b>另有疯狂加价购</b></dd>
                    </dl>
                    <dl>
                        <dt><img src="images/index/index/fl_dl_04.jpg"></dt>
                        <dd><a href="#">大神 X7 现货开抢！</a></dd>
                        <dd><b>￥<span>1699</span>.00</b></dd>
                    </dl>
                    <dl>
                        <dt><img src="images/index/index/fl_dl_05.jpg"></dt>
                        <dd><a href="#">大家电-年前收货！全场狂降!</a></dd>
                        <dd><b>7kg洗衣机998元秒杀</b></dd>
                    </dl>
                    <dl>
                        <dt><img src="images/index/index/fl_dl_06.jpg"></dt>
                        <dd><a href="#">这就是范儿！有范儿才有未来！</a></dd>                       
                    </dl>
                    <dl>
                        <dt><img src="images/index/index/fl_dl_07.jpg"></dt>
                        <dd><a href="#">回家路上，车品护航</a></dd>
                        <dd><b>年底大放血！</b></dd>
                    </dl>
                    <dl>
                        <dt><img src="images/index/index/fl_dl_01.jpg"></dt>
                        <dd><a href="#">48英寸智能电视2499,55英寸智能电视3499</a></dd>
                        <dd><b>送澳门风云2电影票</b></dd>
                    </dl>
                    <dl>
                        <dt><img src="images/index/index/fl_dl_01.jpg"></dt>
                        <dd><a href="#">48英寸智能电视2499,55英寸智能电视3499</a></dd>
                        <dd><b>送澳门风云2电影票</b></dd>
                    </dl>
                    <dl>
                        <dt><img src="images/index/index/fl_dl_01.jpg"></dt>
                        <dd><a href="#">48英寸智能电视2499,55英寸智能电视3499</a></dd>
                        <dd><b>送澳门风云2电影票</b></dd>
                    </dl> -->
                </section>
                <form id="form1" runat="server">
			    <div>
			    </div>
			    <div>
			        <ul class="pagination" id="pagination" style="margin-left:10%;">
			        </ul>
			        <input type="hidden" id="PageCount" runat="server" value="800"/>
			        <input type="hidden" id="PageSize" runat="server" value="8" />
			        <input type="hidden" id="countindex" runat="server" value="10"/>
			        <input type="hidden" id="visiblePages" runat="server" value="21" />
			    </div>
			    </form>         
               	 <!-- 右侧栏   -->         
                <!-- <aside class="floor_right">
                    <ul>
                        <li><img src="images/index/index/rBEQWVFQLqgIAAAAAAAFbgvhBqMAAC0MAP_3cIAAAWG414.gif" /></li>
                        <li><img src="images/index/index/537b3138N3205302e.jpg" /></li>
                        <li><img src="images/index/index/53829f6eNa98427dc.jpg" /></li>
                        <li><img src="images/index/index/rBEhUlHmCN0IAAAAAAASpGQ8IDYAABK2AP_yHEAABK8207.jpg" /></li>
                        <li><img src="images/index/index/537b316bN35574fff.jpg" /></li>
                        <li><img src="images/index/index/54caf3a2N56357d7c.jpg" /></li>
                        <li><img src="images/index/index/537b3173Ne74bf3cf.jpg" /></li>
                        <li><img src="images/index/index/537b3152Nf0573a0d.jpg" /></li>
                        <li><img src="images/index/index/537b3130N7591211b.jpg" /></li>
                        <li><img src="images/index/index/rBEbRlN5zCsIAAAAAAALfFfJRv8AACGGgO__3sAAAuU660.jpg" /></li>
                    </ul>
                    <a href="#"><img src="images/index/index/fl_ad_02.jpg"></a>
                </aside> -->
            </div>

           
            <!--其他部分-->
           <!--  <div id="content_other">
                <div class="share">
                    <p>热门晒单</p>
                    <ul>
                        <li>
                            <i class="shai"></i>
                            <a href="#"><img src="images/index/index/share_01.jpg" /></a>
                            <h3><a href="#">咔哟YOYO4.0蓝牙音箱低音炮立体声音响</a></h3>
                            <p><a href="#">音质还可以，不错的，很小，很大声，很好看。</a></p>
                        </li>
                        <li>
                            <i class="hot"></i>
                            <a href="#"><img src="images/index/index/share_02.jpg" /></a>
                            <h3><a href="#">[晒单帖]出乎意料的京东，神奇的泰福高焖烧壶</a></h3>
                            <p><a href="#">昨天晚上在京东10点下单的，今天中午就送到了，京东的快递哥实在神速呀！而且态度非常好，还确认了</a></p>
                        </li>
                    </ul>
                </div>
                <div class="share">
                    <p>热门晒单</p>
                    <ul>
                        <li>
                            <i class="shai"></i>
                            <a href="#"><img src="images/index/index/share_01.jpg" /></a>
                            <h3><a href="#">咔哟YOYO4.0蓝牙音箱低音炮立体声音响</a></h3>
                            <p><a href="#">音质还可以，不错的，很小，很大声，很好看。</a></p>
                        </li>
                        <li>
                            <i class="hot"></i>
                            <a href="#"><img src="images/index/index/share_02.jpg" /></a>
                            <h3><a href="#">[晒单帖]出乎意料的京东，神奇的泰福高焖烧壶</a></h3>
                            <p><a href="#">昨天晚上在京东10点下单的，今天中午就送到了，京东的快递哥实在神速呀！而且态度非常好，还确认了</a></p>
                        </li>
                    </ul>
                </div>

                <div class="more">
                    <div class="reading">
                        <p>
                            <span>在线读书</span>
                            <a href="#">更多在线读书&gt;</a>
                        </p>
                        <img src="images/index/index/reading.jpg" />
                        <ul>
                            <li><s></s><a href="#">《来到地球第一天》新书特惠</a></li>
                            <li><s></s><a href="#">《袁腾飞讲先秦》(套装全两册)</a></li>
                            <li><s></s><a href="#">《只为成功找方法》升职宝典</a></li>
                            <li><s></s><a href="#">《如果世界只有我和你》蔡骏荐</a></li>
                        </ul>
                    </div>
                    <div class="order">
                        <p>订阅促销信息</p>
                        <input name="email" value="请输入您的Email地址" />
                        <button>订阅</button> 
                    </div>
                </div>
            </div>
        </section> -->
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
            </div> -->
		    <!-- <div class="authentication">
                <a href=""><img src="images/index/jy.jpg" width="108" height="40" /></a>
                <a href=""><img src="images/index/kx.jpg" width="108" height="40" /></a>
                <a href=""><img src="images/index/cy.jpg" width="108" height="40" /></a>
                <a href=""><img src="images/index/cx.jpg" width="112" height="40" /></a>
            </div> -->
        </footer>
		 <script src="/js/res/myPage.js" type="text/javascript"></script>
    </body>
</html>