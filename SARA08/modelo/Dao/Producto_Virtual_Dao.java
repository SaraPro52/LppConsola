
package modelo.Dao;

import modelo.Bean.Producto_Virtual_Bean;
import util.M_Crud;

public class Producto_Virtual_Dao extends M_Crud{
    
    public int Id_P_Virtual;
    public String Nom_P_Virtual;
    public String Des_P_Virtual;
    public String Palabras_Clave;
    public int Id_Formato;
    
    public Producto_Virtual_Dao(){}
    
    public Producto_Virtual_Dao(Producto_Virtual_Bean pv){
    
        this.Id_P_Virtual = pv.getId_P_Virtual();
        this.Nom_P_Virtual = pv.getNom_P_Virtual();
        this.Des_P_Virtual = pv.getDes_P_Virtual();
        this.Palabras_Clave = pv.getPalabras_Clave();
        this.Id_Formato = pv.getId_Formato();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_P_Virtual", ""+this.Id_P_Virtual);
        cont1.put("Nom_P_Virtual",   this.Nom_P_Virtual);
        cont1.put("Des_P_Virtual", this.Des_P_Virtual);
        cont1.put("Palabras_Clave", this.Palabras_Clave);
        cont1.put("Id_Formato", ""+this.Id_Formato);
        return SuperP(sentencia,"Producto_Virtual",cont1,condicion);
    }
    
    
}
