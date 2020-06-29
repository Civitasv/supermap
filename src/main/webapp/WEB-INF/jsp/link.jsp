<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%--引入taglibs.jsp--%>
<%@ include file="taglibs.jsp" %>
<html style="height: 100%;width: 100%;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Movie Cat</title>
    <script src="${path}/js/drawl.js"></script>
    <script type="text/javascript" src="${path}/assets/js/echarts.js"></script>
    <script type="text/javascript" src="${path}/jquery/jquery.min.js"></script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" style="width: 100%;height: 100%;">
<div id="main" style=" width:100%;height:100%;">
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
</div>
<!-- 进行ajax发送并接收数据,最后根据接收的数据完成可视化工作 -->

<script>
    var myChart = echarts.init(document.getElementById('main'), 'dark');
    var nodes = [
        {
            name: 'News', value: 10, category: 0, symbolSize: 140, x: 670, y: 330, fixed: true,
            label: {
                fontSize: 25
            }
        },
        {name: '青海省', value: 2, category: 1, symbolSize: 115, label: {fontSize: 17}},
        {name: '新疆维吾尔自治区', value: 2, category: 2, symbolSize: 100, label: {fontSize: 17}},
        {name: '湖北省', value: 2, category: 3, symbolSize: 100, label: {fontSize: 17}},
        {name: '香港特别行政区', value: 2, category: 4, symbolSize: 100, label: {fontSize: 17}},
        {name: '山西省', value: 2, category: 5, symbolSize: 100, label: {fontSize: 17}},
        {name: '云南省', value: 2, category: 6, symbolSize: 100, label: {fontSize: 17}},
        {name: '河北省', value: 2, category: 7, symbolSize: 100, label: {fontSize: 17}},
        {name: '广西壮族自治区', value: 2, category: 8, symbolSize: 100, label: {fontSize: 17}},
        {name: '海南省', value: 2, category: 9, symbolSize: 100, label: {fontSize: 17}},
        {name: '辽宁省', value: 2, category: 10, symbolSize: 100, label: {fontSize: 17}},
        {name: '上海市', value: 2, category: 11, symbolSize: 100, label: {fontSize: 17}},
        {name: '福建省', value: 2, category: 12, symbolSize: 100, label: {fontSize: 17}},
        {name: '陕西省', value: 2, category: 13, symbolSize: 100, label: {fontSize: 17}},
        {name: '四川省', value: 2, category: 14, symbolSize: 100, label: {fontSize: 17}},
        {name: '贵州省', value: 2, category: 15, symbolSize: 100, label: {fontSize: 17}},
        {name: '广东省', value: 2, category: 16, symbolSize: 100, label: {fontSize: 17}},
        {name: '北京市', value: 2, category: 17, symbolSize: 100, label: {fontSize: 17}},
        {name: '澳门特别行政区', value: 2, category: 18, symbolSize: 100, label: {fontSize: 17}},
        {name: '黑龙江省', value: 2, category: 19, symbolSize: 100, label: {fontSize: 17}},
        {name: '江苏省', value: 2, category: 20, symbolSize: 100, label: {fontSize: 17}},
        {name: '天津市', value: 2, category: 21, symbolSize: 100, label: {fontSize: 17}},
        {name: '重庆市', value: 2, category: 22, symbolSize: 100, label: {fontSize: 17}},
        {name: '山东省', value: 2, category: 23, symbolSize: 100, label: {fontSize: 17}},
        {name: '内蒙古自治区', value: 2, category: 24, symbolSize: 100, label: {fontSize: 17}},
        {name: '浙江省', value: 2, category: 25, symbolSize: 100, label: {fontSize: 17}},
        {name: '宁夏回族自治区', value: 2, category: 26, symbolSize: 100, label: {fontSize: 17}},
        {name: '西藏自治区', value: 2, category: 27, symbolSize: 100, label: {fontSize: 17}},
        {name: '吉林省', value: 2, category: 28, symbolSize: 100, label: {fontSize: 17}},
        {name: '安徽省', value: 2, category: 29, symbolSize: 100, label: {fontSize: 17}},
        {name: '江西省', value: 2, category: 30, symbolSize: 100, label: {fontSize: 17}},
        {name: '河南省', value: 2, category: 31, symbolSize: 100, label: {fontSize: 17}},
        {name: '甘肃省', value: 2, category: 32, symbolSize: 100, label: {fontSize: 17}},
        {name: '湖南省', value: 2, category: 33, symbolSize: 100, label: {fontSize: 17}},
        {name: '台湾省', value: 2, category: 34, symbolSize: 100, label: {fontSize: 17}}
    ];

    var links = [
        {source: 0, target: 1, value: 0},
        {source: 0, target: 2, value: 0},
        {source: 0, target: 3, value: 0},
        {source: 0, target: 4, value: 0},
        {source: 0, target: 5, value: 0},
        {source: 0, target: 6, value: 0},
        {source: 0, target: 7, value: 0},
        {source: 0, target: 8, value: 0},
        {source: 0, target: 9, value: 0},
        {source: 0, target: 10, value: 0},
        {source: 0, target: 11, value: 0},
        {source: 0, target: 12, value: 0},
        {source: 0, target: 13, value: 0},
        {source: 0, target: 14, value: 0},
        {source: 0, target: 15, value: 0},
        {source: 0, target: 16, value: 0},
        {source: 0, target: 17, value: 0},
        {source: 0, target: 18, value: 0},
        {source: 0, target: 19, value: 0},
        {source: 0, target: 20, value: 0},
        {source: 0, target: 21, value: 0},
        {source: 0, target: 22, value: 0},
        {source: 0, target: 23, value: 0},
        {source: 0, target: 24, value: 0},
        {source: 0, target: 25, value: 0},
        {source: 0, target: 26, value: 0},
        {source: 0, target: 27, value: 0},
        {source: 0, target: 28, value: 0},
        {source: 0, target: 29, value: 0},
        {source: 0, target: 30, value: 0},
        {source: 0, target: 31, value: 0},
        {source: 0, target: 32, value: 0},
        {source: 0, target: 33, value: 0},
        {source: 0, target: 34, value: 0}
    ];
    $.ajax({
        method: "POST",
        timeout: 500000,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        url: "${path}/data/loadAllForEcharts.action",
        success: function (data) {
            console.log(data)
            nodes = nodes.concat(data);
            console.log(nodes)
            var count = 35;
            for (var i = 1; i < 35; i++) {
                for (var j = 0; j < 5; j++) {
                    links.push({
                        source: i, target: count, value: nodes[j].symbolSize
                    })
                    count++;
                }
            }
            console.log(links)

            categoryArray = [{name: "News"}, {name: '青海省'}, {name: '新疆维吾尔自治区'}, {name: '湖北省'}, {name: '香港特别行政区'},
                {name: '山西省'}, {name: '云南省'}, {name: '河北省'}, {name: '广西壮族自治区'}, {name: '辽宁省'},
                {name: '海南省'}, {name: '上海市'}, {name: '福建省'}, {name: '陕西省'}, {name: '四川省'},
                {name: '贵州省'}, {name: '广东省'}, {name: '北京市'}, {name: '澳门特别行政区'}, {name: '黑龙江省'},
                {name: '江苏省'}, {name: '天津市'}, {name: '重庆市'}, {name: '山东省'}, {name: '内蒙古自治区'},
                {name: '浙江省'}, {name: '宁夏回族自治区'}, {name: '西藏自治区'}, {name: '吉林省'}, {name: '安徽省'},
                {name: '江西省'}, {name: '河南省'}, {name: '甘肃省'}, {name: '湖南省'}, {name: '台湾省'}];
                jsondata = {"title": "x", "categories": categoryArray, "nodes": nodes, "links": links};
            console.log(jsondata)
            //数据格式为Json格式
            createGraph(myChart, jsondata);
            $('#notif', window.parent.document).hide();
            myChart.resize();
        },
        error: function () {
            console.log("加载失败")
        }
    });


    myChart.on('click', function (params) {
        if (params.componentType === 'series') {
            if (params.seriesType === 'graph') {
                if (params.dataType === 'node') {
                    console.log(params);
                    if (typeof (params.data['url']) != "undefined")
                        window.open(params.data['url']);
                }
            }
        }
    });


</script>


</body>
</html>
