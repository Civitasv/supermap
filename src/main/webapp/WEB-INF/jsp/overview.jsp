<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->

    <link rel="stylesheet" href="${path}/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="${path}/css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${path}/css/style.default.css" id="theme-stylesheet">

    <script src="${path}/assets/js/jquery.min.js" type="text/javascript"></script>
    <script>
        $(function () {
            $.ajax({
                method: "GET",
                timeout: 500000,
                async: true,
                dataType: "json",
                url: "http://api.tianapi.com/txapi/weibohot/?key=d6a3799e3a109821972aa3688479fd11",
                success: function (data) {
                    console.log(data);
                    for (var i = 0; i < 50; i++) {
                        var str = "<div class=\"col-lg-6\">"
                            + "<a href=\"https://www.weibo.com\" target=\"_blank\" class=\"message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style\">"
                            + "<div class=\"row\">"
                            + "<div class=\"col-lg-3 d-flex align-items-center flex-column flex-lg-row text-center text-md-left\">"
                            + "<strong class=\"h5 mb-0 num\">"
                            + data["newslist"][i]["hotwordnum"]
                            + "</strong>"
                            + "</div>"
                            + "<div class=\"col-lg-9 d-flex align-items-center flex-column flex-lg-row text-center text-md-left\">"
                            + "<h6 class=\"mb-0 title\" >"
                            + data["newslist"][i]["hotword"]
                            + "</h6>"
                            + "</div>"
                            + "</div>"
                            + "</a>"
                            + "</div>"
                        $("#weibo").append(str);
                        $("#loading").hide();
                    }
                },
                error: function () {
                    console.log("加载失败");
                    $("#loading_wb").text("加载失败")
                }
            });

            $.ajax({
                method: "GET",
                timeout: 500000,
                async: true,
                dataType: "json",
                url: "http://api.tianapi.com/bulletin/?key=d6a3799e3a109821972aa3688479fd11",
                success: function (data) {
                    console.log(data);
                    var limit = 6;
                    for (var i = 0; i < limit; i++) {
                        if (data["newslist"][i]["imgsrc"] == null) {
                            i++;
                            limit++;
                        }
                        if (data["newslist"][i]["imgsrc"] == "") {
                            i++;
                            limit++;
                        }
                        var str = "<div class=\"col-lg-4 mb-4 mb-lg-0 p-2 \">"
                            + "<div class=\"card rounded credit-card bg-hover-gradient-violet\">"
                            + "<a href=\""
                            + data["newslist"][i]["url"]
                            + " \" target=\"blank\">"
                            + "<div class=\"content d-flex flex-column  justify-content-between align-items-center p-2\">"
                            + "<img style=\"width:80%;height:80%;\" src="
                            + data["newslist"][i]["imgsrc"]
                            + ">"
                            + "<div class=\"font-weight-bold d-block text-dark p-1\">"
                            + data["newslist"][i]["title"]
                            + "</div>"
                            + "</div>"
                            + "</a>"
                            + "</div>"
                            + "</div>"
                        $("#news_img").append(str);
                        $("#loading_imgsec").hide();
                    }
                },
                error: function () {
                    console.log("加载失败");
                    $("#loading_img").text("加载失败");

                }
            });
        });
    </script>
</head>
<body>
<div class="d-flex align-items-stretch">
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <section class="py-3">

                <div class="row text-dark" id="news_img">
                    <div class="col-lg-4 mb-4 mb-lg-0" id="loading_imgsec">
                        <div class="card rounded credit-card bg-hover-gradient-violet">
                            <div class="content d-flex flex-column  justify-content-between align-items-center p-5">
                                <div class="font-weight-bold d-block text-dark p-5" id="loading_img">数据加载中</div>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
            <section class="py-3">
                <div class="row" id="weibo">

                    <div class="col-lg-6" id="loading">
                        <a href="https://www.weibo.com" target="_blank"
                           class="message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style">
                            <div class="row">
                                <div class="col-lg-3 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                </div>
                                <div class="col-lg-9 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                    <h6 class="mb-0 title" id="loading_wb">数据加载中</h6>
                                </div>
                            </div>
                        </a>
                    </div>

                </div>
            </section>
        </div>
    </div>
</div>

<script src="${path}/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>