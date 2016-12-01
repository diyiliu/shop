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
        <input class="easyui-searchbox" data-options="prompt:'请输入用户名',searcher:doSearch" style="width:150px">
    </div>
    <div region="center" border="false">
        <table id="dg" title="角色信息列表" class="easyui-datagrid" style="height: 100%" rownumbers="true" fitColumns="true"
               data-options="border:false,singleSelect:true,pagination:true,url:'${ctx}/role/list.htm',method:'get',toolbar:'#tb'">
            <thead>
            <tr>
                <th data-options="field:'name',width:80">名称</th>
                <th data-options="field:'remark',width:100">描述</th>
                <th data-options="field:'createDate',width:80,align:'right'">创建时间</th>
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


<div id="dlg" class="easyui-dialog" style="width:400px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
        <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">角色信息</div>
        <div style="margin-bottom:10px">
            <input name="name" class="easyui-textbox" style="width:100%" data-options="required:true,label:'角色名:'">
        </div>
        <div style="margin-bottom:10px">
            <input name="remark" class="easyui-textbox" style="width:100%;height:60px" data-options="required:true,label:'描述:',multiline:true">
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
</div>

<script type="text/javascript">
    function doSearch(value){
        alert('You input: ' + value);
    }
    var url;
    function add(){
        $('#dlg').dialog('open').dialog('center').dialog('setTitle','新建角色');
        $('#fm').form('clear');
        url = '${ctx}/role/save.htm';
    }
    function edit(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','Edit User');
            $('#fm').form('load',row);
            url = 'update_user.php?id='+row.id;
        }
    }
    function save(){
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                var result = eval('('+result+')');
                if (result.errorMsg){
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
    function del(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $.messager.confirm('Confirm','确定要删除该角色?',function(r){
                if (r){
                    $.post('destroy_user.php',{id:row.id},function(result){
                        if (result.success){
                            $('#dg').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({    // show error message
                                title: 'Error',
                                msg: result.errorMsg
                            });
                        }
                    },'json');
                }
            });
        }
    }
</script>
</body>
</html>
