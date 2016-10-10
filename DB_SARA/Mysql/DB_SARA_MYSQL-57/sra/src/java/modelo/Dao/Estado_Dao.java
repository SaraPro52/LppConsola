
package modelo.Dao;

import modelo.Bean.Estado_Bean;
import util.M_Crud;

public class Estado_Dao extends M_Crud{
    
    public int Id_Estado;
    public String Nom_Estado;
    public int  Id_Tipo_Estado;
    
    public Estado_Dao(){}
    
    public Estado_Dao(Estado_Bean est){
        
        this.Id_Estado = est.getId_Estado();
        this.Nom_Estado = est.getNom_Estado();
        this.Id_Tipo_Estado = est.getId_Tipo_Estado();
        
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Estado",      ""+this.Id_Estado);
        cont1.put("Nom_Estado",     this.Nom_Estado);
        cont1.put("Id_Tipo_Estado", ""+this.Id_Tipo_Estado);
        return SuperP(sentencia,"Estado",cont1,condicion);
    }

    @Override
    public void carga(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
