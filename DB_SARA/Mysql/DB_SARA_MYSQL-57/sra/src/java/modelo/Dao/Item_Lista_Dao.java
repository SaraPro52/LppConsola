
package modelo.Dao;

import modelo.Bean.Item_Lista_Bean;
import util.M_Crud;

public class Item_Lista_Dao extends M_Crud{

    public int Id_Item_Lista;
    public String Des_Item_Lista;
    public String Tipo_Item;
    
    public Item_Lista_Dao(){}
    
    public Item_Lista_Dao(Item_Lista_Bean it){
    
        this.Id_Item_Lista = it.getId_Item_Lista();
        this.Des_Item_Lista = it.getDes_Item_Lista();
        this.Tipo_Item = it.getTipo_Item();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Item_Lista", ""+this.Id_Item_Lista);
        cont1.put("Des_Item_Lista",   this.Des_Item_Lista);
        cont1.put("Tipo_Item", this.Tipo_Item);
        return SuperP(sentencia,"Item_Lista",cont1,condicion);
    }
    
    public Object restoItems(String[] items){
        String  item = "";
        for(int i = 0; i < items.length; i++){
            if(i==0)item += items[i];
            else item += ","+items[i];
        }
        return this.Crud("SELECT","Item_Lista","Id_Item_Lista NOT IN("+item+")");
    }

    @Override
    public void carga(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
            
}
