<%--
  Created by IntelliJ IDEA.
  User: dellyx
  Date: 2019-10-24
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<head>
    <title>可视化界面</title>
    <script type="text/javascript">
        //定义js可以访问的全局变量
        var path = "${path}";
    </script>
    <link rel="stylesheet" href="${path}/view/css/amazeui.css"/>
    <link rel="stylesheet" href="${path}/view/css/core.css"/>
    <link rel="stylesheet" href="${path}/view/css/menu.css"/>
    <link rel="stylesheet" href="${path}/view/css/admin.css"/>
    <link rel="stylesheet" href="${path}/css/hoverbuttons.css"/>

    <script src="${path}/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="${path}/assets/js/echarts.js"></script>
    <script src="//webapi.amap.com/maps?v=1.4.15&key=1700404313c61e6e8ecfdde9fc26c459"></script>
    <script src="//webapi.amap.com/loca?v=1.3.2&key=1700404313c61e6e8ecfdde9fc26c459"></script>
    <script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
    <link href="${path}/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css">
    <script src="${path}/assets/js/city_line.js"></script>
    <script src="${path}/js/newview.js"></script>

    <link rel="shortcut icon" href="${path}/images/favicon.ico" type="image/x-icon"/>
    <style>
        body {
            font-family: navFont;
        }

        .content-page, .content, .card-box, .am-g {
            height: 100%;
        }

        .content-page {
            margin-top: 0;
        }
        .content-page .content{
            padding:0;
        }

        .inform {
            margin-top: 5px;
            font-size: 30px;
        }

        ul li {
            cursor: pointer;
        }

        #TotalMap, #AveMap, #LinkMap, #Stats,#linkEcharts,#wordCloud,#Overview {
            padding-left: 0;
            font-size:18px;
        }

        #statistics ,#link-echarts,#word-cloud,#overview_panel{
            width: 100%;
            height: 100%;
        }

        @font-face {
            font-family: "navFont";
            src: url(${path}/fonts/方正清刻本悦宋简体.TTF);
        }

    </style>
    <script>
        $(function () {
            loadTotalMap();

            $(".stats").hide();
            $(".aveMapContainer").hide();
            $(".linkMapContainer").hide();
            $(".totalMapContainer").hide();
            $(".link-echarts").hide();
            $(".word-cloud").hide();

            $("#TotalMap").click(function () {
                $(".totalMapContainer").show();
                $(".overviewContainer").hide();
                $(".aveMapContainer").hide();
                $(".link-echarts").hide();
                $(".linkMapContainer").hide();
                $(".stats").hide();
                $(".word-cloud").hide();
                $(".page-title").html("热力图");
                loadTotalMap();
            })
            $("#AveMap").click(function () {
                $(".totalMapContainer").hide();
                $(".overviewContainer").hide();
                $(".aveMapContainer").show();
                $(".linkMapContainer").hide();
                $(".link-echarts").hide();
                $(".stats").hide();
                $(".word-cloud").hide();
                $(".page-title").html("柱状图");

                loadAveMap();
            })
            $("#LinkMap").click(function () {
                $(".totalMapContainer").hide();
                $(".overviewContainer").hide();
                $(".aveMapContainer").hide();
                $(".linkMapContainer").show();
                $(".link-echarts").hide();
                $(".stats").hide();
                $(".page-title").html("连接线图");
                loadLinkMap();
            })
            $("#Stats").click(function () {
                $(".totalMapContainer").hide();
                $(".overviewContainer").hide();
                $(".aveMapContainer").hide();
                $(".linkMapContainer").hide();
                $(".link-echarts").hide();
                $(".stats").show();
                $(".word-cloud").hide();
                $(".page-title").html("统计结果");
            })
            $("#linkEcharts").click(function () {
                $(".totalMapContainer").hide();
                $(".overviewContainer").hide();
                $(".aveMapContainer").hide();
                $(".linkMapContainer").hide();
                $(".stats").hide();
                $(".word-cloud").hide();
                $(".link-echarts").show();
                $(".page-title").html("echarts连接图");
            })
            $("#Overview").click(function () {
                $(".totalMapContainer").hide();
                $(".overviewContainer").show();
                $(".aveMapContainer").hide();
                $(".linkMapContainer").hide();
                $(".stats").hide();
                $(".word-cloud").hide();
                $(".link-echarts").hide();
                $(".page-title").html("热榜");
            })
            $("#wordCloud").click(function () {
                $(".totalMapContainer").hide();
                $(".overviewContainer").hide();
                $(".aveMapContainer").hide();
                $(".linkMapContainer").hide();
                $(".stats").hide();
                $(".word-cloud").show();
                $(".link-echarts").hide();
                $(".page-title").html("词云");
            })
        })
    </script>
