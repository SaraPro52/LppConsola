
package modelo.Dao;

import modelo.Bean.Formato_Bean;
import util.M_Crud;

public class Formato_Dao extends M_Crud{
    
    public int Id_Formato;
    public String Nom_Formato;
    public String Des_Formato;
    
    public Formato_Dao(){}
    
    public Formato_Dao(Formato_Bean fmt){
        
        this.Id_Formato = fmt.getId_Formato();
        this.Nom_Formato = fmt.getNom_Formato();
        this.Des_Formato = fmt.getDes_Formato();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Formato", ""+this.Id_Formato);
        cont1.put("Nom_Formato",   this.Nom_Formato);
        cont1.put("Des_Formato",   this.Des_Formato);
        return SuperP(sentencia,"Formato",cont1,condicion);
    }

    @Override
    public void carga(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
