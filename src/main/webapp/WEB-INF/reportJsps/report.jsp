<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="report" uri="/WEB-INF/runqianReport.tld"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>统计报表</h2>
<report:html
        name="report"
        width="800"
        reportFileName="shop1.raq"
        saveAsName="报送情况"/>

<report:html
        name="report"
        width="800"
        reportFileName="shop2.raq"
        saveAsName="报送情况"/>
</body>
</html>
