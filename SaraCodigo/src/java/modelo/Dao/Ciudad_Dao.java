
package modelo.Dao;

import com.google.gson.Gson;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import modelo.Bean.Ciudad_Bean;
import util.ClaseConn;
import util.InterfaceCrud;

public class Ciudad_Dao extends InterfaceCrud{
    
    public int Id_Ciudad;
    public String Nom_Ciudad;
    
    public Ciudad_Dao(){}
    
    public Ciudad_Dao(Ciudad_Bean ciuB){
    
        this.Id_Ciudad = ciuB.getId_Ciudad();
        this.Nom_Ciudad = ciuB.getNom_Ciudad();
    }
    
    public static Ciudad_Bean ConsultarRegistro(int id){
    
        Ciudad_Bean ciudadB = null;
        
        try {
            ClaseConn c = new ClaseConn();
            Connection co = c.obtenerConn();
            ResultSet rs = null;
            CallableStatement cst = co.prepareCall("{call seleccionar(?,?,?,?)}");
            cst.setInt(1, 2);
            cst.setString(2,"Ciudad");
            cst.setString(3, "Id_Ciudad");
            cst.setInt(4, id);
            cst.execute();
            rs = cst.getResultSet();
            
            while(rs.next()){
            
                ciudadB = new Ciudad_Bean(rs.getString(2));
                ciudadB.setId_Ciudad(id);
            }
            rs.close();
            cst.close();
            
        } catch (Exception ciu1) {
            ciu1.printStackTrace();
        }
        return ciudadB;
        
    }
    
    public String listar(){
    
        ClaseConn co = new ClaseConn();
        ArrayList<Ciudad_Bean> listarCiudades = new ArrayList<Ciudad_Bean>();
        
        try {
            
            procedure = "{call seleccionar(?,?,null,null)}";
            cst = co.obtenerConn().prepareCall(procedure);
            cst.setInt(1, 1);
            cst.setString(2,"Ciudad");
            cst.execute();
            rs = cst.getResultSet();
            
            while(rs.next()){
            
                Id_Ciudad = rs.getInt("Id_Ciudad");
                Nom_Ciudad = rs.getString("Nom_Ciudad");
                
                Ciudad_Bean ciu = new Ciudad_Bean(Nom_Ciudad);
                ciu.setId_Ciudad(Id_Ciudad);
                listarCiudades.add(ciu);
            }
            
        } catch (Exception ciu2) {
            ciu2.printStackTrace();
        }
        
        return new Gson().toJson(listarCiudades);
    }

    @Override
    public boolean AgregarRegistro() {
        listo = AgregarRegistroProce(1,"Ciudad", "Nom_Ciudad",this.Nom_Ciudad,
                                    "", "", "", "", "", "", "", "", "", "", "",
                                    "", "", "", "", "", "", "", "", "");
        return listo;
    }

    @Override
    public boolean ActualizarRegistro() {
        listo = ActualizarRegistroProce(1, "Ciudad", "Id_Ciudad",this.Id_Ciudad , "Nom_Ciudad", this.Nom_Ciudad, 
                                                 "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                                                 "", "");
                return listo;    }
    
}
