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

    <title>注册页</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="${path}/css/sb-admin.css" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="${path}/images/tesla.png"/>
    <style type="text/css">
        @font-face {
            font-family: "navFont";
            src: url(${path}/fonts/方正清刻本悦宋简体.TTF);
        }

        .my-form {
            background-color: transparent;
            border-radius: 0;
            border: 1px solid;
            font-family: navFont;
        }

        .control-label {
            font-family: navFont;
            font-size: 20px;
        }
        .my-login {
            max-width: unset;
            width: 60%;
            padding-bottom: 12px;
            padding-top: 12px;
            margin: 0;
            margin-top: 15px;
            font-family: navFont;
            font-size: 22px;
        }

        .return-login{
            float: right;
            margin-right: 0;
            margin-top:20px;
        }
    </style>
</head>

<body background="${path}/images/register.jpg"
      style=" background-repeat:no-repeat;background-size:100%;background-attachment:fixed;">
<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header" align="center" style="font-family: navFont;font-size: 30px;">即时新闻信息管理系统账户注册</div>
        <div class="card-body">
            <form action="${path}/pages/register_check.action" method="post">

                <div class="form-group">
                    <label for="email" class="control-label">邮箱 <i class="fa fa-envelope-o fa-fw"></i></label>
                    <input class="form-control my-form" id="email" name="email" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-md-6">
                            <label for="password" class="control-label">密码 <i class="fa fa-key fa-fw"></i></label>
                            <input class="form-control my-form" id="password" name="password" placeholder="Password">
                        </div>
                        <div class="col-md-6">
                            <label for="ConfirmPassword" class="control-label">确认密码</label>
                            <input class="form-control my-form" id="ConfirmPassword" name="confirmpassword"
                                   placeholder="Confirm password">
                        </div>
                    </div>
                </div>
                <div class="box" style="align-self: center;font-family: navFont;">
                    <div class="bg-1">
                        <button class="button button--pipaluk button--inverted button--text-thick btn-submit my-login"
                                type="submit"
                                value="注册" onclick="isSame()">
                            登陆
                        </button>
                    </div>
                    <a class="smaller button button--ujarak button--border-thin button--text-thick return-login"
                       href="${path}/pages/login.action" style="text-align: center;font-size: 12px;">已有账号？立即登陆</a>
                </div>
            </form>

        </div>
    </div>
</div>
<script src="${path}/jquery/jquery.min.js"></script>
<script src="${path}/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${path}/jquery-easing/jquery.easing.min.js"></script>
<script>
    function isSame() {
        var email = $("input[name=email]");
        var p1 = $("input[name=password]");
        var p2 = $("input[name=confirmpassword]");
        if (email.val() == '' || p1.val() == '' || p2.val() == '') {
            alert("邮箱或密码不能为空");
        } else if (p1.val() != p2.val()) {
            alert("两次密码不一致！");
        }
    }
</script>
</body>
</html>
