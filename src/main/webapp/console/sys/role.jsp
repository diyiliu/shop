<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/style/plugin/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/style/plugin/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/style/plugin/zTree/zTreeStyle.css">

    <script type="text/javascript" src="${ctx}/style/js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/style/plugin/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/style/plugin/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div class="easyui-layout" fit="true">
    <div region="north" border="false" class="p-search" style="padding: 20px 10px;">
        <label>Search:</label><input type="text"/>
    </div>
    <div region="center" border="false">
        <table id="dg" title="角色信息列表" class="easyui-datagrid" style="height: 100%"
               data-options="border:false,rownumbers:true,singleSelect:true,pagination:true,url:'${ctx}/data/datagrid_data1.json',method:'get',toolbar:'#tb'">
            <thead>
            <tr>
                <th data-options="field:'itemid',width:80">Item ID</th>
                <th data-options="field:'productid',width:100">Product</th>
                <th data-options="field:'listprice',width:80,align:'right'">List Price</th>
                <th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>
                <th data-options="field:'attr1',width:240">Attribute</th>
                <th data-options="field:'status',width:60,align:'center'">Status</th>
            </tr>
            </thead>
        </table>
    </div>
</div>

<div id="tb" style="padding:2px 5px;">
    <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加</a>
    <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a>
    <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-remove">删除</a>
</div>
</body>
</html>
