package java_08dao.control;

import java_08dao.dao.userDao;

import java.sql.ResultSet;

/**
 * @Author:shida
 * @Description:
 * @Date:Create in
 * @Modified By:
 */
public class userController implements Controller {
    userDao user=new userDao();

    public boolean insert(String sql) {
        return false;
    }

    public boolean delete(String sql) {
        return false;
    }

    public boolean update(String sql) {
        return false;
    }

    public ResultSet find(String sql) {
        return null;
    }


}
