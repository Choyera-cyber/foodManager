package jsu.servlet;

import jsu.bean.Food;
import jsu.dao.FoodDAO;
import jsu.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/FoodDeleteServlet")
public class FoodDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        //获取前台提交的用户名
        String foodid = request.getParameter("foodid");

        if (foodid==null){
            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('请选择要删除的数据！');");
            writer.write("window.location.href='FoodPageServlet'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }
        //保存user到数据库UserDAO
        FoodDAO foodDAO = new FoodDAO();

        if (!foodDAO.deleteFood(Integer.valueOf(foodid))) {

            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('删除成功！');");
            writer.write("window.location.href='FoodPageServlet'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        } else {

            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('删除失败！');");
            writer.write("window.location.href='FoodPageServlet'");
            writer.write("</script>");
            writer.flush();
            writer.close();

        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);
    }
}
