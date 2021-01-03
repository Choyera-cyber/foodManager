<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>食品信息修改</title>
    <meta name="Keywords" content="水果,进口水果,国产水果,蔬菜,肉类,海鲜,禽蛋,粮油,甜点,葡萄酒,果蔬网">
    <meta name="Description" content="果蔬网Guoshu是专业的进口生鲜水果食品网络购物平台，为您精选全球3000多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，果蔬网是您悠悦生活的品质之选。">
    <link rel="icon" href="images/rel_icon.png">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/add.css">
    <script src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        function validate() {
            var foodImg = document.getElementById("foodimg");
            if (foodImg.value == "") {
                alert("请选择要上传图片！");
                foodImg.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="header_con">
    <div class="header clearfix">
        <div class="welcome float_left">欢迎来到天天生鲜！</div>
        <div class="user float_right clearfix">
            <c:choose>
                <c:when test="${sessionScope.SESSION_LOGIN == null}">
                    <div class="user_login_link float_left">
                        <a href="login.jsp">登录</a>
                        <span>|</span>
                        <a href="register.jsp">注册</a>
                        <span>|</span>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="user_login_link float_left">
                        <span>欢迎您：<em id="username">${sessionScope.SESSION_LOGIN.userName}</em></span>
                        <span>|</span>
                        <a href="/food/UserLogoutServlet">退出</a>
                        <span>|</span>
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="user_shopping float_left">
                <a href="/food/FoodPageServlet">食品管理</a>
                <span>|</span>
                <a href="/food/UserPageServlet">我的订单</a>
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
    <form action="/food/FoodUpdateServlet" method="post"
          enctype="multipart/form-data" onsubmit="return validate();" class="form">
        <div class="form-group">
            <label for="foodname">食品名:</label>
            <input type="text" id="foodname" name="foodname" class="foodname" value="${sessionScope.SESSION_FOODINFO.foodName}">
            <p class="error userInfo"></p>
        </div>
        <div class="form-group">
            <label for="foodprice">价格:</label>
            <input type="text" id="foodprice" name="foodprice" class="foodprice" value="${sessionScope.SESSION_FOODINFO.foodPrice}">
            <p class="error userInfo"></p>
        </div>
        <div class="form-group">
            <label for="foodnum">库存量:</label>
            <input type="text" id="foodnum" name="foodnum" class="foodnum" value="${sessionScope.SESSION_FOODINFO.foodNum}">
            <p class="error userInfo"></p>
        </div>
        <div>
            <label for="foodimg">食品图:</label>
            <input type="file" id="foodimg" name="foodimg" class="foodimg">
        </div>
        <button id="submit" onclick="m()">修改</button>
        <hr>
    </form>
    <a href="/food/FoodPageServlet"><button>返回</button></a>
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
