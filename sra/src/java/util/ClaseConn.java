
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ClaseConn{
    
    public String driver, url, usuario, contraseña, bd;
    public Connection conn;
    
    public ClaseConn(){
            
        driver = "com.mysql.jdbc.Driver";
        usuario = "root";
        contraseña = "";
        bd = "SARA";
        url = "jdbc:mysql://localhost:3306/"+bd;
        
        try{
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url,usuario,contraseña);
            System.out.println("OK");
        }catch(Exception e){
            System.out.println("NO" + e);
            
        }
        
    }
    
    public Connection obtenerConn(){
        return conn;
    } 
    public Connection CerrarConn() throws SQLException{
        conn.close();
        conn = null;
        return conn;
    }
    
}

