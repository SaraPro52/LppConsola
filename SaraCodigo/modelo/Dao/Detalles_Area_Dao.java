
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Detalles_Area_Bean;
import util.InterfaceCrud;

public class Detalles_Area_Dao extends InterfaceCrud{
    
    public int Id_Detalles_Area;
    public int Id_Programa;
    public int Id_Area;
    private ArrayList<Detalles_Area_Bean> listarDA = new ArrayList<Detalles_Area_Bean>();
    private Detalles_Area_Bean detA = null;
    
    public Detalles_Area_Dao(){}
    
    public Detalles_Area_Dao(Detalles_Area_Bean da){
        
        this.Id_Detalles_Area = da.getId_Detalles_Area();
        this.Id_Programa = da.getId_Programa();
        this.Id_Area = da.getId_Area();
    }

    @Override
    public Object OperacionRegistro(String val, int num, Object objeto) {
        try{
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,num,"Detalles_Area","Id_Detalles_Area",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            detA = new Detalles_Area_Bean(rs.getInt("Id_Programa"),rs.getInt("Id_Area"));
                            detA.setId_Detalles_Area(rs.getInt("Id_Detalles_Area"));
                            if(num == 1)
                                listarDA.add(detA);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,2,"Detalles_Area","Id_Detalles_Area",this.Id_Detalles_Area,"Id_Programa",""+this.Id_Programa+"","Id_Area",""+this.Id_Area+"",
                               "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                        listo = true;
                    break;
            }
        } catch (Exception da1) {
            da1.printStackTrace();
        }
        if(num == 1 && val == "SELECT"){
            return json = new Gson().toJson(listarDA);
        }else{
            if(num == 2 && val == "SELECT"){
                return detA;
            }else{
                return listo;
            }
        }
    }
    
}
