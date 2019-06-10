
package Config;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author sdasd
 */
public class Conexion {
    public DriverManagerDataSource Conectar(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3307/intervid_db");
        dataSource.setUsername("root");
        dataSource.setPassword("");
        return dataSource;
    }
}
