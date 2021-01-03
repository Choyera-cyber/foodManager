<%@ page import="jsu.bean.Food" %>
<%@ page import="jsu.dao.FoodDAO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>果蔬网</title>
    <meta name="Keywords" content="水果,进口水果,国产水果,蔬菜,肉类,海鲜,禽蛋,粮油,甜点,葡萄酒,果蔬网">
    <meta name="Description" content="果蔬网Guoshu是专业的进口生鲜水果食品网络购物平台，为您精选全球3000多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，果蔬网是您悠悦生活的品质之选。">
    <link rel="icon" href="images/rel_icon.png">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<%
    FoodDAO foodDAO = new FoodDAO();
    List<Food> foodList = foodDAO.getFood();
    session.setAttribute("SESSION_FOODLIST",foodList);
%>
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
                <a href="javascript:void(0);">我的订单</a>
            </div>
        </div>
    </div>
</div>
<div class="logo_search clearfix">
    <div class="logo float_left">
        <a href="javascript:void(0);">
            <img src="images/logo.png" alt="logo图">
        </a>
    </div>
    <div class="search float_left">
        <input id="search" type="text" placeholder="搜索">
        <input type="submit" value="搜索">
        <ul class="search_content"></ul>
    </div>
    <div class="chat float_right">
        <a href="javascript:void(0);" class="cart">我的购物车</a>
        <a href="javascript:void(0);">0</a>
    </div>
</div>
<div class="sub_menu_con">
    <div class="sub_menu clearfix">
        <h2 class="float_left">全部商品分类</h2>
        <ul class="float_left">
            <li><a href="javascript:void(0);">首页</a></li>
            <li><a href="javascript:void(0);">手机生鲜</a></li>
            <li><a href="javascript:void(0);">抽奖</a></li>
        </ul>
    </div>
</div>
<div class="nav_left clearfix">
    <ul class="float_left">
        <li>
            <i class="s1"></i>
            <a href="javascript:void(0);">新鲜水果</a>
        </li>
        <li>
            <i class="s2"></i>
            <a href="javascript:void(0);;">海鲜水产</a>
        </li>
        <li>
            <i class="s3"></i>
            <a href="javascript:void(0);">猪牛羊肉</a>
        </li>
        <li>
            <i class="s4"></i>
            <a href="javascript:void(0);">禽类蛋品</a>
        </li>
        <li>
            <i class="s5"></i>
            <a href="javascript:void(0);">新鲜蔬菜</a>
        </li>
        <li>
            <i class="s6"></i>
            <a href="javascript:void(0);">速冻食品</a>
        </li>
    </ul>
    <div class="slide float_left">
        <ul class="ul">
            <li class="list"><a href="javascript:void(0);"><img src="images/slide.jpg" alt="轮播图1"></a></li>
            <li class="list"><a href="javascript:void(0);"><img src="images/slide02.jpg" alt="轮播图2"></a></li>
            <li class="list"><a href="javascript:void(0);"><img src="images/slide03.jpg" alt="轮播图3"></a></li>
            <li class="list"><a href="javascript:void(0);"><img src="images/slide04.jpg" alt="轮播图4"></a></li>
        </ul>
        <div>
            <a class="prev" href="javascript:void(0);"></a>
        </div>
        <div>
            <a class="next" href="javascript:void(0);"></a>
        </div>
        <ul class="points"></ul>
    </div>
    <div class="adv float_left">
        <a href="javascript:void(0);">
            <img src="images/adv01.jpg" alt="广告图">
        </a>
        <a href="javascript:void(0);">
            <img src="images/adv02.jpg" alt="广告图">
        </a>
    </div>
