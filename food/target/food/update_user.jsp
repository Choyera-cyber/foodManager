<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/12/29
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改页面</title>
    <meta name="Keywords" content="水果,进口水果,国产水果,蔬菜,肉类,海鲜,禽蛋,粮油,甜点,葡萄酒,果蔬网">
    <meta name="Description" content="果蔬网Guoshu是专业的进口生鲜水果食品网络购物平台，为您精选全球3000多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，果蔬网是您悠悦生活的品质之选。">
    <link rel="icon" href="images/rel_icon.png">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/add.css">
    <script>
        function validate() {
            var userName =document.getElementById("username").value;
            var email =document.getElementById("email").value;
            var password=document.getElementById("password").value;

            //验证邮箱合法性
            var pattern =/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/ ;
            if(email==''){
                alert("email不能为空！");
                return false;
            }else if (!pattern.test(email)){
                alert("email格式不正确！");
                return false;
            }

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
<div class="header_con">
    <div class="header clearfix">
        <div class="welcome float_left">欢迎来到天天生鲜！</div>
        <div class="user float_right clearfix">
            <c:choose>
                <c:when test="${sessionScope.SESSION_ADMIN == null}">
                    <div class="user_login_link float_left">
                        <a href="login.jsp">登录</a>
                        <span>|</span>
                        <a href="register.jsp">注册</a>
                        <span>|</span>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="user_login_link float_left">
                        <span>欢迎您：<em id="username">${sessionScope.SESSION_ADMIN.adminName}</em></span>
                        <span>|</span>
                        <a href="/food/UserLogoutServlet">退出</a>
                        <span>|</span>
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="user_shopping float_left">
                <a href="/food/UserPageServlet">用户管理</a>
            </div>
        </div>
    </div>
</div>
<div class="logo_search clearfix">
    <div class="logo float_left">
        <a href="index.jsp">
            <img src="images/logo.png" alt="logo图">
        </a>
    </div>

</div>
<div class="food_list">
    <form class="form" action="/food/UserUpdateServlet" method="post" onsubmit="return validate()">
        <div class="form-group">
            <label for="userid">用户编号:</label>
            <input type="text" id="userid" name="userid" class="userid" placeholder="请输入长度位5-15位的用户名" value="${sessionScope.SESSION_USERINFO.userId}">
            <p class="error userInfo"></p>
        </div>
        <div class="form-group">
            <label for="name">用户名:</label>
            <input type="text" id="name" name="username" class="username" placeholder="请输入长度位5-15位的用户名" value="${sessionScope.SESSION_USERINFO.userName}">
            <p class="error userInfo"></p>
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" class="password" placeholder="请输入密码" value="${sessionScope.SESSION_USERINFO.userPWD}">
            <p class="error passwordInfo"></p>
        </div>
        <div class="form-group">
            <label for="email">邮箱:</label>
            <input type="text" id="email" name="email" class="email" placeholder="请输入邮箱地址" value="${sessionScope.SESSION_USERINFO.userEmail}">
            <p class="error emailInfo"></p>
        </div>
        <button id="submit">修改</button>
        <hr>
    </form>
    <a href="/food/UserPageServlet"><button>返回</button></a>
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
