
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ClaseConn{
    
    private String driver, url, usuario, contraseña, bd;
    private Connection conn;
    
    public ClaseConn(){
            
        driver = "com.mysql.jdbc.Driver";
        usuario = "root";
        contraseña = "";
        bd = "SARA08";
        url = "jdbc:mysql://localhost:3306/"+bd;
        
        try{
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url,usuario,contraseña);
            System.out.println("OK");
        }catch(Exception e){
            System.out.println("NO" + e);
            
        }
        
    }
    
    protected Connection obtenerConn(){
        return conn;
    } 
    protected Connection CerrarConn() throws SQLException{
        conn.close();
        conn = null;
        return conn;
    }
    
}

