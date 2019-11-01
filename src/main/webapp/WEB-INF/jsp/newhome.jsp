<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <!-- title -->
    <title>AINewsSupermap</title>
    <!-- CSS IMPORT -->
    <script type="text/javascript">
        //定义js可以访问的全局变量
        var path = "${path}";
    </script>

    <script type="text/javascript" src="${path}/supermap/include-web.js"></script>
    <script type="text/javascript" src="${path}/assets/js/gbk.js"></script>
    <script type="text/javascript" src="${path}/supermap/include-openlayers.js"></script>


    <script type="text/javascript" src="${path}/js/jquery.js"></script>
    <script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path}/js/plugins.min.js"></script>
    <script type="text/javascript" src="${path}/js/main_slideshow.js"></script>

    <link rel="stylesheet" href="${path}/css/style.css"/>
    <link rel="shortcut icon" href="${path}/images/favicon.ico" type="image/x-icon"/>
</head>
<body>
<!-- preloader -->
<div class="preloader-container">
    <div class="content-container">
        <!-- preloader -->
        <span class="spinner-section-far"></span>
        <!-- end preloader -->
        <h6 class="preloader-text">
            LOADING</h6>
    </div>
</div>
<!-- end preloader -->
<!-- logo -->
<img class="img-logo" alt="logo" src="${path}/images/logo_white.png"/>
<!-- end logo -->
<!-- menu -->
<div class="open">
    <div class="cls">
    </div>
    <div>
        <ul class="sub-menu-t">
            <li class="active"><a class="menu-link" data-section="home" data-nav-title="home"
                                  data-section-pos="0" data-section-posy="0">Home <i class="fa fa-fw"></i>
            </a></li>
            <li><a class="menu-link" data-section="about" data-nav-title="about" data-section-pos="0"
                   data-section-posy="-100">Visualization<i class="fa fa-fw"></i></a></li>
            <li><a class="menu-link" data-section="works" data-nav-title="works" data-section-pos="-100"
                   data-section-posy="-100">Management<i class="fa fa-fw"></i></a></li>
            <li><a class="menu-link" data-section="contact" data-nav-title="contact" data-section-pos="-100"
                   data-section-posy="0">NLP Client<i class="fa fa-fw"></i></a></li>
        </ul>
    </div>
    <div class="cls">
    </div>
