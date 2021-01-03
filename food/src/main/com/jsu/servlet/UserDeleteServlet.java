package jsu.servlet;

import jsu.bean.User;
import jsu.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        //获取前台提交的用户名
        String userName = request.getParameter("username");

        if (userName==null){
            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('请选择要删除的数据！');");
            writer.write("window.location.href='UserPageServlet'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }
        //保存user到数据库UserDAO
        UserDAO userDAO = new UserDAO();

        if (!userDAO.deleteUser(userName)) {

            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('删除成功！');");
            writer.write("window.location.href='UserPageServlet'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        } else {

            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('删除失败！');");
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
