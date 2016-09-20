
package modelo.Dao;

import modelo.Bean.Detalles_Lista_Bean;
import util.M_Crud;

public class Detalles_Lista_Dao extends M_Crud{
    
    public int Id_Detalles_Lista;
    public int Id_Lista_Chequeo;
    public int Id_Item_Lista;
    
    public Detalles_Lista_Dao(){}
    
    public Detalles_Lista_Dao(Detalles_Lista_Bean det){
    
        this.Id_Detalles_Lista = det.getId_Detalles_Lista();
        this.Id_Lista_Chequeo = det.getId_Lista_Chequeo();
        this.Id_Item_Lista = det.getId_Item_Lista();
    }
    
    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Detalles_Lista", ""+this.Id_Detalles_Lista);
        cont1.put("Id_Lista_Chequeo",  ""+this.Id_Lista_Chequeo);
        cont1.put("Id_Item_Lista",     ""+this.Id_Item_Lista);
        return SuperP(sentencia,"Detalles_Lista",cont1,condicion);
    }
    
}
