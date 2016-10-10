
package modelo.Dao;

import modelo.Bean.Detalles_Programa_Bean;
import util.M_Crud;

public class Detalles_Programa_Dao extends M_Crud{
    
    public int Id_Detalles_Programa;
    public int Id_Tema;
    public int Id_Programa;
    
    public Detalles_Programa_Dao(){}
    
    public Detalles_Programa_Dao(Detalles_Programa_Bean dp){
    
        this.Id_Detalles_Programa = dp.getId_Detalles_Programa();
        this.Id_Tema = dp.getId_Tema();
        this.Id_Programa = dp.getId_Programa();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Detalles_Programa", ""+this.Id_Detalles_Programa);
        cont1.put("Id_Tema",    ""+this.Id_Tema);
        cont1.put("Id_Programa",""+this.Id_Programa);
        return SuperP(sentencia,"Detalles_Programa",cont1,condicion);
    }

    @Override
    public void carga(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
