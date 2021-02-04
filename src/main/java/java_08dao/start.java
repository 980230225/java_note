package java_08dao;

import java_08dao.dao.userDao;


import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * @Author:shida
 * @Description:
 * @Date:Create in
 * @Modified By:
 */
@SuppressWarnings("ALL")
public class start {
    public static void main(String[] args) throws SQLException {
        userDao user=new userDao();
        String sql;
        for (int i=1;i<301;i++) {

            sql="insert into test(uid,uname) values(" + i + ",'shida');";
            user.insert(sql);

            System.out.println(sql);
            System.out.println("第"+i+"次执行成功");
        }

//        userDao deletedao=new userDao();
//        for (int i=0;i<=300;i++){
//            String sql="delete from test where uid="+i+";";
//        deletedao.delete(sql);
//        }

        sql="select * from test;";
        ResultSet result=user.find(sql);
           while (result.next()) {
               int id = result.getInt(1);
               String name = result.getString(2);
               System.out.println(id + "\t\t" + name);
           }


//
//        Date date_b=new Date();
//        System.out.println(date_a.toString());
//        System.out.println(date_b.toString());
//        sql="create table test4(uid int,uname varchar(20));";
//        System.out.println(user.insert(sql));
    }
}
