<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物导航</title>

    <link rel="stylesheet" type="text/css" href="${ctx}/style/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/style/css/toko.css">

    <script type="text/javascript" src="${ctx}/style/js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/style/js/bootstrap.min.js"></script>
</head>
<body>
<div class="page-wrap">
    <div class="title-content">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h1 class="text-center">今日爆款</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="popular clearfix">
                    <div class="coupon coupon-column">
                        <div class="coupon-inner">
                            <a href="#">
                                <img src="source/image/1.jpg">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="popular clearfix">
                    <div class="coupon coupon-column">
                        <div class="coupon-inner">
                            <a href="#">
                                <img src="source/image/2.jpg">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="popular clearfix">
                    <div class="coupon coupon-column">
                        <div class="coupon-inner">
                            <a href="#">
                                <img src="source/image/3.gif">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="popular clearfix">
                    <div class="coupon coupon-column">
                        <div class="coupon-inner">
                            <a href="#">
                                <img src="source/image/6.png">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
