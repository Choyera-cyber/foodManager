package jsu.servlet;

import jsu.bean.Food;
import jsu.bean.PageBean;
import jsu.bean.User;
import jsu.dao.FoodDAO;
import jsu.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/FoodPageServlet")
public class FoodPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

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
        FoodDAO foodDAO=new FoodDAO();

        String sqlCount="select count(*) from food where USER_NAME=?";
        User user = (User) request.getSession().getAttribute("SESSION_LOGIN");
        totalRows=foodDAO.getFoodCount(sqlCount,user.getUserName());

        //5、起始行 startRow
        Integer startRow=(currentPage-1)*pageSize;

        StringBuffer sqlRow=new StringBuffer("SELECT \n" +
                "FOOD_ID foodId,\n" +
                "FOOD_IMG foodImg,\n" +
                "FOOD_NAME foodName,\n" +
                "FOOD_PRICE foodPrice,\n" +
                "FOOD_NUM foodNum,\n" +
                "FOOD_HOT foodHot,\n" +
                "FOOD_SALES foodSales,\n" +
                "USER_NAME userName\n" +
                "FROM \n" +
                "food where USER_NAME=?\n");
        sqlRow.append(" limit ").append(startRow).append(",").append(pageSize);
        System.out.println(sqlRow.toString());

        List<Food> foodList= foodDAO.getFoodListByPage(sqlRow.toString(),user.getUserName());

        System.out.println(foodList);

        PageBean pageBean=new PageBean( currentPage,  pageSize,    totalRows,   foodList);
        request.setAttribute("foodPageBean",pageBean);

        request.getRequestDispatcher("food_manager.jsp").forward(request,response);

    }
}
