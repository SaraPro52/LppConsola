
package modelo.Dao;

import modelo.Bean.Ciudad_Bean;
import util.M_Crud;

public class Ciudad_Dao extends M_Crud{
    
    public int Id_Ciudad;
    public  String Nom_Ciudad;
    public Ciudad_Dao(){}
    
    public Ciudad_Dao(Ciudad_Bean ciuB){
        this.Id_Ciudad = ciuB.getId_Ciudad();
        this.Nom_Ciudad = ciuB.getNom_Ciudad();
    }
    
    @Override
    public Object Crud(String sentencia, String dTabla ,String condicion){
        cont1.put("Id_Ciudad", ""+this.Id_Ciudad);
        cont1.put("Nom_Ciudad", this.Nom_Ciudad);
        return SuperP(sentencia,"Ciudad",cont1,condicion);
    }
    
}
