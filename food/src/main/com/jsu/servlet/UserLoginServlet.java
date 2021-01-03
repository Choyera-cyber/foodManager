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

@WebServlet(urlPatterns = "/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet( request,  response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的用户名和密码
        String userName=request.getParameter("username");
        String userPWD=request.getParameter("password");

        //根据用户名和密码查询申请人
        UserDAO userDAO=new UserDAO();

        User user=userDAO.getUserByNameAndPass(userName,userPWD);

        //判断user==null,返回登录页面，不为空，就进入主页面
        if(user!=null){

            //将user写入session
            request.getSession().setAttribute("SESSION_LOGIN",user);

            response.sendRedirect("index.jsp");

        }else {
            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('用户名或密码错误！');");
            writer.write("window.location.href='login.jsp'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }
    }
}
