<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>商品列表</h2>
<p>Fresh Fruit:</p>
<form action="" method="post">
    <table style="width:100%; border-spacing:0;">
        <tr>
            <th>名称</th>
            <th>价格</th>
            <th>库存</th>
        </tr>
        <c:forEach items="${list}" var="item">
            <tr>
                <td>
                        ${item.name}
                </td>
                <td>
                    ￥${item.price}
                </td>
                <td>
                        ${item.count}
                </td>
            </tr>
        </c:forEach>
    </table>
    <p class="form_footer">
        <input class="submit" type="submit" value="提交订单">
    </p>
</form>
</body>
</html>
