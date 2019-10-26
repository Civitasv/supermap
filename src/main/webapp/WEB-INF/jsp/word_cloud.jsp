<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="taglibs.jsp" %>
<html style="height: 100%;width: 100%;">
<head>
    <meta charset="utf-8">
    <title>Movie Cat</title>
    <script src="${path}/jquery/jquery.min.js"></script>
    <script src="${path}/assets/js/echarts.js"></script>
    <script src="${path}/res/js/echarts-wordcloud.min.js"></script>
    <style>
        body {
            height: 100%;
            margin: 0;
        }
    </style>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" style="width: 100%;height: 100%;">
<div id="content" style=" width:100%;height:100%;">
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width:1200px;height: 700px">
    </div>
</div>

<script>
    $(function () {
        var dom = document.getElementById("main");
        var myChart = echarts.getInstanceByDom(dom) || echarts.init(dom);
        $.ajax({
            method: "POST",
            timeout: 500000,
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: true,
            url: "${path}/data/loadHotNews.action",
            success: function (data) {
                console.log(data)
                var option = {
                    title: {},
                    tooltip: {
                        formatter: function (params, ticket, callback) {
                            return params.data['title'];
                        }
                    },
                    series:
                        [{
                            type: 'wordCloud',
                            gridSize: 2,
                            sizeRange: [12, 50],
                            rotationRange: [0, 90],
                            shape: 'star',
                            //width: 600,
                            //height: 400,
                            textStyle: {
                                normal: {
                                    color: function () {
                                        return 'rgb(' + [
                                            Math.round(Math.random() * 200),
                                            Math.round(Math.random() * 200),
                                            Math.round(Math.random() * 200)
                                        ].join(',') + ')';
                                    }
                                },
                                emphasis: {
                                    shadowBlur: 5,
                                    shadowColor: '#330a18'
                                }
                            },
                            data: data
                        }]
                };

                myChart.setOption(option);
            }
        })
        ;


        myChart.on('click', function (params) {
            if (params.componentType === 'series') {
                if (params.seriesType === 'wordCloud') {
                    console.log(params);
                    if (typeof (params.data['news_url']) != "undefined")
                        window.open(params.data['news_url']);
                }
            }
        });
    })

</script>
</body>
</html>
