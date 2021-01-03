package jsu.servlet;

import jsu.bean.Admin;
import jsu.dao.AdminDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        //获取前台提交的用户名和密码
        String userName = request.getParameter("username");
        String userPwd = request.getParameter("password");

        //插入数据库中，对数据进行封装，自己封装成一个对象
        Admin admin = new Admin(null, userName, userPwd);

        //保存admin到数据库AdminDAO
        AdminDAO adminDAO = new AdminDAO();

        //判断是否有相同的用户名
        Integer count = AdminDAO.selectAdminNameCount(userName);
        if (count > 0) {
            //数据库中有相同的参数
            //通过response对象给客户端一个错误提示

            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('申请的用户名已经被占用！');");
            writer.write("window.location.href='register_admin.jsp'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        } else {

            //flag是否注册成功
            boolean flag = AdminDAO.saveAdmin(admin);

            if (flag) {
                //注册成功就跳转到登录页面    重定向
                response.sendRedirect("/food/login_admin.jsp");
            } else {
                //注册失败就返回注册页面   请求转发
                RequestDispatcher dispatcher = request.getRequestDispatcher("/register_admin.jsp");
                dispatcher.forward(request, response);
            }

        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);
    }
}
