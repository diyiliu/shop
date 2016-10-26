<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/style/plugin/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/style/plugin/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/style/plugin/zTree/zTreeStyle.css">

    <script type="text/javascript" src="${rc.contextPath}/style/js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/style/plugin/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/style/plugin/zTree/jquery.ztree.core-3.5.min.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'north'" style="height:80px"></div>
<div data-options="region:'south'" style="height:10px"></div>
<div data-options="region:'west',split:true" title="我的菜单" style="width:245px">
    <ul id="tree" class="ztree" style="width:auto; overflow:hidden;"></ul>
</div>
<div id="content" data-options="region:'center',title:'内容'" style="padding: 0">
    <iframe id="myframe" frameborder="0" scrolling="auto" width="100%" src="${rc.contextPath}/index.htm"></iframe>
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
                    var target = treeNode.path + '.htm';
                    console.log(target);
                    $.get(target, function (data) {
                        $("#content").html(data);
                    });
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
        $("#myframe").height($("#content").height()-3);
    })
</script>
<body>