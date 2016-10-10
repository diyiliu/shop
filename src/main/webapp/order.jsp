<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="d" uri="http://www.diyiliu.com.date" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>订单列表</h2>
<p>Order List:</p>
<table style="width:100%; border-spacing:0;">
    <tr>
        <th>订单序号</th>
        <th>交易金额</th>
        <th>下单时间</th>
        <th>订单详情</th>
    </tr>
    <c:forEach items="${list}" var="item" varStatus="s">
        <tr>
            <td>${s.index + 1}</td>
            <td>￥${item.money}</td>
            <td><d:dateTag date="${item.orderDate}"/></td>
            <td>
                <a href="javascript:show('${item.id}','${s.index + 1}')">查看</a>
            </td>
        </tr>
    </c:forEach>
</table>

<script type="text/javascript">
    function show(id,index) {
        $("table tr.detail-product").remove();

        var row = $("table tr:eq(" + index + ")");
        if (row.hasClass("detail-show")){
            row.removeClass("detail-show");
        }else {
            row.addClass("detail-show");

            var content = "";
            $.ajax({
                url: "./pur/detail.htm",
                data: {purId:id},
                type: "post",
                dataType: 'json',
                success: function (result) {

                    for (var i in  result){
                        content += "<tr class='detail-product'><td></td>";
                        content += "<td>￥" + result[i].proPrice + "</td><td>" + result[i].product.name + "</td><td>" + result[i].proCount + "个</td></tr>";
                    }

                    row.after(content);
                }
            });
        }
    }
</script>
</body>
</html>
