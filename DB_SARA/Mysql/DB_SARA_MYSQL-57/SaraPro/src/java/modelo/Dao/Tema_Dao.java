
package modelo.Dao;

import modelo.Bean.Tema_Bean;
import util.M_Crud;

public class Tema_Dao extends M_Crud{
    
    public int Id_Tema;
    public String Nom_Tema;
    public String Des_Tema;
    
    public Tema_Dao(){}
    
    public Tema_Dao(Tema_Bean tm){
        
        this.Id_Tema = tm.getId_Tema();
        this.Nom_Tema = tm.getNom_Tema();
        this.Des_Tema = tm.getDes_Tema();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Tema", ""+this.Id_Tema);
        cont1.put("Nom_Tema",   this.Nom_Tema);
        cont1.put("Des_Tema", this.Des_Tema);
        return SuperP(sentencia,"Tema",cont1,condicion);
    }
    
}
