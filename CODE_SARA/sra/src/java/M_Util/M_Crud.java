
package M_Util;

import com.google.gson.Gson;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import org.json.JSONObject;

public class  M_Crud extends M_Procedure{

    private   String sentencia;
    private   String tabla;
    private   Map<String,Object> contenido1 = null;
    private   String contenido2;
    private   ArrayList<Map> lista = new ArrayList<Map>();
    private   Map<String, Object> item = null;
    private   Boolean muchos = false;
    private   String contenido = "";
    
    public M_Crud(){}
    
    protected Object SuperP(String sen, String tab, Map cont1,String cont2){
        this.sentencia = sen;
        this.tabla = tab;
        this.contenido1 = cont1;
        this.contenido2 = cont2;
        try {
            int a = 0;
            switch(sentencia){
            case "SELECT":
                    
                    rs = saraCrud(sentencia,tabla,"*",contenido2);
                     a = 0;
                    while(rs.next()){
                        item = new LinkedHashMap<String,Object>();
                        
                        for (Entry<String,Object> colums : contenido1.entrySet()) {
                        
                            String clave = colums.getKey();
                            item.put(clave, rs.getString(clave));
                        }
                        a++;
                        if(a >= 1){
                            lista.add(item);
                            muchos = true;
                        }
                    }
                break;
             case   "INSERT": case   "UPDATE":case   "DELETE":    
                 a = 0;
                 for(Entry<String,Object> todo : contenido1.entrySet()){
                     
                     if(a == 1)
                         contenido += todo.getKey()+"~"+todo.getValue();
                     else if(a > 1)
                         contenido += "|"+todo.getKey()+"~"+todo.getValue();
                     a++;
                 }
                 this.saraCrud(sentencia, tabla, contenido, contenido2);
                 listo = true;
                 break;
            }
        }catch(SQLDataException ex){
            System.out.println("NO SARA CRUD" + ex.getMessage());
        }catch(SQLException ex){
            System.out.println("NO SARA CRUD" + ex.getMessage());
        }catch(Exception ex){
            System.out.println("NO SARA CRUD" + ex.getMessage());
        }
        
        if(sentencia == "SELECT" && muchos == true){
            return json = new Gson().toJson(lista);
            }
        else{ if(sentencia == "SELECT" && muchos == false){
                return new JSONObject(item);}
                else{return listo;}
        }
        
    }
    
}
