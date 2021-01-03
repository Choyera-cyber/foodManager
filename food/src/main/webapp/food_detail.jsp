<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>食品详情</title>
    <meta name="Keywords" content="水果,进口水果,国产水果,蔬菜,肉类,海鲜,禽蛋,粮油,甜点,葡萄酒,果蔬网">
    <meta name="Description"
          content="果蔬网Guoshu是专业的进口生鲜水果食品网络购物平台，为您精选全球3000多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，果蔬网是您悠悦生活的品质之选。">
    <link rel="icon" href="images/rel_icon.png">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/reset_detail.css">
    <link rel="stylesheet" href="css/main_detail.css">
</head>
<body>
<div class="header_con">
    <div class="header clearfix">
        <div class="welcome float_left">欢迎来到天天生鲜！</div>
        <div class="user float_right clearfix" align="right">
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
<div class="goods_detail_con clearfix">
    <div class="goods_detail_pic fl">
        <img src="food/images/${sessionScope.SESSION_FOODDETAIL.foodImg}">
    </div>

    <div class="goods_detail_list fr">
        <h3>${sessionScope.SESSION_FOODDETAIL.foodName}</h3>
        <div class="prize_bar">
            <span class="show_pirze">¥<em>${sessionScope.SESSION_FOODDETAIL.foodPrice}</em></span>
            <span class="show_unit">库&nbsp;存：${sessionScope.SESSION_FOODDETAIL.foodNum}</span>
        </div>
        <div class="goods_num clearfix">
            <div class="num_name fl">数 量：1</div>
        </div>

        <div class="operate_btn">
            <a href="javascript:;" class="buy_btn">立即购买</a>
        </div>
    </div>
</div>

<div class="main_wrap clearfix">

    <div class="r_wrap fr clearfix">
        <ul class="detail_tab clearfix">
            <li id="tag_comment">评论</li>
        </ul>
        <div class="tab_content" id="tab_comment" style="display: none">
            <dl>

            </dl>
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
    <p>电话：010-****888 京ICP备*******8号</p>
</div>

</body>
</html>
