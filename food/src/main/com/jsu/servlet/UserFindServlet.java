package jsu.servlet;

import jsu.bean.PageBean;
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
import java.util.List;

@WebServlet(urlPatterns = "/UserFindServlet")
public class UserFindServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet( request,  response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的用户名和密码
        String userName=request.getParameter("search");

        //1、每页多少行 pageSize
        String pageSizeStr=request.getParameter("pageSize");
        Integer pageSize=null;//每页多少行
        if(pageSizeStr!=null&&pageSizeStr.length()>0){
            pageSize=Integer.valueOf(pageSizeStr);
        }else {
            pageSize=5;
        }

        //2、当前是第几页 currentPage
        String currentPageStr=request.getParameter("currentPage");
        Integer currentPage=null;//当前查询第几页
        if(currentPageStr!=null&&currentPageStr.length()>0){
            currentPage=Integer.valueOf(currentPageStr);
        }else {
            currentPage=1;
        }

        //3、一共有多少行 totalRows
        Integer totalRows=0;
        UserDAO userDAO=new UserDAO();

        String sqlCount="select count(*) from user where USER_NAME=?";
        totalRows=userDAO.getUserCount(sqlCount,userName);

        //5、起始行 startRow
        Integer startRow=(currentPage-1)*pageSize;

        StringBuffer sqlRow=new StringBuffer("SELECT \n" +
                "USER_ID userId,\n" +
                "USER_NAME userName,\n" +
                "USER_EMAIL userEmail,\n" +
                "USER_PWD userPWD\n" +
                "FROM \n" +
                "user where USER_NAME=?\n");
        sqlRow.append(" limit ").append(startRow).append(",").append(pageSize);
        System.out.println(sqlRow.toString());

        List<User> userList= userDAO.getUserListByPage(sqlRow.toString(),userName);

        System.out.println(userList);

        PageBean pageBean=new PageBean( currentPage,  pageSize,    totalRows,   userList);
        request.setAttribute("pageBean",pageBean);

        request.getRequestDispatcher("user_page.jsp").forward(request,response);


    }
}
