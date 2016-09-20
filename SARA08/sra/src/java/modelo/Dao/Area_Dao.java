
package modelo.Dao;

import modelo.Bean.Area_Bean;
import util.M_Crud;

public class Area_Dao extends M_Crud{

    public int Id_Area;
    public String Nom_Area;
    public String Lider_Area;
    
    public Area_Dao (){}
    
    public Area_Dao(Area_Bean areB){
        
        this.Id_Area = areB.getId_Area();
        this.Nom_Area = areB.getNom_Area();
        this.Lider_Area = areB.getLider_Area();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Area", ""+this.Id_Area);
        cont1.put("Nom_Area",   this.Nom_Area);
        cont1.put("Lider_Area", this.Lider_Area);
        return SuperP(sentencia,"Area",cont1,condicion);
    }
    
    
}
