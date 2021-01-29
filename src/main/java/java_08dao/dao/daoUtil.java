package java_08dao.dao;
import java.sql.*;
/**
 * @Author:shida
 * @Description:
 * @Date:Create in
 * @Modified By:
 */

public  class daoUtil {
    static String url = "jdbc:postgresql://127.0.0.1:5432/java_note";
    static String user = "postgres";
    static String password = "1qaz!QAZ";
     static Connection conn;

     public daoUtil() {
         init();
     }

     Connection init() {
        try { conn = null;
            // 1.  创建驱动程序类对象，驱动程序类对象在创建过程中已经被注册到MangerDriver类中
            Driver driver = new org.postgresql.Driver();

            // 2. 连接数据库，返回连接对象
            Connection conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return conn;
    }


    public static Connection getConn() {
        return conn;
    }

    public static void setConn(Connection conn) {
        daoUtil.conn = conn;
    }

    public static void close(){
        if(conn==null)
        {
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
