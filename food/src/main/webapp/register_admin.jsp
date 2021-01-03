<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/12/28
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员注册页面</title>
    <meta name="Keywords" content="水果,进口水果,国产水果,蔬菜,肉类,海鲜,禽蛋,粮油,甜点,葡萄酒,果蔬网">
    <meta name="Description" content="果蔬网Guoshu是专业的进口生鲜水果食品网络购物平台，为您精选全球3000多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，果蔬网是您悠悦生活的品质之选。">
    <link rel="icon" href="images/rel_icon.png">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/register.css">
    <script>
        function validate() {
            var userName =document.getElementById("username").value;
            var password=document.getElementById("password").value;

            //验证userName

            if(userName==''){
                alert("用户名不能为空！");
                return false;
            }else if (userName.length<3||userName.length>10){
                alert("用户名长度在3-10字符之间！");
                return false;
            }

            //验证password

            if(password==''){
                alert("密码不能为空！");
                return false;
            }else if (password.length<6||password.length>12){
                alert("密码长度在6-12字符之间！");
                return false;
            }
            return true;
        }
    </script>
    <script src="js/register.js"></script>
</head>
<body>
<div class="con clearfix">
    <div class="float_left logo">
        <a href=""><img src="images/logo.png" alt="logo图"></a>
        <h3>足不出户，新鲜每一天</h3>
    </div>
    <div class="float_left register">
        <div class="title clearfix">
            <h3 class ="float_left">管理员注册</h3>
            <a class="float_right icon"></a>
            <a class="float_right" href="login_admin.jsp">登录</a>
        </div>
        <form class="form" action="/food/AdminRegisterServlet" method="get" onsubmit="return validate()">
            <div class="form-group">
                <label for="username">用户名:</label>
                <input type="text" id="username" name="username" class="username" placeholder="请输入长度位5-15位的用户名">
                <p class="error userInfo"></p>
            </div>
            <div class="form-group">
                <label for="password">密码:</label>
                <input type="password" id="password" name="password" class="password" placeholder="请输入密码">
                <p class="error passwordInfo"></p>
            </div>
            <input type="hidden" id="filename">
            <div class="form-group">
                <input type="checkbox" id="checkbox" class="checkbox" checked>
                <label class="explain">同意天天生鲜用户使用协议</label>
                <p class="error tip" style="display: inline-block"></p>
            </div>
            <button id="submit">注册</button>
        </form>
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
<iframe  name="fileFrame" style="display: none;"></iframe>
</body>
</html>
