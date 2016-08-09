
package modelo.Dao;

import com.google.gson.Gson;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import modelo.Bean.Rol_Bean;
import util.ClaseConn;
import util.InterfaceCrud;

public class Rol_Dao extends InterfaceCrud{

    public int Id_Rol;
    public String Nom_Rol;
    public String Des_Rol;
    
    public Rol_Dao(){}
    
    public Rol_Dao(Rol_Bean rolB){
        this.Id_Rol = rolB.getId_Rol();
        this.Nom_Rol = rolB.getNom_Rol();
        this.Des_Rol = rolB.getDes_Rol();
    }
    
    public static Rol_Bean consultarRegistro(int id){
        
        Rol_Bean rol = null;
        
        try {
            
            ClaseConn c = new ClaseConn();
            Connection co = c.obtenerConn();
            ResultSet rs = null;
            CallableStatement cst = co.prepareCall("{call seleccionar(?,?,?,?)}");
            cst.setInt(1, 2);
            cst.setString(2, "Rol");
            cst.setString(3, "Id_Rol");
            cst.setInt(4,id);
            cst.execute();
            rs = cst.getResultSet();
            
            while(rs.next()){
                
                rol = new Rol_Bean(rs.getString("Nom_Rol"),rs.getString("Des_Rol"));
                rol.setId_Rol(id);
            }
            
            rs.close();
            cst.close();
        } catch (Exception rol1) {
            rol1.printStackTrace();
        }
        
        return rol;
       
    }
    
    public String listar(){
    
        ClaseConn c = new ClaseConn();
        ArrayList<Rol_Bean> listarRoles = new ArrayList<Rol_Bean>();
        
        try {
            procedure = "{call seleccionar(?,?,null,null)}";
            cst = c.obtenerConn().prepareCall(procedure);
            cst.setInt(1, 1);
            cst.setString(2,"Rol");
            cst.execute();
            rs = cst.getResultSet();
            
            while(rs.next()){
            
                Id_Rol = rs.getInt("Id_Rol");
                Nom_Rol = rs.getString("Nom_Rol");
                Des_Rol = rs.getString("Des_Rol");
                
                Rol_Bean rolB = new Rol_Bean(Nom_Rol,Des_Rol);
                rolB.setId_Rol(Id_Rol);
                
                listarRoles.add(rolB);
                
            }
            procedure = "";
        } catch (Exception rol2) {
            rol2.printStackTrace();
        }
        
        return new Gson().toJson(listarRoles);
    }
    
    
    @Override
    public boolean AgregarRegistro() {
        
        listo = AgregarRegistroProce(2,"Rol", "Nom_Rol",this.Nom_Rol,"Des_Rol", this.Des_Rol,
                                            "", "", "", "", "", "", "", "", "",
                                            "", "", "", "", "", "", "", "", "");
        return listo;
    }

    @Override
    public boolean ActualizarRegistro() {
        
        listo = ActualizarRegistroProce(2, "Rol", "Id_Rol",this.Id_Rol , "Nom_Rol", this.Nom_Rol,"Des_Rol",this.Des_Rol,
                                         "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
        return listo;
    }
    
}
