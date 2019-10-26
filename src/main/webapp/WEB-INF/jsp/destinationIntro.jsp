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

<title>新闻信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="${path}/css/sb-admin.css" rel="stylesheet">

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
		<a href="#" id="destination-popup-closer" class="ol-popup-closer"></a>
		<div class="card-header">
			<i class="fa fa-area-chart"></i>New Intro
		</div>
		<br>
		<div>
			<img src="${path}/images/dest_intro.jpg" width="auto" height="300"
				alt="" align="left" />
			<h2 align="center">News Intro</h2>
			<p style="text-indent:2em;overflow:hidden;max-width:600px">Every animal has its own language, and the machine is also!
				Natural Language Processing (NLP) is a bridge between machine language and human language to achieve the purpose of human-computer communication.
				Humans communicate through language, and dogs communicate through barking. The machine also has its own way of communication, that is digital information.</p>
		</div>
		<div class="card-footer small text-muted"></div>
	</div>

	<script src="${path}/jquery/jquery.min.js"></script>
	<script src="${path}/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="${path}/jquery-easing/jquery.easing.min.js"></script>
	<script src="${path}/js/sb-admin.min.js"></script>


</body>
</html>
<script type="text/javascript">
	var destinationPopupCloser = document.getElementById("destination-popup-closer");
	destinationPopupCloser.onclick = function() {
		parent.document.getElementById("destination").style.display = "none";
	};
</script>