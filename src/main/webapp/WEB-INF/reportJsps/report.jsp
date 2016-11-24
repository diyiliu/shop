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
        needPageMark="no"
        needSaveAsExcel="yes"
        needSaveAsPdf="yes"
        needPrint="yes"
        saveAsName="订单报表"/>

<report:print
        name="report"
        width="800"
        reportFileName="shop2.raq"
        canModify="no"/>
</body>
</html>
