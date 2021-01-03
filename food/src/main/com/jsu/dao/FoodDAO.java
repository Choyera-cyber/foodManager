package jsu.dao;


import jsu.bean.Food;
import jsu.bean.User;
import jsu.utils.DBUtils;

import java.util.List;

public class FoodDAO {
    //保存注册对象
    public static boolean saveFood(Food food) {
        String sql="insert into food(FOOD_ID,FOOD_IMG,FOOD_NAME,FOOD_PRICE,FOOD_NUM,FOOD_HOT,FOOD_SALES,USER_NAME) " +
                " values(?,?,?,?,?,?,?,?)";
        return DBUtils.save(sql,food.getFoodId(),food.getFoodImg(),food.getFoodName(),food.getFoodPrice(),food.getFoodNum(),food.getFoodHot(),food.getFoodSales(),food.getUserName());

    }

    //查询食品信息
    public static List<Food> getFood() {
        String sql="select FOOD_ID foodId,FOOD_IMG foodImg,FOOD_NAME foodName,FOOD_PRICE foodPrice,FOOD_NUM foodNum,FOOD_HOT foodHot,FOOD_SALES foodSales,USER_NAME userName from food limit 0,4";
        return DBUtils.getList(Food.class,sql);
    }

    //根据食品名查询食品信息
    public static List<Food> getFoodByFoodAndName(String foodName) {
        String sql="select FOOD_ID,FOOD_IMG,FOOD_NAME,FOOD_PRICE,FOOD_NUM,FOOD_HOT,FOOD_SALES,USER_NAME from food where FOOD_NAME=?";
        return DBUtils.getList(Food.class,sql,foodName);
    }

    //根据食品编号查询食品信息
    public static Food getFoodById(Integer foodId) {
        String sql="select FOOD_ID foodId,FOOD_IMG foodImg,FOOD_NAME foodName,FOOD_PRICE foodPrice,FOOD_NUM foodNum,FOOD_HOT foodHot,FOOD_SALES foodSales,USER_NAME userName from food where FOOD_ID=?";
        return DBUtils.getSingleObj(Food.class,sql,foodId);
    }

    //根据食品编号更新食品信息
    public static boolean updateFood(Food food,Integer foodId) {
        String sql="update food set FOOD_IMG=?,FOOD_NAME=?,FOOD_PRICE=?,FOOD_NUM=? where FOOD_ID=?";
        return DBUtils.update(sql,food.getFoodImg(),food.getFoodName(),food.getFoodPrice(),food.getFoodNum(),foodId);
    }

    //根据食品编号删除食品信息
    public static boolean deleteFood(Integer foodId) {
        String sql="delete from food where FOOD_ID=?";
        return DBUtils.delete(sql,foodId);
    }

    //分页查询
    public List<Food> getFoodListByPage(String sql,Object...param) {

        List<Food> foodList=DBUtils.getList(Food.class,sql,param);
        return foodList;
    }


    //查询一共有多少行
    public Integer getFoodCount(String sql, Object...param) {

        Integer count=DBUtils.getCount(sql,param);
        return count;

    }

    public static Integer selectFoodIdCount(Integer foodId) {
        String sql="select count(*) from food a where a.FOOD_ID=?";
        Integer count=DBUtils.getCount(sql,foodId);
        return count;
    }
}
