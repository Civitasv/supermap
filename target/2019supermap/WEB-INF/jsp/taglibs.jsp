<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- 定义绝对路径的变量 -->
<c:set var="path" value="${pageContext.request.contextPath }"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript">
        //定义js可以访问的全局变量
        var path = "${path}";
    </script>

</head>
<link href="${path}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${path}/css/buttons.css" rel="stylesheet" type="text/css">
<link href="${path}/css/checkboxes.min.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${path}/images/favicon.ico" type="image/x-icon"/>
<link href="${path}/font-awesome/css/font-awesome.min.css"
      rel="stylesheet" type="text/css">
<body>
</body>
</html>