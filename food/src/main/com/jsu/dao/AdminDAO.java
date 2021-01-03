package jsu.dao;


import jsu.bean.Admin;
import jsu.utils.DBUtils;

public class AdminDAO {
    //保存注册对象
    public static boolean saveAdmin(Admin admin) {
        String sql="insert into admin(ADMIN_ID,ADMIN_NAME,ADMIN_PWD) " +
                " values(?,?,?)";
        return DBUtils.save(sql,admin.getAdminId(),admin.getAdminName(),admin.getAdminPWD());

    }


    //根据用户名和密码查询用户
    public static Admin getAdminByNameAndPass(String adminName,String adminPwd) {
        String sql="select ADMIN_ID adminId,ADMIN_NAME adminName,ADMIN_PWD adminPWD from admin where ADMIN_NAME=? and ADMIN_PWD=?";
        return DBUtils.getSingleObj(Admin.class,sql,adminName,adminPwd);
    }

    public static Integer selectAdminNameCount(String adminName) {
        String sql="select count(*) from admin a where a.ADMIN_NAME=?";
        Integer count=DBUtils.getCount(sql,adminName);
        return count;
    }

}
