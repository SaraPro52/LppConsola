
package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import modelo.Bean.EstadoBean;
import util.ClaseConn;
import util.InterfaceCrud;

public class EstadoDao extends InterfaceCrud{
    
    public int Id_Estado;
    public String Nom_Estado;
    public String Id_Tipo_Estado;

    public EstadoDao(){}
    
    public EstadoDao(EstadoBean est){
        
        this.Id_Estado = est.getId_Estado();
        this.Nom_Estado = est.getNom_Estado();
        this.Id_Tipo_Estado = est.getId_Tipo_Estado();
        
    }
    public static EstadoBean consultarRegistro(String nomEstado){
        
        EstadoBean estado = null;
        
        try {
            ClaseConn c = new ClaseConn();
            Connection co = c.obtenerConn();
            Statement st = co.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM Estado WHERE Nom_Estado = '"+nomEstado+"'");
            
            while(rs.next()){
                estado = new EstadoBean(rs.getInt(1),nomEstado,rs.getString(3));
            }
            rs.close();
            st.close();
        } catch (Exception est1) {
            est1.printStackTrace();
        }
        
        return estado;
        
    }
    
    @Override
    public boolean AgregarRegistro() {
        
        listo = AgregarRegistroProce(2,"Estado", "Nom_Estado",this.Nom_Estado, "Id_Tipo_Estado", this.Id_Tipo_Estado,
                                    "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
        return listo;
    }

    @Override
    public boolean ActualizarRegistro() {
        
        listo = ActualizarRegistroProce(2, "Estado", "Id_Estado",this.Id_Estado , "Nom_Estado", this.Nom_Estado, "Id_Tipo_Estado", this.Id_Tipo_Estado, 
                                         "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
        return listo;
    }
    
}
