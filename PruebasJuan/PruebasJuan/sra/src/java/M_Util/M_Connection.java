
package M_Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLDataException;
import java.sql.SQLException;

public class M_Connection{
    
    private String driver, url, usuario, contraseña, bd;
    private Connection conn;
    
    public M_Connection(){
            
        driver = "com.mysql.jdbc.Driver";
        usuario = "Judini";
        contraseña = "ea5d3b6a73a854d449dc33b1b111ed3f";
        bd = "SARA";
        url = "jdbc:mysql://localhost:3306/"+bd;
        
        try{
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url,usuario,contraseña);
            System.out.println("Conexion Exitosa");
        }catch(ClassNotFoundException ex){
            System.out.println("Conexion Fallida" + ex.getMessage());
        }catch(SQLDataException ex){
            System.out.println("Conexion Fallida" + ex.getMessage());
        }catch(SQLException ex){
            System.out.println("Conexion Fallida" + ex.getMessage());
        }catch(Exception ex){
            System.out.println("Conexion Fallida" + ex.getMessage());
        }
        finally{
            
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

