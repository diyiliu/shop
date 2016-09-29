<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<h1>欢迎光临</h1>
<h2>果蔬列表</h2>
<p>Today:</p>
<ul>
    <c:forEach  items="${list}" var="item">
        <li>${item.name} ￥${item.price}</li>
    </c:forEach>
</ul>
</body>
</html>
