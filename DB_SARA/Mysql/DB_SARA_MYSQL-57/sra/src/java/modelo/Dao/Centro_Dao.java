
package modelo.Dao;

import modelo.Bean.Centro_Bean;
import util.M_Crud;

public class Centro_Dao extends M_Crud{

    
    public int Id_Centro;
    public String Num_Centro;
    public String Nom_Centro;
    public String Direccion;
    public int Id_Ciudad;
    
    public Centro_Dao(){}
    
    public Centro_Dao(Centro_Bean cenB){
    
        this.Id_Centro = cenB.getId_Centro();
        this.Num_Centro= cenB.getNum_Centro();
        this.Nom_Centro = cenB.getNom_Centro();
        this.Direccion = cenB.getDireccion();
        this.Id_Ciudad = cenB.getId_Ciudad();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Centro",  ""+this.Id_Centro);
        cont1.put("Num_Centro", this.Num_Centro);
        cont1.put("Nom_Centro", this.Nom_Centro);
        cont1.put("Direccion",  this.Direccion);
        cont1.put("Id_Ciudad", ""+this.Id_Ciudad);
        return SuperP(sentencia,"Centro",cont1,condicion);
    }

    @Override
    public void carga(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    

  


    
}
