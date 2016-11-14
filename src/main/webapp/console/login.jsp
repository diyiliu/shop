<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="../style/plugin/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../style/plugin/easyui/themes/icon.css">
    <script type="text/javascript" src="../style/js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="../style/plugin/easyui/jquery.easyui.min.js"></script>
</head>
<body>
<div style="width: 420px; margin: 50px auto">
    <div class="easyui-panel" title="登录" style="width:100%;max-width:420px;padding:30px 60px;">
        <form method="post" action="../admin/main.htm">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="username" style="width:100%"
                       data-options="label:'用户名:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input type="password" class="easyui-textbox" name="password" style="width:100%"
                       data-options="label:'密码:',required:true">
            </div>
            <div style="text-align:center;padding:5px 0">
                <input type="submit"  class="easyui-linkbutton" value="登录">
                <input type="reset"  class="easyui-linkbutton" value="重置">
            </div>
        </form>
    </div>
</div>
</body>
</html>