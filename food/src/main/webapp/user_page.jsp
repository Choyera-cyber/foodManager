<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/12/30
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <link rel="icon" href="images/rel_icon.png">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="header_con">
    <div class="header clearfix">
        <div class="welcome float_left">欢迎您</div>
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
<form  method="post">
<div class="logo_search clearfix">
    <div class="logo float_left">
        <a href="index.jsp">
            <img src="images/logo.png" alt="logo图">
        </a>
    </div>
    <div class="search float_left">
        <input id="search" name="search" type="text" placeholder="请输入用户名">
        <input type="submit" name="button" value="搜索" formaction="/food/UserFindServlet">
        <ul class="search_content"></ul>
    </div>
    <div class="sub float_right">
        <input type="submit" value="添加" align="right" formaction="add_user.jsp">
        <input type="submit" value="修改" formaction="/food/UserInfoServlet" align="right">
        <input type="submit" value="删除" formaction="/food/UserDeleteServlet" align="right">
    </div>
</div>
<div class="food_list">
        <div align="center">
            <table bgcolor="#EEEEEE" width="100%">
                <thead bgcolor="#F8F8F8">
                <td>用户编号</td>
                <td>用户名</td>
                <td>密码</td>
                <td>邮箱</td>
                </thead>
                <tbody>
                <c:if test="${not empty requestScope.pageBean.list}">
                    <c:forEach items="${requestScope.pageBean.list}" var="user">
                        <tr bgcolor="#F8F8F8">
                            <td><input type="radio" name="username" value="${user.userName}">${user.userId}</td>
                            <td>${user.userName}</td>
                            <td>${user.userPWD}</td>
                            <td>${user.userEmail}</td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
        </div>
        <div align="center">
            <a href="javascript:beforePage('${pageBean.beforePage}')">上一页</a>
            共${pageBean.totalPages}页 共${pageBean.totalRows}行
            第${pageBean.currentPage}页
            每页${pageBean.pageSize}行
            <a href="javascript:afterPage('${pageBean.afterPage}')">下一页</a>
        </div>
        <div align="center">
            <a href="add_user.jsp"><button type="button">添加</button></a>
            <a href="find_user.jsp"><button type="button">查找</button></a>
            <button type="submit" formaction="/food/UserInfoServlet">修改</button>
            <button type="submit" formaction="/food/UserDeleteServlet">删除</button>
        </div>
        </div>
    </form>
    <script>
        function beforePage(page) {

            window.location = "/food/UserPageServlet?currentPage=" + page + "&pageSize=${pageSize}";

        }

        function afterPage(page) {
            window.location = "/food/UserPageServlet?currentPage=" + page + "&pageSize=${pageSize}";

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

