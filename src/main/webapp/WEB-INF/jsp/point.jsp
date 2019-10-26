<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%--引入taglibs.jsp--%>
<%@ include file="taglibs.jsp"%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新闻点图</title>
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
        mapStyle: 'amap://styles/midnight',
        center: [106.3, 30.6],
        zoom: 10,
        features: ['bg', 'road'],
        viewMode: '2D'
    });
    $.ajax({
        method: "POST",
        timeout: 500000,
        contentType:"application/json;charset=utf-8",
        dataType:"json",
        async: true,
        url: "${path}/data/loadAllForPoint.action",
        success: function(data) {
            var layer = new Loca.PointCloudLayer({
                map: map,
                fitView: false
            });
            layer.setData(data,{
                type:'json',
                lnglat:'center'
            });

            // 配置样式
            layer.setOptions({
                unit: 'px',
                style: {
                    radius: 800,     // 圆形半径，单位像素
                    color: '#f7b62d', // 填充颜色
                    borderWidth: 0.5,   // 边框宽度
                    borderColor: '#ffffff'  // 边框颜色
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