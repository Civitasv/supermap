<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%--引入taglibs.jsp--%>
<%@ include file="taglibs.jsp"%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>测试线</title>
    <style>
        html, body, #map {
            margin: 0; padding: 0; width: 100%; height: 100%;
        }
    </style>
</head>
<body>
<div id="map" class="map"></div>
<script src="//webapi.amap.com/maps?v=1.4.15&key=cfa2cd566d02f475496c9f7d0dd8199b&"></script>
<script src="//webapi.amap.com/loca?v=1.3.0&key=cfa2cd566d02f475496c9f7d0dd8199b"></script>
<script src="//a.amap.com/Loca/static/dist/jquery.min.js"></script>
<script>
    var map = new AMap.Map('map', {
        // 设置地图样式
        mapStyle: 'amap://styles/midnight',
        // 设置地图上显示的元素种类
        features: ['bg'],
        // 中心点
        center: [116.397732, 39.912152],
        // 缩放级数
        zoom: 10,
        // 俯仰角度，仅针对3D视图
        pitch: 40,
        viewMode: '3D'
    });
    var layer = new Loca.LineLayer({
        map: map,
    });
    $.ajax({
        method: "POST",
        timeout: 500000,
        contentType:"application/json;charset=utf-8",
        dataType:"json",
        async: true,
        url: "${path}/data/loadAllForLine.action",
        success: function(data) {

            layer.setData(data, {
                lnglat: 'line'
            });
            layer.setOptions({
                style: {
                    // 3D Line 不支持设置线宽，线宽为 1px
                    // borderWidth: 1,
                    opacity: 0.4,
                    color: '#b7eff7',
                }
            });
            layer.render();
        },
        error:function () {
            console.log("加载失败")
        }
    });

</script>
</body>
</html>