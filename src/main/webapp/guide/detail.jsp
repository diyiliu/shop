<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱聚淘</title>
    <link rel="icon" type="image/x-icon" href="${ctx}/style/image/favicon.ico"/>

    <link rel="stylesheet" type="text/css" href="${ctx}/style/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/style/css/toko.css">

    <script type="text/javascript" src="${ctx}/style/js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/style/js/bootstrap.min.js"></script>
</head>
<body>
<div class="page-wrap">
    <div class="title-content">
        <nav class="navbar navbar-default" style="border: 0">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-4" data-stopPropagation="true">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="navbar-brand">
                        <div class="logo-heart">
                            <a href="www.ajutao.com" title="爱聚淘"></a>
                        </div>
                        <div class="logo-name">
                            <a href="www.ajutao.com" title="爱聚淘">爱聚淘</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</div>


<div class="section">
    <div class="container" id="mainPanel">
        <div class="detail">
            <div class="row">
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
        <div class="extend">
            <div class="row">
                <div class="col-xs-9">
                    <h3 class="text-center"><span class="icon_hot"></span>每周爆款<span class="icon_tejia"></span></h3>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        fetch(1, 6);
    })

    function fetch(page, rows) {
        $.ajax({
            url:'${ctx}/guide/list.htm?r='+ Math.random(),
            type:'GET',
            data:{page:page,rows:rows},
            dataType:'json',
            success:function(result){
                var dataGroup = result.rows;
                var content = '<div class="row"><div class="col-md-9">';
                for (i in dataGroup){
                    var data = dataGroup[i];
                    content += '<div class="col-lg-4 col-md-6 col-xs-12">' +
                            '<div class="popular clearfix">' +
                            '<div class="coupon coupon-column">' +
                            '<div class="coupon-inner">' +
                            '<a href="${ctx}/guide/toDetail.htm?serial=' + data["serial"] + '" target="_blank"><img src="${ctx}/' + data["imagePath"] + '"></a></div></div>' +
                            '<p><i class="' + data["storeType"] + '"></i><span class="good">' +  data["name"].substr(0, 25) + '</span></p>' +
                            '<p class="sale">券后价<span class="small" style="margin-left: 10px">￥</span>' +
                            '<span class="h3">' + data["discount"] + '</span>' +
                            '<span class="h4 old" style="margin-left: 15px">￥' + data["price"] + '</span></p></div></div>';
                }

                content += '</div></div>';

                $('#mainPanel').append(content);
            },
            error:function(xhr,textStatus){
                console.log('错误:' + textStatus);
            }
        })
    }
</script>
</body>
</html>
