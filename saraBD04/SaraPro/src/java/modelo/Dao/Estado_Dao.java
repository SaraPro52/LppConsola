
package modelo.Dao;

import com.google.gson.Gson;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.Bean.Estado_Bean;
import util.ClaseConn;
import util.InterfaceCrud;

public class Estado_Dao extends InterfaceCrud{
    
    public int Id_Estado;
    public String Nom_Estado;

    public Estado_Dao(){}
    
    public Estado_Dao(Estado_Bean est){
        
        this.Id_Estado = est.getId_Estado();
        this.Nom_Estado = est.getNom_Estado();
        
    }
    public static Estado_Bean consultarRegistro(int id){
        
        Estado_Bean estado = null;
        
        try {
            ClaseConn c = new ClaseConn();
            Connection co = c.obtenerConn();
            Statement st = co.createStatement();
            ResultSet rs    = null;
            
            CallableStatement cst = co.prepareCall("{call seleccionar(?,?,?,?)}");
            
            cst.setInt(1, 2);
            cst.setString(2, "Estado");
            cst.setString(3, "Id_Estado");
            cst.setInt(4, id);
            
            cst.execute();
            
            rs = cst.getResultSet();
            
            while(rs.next()){
                estado = new Estado_Bean(rs.getString(2));
                estado.setId_Estado(id);
            }
            rs.close();
            st.close();
        } catch (Exception est1) {
            est1.printStackTrace();
        }
        
        return estado;
        
    }
    
    public String listar(){
    
       ClaseConn co = new ClaseConn();
       ArrayList<Estado_Bean> listarEstados = new ArrayList<Estado_Bean>();
       
        try {
            
            st = co.obtenerConn().createStatement();
            procedure = "{call seleccionar(?,?,null,null)}";
            
            cst = conn.prepareCall(procedure);
            
            cst.setInt(1,1);
            cst.setString(2,"Estado");
            
            cst.execute();
            
            rs = cst.getResultSet();
            
            while(rs.next()){
                
                Id_Estado = rs.getInt("Id_Estado");
                Nom_Estado = rs.getString("Nom_Estado");
                
                Estado_Bean esB = new Estado_Bean();
                esB.setId_Estado(Id_Estado);
                esB.setNom_Estado(Nom_Estado);
                
                listarEstados.add(esB);
            
            }
            procedure = "";
        } catch (Exception es) {
            es.printStackTrace();
        }
       return new Gson().toJson(listarEstados);
    }
    
    @Override
    public boolean AgregarRegistro() {
        
        listo = AgregarRegistroProce(1,"Estado", "Nom_Estado",this.Nom_Estado,
                                    "", "", "", "", "", "", "", "", "", "", "",
                                    "", "", "", "", "", "", "", "", "");
        return listo;
    }

    @Override
    public boolean ActualizarRegistro() {
        
        listo = ActualizarRegistroProce(1, "Estado", "Id_Estado",this.Id_Estado , "Nom_Estado", this.Nom_Estado, 
                                         "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                                         "", "");
        return listo;
    }
    
}
