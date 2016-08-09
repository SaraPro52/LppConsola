
package modelo.Dao;

import com.google.gson.Gson;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.Bean.Area_Bean;
import util.ClaseConn;
import util.InterfaceCrud;

public class Area_Dao extends InterfaceCrud{

    public int Id_Area;
    public String Nom_Area;
    public String Lider_Area;
    
    public Area_Dao (){}
    
    public Area_Dao(Area_Bean areB){
        
        this.Id_Area = areB.getId_Area();
        this.Nom_Area = areB.getNom_Area();
        this.Lider_Area = areB.getLider_Area();
    }
    
    public static Area_Bean consultarRegistro(int id){
    
        Area_Bean areaB = null;
        
        try {
            
            ClaseConn c = new ClaseConn();
            Connection co = c.obtenerConn();
            Statement st = co.createStatement();
            ResultSet rs = null;
            
            CallableStatement cst = co.prepareCall("{call seleccionar(?,?,?,?)}");
            
            cst.setInt(1, 2);
            cst.setString(2, "Area");
            cst.setString(3, "Id_Area");
            cst.setInt(4, id);
            
            cst.execute();
            
            rs = cst.getResultSet();
            
            while(rs.next()){
                
                areaB = new Area_Bean(rs.getString(2),rs.getString(3));
                areaB.setId_Area(id);
                
            }
            
            rs.close();
            st.close();
            
        } catch (Exception are1) {
            are1.printStackTrace();
        }
        
        return areaB;
    }
    
    public String listar(){
    
        ClaseConn co = new ClaseConn();
        ArrayList<Area_Bean> listarAreas = new ArrayList<Area_Bean>();
        
        try {
            st = co.obtenerConn().createStatement();
            procedure = "{call seleccionar(?,?,null,null)}";
            
            cst = conn.prepareCall(procedure);
            
            cst.setInt(1, 1);
            cst.setString(2,"Area");
            
            cst.execute();
            
            rs = cst.getResultSet();
            
            while(rs.next()){
                
                Id_Area = rs.getInt("Id_Area");
                Nom_Area = rs.getString("Nom_Area");
                Lider_Area = rs.getString("Lider_Area");
                
                Area_Bean are = new Area_Bean();
                are.setId_Area(Id_Area);
                are.setNom_Area(Nom_Area);
                are.setLider_Area(Lider_Area);
                
                listarAreas.add(are);
                
            }
            procedure = "";
        } catch (Exception are2) {
            are2.printStackTrace();
        }
        return new Gson().toJson(listarAreas);
    }
    
    @Override
    public boolean AgregarRegistro() {
        listo = AgregarRegistroProce(2,"Area", "Nom_Area",this.Nom_Area,
                                    "Lider_Area", this.Lider_Area, "", "", "", "", "", "", "", "", "",
                                    "", "", "", "", "", "", "", "", "");
        return listo;
    }

    @Override
    public boolean ActualizarRegistro() {
        
        listo = ActualizarRegistroProce(2, "Area", "Id_Area",this.Id_Area , "Nom_Area", this.Nom_Area, 
                                         "Lider_Area", this.Lider_Area, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                                         "", "");
        return listo;
    }
    
    
}
