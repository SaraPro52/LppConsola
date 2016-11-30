package M_Modelo;

import M_Util.Elomac;
import org.json.JSONArray;
import org.json.JSONObject;

public class Producto_Virtual extends Elomac{
	public  Producto_Virtual ( ){ 
		super("Producto_Virtual",1);
	}
        
        public Object ConsultarProducto(){
            
            try {
                String consulta = new Elomac(22,2).Select();
                String autores = "";
                JSONArray arr = new JSONArray();
                
                for (int i = 0; i < new JSONArray(consulta).length();i++) {
                    JSONObject conJ = new JSONArray(consulta).getJSONObject(i);
                    String delimitador = "[{colum:2,operador:0,valor1:" + conJ.getInt("Id_Version") + "}]";
                    String consulta2 = new Elomac(21,2).Select(delimitador);
                    
                    for(int j = 0; j < new JSONArray(consulta2).length();j++){
                        JSONObject con2J = new JSONArray(consulta2).getJSONObject(j);
                        if(j == 0)autores += con2J.getString("NombreCompleto");
                        else autores += ","+ con2J.getString("NombreCompleto");
                    }
                    conJ.put("Autores", autores);
                    arr.put(conJ);
                }
                return arr;
            } catch (Exception ex) {
                return ex.getMessage();
            }
        }

}