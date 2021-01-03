package jsu.servlet;

import jsu.bean.Admin;
import jsu.bean.User;
import jsu.dao.AdminDAO;
import jsu.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet( request,  response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的用户名和密码
        String userName=request.getParameter("username");
        String userPWD=request.getParameter("password");

        //根据用户名和密码查询申请人
        AdminDAO adminDAO=new AdminDAO();

        Admin admin=adminDAO.getAdminByNameAndPass(userName,userPWD);

        //判断admin==null,返回登录页面，不为空，就进入主页面
        if(admin!=null){
            //将user写入session
            request.getSession().setAttribute("SESSION_ADMIN",admin);

            response.sendRedirect("UserPageServlet");

        }else {
            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('用户名或密码错误！');");
            writer.write("window.location.href='login_admin.jsp'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }
    }
}
