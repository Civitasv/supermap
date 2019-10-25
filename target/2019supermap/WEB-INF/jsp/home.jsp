<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%--引入taglibs.jsp--%>
<%@ include file="taglibs.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <title>AINewsSuperMap</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="${path}/assets/css/main.css"/>
    <script type="text/javascript" src="${path}/supermap/include-web.js"></script>
    <script type="text/javascript" src="${path}/assets/js/gbk.js"></script>
    <script type="text/javascript" src="${path}/supermap/include-openlayers.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#translateBtn").click(function () {
                $.ajax({
                    method: "POST",
                    timeout: 500000,
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    async: true,
                    url: "${path}/mood/baidu_mood.action?name="+$("#nlp_input").val(),
                    success: function (output) {
                        console.log(output['items'])
                        $("#nlp_output").val("confidence: "+output['items'][0]['confidence']+"\r"+
                        "negative_prob: "+output['items'][0]['negative_prob']+"\r"+
                        "positive_prob: "+output['items'][0]['positive_prob']+"\r"+
                        "sentiment: "+output['items'][0]['sentiment']);
                    },
                    error: function () {
                        console.log("AJAX请求失败");
                    }
                });
            });
        });
    </script>
</head>
<body>
<!-- Wrapper -->
<div id="wrapper">
    <!-- Header -->
    <header id="header">
        <div class="logo">
            <span class="icon fa-diamond"></span>
        </div>
        <div class="content">
            <div class="inner">
                <h1>AINewsSuperMap 新闻情绪数据可视化与管理平台</h1>
                <p>2019年Supermap大赛作品，数据来源：<a href="https://news.sina.com.cn">新浪新闻</a></p>
                <p>武汉大学：丁家祺 岳远紊 楚尔轩 苏昊睿</p>
            </div>
        </div>
        <nav>
            <ul>
                <li><a href="#intro">Intro</a></li>
                <li><a href="${path}/pages/view.action">View</a></li>
                <li><a href="${path}/pages/login.action">Manage</a></li>
                <li><a href="#nlp">NLP Client</a></li>
                <li><a href="#about">About</a></li>
            </ul>
        </nav>
    </header>
    <!-- Main -->
    <div id="main">
        <!-- Intro -->
        <article id="intro">
            <h2 class="major">介绍 | Intro</h2>
            <span class="image main"><img style="height: 30%;" src="${path}/images/intro.jpg" alt=""/></span>
            <p>随着网络信息来源的扩展和信息量的不断壮大，网络媒介技术下的网络社会意向更加复杂，网络舆情变幻莫测。借助GIS
                地理可视化技术进行知识挖掘是有益的探索，而借助GIS的地理分析技术则可以预测、监控舆情的发展情况，具有极高的现实价值。
                在此背景下，作品面向舆情热点，尤其是以网络新闻为代表的信息，利用WebGIS及相关技术，探索了其可视化分析系统的开发与应用前景，利用主流Web开发技术，实现了基于地理位置的舆情可视化分析系统开发。为用户提供了广区域、大格局尺度下的洞见，讨论了将GIS
                可视化互联网舆情监测系统应用于网络舆情监测工作中的潜能。</p>
        </article>
        <article id="nlp">
            <h2 class="major">自然语言处理 | NLP</h2>
            <textarea rows="10" cols="30" id="nlp_input">分析文本</textarea>
            <button id="translateBtn" style="width:95% ;color: #fff;">情感倾向分析</button>
            <textarea rows="10" cols="30" id="nlp_output">分析结果</textarea>
        </article>
        <!-- About -->
        <article id="about">
            <h2 class="major">关于 | About</h2>
            <div id="map" style="width: 100%;height: 400px "></div>
            <p>武汉大学 资源与环境科学学院 丁家祺 岳远紊 楚尔轩 苏昊睿</p>
            <script type="text/javascript">
                var map = new ol.Map({
                    target: 'map',
                    controls: ol.control.defaults({attributionOptions: {collapsed: false}})
                        .extend([new ol.supermap.control.Logo()]),
                    view: new ol.View({
                        center: [114.36, 30.54],
                        zoom: 14,
                        projection: "EPSG:4326",
                    }),

                    layers: [new ol.layer.Tile({
                        source: new ol.source.Tianditu({
                            layerType: 'ter',
                            key: "1d109683f4d84198e37a38c442d68311",
                            projection: "EPSG:4326"
                        })
                    }), new ol.layer.Tile({
                        source: new ol.source.Tianditu({
                            layerType: 'ter',
                            key: "1d109683f4d84198e37a38c442d68311",
                            isLabel: true,
                            projection: "EPSG:4326"
                        })
                    })]
                });
            </script>
        </article>
    </div>
    <!-- Footer -->
    <footer id="footer">
        <p class="copyright">&copy;Design: <a href="https://github.com/silverbullet1472">JiaqiDing</a></p>
    </footer>
</div>
<!-- BG -->
<div id="bg"></div>
<!-- Scripts -->
<script src="${path}/assets/js/jquery.min.js"></script>
<script src="${path}/assets/js/skel.min.js"></script>
<script src="${path}/assets/js/util.js"></script>
<script src="${path}/assets/js/main.js"></script>
</body>
</html>