</div>
<!-- end menu  -->
<!-- page container -->
<div class="page-container">
    <!-- section container -->
    <div class="section-container">
        <!-- home section -->
        <section class="home-section">
            <!-- section background -->
            <div class="bg-container"></div>
            <!-- end section background -->
            <!-- content -->
            <div class="content col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-rlt no-pad centering-y">
                <div class="col-md-12 col-sm-12">
                    <!-- headline -->
                    <h3>AINewsSupermap——新闻情绪数据可视化与管理平台</h3>
                    <div class="sub-title" id="wordsrotator">
                        <h4>从地理信息科学，我们重新思考情绪</h4>
                    </div>
                    <h4>实时数据量：<span id="data-amount">170386</span></h4>
                </div>
            </div>
            <!-- end content -->
        </section>
        <!-- end home section -->
        <!-- about section -->
        <section class="about-section">
            <!-- section background -->
            <div class="bg-container-static"></div>
            <!-- end section background -->
            <!-- content -->
            <div class="content col-md-8 col-md-offset-2 col-sm-12 col-sm-rlt col-xs-12 no-pad centering-y">
                <div class="col-md-12 col-sm-12">
                    <h1>Visualization</h1>
                    <!-- company description -->
                    <div class="desc">
                        <!-- quote -->
                        <p class="quote separator-line">
                            新闻情绪可视化平台入口
                        </p>
                        <!-- end quote -->
                    </div>
                    <div class="col-xs-12 no-pad text-left mrg-top-xs">
                        <a href="${path}/pages/newview.action">
                            <button type="submit" class="button button-green button-small">enter</button>
                        </a>
                    </div>
                    <!-- end company description -->
                </div>
            </div>
            <!-- end content -->
        </section>
        <!-- end about section -->
        <!-- service section -->
        <section class="works-section">
            <!-- section background -->
            <div class="bg-container-static"></div>
            <!-- end section background -->
            <!-- content -->
            <div class="content col-md-8 col-md-offset-2 col-sm-12 col-sm-rlt col-xs-12 no-pad centering-y">
                <div class="col-md-12 col-sm-12">
                    <h1>Management</h1>
                    <!-- company description -->
                    <div class="desc">
                        <!-- quote -->
                        <p class="quote separator-line">
                            新闻情绪数据管理平台入口
                        </p>
                        <!-- end quote -->
                    </div>
                    <div class="col-xs-12 no-pad text-left mrg-top-xs">
                        <a href="${path}/pages/login.action">
                            <button type="submit" class="button button-green button-small">enter</button>
                        </a>
                    </div>
                    <!-- end company description -->
                </div>
            </div>
            <!-- end content -->
        </section>
        <!-- end works section -->
        <!-- contact section -->
        <section class="contact-section">
            <!-- section background -->
            <div class="bg-container-static"></div>
            <!-- end section background -->
            <!-- content -->
            <div class="content col-md-10 col-md-offset-1 col-sm-12 col-xs-12 no-pad centering-y col-sm-rlt">
                <!-- contact form container -->
                <div class="contact-form-container col-md-6 col-sm-12 col-xs-12">
                    <h5>新闻文本情绪、地址、摘要提取</h5>
                    <form class="contact-form" enctype="multipart/form-data" action="${path}/mood/baidu_mood.action">
                        <!-- full width -->
                        <div class="col-xs-12 text-center no-pad">
                            <div class="input-container no-mrg">
                                <textarea id="nlp_input" name="nlp_input"></textarea>
                                <label for="nlp_input">原文</label>
                                <div class="input-border-bottom"></div>
                            </div>
                            <!-- notification container -->
                            <div class="col-xs-12 notif-container no-pad">
                                <div class="form-notif"></div>
                            </div>
                            <!-- end notification container -->
                            <!-- button container -->
                            <div class="col-xs-12 no-pad text-left mrg-all-xs">
                                <button type="submit" class="button button-green button-small" id="translateBtn">提取
                                </button>
                            </div>
                            <!-- end button container -->
                        </div>
                    </form>
                    <form class="contact-form" method="post" enctype="multipart/form-data">
                        <!-- left side -->
                        <div class="col-md-12 col-sm-12 no-pad">
                            <div class="input-container">
                                <input type="text" id="address" name="address"/>
                                <label for="address" id="adr_lb">地址</label>

                                <div class="input-border-bottom"></div>
                            </div>
                        </div>
                        <!-- end left side -->
                        <!-- right side -->
                        <div class="col-md-12 col-sm-12 no-pad">
                            <div class="input-container">
                                <input type="text" id="sentiment"/>
                                <label for="sentiment" id="stm_lb">情绪</label>
                                <div class="input-border-bottom"></div>
                            </div>
                        </div>
                        <!-- end right side -->
                        <!-- full width -->
                        <div class="col-xs-12 text-center no-pad">
                            <div class="input-container no-mrg">
                                <textarea id="summary" name="summary"></textarea>
                                <label for="summary" id="smy_lb">摘要</label>
                                <div class="input-border-bottom"></div>
                            </div>
                            <!-- notification container -->
                            <div class="col-xs-12 notif-container no-pad">
                                <div class="form-notif"></div>
                            </div>
                            <!-- end notification container -->
                        </div>
                        <!-- end full width -->
                    </form>
                </div>
                <!-- end contact form container -->
                <div class="contact-form-container col-md-6 col-sm-12 col-xs-12 " style="padding:0">
                    <div id="map" style="height:600px;padding:50px"></div>
                    <script type="text/javascript">
                        var url = (window.isLocal ? window.server : "http://support.supermap.com.cn:8090") + "/iserver/services/map-china400/rest/maps/China_4326";
                        var addressUrl = (window.isLocal ? window.server : "http://support.supermap.com.cn:8090") + "/iserver/services/addressmatch-Address/restjsr/v1/address";
                        var imgurl = path + '/images/blue_marker.png';
                        var vectorSource = new ol.source.Vector();
                        var addressMatchService = new ol.supermap.AddressMatchService(addressUrl);
                        var view = new ol.View({
                            center: [108.3, 30.6],
                            projection: 'EPSG:4326',
                            maxZoom: 19,
                            zoom: 5
                        });
                        new ol.supermap.MapService(url).getMapInfo(function (serviceResult) {
                            var mapJSONObj = serviceResult.result;
                            map = new ol.Map({
                                controls: ol.control.defaults({attributionOptions: {collapsed: false}})
                                    .extend([new ol.supermap.control.Logo()]),
                                target: document.getElementById('map'),
                                view: view
                            });
                            var options = ol.source.TileSuperMapRest.optionsFromMapJSON(url, mapJSONObj);
                            var layer = new ol.layer.Tile({
                                source: new ol.source.TileSuperMapRest(options)
                            });
                            map.addLayer(layer);

                            var vectorLayer = new ol.layer.Vector({
                                source: vectorSource
                            });
                            map.addLayer(vectorLayer);
                        });

                        //-- 6.26 validate and submit contact us form
                        $('.contact-form').validate({
                            rules: {
                                nlp_input: {
                                    required: true
                                }
                            },
                            highlight: function (element, errorClass, validClass) {
                                $(element).parent().addClass('form-error');
                            },
                            unhighlight: function (element, errorClass, validClass) {
                                $(element).parent().removeClass('form-error');
                            },
                            errorPlacement: function (error, element) {

                            },
                            submitHandler: function (form) {
                                var url_dest = $(form).attr('action');
                                var form_data = $(form).serialize();

                                console.log(url_dest + "?" + form_data)
                                //-- show loading
                                $(form).find('.form-notif').find('label').remove();
                                $(form).find('.form-notif').append('<label class="loading">Please wait</label>').addClass('is-visible');

                                $.ajax({
                                    method: "POST",
                                    timeout: 500000,
                                    contentType: "application/json;charset=utf-8",
                                    dataType: "json",
                                    async: true,
                                    url: url_dest + "?" + form_data,
                                    success: function (output) {
                                        console.log(output);
                                        $("#adr_lb").attr("style", "display:none;");
                                        $("#stm_lb").attr("style", "display:none;");
                                        $("#smy_lb").attr("style", "display:none;");

                                        //-- show result
                                        var stmt_type = 'unknown';
                                        switch (output['sentiment']) {
                                            case 0:
                                                stmt_type = '消极';
                                                break;
                                            case 1:
                                                stmt_type = '中性';
                                                break;
                                            case 2:
                                                stmt_type = '积极';
                                                break;
                                        }

                                        $("#sentiment").val("情绪类别:  " + stmt_type + "\r" +
                                            "； 置信度: " + output['confidence'] + "\r" +
                                            "； 消极概率: " + output['negative_prob'] + "\r" +
                                            "； 积极概率: " + output['positive_prob'] + "\r");

                                        $("#summary").val(output['summary'] + "\r");
                                        var addr = "";
                                        if (output['province'] != "unknown") {
                                            addr += output['province'];
                                        }
                                        if (output['city'] != "unknown") {
                                            addr += output['city'];
                                        }
                                        if (output['town'] != "unknown") {
                                            addr += output['town']
                                        }
                                        if (output['county'] != "unknown") {
                                            addr += output['county']
                                        }
                                        if (output['detail'] != "unknown") {
                                            addr += output['detail']
                                        }

                                        console.log(addr);
                                        if(addr==""){
                                            addr="湖北省武汉市"
                                        }
                                        $("#address").val("地址信息提取结果:  " + addr);
                                        vectorSource.clear();
                                        var feature = new ol.Feature();
                                        var features = [];
                                        feature.setGeometry(new ol.geom.Point([output['lon'],output['lat']]));
                                        feature.setStyle(new ol.style.Style({
                                            image: new ol.style.Icon(({
                                                opacity: 1,
                                                src: imgurl,
                                                scale: 0.8
                                            }))
                                        }));
                                        features.push(feature);
                                        vectorSource.addFeatures(features);
                                        view.animate({zoom: 7}, {center: [output['lon'],output['lat']]});
                                        /*
                                        var geoCodeParam = new SuperMap.GeoCodingParameter({
                                            address: addr,
                                            fromIndex: 0,
                                            toIndex: 10,
                                            filters: output['city'],
                                            prjCoordSys: "{epsgCode:4326}" ,// 3857? 4326?
                                            maxReturn: 1
                                        });
                                        addressMatchService.code(geoCodeParam, match);

                                        function match(obj) {
                                        	console.log(obj.result);
											var center_point = new ol.geom.Point([obj.result[0].location.x, obj.result[0].location.y]);
                                            vectorSource.clear();
                                            var features = [];
                                            obj.result.map(function (item) {
                                                var feature = new ol.Feature();
                                                feature.setGeometry(new ol.geom.Point([item.location.x, item.location.y]));
                                                feature.setProperties({
                                                    location: item.location,
                                                    address: item.address,
                                                    score: item.score,
                                                    filters: item.filters
                                                });
                                                feature.setStyle(new ol.style.Style({
                                                    image: new ol.style.Icon(({
                                                        opacity: 1,
                                                        src: imgurl,
                                                        scale: 0.4
                                                    }))
                                                }));
                                                features.push(feature);
                                            });
                                            vectorSource.addFeatures(features);
                                            view.animate({zoom: 11}, {center: [obj.result[0].location.x, obj.result[0].location.y]});
                                        }
                                        */
                                        //-- hide loading
                                        var wait_loading = setTimeout(function () {
                                            $(form).find('.form-notif').removeClass('is-visible');
                                            clearTimeout(this);
                                        }, 1000);

                                        //-- show notif success
                                        var show_notif = setTimeout(function () {
                                            $(form).find('.form-notif').find('label').remove();
                                            $(form).find('.form-notif').append('<label class="notif-success">Analysis Finished!</label>');
                                            $(form).find('.form-notif').addClass('is-visible');
                                            clearTimeout(this);
                                        }, 1500);

                                        //-- wait 5 seconds and then hide the notification
                                        var hide_notif = setTimeout(function () {
                                            $(form).find('.form-notif').removeClass('is-visible');
                                            clearTimeout(this);
                                        }, 7000);
                                    },
                                    error: function () {

                                        //-- reset form
                                        $(form).trigger('reset');
                                        $(form).find('.filled').each(function (index, element) {
                                            $(this).removeClass('filled');
                                        });

                                        //-- hide loading
                                        var wait_loading = setTimeout(function () {
                                            $(form).find('.form-notif').removeClass('is-visible');

                                            clearTimeout(this);
                                        }, 1000);

                                        //-- show notif error
                                        var show_notif = setTimeout(function () {
                                            $(form).find('.form-notif').find('label').remove();
                                            $(form).find('.form-notif').append('<label class="notif-error">Error</label>');
                                            $(form).find('.form-notif').addClass('is-visible');

                                            clearTimeout(this);
                                        }, 1500);

                                        //-- wait 5 seconds and then hide the notification
                                        var hide_notif = setTimeout(function () {
                                            $(form).find('.form-notif').removeClass('is-visible');

                                            clearTimeout(this);
                                        }, 7000);
                                    }
                                });
                                return false;
                            }
                        });

                    </script>
                </div>

            </div>
            <!-- end content -->
        </section>
        <!-- end contact section -->
    </div>
    <!-- end section container -->
</div>
<!-- end page container -->
<!-- javascript import -->
<!-- jquery -->

</body>
</html>
