<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head><title>Fruit Supermarket</title>
  <meta name="keywords" content="website keywords, website keywords">
  <link rel="stylesheet" type="text/css" href="./style/css/style.css">
</head>
<body>
<div id="main">
  <div id="header">
    <div id="logo">
      <div id="logo_text">
        <!-- class="logo_colour", allows you to change the colour of the text -->
        <h1><a href="index.html">simple<span class="logo_colour"> Fruit Supermarket</span></a></h1>
        <h2>Simple. Fruit Supermarket</h2>
      </div>
    </div>
    <div id="menubar">
      <ul id="menu">
        <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
        <li class="selected"><a href="./index.jsp">首页</a></li>
        <li><a target="./pro/list.htm">选购</a></li>
        <li><a target="./add.jsp">添加</a></li>
        <li><a target="another_page.html">Another Page</a></li>
        <li><a target="contact.html">Contact Us</a></li>
      </ul>
    </div>
  </div>

  <div id="site_content">
    <div id="sidebar_container">
      <div class="sidebar">
        <div class="sidebar_top"></div>
        <div class="sidebar_item">
          <!-- insert your sidebar items here -->
          <h3>Latest News</h3>
          <h4>New Website Launched</h4>
          <h5>January 1st, 2010</h5>
          <p>2010 sees the redesign of our website..... <a href="#">read more</a></p>
        </div>
        <div class="sidebar_base"></div>
      </div>
      <div class="sidebar">
        <div class="sidebar_top"></div>
        <div class="sidebar_item">
          <h3>Useful Links</h3>
          <ul>
            <li><a href="#">link 1</a></li>
            <li><a href="#">link 2</a></li>
            <li><a href="#">link 3</a></li>
            <li><a href="#">link 4</a></li>
          </ul>
        </div>
        <div class="sidebar_base"></div>
      </div>
      <div class="sidebar">
        <div class="sidebar_top"></div>
        <div class="sidebar_item">
          <h3>Search</h3>
          <form method="post" action="#" id="search_form">
            <p>
              <input class="search" type="text" name="search_field" placeholder="Enter keywords....."><input
                    name="search" type="image" style="border: 0; margin: 0 0 -9px 5px;"
                    src="./style/image/search.png" alt="Search" title="Search"></p>
          </form>
        </div>
        <div class="sidebar_base"></div>
      </div>
    </div>
    <div id="content">

    </div>
  </div>

  <div id="footer">
    <p><a href="index.html">Home</a> | <a href="examples.html">Examples</a> | <a href="page.html">A Page</a> | <a
            href="another_page.html">Another Page</a> | <a href="contact.html">Contact Us</a></p>
    <p>Copyright © simplestyle_3 | <a href="http://validator.w3.org/check?uri=referer">HTML5</a> | <a
            href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> | <a
            href="http://www.html5webtemplates.co.uk">design from HTML5webtemplates.co.uk</a>
    </p>
  </div>
</div>

<script type="text/javascript" src="./style/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
  $(function () {
    $.get("./pro/today.htm", function (data) {
      $("#content").html(data);//初始化加载界面
    });

    $('#menu li').click(function () {//点击li加载界面

      $('#menu li').each(function () {
        $(this).removeClass('selected');
      })
      $(this).addClass('selected');

      var current = $(this),
              target = current.find('a').attr('target'); // 找到链接a中的targer的值
      $.get(target, function (data) {
        $("#content").html(data);
      });
    });
  });
</script>
</body>
</html>
