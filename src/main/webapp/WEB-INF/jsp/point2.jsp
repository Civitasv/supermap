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
        html,
        body,
        #container {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }
    </style>
</head>

<body>
<div id="containers" class="containers"></div>
<script src="//webapi.amap.com/maps?v=1.4.15&key=cfa2cd566d02f475496c9f7d0dd8199b&"></script>
<script src="//webapi.amap.com/loca?v=1.3.0&key=cfa2cd566d02f475496c9f7d0dd8199b"></script>
<script src="//a.amap.com/Loca/static/dist/jquery.min.js"></script>
<script>
    var map = new AMap.Map('containers', {
        center: [116.397217, 39.909071],
        features: ['bg', 'road'],
        mapStyle: 'amap://styles/midnight',
        /*rotation: 30,*/
        zoom: 12,
        viewMode: '2D'
        /*pitch: 60,
        skyColor: '#33216a'*/
    });
    var layer = new Loca.RoundPointLayer({
        map: map
    });
    var colors = [
        '#c57f34',
        '#cbfddf',
        '#edea70',
        '#8cc9f1',
        '#2c7bb6'
    ];
    // 10万辆北京公共交通车辆
    $.get('${path}/data/GCJ02.csv', function (csv) {
        layer.setData(csv, {
            lnglat: function (obj) {
                var value = obj.value;
                return [value['GCJ02long'], value['GCJ02lat']];
            },
            type: 'csv'
        });
        layer.setOptions({
            unit: 'px',
            style: {
                // 根据车辆类型设定不同半径
                radius: function (obj) {
                    var value = obj.value;
                    switch (parseInt(value.type)) {
                        case 0:
                            return 2;
                        case 1:
                            return 2.2;
                        case 2:
                            return 2.4;
                        case 3:
                            return 2.5;
                        case 4:
                            return 2.6;
                        default:
                            return 2;
                    }
                },
                height: 0,
                // 根据出租车当前不同情况填充不同的颜色
                color: function (obj) {
                    var value = obj.value;
                    switch (parseInt(value.type)) {
                        case 0:
                            return colors[0];
                        case 1:
                            return colors[1];
                        case 2:
                            return colors[2];
                        case 3:
                            return colors[3];
                        case 4:
                            return colors[4];
                        default:
                            return colors[4];
                    }
                },
                opacity: 0.85
            }
        });
        layer.render();
    });
</script>
</body>

</html>