</head>
<body>
<!-- Begin page -->
<header class="am-topbar am-topbar-fixed-top" style="
     position: relative;
     border-top-width: 0px;
     margin-bottom: 0px;
     ">
    <div class="am-topbar-left am-hide-sm-only">
        <a href="${path}/pages/newview.action" class="logo"><span>AINewsSuperMap</span><i class="zmdi zmdi-layers"></i></a>
    </div>

    <div class="contain">
        <ul class="am-nav am-navbar-nav am-navbar-left">

            <li><h4 class="page-title">热榜</h4></li>
        </ul>

        <ul class="am-nav am-navbar-nav am-navbar-right">
            <li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>
            <li class="hidden-xs am-hide-sm-only">
                <form role="search" class="app-search">
                    <input type="text" placeholder="Search..." class="form-control">
                    <a href=""><img src="${path}/view/img/search.png"></a>
                </form>
            </li>
        </ul>
    </div>
</header>
<!-- end page -->

<div class="admin">
    <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas" style="margin-top: 0px;">
        <div class="am-offcanvas-bar admin-offcanvas-bar">
            <!-- User -->
            <div class="user-box am-hide-sm-only">
                <div class="user-img" >
                    <a href="${path}">
                    <img src="${path}/images/tesla.png"  title="2019SuperMap"
                         class="img-circle img-thumbnail img-responsive">
                    </a>
                    <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
                </div>
                <h5><a href="#">2019SuperMap</a></h5>
                <ul class="list-inline">
                    <li>
                        <a href="#">
                            <i class="fa fa-cog" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="text-custom">
                            <i class="fa fa-cog" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- End User -->

            <ul class="am-list admin-sidebar-list">

                <li><a id="Overview" class="hbtn hb-border-bottom"><i class="fa fa-stack-overflow"></i> Overview</a></li>
                <li><a id="Stats" class="hbtn hb-border-bottom"><i class="fa fa-pie-chart"></i> Stats</a></li>
                <li><a id="TotalMap" class="hbtn hb-border-bottom"><i class="fa fa-map-o"></i> TotalMap</a></li>
                <li> <a id="AveMap" class="hbtn hb-border-bottom"><i class="fa fa-map"></i> AveMap</a></li>
                <li> <a id="LinkMap" class="hbtn hb-border-bottom"><i class="fa fa-cogs"></i> LinkMap</a></li>
                <li> <a id="linkEcharts" class="hbtn hb-border-bottom"><i class="fa fa-anchor"></i>LinkEcharts</a></li>
                <li> <a id="wordCloud" class="hbtn hb-border-bottom"><i class="fa fa-cloud"></i>WordCloud</a></li>
            </ul>
        </div>
    </div>
    <!-- sidebar end -->

    <!--</div>
</div>
</div>-->
    <div class="content-page">

        <div class="content overviewContainer" style="margin-bottom: 90px;">
            <div class="am-g">
                <div class="card-box embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" id="overview_panel" src="${path}/pages/overview.action"></iframe>
                </div>
            </div>
        </div>

        <div class="content totalMapContainer">
            <div class="am-g">
                <!-- Row start -->
                <div class="card-box" id="totalMapContainer">
                </div>
            </div>
        </div>
        <div class="content aveMapContainer">
            <div class="am-g">
                <div class="card-box" id="aveMapContainer">
                </div>
            </div>
        </div>

        <div class="content linkMapContainer">
            <div class="am-g">
                <div class="card-box" id="linkMapContainer">
                </div>
            </div>
        </div>

        <div class="content stats" style="margin-bottom: 90px;">
            <div class="am-g">
                <div class="card-box embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" id="statistics" src="${path}/pages/view.action"></iframe>
                </div>
            </div>
        </div>

        <div class="content link-echarts" style="margin-bottom: 90px;">
            <div class="am-g">
                <div class="card-box embed-responsive embed-responsive-16by9">
                    <h3 id="notif" style="text-align:center;">数据加载ing</h3>
                    <iframe class="embed-responsive-item" id="link-echarts" src="${path}/pages/link.action"></iframe>
                </div>
            </div>
        </div>

        <div class="content word-cloud" style="margin-bottom: 90px;">
            <div class="am-g">
                <div class="card-box embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" id="word-cloud" src="${path}/pages/wordCloud.action"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
