
package modelo.Dao;

import com.google.gson.Gson;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import modelo.Bean.Centro_Bean;
import util.ClaseConn;
import util.InterfaceCrud;

public class Centro_Dao extends InterfaceCrud{

    
    public int Id_Centro;
    public String Num_Centro;
    public String Nom_Centro;
    public String Direccion;
    public int Id_Ciudad;
    
    public Centro_Dao(){}
    
    public Centro_Dao(Centro_Bean cenB){
    
        this.Id_Centro = cenB.getId_Centro();
        this.Num_Centro= cenB.getNum_Centro();
        this.Nom_Centro = cenB.getNom_Centro();
        this.Direccion = cenB.getDireccion();
        this.Id_Ciudad = cenB.getId_Ciudad();
    }
    
    public static Centro_Bean consultarRegistro(int id){
    
        Centro_Bean cen = null;
        
        try {
            
            ClaseConn c = new ClaseConn();
            Connection co = c.obtenerConn();
            ResultSet rs = null;
            CallableStatement cst = co.prepareCall("{call seleccionar(?,?,?,?)}");
            cst.setInt(1, 2);
            cst.setString(2, "Centro");
            cst.setString(3,"Id_Centro");
            cst.setInt(4, id);
            cst.execute();
            rs = cst.getResultSet();
            
            while(rs.next()){
                
                cen = new Centro_Bean(rs.getString("Num_Centro"),rs.getString("Nom_Centro"),rs.getString("Direccion"),rs.getInt("Id_Ciudad"));
                cen.setId_Centro(id);
            }
            rs.close();
            cst.close();
            
        } catch (Exception cen1) {
            cen1.printStackTrace();
        }
        return cen;
    }
    
    public String listar(){
    
        ClaseConn c = new ClaseConn();
        ArrayList<Centro_Bean> listarCentros = new ArrayList<Centro_Bean>();
        
        try {
            procedure = "{call seleccionar(?,?,null,null)}";
            cst = c.obtenerConn().prepareCall(procedure);
            cst.setInt(1, 1);
            cst.setString(2, "Centro");
            cst.execute();
            rs = cst.getResultSet();
            
            while(rs.next()){
            
                Id_Centro = rs.getInt("Id_Centro");
                Num_Centro = rs.getString("Num_Centro");
                Nom_Centro = rs.getString("Nom_Centro");
                Direccion = rs.getString("Direccion");
                Id_Ciudad = rs.getInt("Id_Ciudad");
                
                Centro_Bean cen = new Centro_Bean(Num_Centro,Nom_Centro,Direccion,Id_Ciudad);
                cen.setId_Centro(Id_Centro);
                listarCentros.add(cen);
            }
            
        } catch (Exception cen2) {
            cen2.printStackTrace();
        }
        return new Gson().toJson(listarCentros);
    }
    
    @Override
    public boolean AgregarRegistro() {
        
        listo = AgregarRegistroProce(4,"Centro", "Nom_Centro",this.Nom_Centro,"Direccion",this.Direccion, "Id_Ciudad", ""+this.Id_Ciudad+"", 
                                    "Num_Centro",this.Num_Centro, "", "", "", "", "","", "", "", "", "", "", "", "", "");
        return listo;
    }

    @Override
    public boolean ActualizarRegistro() {
        
        listo = ActualizarRegistroProce(4, "Centro", "Id_Centro",this.Id_Centro , "Nom_Centro", this.Nom_Centro, 
                                         "Direccion", this.Direccion, "Id_Ciudad", ""+this.Id_Ciudad+"", 
                                         "Num_Centro", this.Num_Centro, "", "", "", "", "", "", "", "", "", "", "", "","", "");
        return listo;
    }
    
}