</div>
<div class="food">
    <div class="food_list">
        <div class="food_list_title">
            <h3>新鲜水果</h3>
            <ul>
                <li><a href="javascript:void(0);">鲜芒</a></li>
                <li><a href="javascript:void(0);">加州提子</a></li>
                <li><a href="javascript:void(0);">亚马逊牛油果</a></li>
            </ul>
        </div>
        <div class="food_list_img clearfix">
            <img class="float_left" src="images/banner01.jpg" alt="banner图1">
            <form action="">
                <ul class="float_left">
                    <c:forEach items="${sessionScope.SESSION_FOODLIST}" var="food">
                        <a href="/food/FoodDetailServlet?foodid=${food.foodId}">
                            <li class="float_left">
                                <h3>${food.foodName}</h3>
                                <img src="food/images/${food.foodImg}" alt="水果图片1">
                                <h4>&yen;${food.foodPrice}</h4>
                            </li>
                        </a>
                    </c:forEach>
                </ul>
            </form>
        </div>
    </div>
    <div class="food_list">
        <div class="food_list_title">
            <h3>新鲜水果</h3>
            <ul>
                <li><a href="javascript:void(0);">鲜芒</a></li>
                <li><a href="javascript:void(0);">加州提子</a></li>
                <li><a href="javascript:void(0);">亚马逊牛油果</a></li>
            </ul>
        </div>
        <div class="food_list_img clearfix">
            <img class="float_left" src="images/banner02.jpg" alt="">
            <ul class="float_left">
                <li class="float_left clearfix">
                    <h3>草莓</h3>
                    <img src="images/goods/hai_04.jpg" alt="海鲜图片1">
                    <h4>&yen;38.00</h4>
                </li>
                <li class="float_left">
                    <h3>草莓</h3>
                    <img src="images/goods/hai_03.jpg" alt="海鲜图片2">
                    <h4>&yen;38.00</h4>
                </li>
                <li class="float_left">
                    <h3>草莓</h3>
                    <img src="images/goods/hai_02.jpg" alt="海鲜图片3">
                    <h4>&yen;38.00</h4>
                </li>
                <li class="float_left">
                    <h3>草莓</h3>
                    <img src="images/goods/hai_01.jpg" alt="海鲜图片4">
                    <h4>&yen;38.00</h4>
                </li>
            </ul>
        </div>
    </div>
    <div class="food_list">
        <div class="food_list_title">
            <h3>新鲜水果</h3>
            <ul>
                <li><a href="javascript:void(0);">鲜芒</a></li>
                <li><a href="javascript:void(0);">加州提子</a></li>
                <li><a href="javascript:void(0);">亚马逊牛油果</a></li>
            </ul>
        </div>
        <div class="food_list_img clearfix">
            <img class="float_left" src="images/banner03.jpg" alt="">
            <ul class="float_left">
                <li class="float_left clearfix">
                    <h3>牛肉</h3>
                    <img src="images/goods/beat01.jpg" alt="牛肉">
                    <h4>&yen;38.00</h4>
                </li>
                <li class="float_left">
                    <h3>猪肉</h3>
                    <img src="images/goods/beat02.jpg" alt="猪肉">
                    <h4>&yen;38.00</h4>
                </li>
                <li class="float_left">
                    <h3>羊肉</h3>
                    <img src="images/goods/beat04.jpg" alt="羊肉">
                    <h4>&yen;38.00</h4>
                </li>
                <li class="float_left">
                    <h3>草莓</h3>
                    <img src="images/goods/beat01.jpg" alt="">
                    <h4>&yen;38.00</h4>
                </li>
            </ul>
        </div>
    </div>
    <div class="food_list">
        <div class="food_list_title">
            <h3>新鲜水果</h3>
            <ul>
                <li><a href="javascript:void(0);">鲜芒</a></li>
                <li><a href="javascript:void(0);">加州提子</a></li>
                <li><a href="javascript:void(0);">亚马逊牛油果</a></li>
            </ul>
        </div>
        <div class="food_list_img clearfix">
            <img class="float_left" src="images/banner04.jpg" alt="">
            <ul class="float_left">
                <li class="float_left clearfix">
                    <h3>草莓</h3>
                    <img src="images/goods/furit_04.jpg" alt="">
                    <h4>&yen;38.00</h4>
                </li>
                <li class="float_left">
                    <h3>草莓</h3>
                    <img src="images/goods/furit_04.jpg" alt="">
                    <h4>&yen;38.00</h4>
                </li>
                <li class="float_left">
                    <h3>草莓</h3>
                    <img src="images/goods/furit_04.jpg" alt="">
                    <h4>&yen;38.00</h4>
                </li>
                <li class="float_left">
                    <h3>草莓</h3>
                    <img src="images/goods/furit_04.jpg" alt="">
                    <h4>&yen;38.00</h4>
                </li>
            </ul>
        </div>
    </div>
    <div class="food_list">
        <div class="food_list_title">
            <h3>新鲜水果</h3>
            <ul>
                <li><a href="javascript:void(0);">鲜芒</a></li>
                <li><a href="javascript:void(0);">加州提子</a></li>
                <li><a href="javascript:void(0);">亚马逊牛油果</a></li>
            </ul>
        </div>
        <div class="food_list_img clearfix">
            <img class="float_left" src="images/banner05.jpg" alt="">
            <ul class="float_left">
                <li class="float_left clearfix">
                    <h3>草莓</h3>
                    <img src="images/goods/furit_04.jpg" alt="">
                    <h4>&yen;38.00</h4>
                </li>
                <li class="float_left">
                    <h3>草莓</h3>
                    <img src="images/goods/furit_04.jpg" alt="">
                    <h4>&yen;38.00</h4>
                </li>
                <li class="float_left">
                    <h3>草莓</h3>
                    <img src="images/goods/furit_04.jpg" alt="">
                    <h4>&yen;38.00</h4>
                </li>
                <li class="float_left">
                    <h3>草莓</h3>
                    <img src="images/goods/furit_04.jpg" alt="">
                    <h4>&yen;38.00</h4>
                </li>
            </ul>
        </div>
    </div>
    <div class="food_list">
        <div class="food_list_title">
            <h3>新鲜水果</h3>
            <ul>
                <li><a href="javascript:void(0);">巧乐兹经典巧</a></li>
            </ul>
        </div>
        <div class="food_list_img clearfix">
            <img class="float_left" src="images/banner06.jpg" alt="">
            <ul class="float_left">
                <li class="float_left clearfix">
                    <h3>OCEAN GALA冰岛</h3>
                    <img src="images/goods/furit_04.jpg" alt="">
                    <h4>&yen;21.00</h4>
                </li>
                <li class="float_left">
                    <h3>大洋世家舟山鲳鱼</h3>
                    <img src="images/goods/furit_04.jpg" alt="">
                    <h4>&yen;32.00</h4>
                </li>
                <li class="float_left">
                    <h3>大洋世家舟山半壳</h3>
                    <img src="images/goods/furit_04.jpg" alt="">
                    <h4>&yen;22.00</h4>
                </li>
                <li class="float_left">
                    <h3>问鼎食神 巴沙鱼片 </h3>
                    <img src="images/goods/furit_04.jpg" alt="">
                    <h4>&yen;48.00</h4>
                </li>
            </ul>
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
