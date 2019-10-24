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
    <img class="img-logo" alt="logo" src="${path}/images/logo_white.png" />
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
							<h4 >实时数据量：<span id="data-amount">170386</span> </h4>
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
										<textarea id="nlp_input" name = "nlp_input"></textarea>
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
										<button type="submit" class="button button-green button-small" id="translateBtn">提取</button>
									</div>
									<!-- end button container -->
								</div>
							</form>
							<form class="contact-form" method="post" enctype="multipart/form-data">
								<!-- left side -->
						    	<div class="col-md-6 col-sm-12 no-pad">
							    	<div class="input-container">
								    	<input type="text" id="address" name="address" />
								    	<label for="address">地址</label>
                        	        
								    	<div class="input-border-bottom"></div>
							    	</div>
						    	</div>
						    	<!-- end left side -->
						    	<!-- right side -->
						    	<div class="col-md-6 col-sm-12 no-pad">
							    	<div class="input-container">
								    	<input type="text" id="sentiment" placeholder="情绪"/>
								    	<div class="input-border-bottom"></div>
							    	</div>
						    	</div>
						    	<!-- end right side -->
						    	<!-- full width -->
						    	<div class="col-xs-12 text-center no-pad">                            
							    	<div class="input-container no-mrg">
								    	<textarea id="abstract" name="abstract"></textarea>
								    	<label for="abstract">摘要</label>
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
						<div id="map" style="height:550px;padding:50px" ></div>
							<script type="text/javascript">
								var map = new ol.Map({
									target: 'map',
									controls: ol.control.defaults({attributionOptions: {collapsed: false}})
											.extend([new ol.supermap.control.Logo()]),
									view: new ol.View({
										center: [114.36, 30.54],
										zoom: 14,
										projection: "EPSG:4326",
									}),

									layers: [new ol.layer.Tile({
										source: new ol.source.Tianditu({
											layerType: 'ter',
											key: "1d109683f4d84198e37a38c442d68311",
											projection: "EPSG:4326"
										})
									}), new ol.layer.Tile({
										source: new ol.source.Tianditu({
											layerType: 'ter',
											key: "1d109683f4d84198e37a38c442d68311",
											isLabel: true,
											projection: "EPSG:4326"
										})
									})]
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

	<script type="text/javascript" src="${path}/js/jquery.js"></script>
	<script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${path}/js/plugins.min.js"></script>
	<script type="text/javascript" src="${path}/js/main_slideshow.js"></script>

</body>
</html>
