<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${ctx}/style/plugin/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/style/plugin/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/style/plugin/zTree/zTreeStyle.css">


    <script type="text/javascript" src="${ctx}/style/js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/style/plugin/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/style/plugin/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div class="easyui-layout" fit="true">
    <div region="north" class="easyui-panel" border="false" style="padding: 20px 10px 5px 10px;">
        <input class="easyui-searchbox" data-options="prompt:'店名',searcher:doSearch" style="width:150px">
    </div>
    <div region="center" border="false">
        <table id="dg" title="商品列表" class="easyui-datagrid" style="height: 100%" rownumbers="true" fitColumns="true"
               data-options="border:false,singleSelect:true,pagination:true,url:'${ctx}/guide/list.htm',method:'post',toolbar:'#tb'">
            <thead>
            <tr>
                <th data-options="field:'name',width:80">商品名称</th>
                <th data-options="field:'price',width:80,align:'right'">原价</th>
                <th data-options="field:'discount',width:80,align:'right'">优惠价</th>
                <th data-options="field:'startTime',width:120">开始时间</th>
                <th data-options="field:'endTime',width:120">结束时间</th>
            </tr>
            </thead>
        </table>
    </div>
</div>

<div id="tb" style="padding:2px 5px;">
    <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="add();">添加</a>
    <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-edit" onclick="edit();">修改</a>
    <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-remove" onclick="del();">删除</a>
</div>


<div id="dlg" class="easyui-dialog" style="width:650px"
     data-options="buttons:'#dlg-buttons',draggable:false,closed:true">
    <form id="fm" action="${ctx}/guide/addGoods.htm" method="post" enctype="multipart/form-data" novalidate
          style="margin:0;padding:20px 50px">
        <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">商品信息</div>

        <div style="margin-bottom:10px">
            <div style="width: 100%">
                <div style="padding-left: 350px;width: 135px">
                    <img id="pv" src="#" style="width: 100%;height: 180px"/>
                </div>
            </div>
        </div>

        <div style="margin-bottom:10px">
            <input name="file" class="easyui-filebox" style="width:100%"
                   data-options="label:'图片:',prompt:'请选择商品图片...',onChange:function(){preview(this)}">
        </div>

        <div style="margin-bottom:10px">
            <input name="goods.name" class="easyui-textbox" style="width:100%" data-options="label:'商品名称:'">
        </div>

        <div style="margin-bottom:10px">
            <input name="goods.store" class="easyui-textbox" style="width:100%" data-options="label:'店铺名称:'">
        </div>

        <div style="margin-bottom:10px">
            <select class="easyui-combobox" name="goods.storeType" label="类别" style="width:100%">
                <option value="tmall" selected="selected">天猫</option>
                <option value="taobao">淘宝</option>
            </select>
        </div>

        <div style="margin-bottom:10px">
            <input name="goods.price" class="easyui-textbox" style="width:100%" data-options="label:'原价:'">
        </div>

        <div style="margin-bottom:10px">
            <input name="goods.discount" class="easyui-textbox" style="width:100%" data-options="label:'现价:'">
        </div>

        <div style="margin-bottom:10px">
            <input name="goods.tOrder" class="easyui-textbox" style="width:100%" data-options="label:'淘口令:'">
        </div>

        <div style="margin-bottom:10px">
            <input name="goods.link1" class="easyui-textbox" style="width:100%;height:30px"
                   data-options="label:'商品链接:',multiline:true">
        </div>

        <div style="margin-bottom:10px">
            <input name="goods.link2" class="easyui-textbox" style="width:100%;height:30px"
                   data-options="label:'优惠链接:',multiline:true">
        </div>

        <div style="margin-bottom:10px">
            <input name="goods.link3" class="easyui-textbox" style="width:100%;height:30px"
                   data-options="label:'购买链接:',multiline:true">
        </div>

        <div style="margin-bottom:10px">
            <input name="goods.startTime" class="easyui-datetimebox" style="width:100%" data-options="label:'开始时间:'">
        </div>

        <div style="margin-bottom:10px">
            <input name="goods.endTime" class="easyui-datetimebox" style="width:100%" data-options="label:'结束时间:'">
        </div>

    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
       onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
</div>

<script type="text/javascript">
    function doSearch(value) {
        alert('You input: ' + value);
    }
    var url;
    function add() {
        $('#dlg').dialog('open').dialog('center').dialog('setTitle', '添加商品');
        $('#fm').form('reset');
        url = '${ctx}/guide/addGoods.htm';
    }
    function edit() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $('#dlg').dialog('open').dialog('center').dialog('setTitle', 'Edit User');
            $('#fm').form('load', row);
            url = 'update_user.php?id=' + row.id;
        }
    }
    function save() {
        $('#fm').form('submit', {
            url: url,
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (result) {
                var result = eval('(' + result + ')');
                if (result.errorMsg) {
                    $.messager.show({
                        title: 'Error',
                        msg: result.errorMsg
                    });
                } else {
                    $('#dlg').dialog('close');        // close the dialog
                    $('#dg').datagrid('reload');    // reload the user data
                }
            }
        });
    }

    function del() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $.messager.confirm('提示', '确定要删除该角色?', function (r) {
                if (r) {
                    $.post('destroy_user.php', {id: row.id}, function (result) {
                        if (result.success) {
                            $('#dg').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({    // show error message
                                title: 'Error',
                                msg: result.errorMsg
                            });
                        }
                    }, 'json');
                }
            });
        }
    }

    function preview(_obj) {
        //var file = _obj.files[0];
        var file = document.getElementById('filebox_file_id_1').files[0];
        _imgSrc = getObjectURL(file);

        console.log("_imgSrc:" + _imgSrc);
        $("#pv").attr("src", _imgSrc);
    }

    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }
</script>
</body>
</html>
