package jsu.servlet;

import jsu.bean.Food;
import jsu.bean.User;
import jsu.dao.FoodDAO;
import jsu.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/FoodInfoServlet")
public class FoodInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        //获取前台提交的编号
        String foodId = request.getParameter("foodid");

        if (foodId==null){
            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('请选择要修改的数据！');");
            writer.write("window.location.href='FoodPageServlet'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }
        //保存Food到数据库FoodDAO
        FoodDAO foodDAO = new FoodDAO();

        //插入数据库中，对数据进行封装，自己封装成一个对象
        Food food = foodDAO.getFoodById(Integer.valueOf(foodId));

        //判断是否有相同的userName
        Integer count = foodDAO.selectFoodIdCount(Integer.valueOf(foodId));
        if (count > 0) {
            //将user写入session
            request.getSession().setAttribute("SESSION_FOODINFO",food);

            response.sendRedirect("update_food.jsp");
        } else {

            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('数据出错！');");
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
