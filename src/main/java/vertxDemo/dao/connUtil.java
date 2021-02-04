package vertxDemo.dao;

import io.vertx.core.AsyncResult;
import io.vertx.pgclient.PgConnectOptions;
import io.vertx.pgclient.PgPool;
import io.vertx.sqlclient.PoolOptions;
import io.vertx.sqlclient.SqlConnection;

/**
 * @Author:shida
 * @Description:
 * @Date:Create in
 * @Modified By:
 */
public class connUtil {

    PgConnectOptions connectOptions = new PgConnectOptions()
            .setPort(5432)
            .setHost("the-host")
            .setDatabase("the-db")
            .setUser("user")
            .setPassword("secret");

    // Pool options
    PoolOptions poolOptions = new PoolOptions()
            .setMaxSize(5);

    // Create the pooled client
    PgPool client = PgPool.pool(connectOptions, poolOptions);
    void getConn(){
       return;
    }


}
