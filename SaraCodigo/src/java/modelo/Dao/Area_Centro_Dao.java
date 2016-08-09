package modelo.Dao;

import com.google.gson.Gson;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import modelo.Bean.Area_Centro_Bean;
import util.ClaseConn;
import util.InterfaceCrud;

public class Area_Centro_Dao extends InterfaceCrud {
    
    public int Id_Area_Centro;
    public int Id_Area;
    public int Id_Centro;
    
    public Area_Centro_Dao(){}
    
    public Area_Centro_Dao(Area_Centro_Bean acb){
    
        this.Id_Area_Centro = acb.getId_Area_Centro();
        this.Id_Area = acb.getId_Area();
        this.Id_Centro = acb.getId_Centro();
    }
    
    public static Area_Centro_Bean consultarRegistro(int id){
    
        Area_Centro_Bean acB = null;
        
        try {
            ClaseConn c = new ClaseConn();
            Connection co = c.obtenerConn();
            ResultSet rs = null;
            CallableStatement cst = co.prepareCall("{call seleccionar(?,?,?,?)}");
            cst.setInt(1, 2);
            cst.setString(2, "Area_Centro");
            cst.setString(3, "Id_Area_Centro");
            cst.setInt(4, id);
            cst.execute();
            rs = cst.getResultSet();
            
            while(rs.next()){
                
                acB = new Area_Centro_Bean(rs.getInt("Id_Area"),rs.getInt("Id_Centro"));
                acB.setId_Area_Centro(id);
            
            }
            rs.close();
            cst.close();
        } catch (Exception ac1) {
            ac1.printStackTrace();
        }
        return acB;
        
    }

    public String listar(){
    
        ClaseConn c = new ClaseConn();
        ArrayList<Area_Centro_Bean> listarAreas_C = new ArrayList<Area_Centro_Bean>();
        
        try {
            procedure = "{call seleccionar(?,?,null,null)}";
            cst = c.obtenerConn().prepareCall(procedure);
            cst.setInt(1, 1);
            cst.setString(2, "Area_Centro");
            cst.execute();
            rs = cst.getResultSet();
            
            while(rs.next()){
                
                Id_Area_Centro = rs.getInt("Id_Area_Centro");
                Id_Area = rs.getInt("Id_Area");
                Id_Centro = rs.getInt("Id_Centro");
                
                Area_Centro_Bean acb = new Area_Centro_Bean(Id_Area,Id_Centro);
                acb.setId_Area_Centro(Id_Area_Centro);
                listarAreas_C.add(acb);
            
            }
        } catch (Exception ac2) {
            
            ac2.printStackTrace();
        }
        return new Gson().toJson(listarAreas_C);
    }
    @Override
    public boolean AgregarRegistro() {
        
        listo = AgregarRegistroProce(2,"Area_Centro", "Id_Area",""+this.Id_Area+"",
                                    "Id_Centro", ""+this.Id_Centro+"", "", "", "", "", "", "", "", "", "",
                                    "", "", "", "", "", "", "", "", "");
        return listo;
    }

    @Override
    public boolean ActualizarRegistro() {
        
        
        listo = ActualizarRegistroProce(2, "Area_Centro", "Id_Area_Centro",this.Id_Area_Centro , "Id_Area",""+this.Id_Area+"",
                                    "Id_Centro", ""+this.Id_Centro+"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                                         "", "");
        return listo;
    }
    
}
