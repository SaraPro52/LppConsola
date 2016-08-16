
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Item_Lista_Bean;
import util.InterfaceCrud;

public class Item_Lista_Dao extends InterfaceCrud{

    public int Id_Item_Lista;
    public String Des_Item_Lista;
    public int Tipo_Item;
    private ArrayList<Item_Lista_Bean> listarItem = new ArrayList<Item_Lista_Bean>();
    private Item_Lista_Bean item = null;
    
    public Item_Lista_Dao(){}
    
    public Item_Lista_Dao(Item_Lista_Bean it){
    
        this.Id_Item_Lista = it.getId_Item_Lista();
        this.Des_Item_Lista = it.getDes_Item_Lista();
        this.Tipo_Item = it.getTipo_Item();
    }
            
    @Override
    public Object OperacionRegistro(String val, int num, int id) {
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,num,"Item_Lista","Id_Item_Lista",id,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            item = new Item_Lista_Bean(rs.getString("Des_Item_Lista"),rs.getInt("Tipo_Item"));
                            item.setId_Item_Lista(rs.getInt("Id_Item_Lista"));
                            if(num == 1)
                                listarItem.add(item);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,2,"Item_Lista","Id_Item_Lista",this.Id_Item_Lista,"Des_Item_Lista",this.Des_Item_Lista,"Tipo_Item",""+this.Tipo_Item+"",
                                    "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                        listo = true;
                    break;
            }
        } catch (Exception it1) {
            it1.printStackTrace();
        }
        if(num == 1 && val == "SELECT"){
            return new Gson().toJson(listarItem);
        }else{
            if(num == 2 && val == "SELECT"){
                return item;
            }else{
                return listo;
            }
        }
    }
    
}
