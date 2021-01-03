package jsu.servlet;

import jsu.bean.User;
import jsu.dao.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/UserInfoServlet")
public class UserInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        //获取前台提交的用户名、email和密码
        String userName = request.getParameter("username");

        if (userName==null){
            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('请选择要修改的数据！');");
            writer.write("window.location.href='UserPageServlet'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }

        //保存user到数据库UserDAO
        UserDAO userDAO = new UserDAO();

        //插入数据库中，对数据进行封装，自己封装成一个对象
        User user = userDAO.getUserByName(userName);

        //判断是否有相同的userName
        Integer count = UserDAO.selectUserNameCount(userName);
        if (count > 0) {
            //将user写入session
            request.getSession().setAttribute("SESSION_USERINFO",user);

            response.sendRedirect("update_user.jsp");
        } else {

            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('数据出错！');");
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
