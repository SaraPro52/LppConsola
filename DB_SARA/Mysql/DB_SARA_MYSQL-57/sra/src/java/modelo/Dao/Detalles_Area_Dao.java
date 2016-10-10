
package modelo.Dao;

import modelo.Bean.Detalles_Area_Bean;
import util.M_Crud;

public class Detalles_Area_Dao extends M_Crud{
    
    public int Id_Detalles_Area;
    public int Id_Programa;
    public int Id_Area;
    
    public Detalles_Area_Dao(){}
    
    public Detalles_Area_Dao(Detalles_Area_Bean da){
        
        this.Id_Detalles_Area = da.getId_Detalles_Area();
        this.Id_Programa = da.getId_Programa();
        this.Id_Area = da.getId_Area();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Detalles_Area", ""+this.Id_Detalles_Area);
        cont1.put("Id_Programa",    ""+this.Id_Programa);
        cont1.put("Id_Area",        ""+this.Id_Area);
        return SuperP(sentencia,"Detalles_Area",cont1,condicion);
    }

    @Override
    public void carga(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
