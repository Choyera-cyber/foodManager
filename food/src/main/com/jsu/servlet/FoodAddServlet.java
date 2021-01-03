package jsu.servlet;

import com.mysql.cj.xdevapi.JsonArray;
import com.mysql.cj.xdevapi.JsonParser;
import jsu.bean.Food;
import jsu.bean.User;
import jsu.dao.FoodDAO;
import jsu.dao.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/FoodAddServlet")
@MultipartConfig
public class FoodAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("UTF-8");

        Part part=request.getPart("foodimg");

        //上传文件名head1.png
        String fileName=part.getSubmittedFileName();

        //创建保存文件目录
        String dir=this.getServletContext().getRealPath("/food/images");
        //判断目录是否存在
        File imgDir=new File(dir);
        if(imgDir.exists()){
            imgDir.mkdirs();
        }

        //上传到服务器文件路径 imgDir+'/'+fileName
        part.write(dir+"/"+fileName);

        //获取前台提交的用户名、email和密码
        String foodName=new String(request.getParameter("foodname").getBytes("ISO-8859-1"),"UTF-8");
        String foodPrice = request.getParameter("foodprice");
        String foodNum = request.getParameter("foodnum");
        User user = (User) request.getSession().getAttribute("SESSION_LOGIN");
        //插入数据库中，对数据进行封装，自己封装成一个对象
        Food food = new Food(null, fileName,foodName,Double.valueOf(foodPrice),Integer.valueOf(foodNum),0,0,user.getUserName());

        System.out.println(food.toString());
        //保存user到数据库UserDAO
        FoodDAO foodDAO = new FoodDAO();

        //判断是否有相同的userName
        Integer count = foodDAO.selectFoodIdCount(food.getFoodId());
        if (count > 0) {
            //数据库中有相同的参数
            //通过response对象给客户端一个错误提示

            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('上架食品失败！');");
            writer.write("window.location.href='add_food.jsp'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        } else {

            //flag是否保存成功
            boolean flag = foodDAO.saveFood(food);

            if (flag) {

                response.sendRedirect("/food/add_food.jsp");
            } else {

                RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
            }

        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);
    }
}
