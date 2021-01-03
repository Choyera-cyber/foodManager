<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>食品管理</title>
    <meta name="Keywords" content="水果,进口水果,国产水果,蔬菜,肉类,海鲜,禽蛋,粮油,甜点,葡萄酒,果蔬网">
    <meta name="Description" content="果蔬网Guoshu是专业的进口生鲜水果食品网络购物平台，为您精选全球3000多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，果蔬网是您悠悦生活的品质之选。">
    <link rel="icon" href="images/rel_icon.png">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
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
<div>
<form method="post">
<div class="logo_search clearfix">
    <div class="logo float_left">
        <a href="index.jsp">
            <img src="images/logo.png" alt="logo图">
        </a>
    </div>
    <div class="search float_left">
            <input id="search" name="search" type="text" placeholder="请输入食品名">
            <input type="submit" name="button" value="搜索" formaction="/food/FoodFindServlet">
            <ul class="search_content"></ul>
    </div>
    <div class="sub float_right">
        <input type="submit" value="添加" align="right" formaction="add_food.jsp">
        <input type="submit" value="修改" formaction="/food/FoodInfoServlet" align="right">
        <input type="submit" value="删除" formaction="/food/FoodDeleteServlet" align="right">
    </div>
</div>
<div class="food_list">
        <div>
            <table bgcolor="#EEEEEE" width="100%">
                <thead bgcolor="#F8F8F8">
                <td>编号</td>
                <td>食品名</td>
                <td>价格</td>
                <td>库存</td>
                <td>热度</td>
                <td>销量</td>
                </thead>
                <tbody>
                <c:if test="${not empty requestScope.foodPageBean.list}">
                    <c:forEach items="${requestScope.foodPageBean.list}" var="food">
                        <tr bgcolor="#F8F8F8">
                            <td><input type="radio" name="foodid" value="${food.foodId}">${food.foodId}</td>
                            <td><img src="food/images/${food.foodImg}" alt=""><span>${food.foodName}</span></td>
                            <td>${food.foodPrice}元</td>
                            <td>${food.foodNum}</td>
                            <td>${food.foodHot}</td>
                            <td>${food.foodSales}</td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
        </div>
        <div align="center">
            <a href="javascript:beforePage('${foodPageBean.beforePage}')">上一页</a>
            共${foodPageBean.totalPages}页 共${foodPageBean.totalRows}行
            第${foodPageBean.currentPage}页
            每页${foodPageBean.pageSize}行
            <a href="javascript:afterPage('${foodPageBean.afterPage}')">下一页</a>
        </div>
    </div>
</form>
</div>
    <script>
        function beforePage(page) {

            window.location = "/food/FoodPageServlet?currentPage=" + page + "&pageSize=${pageSize}";

        }

        function afterPage(page) {
            window.location = "/food/FoodPageServlet?currentPage=" + page + "&pageSize=${pageSize}";

        }

    </script>
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
