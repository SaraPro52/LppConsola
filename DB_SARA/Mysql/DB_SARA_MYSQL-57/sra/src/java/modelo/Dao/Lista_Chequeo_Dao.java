
package modelo.Dao;

import java.sql.Timestamp;
import modelo.Bean.Lista_Chequeo_Bean;
import util.M_Crud;

public class Lista_Chequeo_Dao extends M_Crud{
    
    public int Id_Lista_Chequeo;
    public String Nom_Lista_Chequeo;
    public String Des_Lista_Chequeo;
    public Timestamp  Fecha_Creacion;
    public int    Id_Funcionario;

    public Lista_Chequeo_Dao(){}
    
    public Lista_Chequeo_Dao(Lista_Chequeo_Bean list){
        
        this.Id_Lista_Chequeo = list.getId_Lista_Chequeo();
        this.Nom_Lista_Chequeo = list.getNom_Lista_Chequeo();
        this.Des_Lista_Chequeo = list.getDes_Lista_Chequeo();
        this.Fecha_Creacion = list.getFecha_Creacion();
        this.Id_Funcionario = list.getId_Funcionario();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Lista_Chequeo", ""+this.Id_Lista_Chequeo);
        cont1.put("Nom_Lista_Chequeo",   this.Nom_Lista_Chequeo);
        cont1.put("Des_Lista_Chequeo",  this.Des_Lista_Chequeo);
        cont1.put("Fecha_Creacion",     ""+this.Fecha_Creacion);
        cont1.put("Id_Funcionario",     ""+this.Id_Funcionario);
        return SuperP(sentencia,"Lista_Chequeo",cont1,condicion);    
    }
    
    public boolean RegistrarLista(String[] lista,String[] items){
        
        String todo = "";String itemsT = "";
        for (int i = 0; i < lista.length; i++) {
             if(i == 0)todo += lista[i];
             else todo += "~"+lista[i];
        }
        for (int i = 0; i < items.length; i++) {
             if(i == 0)itemsT += items[i];
             else itemsT += ","+items[i];
        }
        todo += "~"+itemsT;
        return (boolean)this.Registar(todo,1);
    }

    @Override
    public void carga(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
