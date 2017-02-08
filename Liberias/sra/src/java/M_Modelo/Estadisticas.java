package M_Modelo;

import M_Util.M_Crud;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

public class Estadisticas extends M_Crud {

    public Estadisticas() {

    }

    public Object EstadisticaFecha(String[] fecha, int diagrama) {
        try {
            Map<String,Object> columnas = new LinkedHashMap<String,Object>();
            JSONObject columnas1 = null;
            JSONArray todo = new JSONArray();
            String  vista = "", grupo = "GROUP BY ";
            switch (diagrama) {
                case 1:
                    vista = "31_V_EstadisticaTipo1";
                    columnas.put("Id_Formato", "");
                    columnas.put("Nom_Formato", "");
                    grupo += "Id_Formato, Nom_Formato, Id_Centro";
                    break;
                case 2:
                    vista = "33_v_EstadisticaArea1";
                    columnas.put("Id_Area", "");
                    columnas.put("Nom_Area", "");
                    grupo += "Id_Area, Nom_Area,Id_Centro";
                    break;
                case 3:
                    vista = "35_V_EstadisticaCategoria1";
                    columnas.put("Id_Categoria", "");
                    columnas.put("Nom_Categoria", "");
                    grupo += "Id_Categoria, Nom_Categoria,Id_Centro";
                    break;
                default:
                    throw new AssertionError();
            }
            columnas.put("COUNT(*) AS Cantidad", "");
            columnas.put("Id_Centro", "");
            int a = 0;
            rs = saraCrud("SELECT", vista,Group(M_toArray(columnas, 1), '|'), "Fecha_Publicacion BETWEEN '" + fecha[0] + "' AND '" + fecha[1] + "' " + grupo + " ");
            
            while(rs.next()){
                columnas1 = new JSONObject();
                
                for (Map.Entry<String, Object> entry : columnas.entrySet()) {
                    String clave = entry.getKey();
                    if(clave.equals("COUNT(*) AS Cantidad")){
                        columnas1.put("Cantidad", rs.getString("Cantidad"));
                        System.out.println("Clave: "+clave +" valor: "+rs.getString("Cantidad"));
                    }else{
                        columnas1.put(clave, rs.getString(clave));
                        System.out.println("Clave: "+clave +" valor: "+rs.getString(clave));
                    }
                    
                }
                todo.put(columnas1);
                a++;
            }
            return todo;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        
    }
}
