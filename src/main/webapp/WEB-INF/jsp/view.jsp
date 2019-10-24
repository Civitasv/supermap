<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%--引入taglibs.jsp--%>
<%@ include file="taglibs.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" href="${path}/assets/css/view.css">
    <link rel="stylesheet" type="text/css" href="${path}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/assets/css/stats.css"/>
    <title>AINewsSuperMap</title>
    <script src="${path}/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="${path}/assets/js/echarts.js"></script>

</head>
<body>

<div class="main clearfix">
    <div class="main-left">
        <div class="border-container containertop">
            <h5 class="name-title tile-size-color">
                情绪指数分布
            </h5>
            <div id="radar">
                <div class="radarkong">
                    <p class="tile-size-color">Total:<span class="Totalequipment"> 169941</span>Time:<span> 2019.01-2019.02</span>
                    </p>
                </div>
                <div class="pie-chart" id="pie-chart"></div>
                <ul class="SiteStatusList">
                    <li><i class="Statusnormal Statussame"></i>negative</li>
                    <li><i class="Statusemergency Statussame"></i>positive</li>
                    <li><i class="StatusOffline Statussame"></i>neutral</li>
                </ul>
            </div>
        </div>

        <div class="border-container containerbottom">
            <div class="name-title tile-size-color">
                评论数据组成
            </div>
            <div class="graduateyear">
                <div class="bar-chart" id="bar-chart"></div>
                <ul class="SiteStatusList">
                    <li>一月</li>
                    <li class="DataSwitch"><i class="ThisweekData Datasame" onClick="DataSwitch(this,1)"></i><i
                            class="ThisweekData" onClick="DataSwitch(this,2)"></i></li>
                    <li class="Defaultgray">六月</li>
                </ul>
            </div>


        </div>
    </div>
    <div class="main-middle">
        <div class="border-container containertop">
            <div class="name-title tile-size-color">
                正负情绪占比
            </div>
            <div id="mapadd">
                <div class="mapleft">
                    <div class="progress2-chart" id="progress2-chart">
                    </div>
                </div>

                <div class="map-chart" id="map-chart">
                </div>
                <ul class="Devicestatus-List">
                    <li class="Online2">-0.53
                        <span class="DevicestatusName">中山</span>
                    </li>
                    <li class="Online2">-0.53
                        <span class="DevicestatusName">南通</span>
                    </li>
                    <li class="Online2">-0.43
                        <span class="DevicestatusName">深圳</span>
                    </li>
                    <li class="Online2">-0.35
                        <span class="DevicestatusName">成都</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="border-container containerbottom borderno-container">
            <ul class="teacher-pie clearfix">
                <li class="teacherList">
                    <div class="name-title tile-size-color">
                        武汉情绪指数
                    </div>
                    <div id="courserate">
                        <div class="line-chart" id="line-chart"></div>
                        <ul class="SiteStatusList">
                            <li><i class="Statusnormal Statussame"></i>1-5月</li>
                        </ul>
                    </div>
                </li>
                <li class="teacherList">
                    <div class="name-title tile-size-color">
                        5月4城 评论数变化
                    </div>
                    <div class="bars-chart" id="bars-chart"></div>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-right">
        <div class="border-container containertop">
            <div class="name-title tile-size-color">
                负向指数排行
            </div>
            <div class="progress1-chart" id="progress1-chart"></div>
        </div>
        <div class="border-container containerbottom">
            <div class="name-title tile-size-color">
                5城情绪指数-1月
            </div>
            <div id="radar-chart" class="radar-chart">
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${path}/assets/js/stats_data.js"></script>
<script type="text/javascript" src="${path}/assets/js/stats_map.js"></script>
</body>
</html>


