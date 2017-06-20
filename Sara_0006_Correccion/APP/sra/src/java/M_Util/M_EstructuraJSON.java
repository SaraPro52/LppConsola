
package M_Util;

import M_Util.EstructuraDB;
import org.json.JSONArray;
import org.json.JSONObject;


public class M_EstructuraJSON extends EstructuraDB{
    private static final String contenidoDatosDB = estructura;

    public M_EstructuraJSON(){}
    
    public String ColumnasTabla(String nomTabla){
        try {
            JSONObject contenidoTodo = new JSONObject(contenidoDatosDB);
            JSONArray columnas = contenidoTodo.getJSONObject(nomTabla.toLowerCase()).getJSONArray("ColumnasTabla");
            return columnas.toString();
        } catch (Exception e) {
            return e.getMessage();
        }
    }
    
    public String TablaDB(int tipoTabla,int numPosTabla){ 
        try {
            JSONObject contenidoTodo = new JSONObject(contenidoDatosDB);
            String nombreTabla = "";
            for (int i = 0; i < contenidoTodo.length(); i++) {
                
                String nomTabla = contenidoTodo.names().getString(i);
                int posicion = contenidoTodo.getJSONObject(nomTabla).getInt("Posicion");
                
                if(contenidoTodo.getJSONObject(nomTabla).getInt("TipoT") == tipoTabla && posicion == numPosTabla){
                    nombreTabla = nomTabla;
                }
            }
            return nombreTabla;
        } catch (Exception e) {
            return e.getMessage();
        }
    }
    
   
    
}
