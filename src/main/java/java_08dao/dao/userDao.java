package java_08dao.dao;

import java.sql.*;

/**
 * @Author:shida
 * @Description:daotest
 * @Date:Create in
 * @Modified By:
 */
public class userDao implements dao{
    static String url = "jdbc:postgresql://127.0.0.1:5432/java_note";
    static String user = "shida";
    static String password = "1qaz!QAZ";
    static Connection conn;
    static ResultSet result;

    PreparedStatement pre=null;
    public userDao() {
        try { conn = null;
            // 1.  创建驱动程序类对象，驱动程序类对象在创建过程中已经被注册到MangerDriver类中
            Driver driver = new org.postgresql.Driver();

            // 2. 连接数据库，返回连接对象
            conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }



    public boolean insert(String sql) {
        return excute(sql);
    }

    public boolean delete(String sql) {
        return excute(sql);
    }

    public boolean update(String sql) {
        return false;
    }

    public ResultSet find(String sql) {


        try {
            pre=conn.prepareStatement(sql);
            result=pre.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    public ResultSet findall() {
        return null;
    }
    boolean excute(String sql){
        boolean bool=false;
        try {

            pre=conn.prepareStatement(sql);
            bool=pre.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.out.println(sql);
        }
        return bool;
    }


}
