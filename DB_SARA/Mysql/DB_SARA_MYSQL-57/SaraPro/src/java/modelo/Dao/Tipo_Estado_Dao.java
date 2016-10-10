
package modelo.Dao;

import modelo.Bean.Tipo_Estado_Bean;
import util.M_Crud;

public class Tipo_Estado_Dao extends M_Crud{

    public int Id_Tipo_Estado;
    public String Nom_Tipo_Estado;
    
    public Tipo_Estado_Dao (){}
    
    public Tipo_Estado_Dao(Tipo_Estado_Bean tipoB){
        
        this.Id_Tipo_Estado = tipoB.getId_Tipo_Estado();
        this.Nom_Tipo_Estado = tipoB.getNom_Tipo_Estado();
    }
    
    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Tipo_Estado", ""+this.Id_Tipo_Estado);
        cont1.put("Nom_Tipo_Estado",   this.Nom_Tipo_Estado);
        return SuperP(sentencia,"Tipo_Estado",cont1,condicion);
    }
    
    
}
