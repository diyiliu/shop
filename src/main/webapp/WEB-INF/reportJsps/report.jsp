<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="report" uri="/WEB-INF/runqianReport.tld"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>统计报表</h2>
<body style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px;">
<report:html
        name="report"
        reportFileName="shop.raq"
        saveAsName="报送情况"/>

<report:html
        name="report"
        reportFileName="shop2.raq"
        saveAsName="报送情况"/>
</body>
</body>
</html>
