
package modelo.Dao;

import modelo.Bean.Tipo_Documento_Bean;
import util.M_Crud;

public class Tipo_Documento_Dao extends M_Crud{

    public int Id_Tipo_Documento;
    public String Nom_Tipo_Documento;
            
    public Tipo_Documento_Dao(){}
    
    public Tipo_Documento_Dao(Tipo_Documento_Bean tipoD){
    
        this.Id_Tipo_Documento = tipoD.getId_Tipo_Documento();
        this.Nom_Tipo_Documento = tipoD.getNom_Tipo_Documento();
    }
    
    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Tipo_Documento", ""+this.Id_Tipo_Documento);
        cont1.put("Nom_Tipo_Documento", this.Nom_Tipo_Documento);
        return SuperP(sentencia,"Tipo_Documento",cont1,condicion);
    }
}
