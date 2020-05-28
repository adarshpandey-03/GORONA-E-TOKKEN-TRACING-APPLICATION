
package ConnectionPackage;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbms_Connection {
private static Connection con;
  public static Connection getConnection() {
        try {
            //make connection here if connection is already not made
            if(con == null)
            {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=gorona;user=sa;password=password@123");
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return con;
        
    }
} 
            
