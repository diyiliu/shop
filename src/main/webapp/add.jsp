<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- insert the page content here -->
<h2>添加商品</h2>
<p>Add product template:</p>
<form action="../pro/add.htm" method="post">
    <div class="form_settings">
        <p>
            <span>名称</span>
            <input type="text" name="name">
        </p>
        <p>
            <span>数量</span>
            <input type="text" name="count">
        </p>
        <p>
            <span>价格</span>
            <input type="text" name="price">
        </p>
        <p>
            <span>描述</span>
            <textarea class="contact textarea" rows="8" cols="50" name="your_enquiry"></textarea>
        </p>
        <p style="padding-top: 15px">
            <span>&nbsp;</span><input class="submit" type="submit" value="添加">
        </p>
    </div>
</form>
<p><br><br>NOTE: Fresh fruit.</p>
</body>
</html>
