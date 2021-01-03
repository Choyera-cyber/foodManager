package jsu.utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.util.Properties;

public class Test {

    public static  void main(String[] args) throws Exception{

        InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("config/db.properties");
        Properties properties = new Properties();
        properties.load(in);

        DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
        Connection connection = dataSource.getConnection();
        System.out.println(connection);
        /*String userName = properties.getProperty("userName");
        String driver = properties.getProperty("driver");
        String password = properties.getProperty("password");
        String url = properties.getProperty("url");*/
        /*//加载驱动
        Class.forName("com.mysql.cj.jdbc.Driver");

        //获取链接
        String url="jdbc:mysql://localhost:3306/offers?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8";
        String userName="root";
        String password = "123456";*/
       /* Connection connection = DriverManager.getConnection(url,userName,password);
        System.out.println(connection);*/
    }
}
