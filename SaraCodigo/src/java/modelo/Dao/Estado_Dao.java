
package modelo.Dao;

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
    public static Estado_Bean consultarRegistro(String nomEstado){
        
        Estado_Bean estado = null;
        
        try {
            ClaseConn c = new ClaseConn();
            Connection co = c.obtenerConn();
            Statement st = co.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM Estado WHERE Nom_Estado = '"+nomEstado+"'");
            
            while(rs.next()){
                estado = new Estado_Bean(rs.getInt(1),nomEstado);
            }
            rs.close();
            st.close();
        } catch (Exception est1) {
            est1.printStackTrace();
        }
        
        return estado;
        
    }
    
    public ArrayList<Estado_Bean> listar(){
    
       ClaseConn co = new ClaseConn();
       ArrayList<Estado_Bean> listarEstados = new ArrayList<Estado_Bean>();
       
        try {
            
            st = co.obtenerConn().createStatement();
            procedure = "{call seleccionar(?)}";
            cst = conn.prepareCall(procedure);
            
            cst.setString(1,"Estado");
            
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
       return listarEstados;
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
