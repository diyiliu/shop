<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="report" uri="/WEB-INF/runqianReport.tld"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2><a href="${ctx}/ireport.htm">统计报表</a></h2>
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
