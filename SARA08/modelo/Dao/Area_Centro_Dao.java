package modelo.Dao;

import modelo.Bean.Area_Centro_Bean;
import util.M_Crud;

public class Area_Centro_Dao extends M_Crud{
    
    public int Id_Area_Centro;
    public int Id_Area;
    public int Id_Centro;
    
    
    public Area_Centro_Dao(){}
    
    public Area_Centro_Dao(Area_Centro_Bean acb){
    
        this.Id_Area_Centro = acb.getId_Area_Centro();
        this.Id_Area = acb.getId_Area();
        this.Id_Centro = acb.getId_Centro();
        tabla = "Area_Centro";
    }

    @Override
    public Object Crud(String sentencia, String dTabla ,String condicion) {
        cont1.put("Id_Area_Centro", ""+this.Id_Area_Centro);
        cont1.put("Id_Area",    ""+this.Id_Area);
        cont1.put("Id_Centro",  ""+this.Id_Centro);
        if(dTabla == "0"){tabla = "V_Area_Centro";}
        return SuperP(sentencia,tabla,cont1,condicion); 
    }

    
    
}
