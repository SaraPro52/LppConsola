package M_Util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLDataException;
import java.sql.SQLException;

public class M_Connection{
    
    public M_Connection(){}
    private static String db = "saradb";
    
    protected Connection obtenerConn(){
        String driver = "com.mysql.jdbc.Driver";
        String url =  "jdbc:mysql://localhost:3306/"+db;     
        String usuario = "root";
        String contraseña = "";//775753494judinI
        Connection conn =  null;
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
        return conn;
    } 
    protected Connection CerrarConn(Connection conn) throws SQLException{
        conn.close();
        conn = null;
        return conn;
    }   
    
    public String getDb(){
        return db;
    }
}

