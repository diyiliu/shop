<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/style/plugin/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/style/plugin/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/style/plugin/zTree/zTreeStyle.css">

    <script type="text/javascript" src="${ctx}/style/js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/style/plugin/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/style/plugin/zTree/jquery.ztree.core-3.5.min.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false"  style="height:80px"></div>
<div data-options="region:'south'" style="height:10px"></div>
<div data-options="region:'west',split:true" title="我的菜单" style="width:245px">
    <ul id="tree" class="ztree" style="width:auto; overflow:hidden;"></ul>
</div>
<div data-options="region:'center'" style="padding: 0px; border: 0px;">
    <div id="myTab" class="easyui-tabs" data-options="fit:true,border:true" style="padding: 0px;">
        <div title="首页" style="overflow: hidden">
            <iframe id="myframe" frameborder="0" width="100%" height="100%"
                    src="${ctx}/index.htm"></iframe>
        </div>
    </div>
</div>
<script type="text/javascript">
    var zTree;
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pid",
                rootPId: null
            }
        },
        callback: {
            beforeClick: function (treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                if (treeNode.isParent) {
                    zTree.expandNode(treeNode);
                    return false;
                }
                else {
                    var url = '${ctx}/sys' + treeNode.path + '.htm';

                    if ($('#myTab').tabs('exists', treeNode.name)) {
                        $("#myTab").tabs('select',treeNode.name);
                        refreshTab(treeNode.id, url);
                    } else {
                        $('#myTab').tabs('add', {
                            title: treeNode.name,
                            content: '<div style="height:100%;overflow: hidden;"><iframe id="' + treeNode.id + '" scrolling="no" scorll="no" frameborder="0" height="100%" width="100%" src="' + url + '"></iframe></div>',
                            closable: true,
                            fit : true,
                            tools : [ {
                                iconCls : 'icon-mini-refresh',
                                handler : function() {
                                    refreshTab(treeNode.id, url);
                                }
                            } ]
                        });
                    }
                    return true;
                }
            }
        }
    };

    $(document).ready(function () {
        var t = $("#tree");
        $.fn.zTree.init(t, setting, ${list});
        zTree = $.fn.zTree.getZTreeObj("tree");
        zTree.expandAll(true);
    })

    function refreshTab(target, url) {
        var fm = document.getElementById(target);
        fm.contentWindow.location.href = url + "?r=" + Math.random();
    }
</script>
<body>