<%@ Page Language="C#"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery ligerUI Demos导航主页</title>
    <link href="lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <script src="lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>    
    <script src="lib/ligerUI/js/ligerui.all.js" type="text/javascript"></script> 
    <script src="indexdata.js" type="text/javascript"></script>
        <script type="text/javascript">
            var tab = null;
            var accordion = null;
            var tree = null;
            $(function ()
            {
                $("#home").attr("src", "welcome.htm");
                //布局
                $("#layout1").ligerLayout({ leftWidth: 190, height: '100%', heightDiff: -34, space: 4, onHeightChanged: f_heightChanged });

                var height = $(".l-layout-center").height();

                //Tab
                $("#framecenter").ligerTab({ height: height });

                //面板
                $("#accordion1").ligerAccordion({ height: height - 24, speed: null });

                $(".l-link").hover(function ()
                {
                    $(this).addClass("l-link-over");
                }, function ()
                {
                    $(this).removeClass("l-link-over");
                });
                //树
                $("#tree1").ligerTree({
                    data: indexdata2,
                    checkbox: false,
                    slide: false,
                    nodeWidth: 120,
                    attribute: ['nodename', 'url'],
                    onSelect: function (node)
                    {
                        if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid)
                        {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid)
                        }
                        f_addTab(tabid, node.data.text, node.data.url);
                    }
                });

                tab = $("#framecenter").ligerGetTabManager();
                accordion = $("#accordion1").ligerGetAccordionManager();
                tree = $("#tree1").ligerGetTreeManager();
                $("#pageloading").hide();

            });
            function f_heightChanged(options)
            {
                if (tab)
                    tab.addHeight(options.diff);
                if (accordion && options.middleHeight - 24 > 0)
                    accordion.setHeight(options.middleHeight - 24);
            }
            function f_addTab(tabid, text, url)
            {
                tab.addTabItem({ tabid: tabid, text: text, url: url });
            } 
             
            
     </script> 
<style type="text/css"> 
    body,html{height:100%;}
    body{ padding:0px; margin:0;   overflow:hidden;}  
    .l-link{ display:block; height:26px; line-height:26px; padding-left:10px; text-decoration:underline; color:#333;}
    .l-link2{text-decoration:underline; color:white; margin-left:2px;margin-right:2px;}
    .l-layout-top{background:#102A49; color:White;}
    .l-layout-bottom{ background:#E5EDEF; text-align:center;}
    #pageloading{position:absolute; left:0px; top:0px; background:white url('loading.gif') no-repeat center; width:100%; height:100%;z-index:99999;}
    .l-link{ display:block; line-height:22px; height:22px; padding-left:16px;border:1px solid white; margin:4px;}
    .l-link-over{ background:#FFEEAC; border:1px solid #DB9F00;} 
    .l-winbar{ background:#2B5A76; height:30px; position:absolute; left:0px; bottom:0px; width:100%; z-index:99999;}
    .space{ color:#E7E7E7;}
    /* 顶部 */ 
    .l-topmenu{ margin:0; padding:0; height:31px; line-height:31px; background:url('lib/images/top.jpg') repeat-x bottom;  position:relative; border-top:1px solid #1D438B;  }
    .l-topmenu-logo{ color:#E7E7E7; padding-left:35px; line-height:26px;background:url('lib/images/topicon.gif') no-repeat 10px 5px;}
    .l-topmenu-welcome{  position:absolute; height:24px; line-height:24px;  right:30px; top:2px;color:#070A0C;}
    .l-topmenu-welcome a{ color:#E7E7E7; text-decoration:underline} 

 </style>
</head>
<body style="padding:0px;background:#EAEEF5;">  
<div id="pageloading"></div>  
<div id="topmenu" class="l-topmenu">
    <div class="l-topmenu-logo">jQuery ligerUI Demos导航主页</div>
    <div class="l-topmenu-welcome">
        <a href="index.htm" class="l-link2">本地版本</a>
        <span class="space">|</span>
        <a href="https://me.alipay.com/daomi" class="l-link2" target="_blank">捐赠</a> 
        <span class="space">|</span>
        <a href="http://bbs.ligerui.com" class="l-link2" target="_blank">论坛</a>
    </div> 
</div>
  <div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; "> 
        <div position="left"  title="主要菜单" id="accordion1"> 
                     <div title="功能列表" class="l-scroll">
                         <ul id="tree1" style="margin-top:3px;">
                    </div>
                    <div title="应用场景">
                    <div style=" height:7px;"></div>
                         <a class="l-link" href="javascript:f_addTab('listpage','列表页面','demos/case/listpage.htm')">列表页面</a> 
                         <a class="l-link" href="demos/dialog/win7.htm" target="_blank">模拟Window桌面</a> 
                    </div>    
                     <div title="实验室">
                    <div style=" height:7px;"></div>
                          <a class="l-link" href="lab/generate/index.htm" target="_blank">表格表单设计器</a> 
                    </div> 
        </div>
        <div position="center" id="framecenter"> 
            <div tabid="home" title="我的主页" style="height:300px" >
                <iframe frameborder="0" name="home" id="home" src=""></iframe>
            </div> 
        </div> 
        
    </div>
    <div  style="height:32px; line-height:32px; text-align:center;">
            Copyright © 2011-2013 www.ligerui.com
    </div>
    <div style="display:none"></div>
</body>
</html>
