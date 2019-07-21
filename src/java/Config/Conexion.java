
package Config;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author sdasd
 */

//Conexión Amazon RDS

//public class Conexion {
//    public DriverManagerDataSource Conectar(){
//        DriverManagerDataSource dataSource = new DriverManagerDataSource();
//        dataSource.setDriverClassName("org.mariadb.jdbc.Driver");
//        dataSource.setUrl("jdbc:mariadb://intervid-db.clqtpysh0kub.sa-east-1.rds.amazonaws.com:3306/intervid_db");
//        dataSource.setUsername("root");
//        dataSource.setPassword("intervid4321");
//        return dataSource;
//    }
//}

public class Conexion {
    public DriverManagerDataSource Conectar(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.mariadb.jdbc.Driver");
        dataSource.setUrl("jdbc:mariadb://intervid-db.clqtpysh0kub.sa-east-1.rds.amazonaws.com:3306/intervid_prueba");
        dataSource.setUsername("root");
        dataSource.setPassword("intervid4321");
        return dataSource;
    }
}

//public class Conexion {
//    public DriverManagerDataSource Conectar(){
//        DriverManagerDataSource dataSource = new DriverManagerDataSource();
//        dataSource.setDriverClassName("org.mariadb.jdbc.Driver");
//        dataSource.setUrl("jdbc:mariadb://localhost:3307/intervid_db");
//        dataSource.setUsername("root");
//        dataSource.setPassword("");
//        return dataSource;
//    }
//}
