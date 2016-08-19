
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Area_Bean;
import util.InterfaceCrud;

public class Area_Dao extends InterfaceCrud{

    public int Id_Area;
    public String Nom_Area;
    public String Lider_Area;
    private ArrayList<Area_Bean> listarArea = new ArrayList<Area_Bean>();
    private Area_Bean area = null;
    
    public Area_Dao (){}
    
    public Area_Dao(Area_Bean areB){
        
        this.Id_Area = areB.getId_Area();
        this.Nom_Area = areB.getNom_Area();
        this.Lider_Area = areB.getLider_Area();
    }
    
    @Override
    public Object OperacionRegistro(String val, int num, int id) {
        
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,num,"Area","Id_Area",id,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        
                        while(rs.next()){
                            
                            area = new Area_Bean(rs.getString("Nom_Area"),rs.getString("Lider_Area"));
                            area.setId_Area(rs.getInt("Id_Area"));
                            if(num == 1)
                                listarArea.add(area);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                    this.saraCrud(val,2,"Area","Id_Area",this.Id_Area,"Nom_Area",this.Nom_Area,"Lider_Area",this.Lider_Area,
                                  "","","","","","","","","","","","","","","","","","");
                    listo = true;
                    break;
            }
        } catch (Exception a1) {
            a1.printStackTrace();
        }
        if(num == 1 && val == "SELECT"){
            return json = new Gson().toJson(listarArea);
        }else{
            if(num == 2 && val == "SELECT"){
                return area;
            }else{
                return listo;
            }
        }
    }
    
    
}
