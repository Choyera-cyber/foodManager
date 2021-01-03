package jsu.dao;


import jsu.bean.User;
import jsu.utils.DBUtils;

import java.util.List;

public class UserDAO {
    //保存注册对象
    public static boolean saveUser(User user) {
        String sql="insert into user(USER_NAME,USER_EMAIL,USER_PWD) " +
                " values(?,?,?)";
        return DBUtils.save(sql,user.getUserName(),user.getUserEmail(),user.getUserPWD());

    }


    //根据用户名和密码查询用户
    public static User getUserByNameAndPass(String userName,String userPWD) {
        String sql="select USER_ID userId,USER_NAME userName,USER_EMAIL userEmail ,USER_PWD userPWD from user where USER_NAME=? and USER_PWD=?";
        return DBUtils.getSingleObj(User.class,sql,userName,userPWD);
    }

    //根据用户名查询用户
    public static User getUserByName(String userName) {
        String sql="select USER_ID userId,USER_NAME userName,USER_EMAIL userEmail ,USER_PWD userPWD from user where USER_NAME=?";
        return DBUtils.getSingleObj(User.class,sql,userName);
    }

    //根据用户名更新用户
    public static boolean updateUser(User user,String username) {
        String sql="update user set USER_ID=?,USER_NAME=?,USER_EMAIL=?,USER_PWD=? where USER_NAME=?";
        return DBUtils.update(sql,user.getUserId(),user.getUserName(),user.getUserEmail(),user.getUserPWD(),username);
    }

    //根据用户名删除
    public static boolean deleteUser(String username) {
        String sql="delete from user where USER_NAME=?";
        return DBUtils.delete(sql,username);
    }

    //分页查询
    public List<User> getUserListByPage(String sql,Object...param) {

        List<User> userList=DBUtils.getList(User.class,sql,param);
        return userList;
    }

    //查询一共有多少行
    public Integer getUserCount(String sql, Object...param) {

        Integer count=DBUtils.getCount(sql,param);
        return count;

    }

    public static Integer selectUserNameCount(String userName) {
        String sql="select count(*) from user a where a.USER_NAME=?";
        Integer count=DBUtils.getCount(sql,userName);
        return count;
    }
}
