package M_Modelo;

import M_Util.Elomac;
import org.json.JSONArray;
import org.json.JSONObject;

public class Lista_Chequeo extends Elomac{
public  Lista_Chequeo ( ){ 
		super("Lista_Chequeo",1);
	}
        
        public boolean RegistrarLista(Object[] lista,String items){
            return (boolean)this.Registar(Group(lista,'~')+"~"+items,1);
        }
        
        public boolean ModificarLista(String[] mLista,String[] mItems){
            
            Elomac listaMo = new Elomac(20,1,mLista);
            try {
                 if(listaMo.Update()){
                     for (int i = 0; i < mLista.length; i++) {
                         Detalles_Lista dtaL = new Detalles_Lista();
                         dtaL.atributos.replace("Id_Lista_Chequeo", mLista[0]);
                         dtaL.atributos.replace("Id_Item_Lista", mItems[i]);
                         System.out.println(mLista[0]+"---"+mItems[i]);
                         if(dtaL.Insert()){
                             System.out.println("Si");
                         }else{
                             System.out.println("No");
                         }
                     }
                     return true;
                 }else{
                       System.out.println("No se pudo1");
                       return false;
                 }
            } catch (Exception e) {
                System.out.println(e.getMessage());
                return false;
            }
            
            
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
                items = new Elomac(19,1).Select(numT, delimitador);
                if(items != "false"){
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
}