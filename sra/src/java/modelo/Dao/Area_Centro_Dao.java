package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Area_Centro_Bean;
import util.InterfaceCrud;

public class Area_Centro_Dao extends InterfaceCrud {
    
    public int Id_Area_Centro;
    public int Id_Area;
    public int Id_Centro;
    private ArrayList<Area_Centro_Bean> listarAreasC = new ArrayList<Area_Centro_Bean>();
    private Area_Centro_Bean areaCB = null;
    
    public Area_Centro_Dao(){}
    
    public Area_Centro_Dao(Area_Centro_Bean acb){
    
        this.Id_Area_Centro = acb.getId_Area_Centro();
        this.Id_Area = acb.getId_Area();
        this.Id_Centro = acb.getId_Centro();
    }
    
    
    @Override
    public Object OperacionRegistro(String val, int num, int id) {
        
        try {
            switch(val){
                case "SELECT":
                    rs = saraCrud(val,num,"Area_Centro","Id_Area_Centro",id,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                    
                    while(rs.next()){
                        
                        areaCB = new Area_Centro_Bean(rs.getInt("Id_Area"),rs.getInt("Id_Centro"));
                        areaCB.setId_Area_Centro(rs.getInt("Id_Area_Centro"));
                        if(num == 1)
                        listarAreasC.add(areaCB);
                        
                    }
                    rs.close();
                    cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                     this.saraCrud(val,2, "Area_Centro", "Id_Area_Centro",this.Id_Area_Centro , "Id_Area",""+this.Id_Area+"",
                                    "Id_Centro", ""+this.Id_Centro+"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                                         "", "");
                     listo = true;
                    break;
            }
        } catch (Exception ac1) {
            ac1.printStackTrace();
        }
        if(num == 1 && val == "SELECT"){
            return json = new Gson().toJson(listarAreasC);
        }else{
            if(num == 2 && val == "SELECT"){
                return areaCB;
            }else{
                return listo;
            }
        }
    }
    
}
