package M_Util;

import com.google.gson.Gson;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.sql.ResultSet;
import org.json.JSONObject;

public class M_Crud extends M_Procedure {

    private String sentencia;
    private String tabla;
    private Map<String, Object> contenido1 = null;
    private String contenido2;
    private ArrayList<Map> lista = new ArrayList<Map>();
    private Map<String, Object> item = null;
    private Boolean muchos = false;
    private String contenido = "";
            
    public M_Crud() {
    }

    protected String SuperP(String sen, String tab, Map cont1, String cont2) {
        this.sentencia = sen;
        this.tabla = tab;
        this.contenido1 = cont1;
        this.contenido2 = cont2;
        ResultSet rs1 = null;
        try {
            int a = 0;
            switch (sentencia) {
                case "SELECT":
                    rs1 = saraCrud(sentencia, tabla, this.Group(M_toArray(contenido1, 1), '|'), contenido2);
                    a = 0;
                    while (rs1.next()) {
                        item = new LinkedHashMap<String, Object>();

                        for (Entry<String, Object> colums : contenido1.entrySet()) {

                            String clave = colums.getKey();
                            item.put(clave, rs1.getString(clave));
                        }
                        a++;
                        if (a >= 1) {
                            lista.add(item);
                            muchos = true;
                        }
                    }
                    break;
                case "INSERT":
                case "UPDATE":
                case "DELETE":
                    a = 0;
                    for (Entry<String, Object> todo : contenido1.entrySet()) {

                        if (a == 1) {
                            contenido += todo.getKey() + "~" + todo.getValue();
                        } else if (a > 1) {
                            contenido += "|" + todo.getKey() + "~" + todo.getValue();
                        }
                        a++;
                    }
                    this.saraCrud(sentencia, tabla, contenido, contenido2);
                    listo = true;
                    break;
            }
        } catch (SQLDataException ex) {
            System.out.println("NO SARA CRUD" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("NO SARA CRUD" + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("NO SARA CRUD" + ex.getMessage());
        }

        if (sentencia == "SELECT" && muchos == true) {
            return json = new Gson().toJson(lista);
        } else {
            if (sentencia == "SELECT" && muchos == false) {
                return new JSONObject(item).toString();
            } else {
                if(listo)return "true";
                else return "false";
            }
        }

    }

    public static String[] M_toArray(Map<String, Object> mapa, int vector) {
        String[] array = new String[mapa.size()];                          
        Object[] array1 = new String[mapa.size()];                          
        int i = 0;
        String[] retorno = null;                                            
        for (Entry<String, Object> enti : mapa.entrySet()) {                
            array[i] = enti.getKey();                                       
            array1[i] = enti.getValue();                                    
            i++;                                                            
        }               
        if (vector == 1) {                                                    
            retorno = array;                                                   
        } else {
            if (vector == 2) {                                               
                retorno = (String[]) array1;                                    
            }
        }
        return retorno;                                                        
    }

    public static String M_Format(String fecha) {
        Date d = new Date(fecha);
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        fecha = f.format(d);
        return fecha;
    }

}