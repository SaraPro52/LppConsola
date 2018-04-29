package M_Modelo;

import M_Util.Elomac;
import M_Util.M_Crud;
import static M_Util.M_Procedure.Group;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

public class Estadisticas extends M_Crud {

    public Estadisticas() {

    }
    
    //REPORTES 
    public String ConsultaReportes(String[] parametrosReportes){
        try {
            JSONArray arrayConsulta = new JSONArray(Elomac.M_ResultSet(Group(parametrosReportes, '~'), 17));
            return arrayConsulta.toString();
        } catch (Exception e) {
            return e.getMessage();
        }
    }
    //ESTADISTICAS

    public String ConsultaGraficas(String[] parametrosGraficas){
        try {
            JSONArray arrayConsulta = new JSONArray(Elomac.M_ResultSet(Group(parametrosGraficas, '~'), 18));
            return arrayConsulta.toString();
        } catch (Exception e) {
            return e.getMessage();
        }
    }
    
    
    public Object EstadisticaFecha(String[] fecha, int diagrama) {
        try {
            Map<String,Object> columnas = new LinkedHashMap<String,Object>();
            JSONObject columnas1 = null;
            JSONArray todo = new JSONArray();
            String  vista = "", grupo = "GROUP BY ";
            switch (diagrama) {
                case 1:
                    vista = "31_v_estadisticatipo1";
                    columnas.put("id_formato", "");
                    columnas.put("nom_formato", "");
                    grupo += "id_formato, nom_formato, id_centro";
                    break;
                case 2:
                    vista = "33_v_estadisticaarea1";
                    columnas.put("id_Area", "");
                    columnas.put("nom_area", "");
                    grupo += "id_area, nom_area,id_centro";
                    break;
                case 3:
                    vista = "35_v_estadisticacategoria1";
                    columnas.put("id_categoria", "");
                    columnas.put("nom_categoria", "");
                    grupo += "id_categoria,nom_categoria,id_centro";
                    break;
                default:
                    throw new AssertionError();
            }
            columnas.put("COUNT(*) AS Cantidad", "");
            columnas.put("id_centro", "");
            int a = 0;
            rs = saraCrud("SELECT", vista,Group(M_toArray(columnas, 1), '|'), "fecha_publicacion BETWEEN '" + fecha[0] + "' AND '" + fecha[1] + "' " + grupo + " ");
            
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
