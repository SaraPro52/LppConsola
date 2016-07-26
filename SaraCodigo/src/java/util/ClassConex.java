package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ClassConex {
  
    public String driver, url, user,pass,bd;
    public Connection conexion;
    
    public ClassConex(){
        driver = "com.mysql.jdbc.Driver";
        user = "root";
        pass = "";
        bd = "SARApro";
        url = "jdbc:mysql://localhost:3306/"+bd;
        
        try {
            Class.forName(driver).newInstance();
            conexion = DriverManager.getConnection(url,user,pass);
            System.out.printf("Conexion..");
        } catch (Exception a1) {
            System.out.println("Error al connectar: "+ a1);
        }
 
    }
    
    public Connection ObtenerConexion(){
        return conexion;
    }
    public Connection CerrarConexion() throws SQLException{
        conexion.close();
        conexion = null;
        return conexion;
    }    
}
