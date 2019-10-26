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
		<a href="#" id="super-popup-closer" class="ol-popup-closer"></a>
		<div class="card-header">
			<i class="fa fa-area-chart"></i>新闻介绍
		</div>
		<br>

		<div>
			<img src="${path}/images/super_intro.jpg" width="500" height="auto" alt=""
				align="left" />
			<h2 align="center">介绍文本</h2>
			<p style="text-indent:2em;overflow:hidden;max-width:650px">
				每种动物都有自己的语言，机器也是！
				自然语言处理（NLP）就是在机器语言和人类语言之间沟通的桥梁，以实现人机交流的目的。
				人类通过语言来交流，狗通过汪汪叫来交流。机器也有自己的交流方式，那就是数字信息。</p>

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
	var superPopupCloser = document.getElementById("super-popup-closer");
	superPopupCloser.onclick = function() {
		parent.document.getElementById("super").style.display = "none";
	};
</script>