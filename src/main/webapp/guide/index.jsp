<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <div class="container" id="mainPanel">
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="popular clearfix">
                    <div class="coupon coupon-column">
                        <div class="coupon-inner">
                            <a href="#">
                                <img src="../source/image/3.jpg">
                            </a>
                        </div>
                    </div>
                    <p><i class="tmall"></i><span class="good">${fn:substring("韩版时尚女士简约复古单肩包", 0, 15)}</span></p>
                    <p class="sale">券后价<span class="small" style="margin-left: 10px">￥</span><span class="h3">149.8</span><span class="h4 old" style="margin-left: 15px">￥320</span></p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="popular clearfix">
                    <div class="coupon coupon-column">
                        <div class="coupon-inner">
                            <a href="#">
                                <img src="../source/image/3.jpg">
                            </a>
                        </div>
                    </div>
                    <p><i class="tmall"></i><span class="good">${fn:substring("韩版时尚女士简约复古单肩包", 0, 15)}</span></p>
                    <p class="sale">券后价<span class="small" style="margin-left: 10px">￥</span><span class="h3">149.8</span><span class="h4 old" style="margin-left: 15px">￥320</span></p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="popular clearfix">
                    <div class="coupon coupon-column">
                        <div class="coupon-inner">
                            <a href="#">
                                <img src="../source/image/3.jpg">
                            </a>
                        </div>
                    </div>
                    <p><i class="tmall"></i><span class="good">${fn:substring("韩版时尚女士简约复古单肩包", 0, 15)}</span></p>
                    <p class="sale">券后价<span class="small" style="margin-left: 10px">￥</span><span class="h3">149.8</span><span class="h4 old" style="margin-left: 15px">￥320</span></p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="popular clearfix">
                    <div class="coupon coupon-column">
                        <div class="coupon-inner">
                            <a href="#">
                                <img src="../source/image/3.jpg">
                            </a>
                        </div>
                    </div>
                    <p><i class="tmall"></i><span class="good">${fn:substring("韩版时尚女士简约复古单肩包", 0, 15)}</span></p>
                    <p class="sale">券后价<span class="small" style="margin-left: 10px">￥</span><span class="h3">149.8</span><span class="h4 old" style="margin-left: 15px">￥320</span></p>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        fetch(1, 12);
    })

    function fetch(page, rows) {
        $.ajax({
            url:'${ctx}/guide/list.htm',
            type:'GET',
            data:{page:page,rows:rows},
            dataType:'json',
            success:function(result){
                var dataGroup = result.rows;
                var content = '<div class="row">';
                for (i in dataGroup){
                    var data = dataGroup[i];
                    content += '<div class="col-md-3 col-sm-6 col-xs-12">' +
                            '<div class="popular clearfix">' +
                            '<div class="coupon coupon-column">' +
                            '<div class="coupon-inner">' +
                            '<a href="' + data["link1"] + '"><img src="${ctx}/' + data["imagePath"] + '"></a></div></div>' +
                            '<p><i class="' + data["storeType"] + '"></i><span class="good">' + data["name"] + '</span></p>' +
                            '<p class="sale">券后价<span class="small" style="margin-left: 10px">￥</span>' +
                            '<span class="h3">' + data["discount"] + '</span>' +
                            '<span class="h4 old" style="margin-left: 15px">￥' + data["price"] + '</span></p></div></div>';
                }
                content += '</div>';

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
