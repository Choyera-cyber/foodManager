package jsu.servlet;

import jsu.bean.User;
import jsu.dao.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        //获取前台提交的用户名、email和密码
        String userId = request.getParameter("userid");
        String userName = request.getParameter("username");
        String userEmail = request.getParameter("email");
        String userPwd = request.getParameter("password");
        User userbefore = (User) request.getSession().getAttribute("SESSION_USERINFO");

        //插入数据库中，对数据进行封装，自己封装成一个对象
        User user = new User(Integer.valueOf(userId), userName, userEmail, userPwd);

        //保存user到数据库UserDAO
        UserDAO userDAO = new UserDAO();

        if (userDAO.updateUser(user,userbefore.getUserName())) {

            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('修改成功！');");
            writer.write("window.location.href='UserPageServlet'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        } else {

            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('修改失败！');");
            writer.write("window.location.href='UserPageServlet'");
            writer.write("</script>");
            writer.flush();
            writer.close();

        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);
    }
}
