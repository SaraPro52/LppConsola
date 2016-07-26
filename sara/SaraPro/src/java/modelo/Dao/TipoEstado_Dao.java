
package modelo.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Bean.TipoEstado_Bean;
import util.ClaseConn;
import util.InterfaceCrud;

public class TipoEstado_Dao extends InterfaceCrud{
    
    public int Id_Tipo_Estado;
    public String Nom_Tipo_Estado;
    
    public TipoEstado_Dao(){}
    
    public TipoEstado_Dao(TipoEstado_Bean BTipoEstado){
        super();
        try {
            conn = this.obtenerConn();
            st = conn.createStatement();
            
            Id_Tipo_Estado = BTipoEstado.getId_Tipo_Estado();
            Nom_Tipo_Estado = BTipoEstado.getNom_Tipo_Estado();
            
        } catch (SQLException tip) {
            Logger.getLogger(TipoEstado_Dao.class.getName()).log(Level.SEVERE,null,tip);
        } 
    }
    
    public static TipoEstado_Bean consultarRegistro(String nomTipo){
        
        TipoEstado_Bean tipEstado = null;
        
        try {
            ClaseConn c = new ClaseConn();
            Connection co = c.obtenerConn();
            Statement st = co.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM Tipo_Estado WHERE Nom_Tipo_Estado = '"+nomTipo+"'");
            
            while(rs.next()){
                tipEstado = new TipoEstado_Bean(rs.getInt(1),nomTipo);
            }
            rs.close();
            st.close();
        } catch (Exception tip1) {
            tip1.printStackTrace();
        }
        
        return tipEstado;
        
    }
    
    @Override
    public boolean AgregarRegistro(){
        
        listo = this.AgregarRegistroProce(1, "Tipo_Estado", "Nom_Tipo_Estado",this.Nom_Tipo_Estado,
                            "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                            "", "", "", "", "", "", "");
        
        return listo;
    }

    @Override
    public boolean ActualizarRegistro() {
        listo = this.ActualizarRegistroProce(1, "Tipo_Estado", "Id_Tipo_Estado",this.Id_Tipo_Estado,
                            "Nom_Tipo_Estado", this.Nom_Tipo_Estado, "", "", "", "", "", "", "", "", "", "", "", "", "",
                            "", "", "", "", "", "", "","","");
        return listo;
    }
    
    
    
    
    
    



   
    
}
