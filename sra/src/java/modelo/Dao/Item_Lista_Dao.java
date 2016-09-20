
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Item_Lista_Bean;
import util.InterfaceCrud;

public class Item_Lista_Dao extends InterfaceCrud{

    public int Id_Item_Lista;
    public String Des_Item_Lista;
    public String Tipo_Item;
    private ArrayList<Item_Lista_Bean> listarItem = new ArrayList<Item_Lista_Bean>();
    private Item_Lista_Bean item = null;
    public char ope = 'N';
    private String tabla = "Item_Lista";
    private String columnaId = "Id_Item_Lista";
    
    public Item_Lista_Dao(){}
    
    public Item_Lista_Dao(Item_Lista_Bean it){
    
        this.Id_Item_Lista = it.getId_Item_Lista();
        this.Des_Item_Lista = it.getDes_Item_Lista();
        this.Tipo_Item = it.getTipo_Item();
    }
            
    @Override
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                    if(ope == 'S'){
                        this.tabla = "V_Detalles_Lista";
                        this.columnaId = "Id_Lista_Chequeo";
                    }
                        
                        rs = saraCrud(val,operador+"4",this.tabla,this.columnaId,(int) objeto,"Id_Item_Lista",null,"Des_Item_Lista",null,"Tipo_Item",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            item = new Item_Lista_Bean(rs.getString("Des_Item_Lista"),rs.getString("Tipo_Item"));
                            item.setId_Item_Lista(rs.getInt("Id_Item_Lista"));
                            
                            if((operador == "-") || (operador == "" && ope == 'S'))
                                listarItem.add(item);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,"2","Item_Lista","Id_Item_Lista",this.Id_Item_Lista,"Des_Item_Lista",this.Des_Item_Lista,"Tipo_Item",""+this.Tipo_Item+"",
                                    "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                        listo = true;
                    break;
            }
        } catch (Exception it1) {
            it1.printStackTrace();
        }
        if((operador == "-" && val == "SELECT") || (operador == "" && val == "SELECT" && ope == 'S')){
            return json = new Gson().toJson(listarItem);
        }else{
            if(operador == "" && val == "SELECT" && ope == 'N'){
                return item;
            }else{
                return listo;
            }
        }
    }
    
}
