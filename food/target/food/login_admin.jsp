<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/12/28
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员登录</title>
    <meta name="Keywords" content="水果,进口水果,国产水果,蔬菜,肉类,海鲜,禽蛋,粮油,甜点,葡萄酒,果蔬网">
    <meta name="Description" content="果蔬网Guoshu是专业的进口生鲜水果食品网络购物平台，为您精选全球3000多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，果蔬网是您悠悦生活的品质之选。">
    <link rel="icon" href="images/rel_icon.png">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/login.css">
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/login.js"></script>
</head>
<body>
<div class="login_header">
    <a href="index.jsp"><img src="images/logo.png" alt="logo图"></a>
</div>
<div class="main">
    <div class="main_box clearfix">
        <div class="login_img float_left">
            <img src="images/login_banner.png" alt="登录页面banner图">
        </div>
        <div class="login_title float_left">日夜兼程.急速送达</div>
        <div class="float_right">
            <form class="login_form" action="/food/AdminLoginServlet" method="get">
                <p>
                    <a href="login_admin.jsp">管理员登录</a>
                    <a href="register_admin.jsp"><span>&gt;</span>立即注册</a>
                </p>
                <div class="form_input usediv">
                    <input id="username" class="username" type="text" name="username" placeholder="请输入用户名">
                    <span class="error"></span>
                </div>
                <div class="form_input form_pwd">
                    <input id="password" class="pwd" type="password" name="password" placeholder="请输入密码">
                    <span class="error"></span>
                </div>
                <div class="clearfix">
                    <input class="float_left" type="checkbox" name="remember" id="remember">
                    <label for="remember" class="float_left">记住用户名</label>
                    <label class="float_right">忘记密码</label>
                </div>
                <div class="btn">
                    <input type="submit" class="button" value="登录">
                </div>
            </form>

        </div>
    </div>
</div>
<div class="footer">
    <p>
        <a href="">关于我们</a>
        <span>|</span>
        <a href="">联系我们 </a>
        <span>|</span>
        <a href="">招聘人才</a>
        <span>|</span>
        <a href="">友情链接</a>
    </p>
    <p>CopyRight © 2016 果蔬网信息技术有限公司 All Rights Reserved</p>
    <p>电话：010-****888    京ICP备*******8号</p>
</div>
</body>
</html>

