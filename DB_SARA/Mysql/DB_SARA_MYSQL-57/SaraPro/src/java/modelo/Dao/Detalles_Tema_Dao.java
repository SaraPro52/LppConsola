
package modelo.Dao;

import modelo.Bean.Detalles_Tema_Bean;
import util.M_Crud;

public class Detalles_Tema_Dao extends M_Crud{
    
    public int Id_Detalles_Tema;
    public int Id_Tema;
    public int Id_P_Virtual;
    public String Tipo_Tema;

    public Detalles_Tema_Dao(){}
    
    public Detalles_Tema_Dao(Detalles_Tema_Bean dt){
        
        this.Id_Detalles_Tema = dt.getId_Detalles_Tema();
        this.Id_Tema = dt.getId_Tema();
        this.Id_P_Virtual = dt.getId_P_Virtual();
        this.Tipo_Tema = dt.getTipo_Tema();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Detalles_Tema", ""+this.Id_Detalles_Tema);
        cont1.put("Id_Tema",        ""+this.Id_Tema);
        cont1.put("Id_P_Virtual",   ""+this.Id_P_Virtual);
        cont1.put("Tipo_Tema",      ""+this.Tipo_Tema);
        return SuperP(sentencia,"Detalles_Tema",cont1,condicion);
    }

}
