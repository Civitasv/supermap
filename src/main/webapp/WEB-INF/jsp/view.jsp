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
    <link rel="stylesheet" href="${path}/assets/css/sidenav.css">
    <link rel="stylesheet" href="${path}/assets/css/view.css">
    <link rel="stylesheet" type="text/css" href="${path}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/assets/css/stats.css"/>
    <title>AINewsSuperMap</title>
    <script src="${path}/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="${path}/assets/js/echarts.js"></script>
    <script src="//webapi.amap.com/maps?v=1.4.15&key=1700404313c61e6e8ecfdde9fc26c459"></script>
    <script src="//webapi.amap.com/loca?v=1.3.2&key=1700404313c61e6e8ecfdde9fc26c459"></script>
    <script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>

</head>
<body>
<!--侧栏界面设计-->
<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="#total_map" onclick="closeNav()">TotalMap</a>
    <a href="#ave_map" onclick="closeNav()">AveMap</a>
    <a href="#link_map" onclick="closeNav()">LinkMap</a>
    <a href="#stats" onclick="closeNav()">Stats</a>
</div>
<div id="main">
    <span style="font-size:18px;cursor:pointer" onclick="openNav()">&#9776; AINewsSuperMap 可视化界面</span>
</div>
<script type="text/javascript" src="${path}/assets/js/sidenav.js"></script>
<!--地图-->
<section id="total_map">
    <div id="totalMapContainer" style="width: 100%;height:100%"></div>
    <script type="text/javascript">
        AMapUI.loadUI(['control/BasicControl'], function (BasicControl) {
            var map = new AMap.Map('totalMapContainer', {
                features: ['bg', 'road'],
                mapStyle: 'amap://styles/midnight',
                center: [110, 31],
                pitch: 50,
                zoom: 5,
                viewMode: '3D',
            });
            var layer = new Loca.HeatmapLayer({
                map: map,
            });
            $.ajax({
                type: 'GET',
                url: '${path}/data/df_byid_located_loged.csv',
                success: function (data) {
                    layer.setData(data, {
                        type: 'csv',
                        lnglat: 'lnglat',
                        value: 'logcount'
                    });
                    layer.setOptions({
                        style: {
                            radius: 40,
                            color: {
                                0.5: '#2c7bb6',
                                0.65: '#abd9e9',
                                0.7: '#ffffbf',
                                0.9: '#fde468',
                                1.0: '#d7191c'
                            }
                        }
                    });
                    layer.render();
                },
            });

            var layerCtrl = new BasicControl.LayerSwitcher({
                theme: 'light',
                //自定义基础图层
                baseLayers: [{
                    enable: true,
                    id: 'tile',
                    name: '基础图',
                    layer: new AMap.TileLayer()
                }, {
                    id: 'satellite',
                    name: '卫星图',
                    layer: new AMap.TileLayer.Satellite()
                }
                ],
                //自定义覆盖图层
                overlayLayers: [{
                    enable: true,
                    id: 'total_count',
                    name: '总数',
                    layer: layer
                }]
            });
            layers = layerCtrl.getEnabledLayers();
            map.setLayers(layers);
            map.addControl(layerCtrl);
        });
    </script>
</section>

<section id="ave_map">
    <div id="aveMapContainer" style="width: 100%;height:100%"></div>
    <script type="text/javascript">
        var ave_map = new AMap.Map('aveMapContainer', {
            features: ['bg', 'road'],
            mapStyle: 'amap://styles/midnight',
            center: [110, 31],
            pitch: 50,
            zoom: 5,
            viewMode: '3D'
        });

        var layer = new Loca.ScatterPointLayer({
            map: ave_map,
        });

        $.ajax({
            type: 'GET',
            url: '${path}/data/df_byid_located_loged_absed.csv',
            success: function (data) {
                layer.setData(data, {
                    type: 'csv',
                    lnglat: 'lnglat'
                });
                var colors = [
                    '#2c7bb6',
                    '#ffffff',
                    '#d7191c'
                ];
                layer.setOptions({
                    // 单位米
                    unit: 'meter',
                    style: {
                        // 正多边形半径
                        radius: 8000,
                        // 高度为 0 即可贴地面
                        height: {
                            key: 'absmean',
                            scale: 'linear',
                            value: [0, 80000]
                        },
                        // 顶面颜色
                        color: {
                            key: 'mean',
                            scale: 'quantile',
                            value: colors
                        },
                        opacity: 0.85
                    }
                });
                layer.render();
            },
        });
    </script>

</section>


<section id="link_map">
    <div id="linkMapContainer" style="width: 100%;height:100%"></div>
    <script src="${path}/assets/js/city_line.js"></script>
    <script type="text/javascript">
        var link_map = new AMap.Map('linkMapContainer', {
            mapStyle: 'amap://styles/midnight',
            features: ['bg', 'road'],
            center: [110, 31],
            pitch: 50,
            zoom: 5,
            viewMode: '3D'
        });
        var link_layer = new Loca.LinkLayer({
            map: link_map
        });

        link_layer.setData(city_line, {
            lnglat: 'line'
        });

        link_layer.setOptions({
            style: {
                // 曲率 [-1, 1] 区间
                curveness: 1,
                opacity: 0.8,
                color: '#5695F6'
            }
        });

        link_layer.render();
    </script>

</section>

<section id="stats">
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
</section>
</body>
</html>


