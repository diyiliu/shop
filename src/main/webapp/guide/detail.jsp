<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <h1 class="text-left">淘联盟</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="section">
    <div class="container" id="mainPanel">
        <div class="row">
            <div class="detail">
                <div class="col-md-3">
                    <div class="coupon-inner">
                        <a href="${goods.link1}" target="_blank">
                            <img src="${ctx}/${goods.imagePath}">
                        </a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="content">
                        <p><i class="tmall"></i><span class="title">${fn: substring(goods.name, 0, 50)}</span></p>
                        <p class="money"><span class="price-title">券后价  ￥</span><span class="price-now"><fmt:formatNumber value="${goods.discount}" pattern="##.#"/></span>
                            <span class="price-original">正常售价 ￥ <fmt:formatNumber value="${goods.price}" pattern="##.#"/></span></p>
                        <p class="coupon-price">优惠券<span class="sum" style="margin-left: 5px;margin-right: 5px">￥<fmt:formatNumber value="${goods.price - goods.discount}" maxFractionDigits="0"/></span>元</p>
                        <p class="goods-buy">
                            <a href="${goods.link2}" class="dis-price col-xs-6">马上领券</a>
                            <a href="${goods.link3}" class="go-buy col-xs-6">立即下单</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

</script>
</body>
</html>
