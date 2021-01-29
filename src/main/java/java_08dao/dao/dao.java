package java_08dao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @Author:shida
 * @Description:
 * @Date:Create in
 * @Modified By:
 */
public  interface dao  {
    Connection conn =null;
    boolean insert(String sql);
    boolean delete(String sql);
   boolean update(String sql);
    ResultSet find(String sql);

}
