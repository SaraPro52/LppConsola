
package modelo.Dao;


import modelo.Bean.Rol_Bean;
import util.M_Crud;

public class Rol_Dao extends M_Crud{

    public int Id_Rol;
    public String Nom_Rol;
    public String Des_Rol;
    
    public Rol_Dao(){}
    
    public Rol_Dao(Rol_Bean rolB){
        this.Id_Rol = rolB.getId_Rol();
        this.Nom_Rol = rolB.getNom_Rol();
        this.Des_Rol = rolB.getDes_Rol();
    }
    
    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Rol", ""+this.Id_Rol);
        cont1.put("Nom_Rol",   this.Nom_Rol);
        cont1.put("Des_Rol", this.Des_Rol);
        return SuperP(sentencia,"Rol",cont1,condicion);    }

    @Override
    public void carga(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   
}
