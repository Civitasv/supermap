<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--引入taglibs.jsp--%>
<%@ include file="taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="${path}/css/sb-admin.css" rel="stylesheet">
<script src="${path}/js/echarts.common.min.js"></script>
<title>新闻信息</title>
</head>
<style>
.ol-popup-closer {
	text-decoration: none;
	position: absolute;
	top: 2px;
	right: 8px;
}

.ol-popup-closer:after {
	content: "✖";
}
</style>
<body style="height: 100%; margin: 0;background:rgba(255,255,255,0)">

	<div class="card mb-3" style="background:rgba(255,255,255,0.8)">
		<a href="#" id="column-popup-closer" class="ol-popup-closer"></a>
		<div class="card-header">
			<i class="fa fa-area-chart"></i> 各省分布柱状统计图
		</div>
		<div id="container" style="height: 580px"></div>


	</div>

	<script src="${path}/jquery/jquery.min.js"></script>
	<script src="${path}/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="${path}/jquery-easing/jquery.easing.min.js"></script>
	<script src="${path}/js/sb-admin.min.js"></script>



</body>
</html>
<script type="text/javascript">
	var columnPopupCloser = document.getElementById("column-popup-closer");
	var dom = document.getElementById("container");
	var myChart = echarts.init(dom);
	var app = {};
	option = null;
	option = {
		legend : {},
		tooltip : {},
		dataset : {
			source : [
				[ 'product', '暖', '冷', '总数' ],
			]
		},
		xAxis : {
			type : 'category',
			axisLabel : {
				interval : 0,
				rotate : 30
			}
		},
		yAxis : {},

		series : [
			{
				type : 'bar'
			},
			{
				type : 'bar'
			},
			{
				type : 'bar'
			}
		]
	};
	;

	$.ajax({
		type : 'post', //传输类型
		async : false, //同步执行
		url : path + "/chart/loadChart.action", //web.xml中注册的Servlet的url-pattern
		dataType : 'json', //返回数据形式为json
		success : function(result) {
			if (result) {

				for (var i = 0; i < result.length; i++) {

					option.dataset.source.push([ result[i].province, result[i].coldNum, result[i].warmNum, result[i].summary ]);

				}
			}
		},
		error : function(errorMsg) {
			alert("加载数据失败");
		}
	}); //AJAX



	if (option && typeof option === "object") {
		myChart.setOption(option, true);
	}

	columnPopupCloser.onclick = function() {
		parent.document.getElementById("column").style.display = "none";
	};
</script>