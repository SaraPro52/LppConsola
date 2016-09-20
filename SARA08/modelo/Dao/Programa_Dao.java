
package modelo.Dao;

import modelo.Bean.Programa_Bean;
import util.M_Crud;

public class Programa_Dao extends M_Crud{

    public int Id_Programa;
    public String Nom_Programa;
    public String Nivel_Formacion;
    
    public Programa_Dao(){}
    
    public Programa_Dao(Programa_Bean p){
        
        this.Id_Programa = p.getId_Programa();
        this.Nom_Programa = p.getNom_Programa();
        this.Nivel_Formacion = p.getNivel_Formacion();
    }
    
    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Programa", ""+this.Id_Programa);
        cont1.put("Nom_Programa",   this.Nom_Programa);
        cont1.put("Nivel_Formacion", this.Nivel_Formacion);
        return SuperP(sentencia,"Programa",cont1,condicion);
    }
    
}
