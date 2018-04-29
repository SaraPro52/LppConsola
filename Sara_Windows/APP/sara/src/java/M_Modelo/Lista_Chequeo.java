package M_Modelo;

import M_Util.Elomac;
import org.json.JSONArray;
import org.json.JSONObject;

public class Lista_Chequeo extends Elomac{
public  Lista_Chequeo ( ){ 
		super("lista_chequeo",1);
	}
        
        public boolean RegistrarLista(Object[] lista,String items){
            return (boolean)this.Registar(Group(lista,'~')+"~"+items,1);
        }
        
        public boolean ModificarLista(String[] mLista,String[] mItems){
            
            return (boolean)this.Registar(Group(mLista,'~')+"~"+Group(mItems,','),16);
        }
        
        
        public Object ListaItems(int idLista,int tipoLista){//Editar lista chequeo
            String[] numT = {"0","1"};
            String delimitador = "[{colum:3,operador:0,valor1:" + idLista + ",añadir:0},{colum:2,operador:0,valor1:" + tipoLista + "}]";
            String items = new Elomac(15,2).Select(numT, delimitador);
            String itemsTiene = "";
            JSONArray arrayItems = new JSONArray();
            
            try {
                for (int i = 0; i < new JSONArray(items).length(); i++) {
                    JSONObject jItem = new JSONArray(items).getJSONObject(i);
                    jItem.put("tipo", 1);
                    if(i == 0){
                        itemsTiene += jItem.getString("Id_Item_Lista");
                    }else{
                        itemsTiene += "," + jItem.getString("Id_Item_Lista");
                    }
                    arrayItems.put(jItem);
                }
                delimitador = "[{colum:0,operador:7,valor1:\'" + itemsTiene + "\',añadir:0},{colum:2,operador:0,valor1:" + tipoLista + "}]";
                items = new Elomac(35,1).Select(numT, delimitador);
                if(new JSONObject(items).length() >= 1){//24/04/2017
                    for (int i = 0; i < new JSONArray(items).length(); i++) {
                        JSONObject jItem1 = new JSONArray(items).getJSONObject(i);
                        jItem1.put("tipo", 0);
                        arrayItems.put(jItem1);
                    }
                }
                
            } catch (Exception e) {
                System.out.println(e.getMessage());
                return "false";
            }
            return arrayItems;
        }
        
        public String RegistrarItemLista(String[] datosItem){//20/04/2017
            try{
                return  Elomac.M_ResultSet("1,"+this.Group(datosItem, '~')+"", 15);
            } catch (Exception e) {
                return "null";
            }
        }
}