<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>商品列表</h2>
<p>Fresh Fruit:</p>
<form action="./pur/submit.htm" method="post">
    <table style="width:100%; border-spacing:0;">
        <tr>
            <th>名称</th>
            <th>价格</th>
            <th>库存</th>
            <th>购买数量</th>
        </tr>
        <c:forEach items="${list}" var="item" varStatus="s">
            <tr class="product">
                <td>
                        ${item.name}
                </td>
                <td>
                    ￥<em>${item.price}</em>
                </td>
                <td class="stock">
                        ${item.count}
                </td>
                <td>
                    <input type="number" class="count" name="countList[${s.index}]" value="0">
                    <input type="hidden" name="idList[${s.index}]" value="${item.id}">
                </td>
            </tr>
        </c:forEach>
    </table>
    <p class="form_footer">
        <input class="submit" type="submit" value="提交订单">
        <span class="money">总价:￥<em id="money">0</em></span>
        <input type="hidden" name="money" value="0">
    </p>
</form>
<script type="text/javascript" src="./style/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        $("input.count").change(function () {

            var st = parseInt($(this).parents("tr").find("td.stock").html());
            var buy = $(this).parents("tr").find("input.count").val();

            if (buy){
                buy = parseInt(buy);
            }else {
                buy = 0;
            }

            buy = buy < 0? 0: buy;
            buy = buy > st? st: buy;

            $(this).parents("tr").find("input.count").val(buy);

            sum();
        })
    })
    
    function sum() {

        var sum = 0;
        $("tr.product").each(function () {
            var un = Number($(this).find("td em").html());
            var buy = parseInt($(this).find("input.count").val());

            sum += buy*un;
        })

        $("#money").html(sum.toFixed(2))
        $("input[name='money']").val(sum.toFixed(2))
    }
    
</script>

</body>
</html>
