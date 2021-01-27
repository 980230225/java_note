package java_08dao.dao;
import java.sql.*;
/**
 * @Author:shida
 * @Description:
 * @Date:Create in
 * @Modified By:
 */
public  class daoUtil {
    static String url = "jdbc:postgresql://127.0.0.1:5432/test";

    static String usr = "postgres";

    static String psd = "1qaz!QAZ";
     static Connection conn;

    private daoUtil() {
        conn = null;


        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, usr, psd);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
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
