
package modelo.Dao;

import com.google.gson.Gson;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import modelo.Bean.Rol_Funcionario_Bean;
import util.ClaseConn;
import util.InterfaceCrud;

public class Rol_Funcionario_Dao extends InterfaceCrud {
    
    public int Id_Rol_Funcionario;
    public int Id_Rol;
    public int Id_Funcionario;
    
    public Rol_Funcionario_Dao(){}
    
    public Rol_Funcionario_Dao(Rol_Funcionario_Bean rfb){
        
        this.Id_Rol_Funcionario = rfb.getId_Rol_Funcionario();
        this.Id_Rol = rfb.getId_Rol();
        this.Id_Funcionario = rfb.getId_Funcionario();
    }

    public static Rol_Funcionario_Bean  consultarRegistro(int id){
    
        Rol_Funcionario_Bean rfb = null;
        
        try {
            ClaseConn c = new ClaseConn();
            Connection co = c.obtenerConn();
            ResultSet rs = null;
            CallableStatement cst = co.prepareCall("{call seleccionar(?,?,?,?)}");
            cst.setInt(1, 2);
            cst.setString(2, "Rol_Funcionario");
            cst.setString(3, "Id_Rol_Funcionario");
            cst.setInt(4, id);
            cst.execute();
            rs = cst.getResultSet();
            
            while(rs.next()){
                
                rfb = new Rol_Funcionario_Bean(rs.getInt("Id_Rol"),rs.getInt("Id_Funcionario"));
                rfb.setId_Rol_Funcionario(id);
            }
            rs.close();
            cst.close();
        } catch (Exception rf1) {
            rf1.printStackTrace();
        }
        
        return rfb;
    }
    
    public String listar(){
    
        ClaseConn c = new ClaseConn();
        ArrayList<Rol_Funcionario_Bean> listarRF = new ArrayList<Rol_Funcionario_Bean>();
        
        try {
            procedure = "{call seleccionar(?,?,null,null)}";
            cst = c.obtenerConn().prepareCall(procedure);
            cst.setInt(1, 1);
            cst.setString(2, "Rol_Funcionario");
            cst.execute();
            rs = cst.getResultSet();
            
            while(rs.next()){
                
                Id_Rol_Funcionario = rs.getInt("Id_Rol_Funcionario");
                Id_Rol = rs.getInt("Id_Rol");
                Id_Funcionario = rs.getInt("Id_Funcionario");
                
                Rol_Funcionario_Bean rolF = new Rol_Funcionario_Bean(Id_Rol,Id_Funcionario);
                rolF.setId_Rol_Funcionario(Id_Rol_Funcionario);
                listarRF.add(rolF);
            }
            
            
        } catch (Exception rf2) {
            rf2.printStackTrace();
        }
        
        return new Gson().toJson(listarRF);
    
    }
    
    
    @Override
    public boolean AgregarRegistro() {
        
        listo = AgregarRegistroProce(2,"Rol_Funcionario", "Id_Rol",""+this.Id_Rol+"",
                                    "Id_Funcionario", ""+this.Id_Funcionario+"", "", "", "", "", "", "", "", "", "",
                                    "", "", "", "", "", "", "", "", "");
        return listo;
    }

    @Override
    public boolean ActualizarRegistro() {
        
        listo = ActualizarRegistroProce(2, "Rol_Funcionario", "Id_Rol_Funcionario",this.Id_Rol_Funcionario , "Id_Rol", ""+this.Id_Rol+"", 
                                         "Id_Funcionario", ""+this.Id_Funcionario+"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                                         "", "");
        return listo;
    }
    
}
