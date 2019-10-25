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
    <base href="<%=basePath%>">

    <title>登陆页</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link href="${path}/css/sb-admin.css" rel="stylesheet">
    <script type="text/javascript" src="${path}/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/js/jquery.form.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="${path}/images/tesla.png"/>

    <style>
        .my-form {
            background-color: transparent;
            border-radius: 0;
            border: 1px solid;
            font-family: navFont;
        }

        .my-login {
            max-width: unset;
            width: 100%;
            padding-bottom: 12px;
            padding-top: 12px;
            margin: 0;
            margin-top: 15px;
            font-family: navFont;
            font-size: 22px;
        }

        @font-face {
            font-family: "navFont";
            src: url(${path}/fonts/方正清刻本悦宋简体.TTF);
        }


        .control-label {
            font-family: navFont;
            font-size: 20px;
        }

    </style>
</head>

<body background="${path}/images/login.jpg"
      style=" background-repeat:no-repeat;background-size:100% ;background-attachment:fixed;">
<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header" align="center" style="font-family: navFont;font-size: 30px;">即时新闻信息管理系统</div>
        <div class="card-body">
            <form id="login" action="${path}/pages/login_check.action" method="post">
                <div class="form-group">
                    <label for="email" class="control-label">邮箱 <i class="fa fa-envelope-o fa-fw"></i></label>
                    <input type="text" class="form-control my-form" id="email" name="email" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label for="password" class="control-label">密码 <i
                            class="fa fa-key fa-fw"></i></label>
                    <input type="password" class="form-control my-form" id="password" name="password"
                           placeholder="Password">
                </div>
                <label class="control-label">记住密码 <i
                        class="fa fa-angle-double-right fa-fw"></i></label>
                <div class="ckbx-style-2">
                    <input type="checkbox" id="ckbx-style-2-1" value="0" name="ckbx-style-2">
                    <label for="ckbx-style-2-1"></label>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <div class="bg-1">
                            <button class="button button--pipaluk button--inverted button--text-thick btn-submit my-login"
                                    type="submit"
                                    value="登陆" onclick="isEmpty()">
                                登陆
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="box" style="align-self: center;font-family: navFont;">
            <a class="smaller button button--ujarak button--border-thin button--text-thick"
               href="${path}/pages/register.action" style="text-align: center;font-size: 12px;">注册账户</a>
            <a class="smaller button button--ujarak button--border-thin button--text-thick"
               href="${path}/pages/index.action" style="text-align: center;font-size: 12px;">游客登陆</a>
        </div>

        <p id="ts"></p>
    </div>

</div>

<script src="${path}/jquery/jquery.min.js"></script>
<script src="${path}/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${path}/jquery-easing/jquery.easing.min.js"></script>
<script>
    function isEmpty() {
        var u = $("input[name=email]");
        var p = $("input[name=password]");

        if (u.val() == '' || p.val() == '') {
            alert("邮箱或密码不能为空");
        }
    }
</script>
</body>
</html>
