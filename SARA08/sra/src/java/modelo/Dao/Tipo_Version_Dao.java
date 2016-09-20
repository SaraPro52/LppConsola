
package modelo.Dao;

import modelo.Bean.Tipo_Version_Bean;
import util.M_Crud;

public class Tipo_Version_Dao extends M_Crud{
    
    public int Id_Tipo_Version;
    public String Nom_Tipo_Version;
    public String Des_Tipo_Version;
    
    public Tipo_Version_Dao(){}
    
    public Tipo_Version_Dao(Tipo_Version_Bean tipo){
        
        this.Id_Tipo_Version = tipo.getId_Tipo_Version();
        this.Nom_Tipo_Version = tipo.getNom_Tipo_Version();
        this.Des_Tipo_Version = tipo.getDes_Tipo_Version();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Tipo_Version", ""+this.Id_Tipo_Version);
        cont1.put("Nom_Tipo_Version",   this.Nom_Tipo_Version);
        cont1.put("Des_Tipo_Version", this.Des_Tipo_Version);
        return SuperP(sentencia,"Tipo_Version",cont1,condicion);
    }
    
    
    
    
}
