package M_Modelo;

import M_Util.Elomac;
import org.json.JSONArray;
import org.json.JSONObject;

public class Notificacion extends Elomac {

    public Notificacion() {
        super("notificacion", 1);
    }

//    public Object NotificacionAR(String[] elegir, String delimitador) {
//
//        JSONObject jNot1 = null;
//        JSONArray jNot2 = new JSONArray();
//        try {
//            String stNot1 = new Elomac(17, 2).Select(elegir, delimitador);
//            for (int i = 0; i < new JSONArray(stNot1).length(); i++) {
//
//                jNot1 = new JSONArray(stNot1).getJSONObject(i);
//                int tipo = Integer.parseInt((String) jNot1.get("Id_Tipo_Notificacion"));
//                if (tipo == 3) {
//                    String[] numT = {"1", "8"};
//                    String delimi = "[{colum:5,operador:0,valor1:" + jNot1.get("Ides_Proceso") + "}]";
//                    JSONObject jVer1 = new JSONArray(new Elomac(6, 2).Select(numT, delimi)).getJSONObject(0);
//                    jNot1.put("Nom_P_Virtual", jVer1.get("Nom_P_Virtual"));
//                    jNot1.put("Num_Version", jVer1.get("Num_Version"));
//                    jNot1.remove("Id_Tipo_Notificacion");
//                    jNot2.put(jNot1);
//                } else if (tipo == 2) {
//                    String[] numT = {"1", "2", "3","4"}; //-------CAMBIADO 3-> ID VERSION, url
//                    String delimi = "[{colum:0,operador:0,valor1:" + jNot1.get("Ides_Proceso") + "}]";
//                    JSONObject jEva = new JSONArray(new Elomac(39, 2).Select(numT, delimi)).getJSONObject(0);
//                    jNot1.put("Nom_P_Virtual", jEva.get("Nom_P_Virtual"));
//                    jNot1.put("Num_Version", jEva.get("Num_Version"));
//                    jNot1.put("Id_Version", jEva.get("Id_Version"));//-------CAMBIADO 3-> ID VERSION
//                    jNot1.put("Url_Version", jEva.get("Url_Version"));//-------CAMBIADO 4-> url
//                    jNot1.remove("Id_Tipo_Notificacion");
//                    jNot2.put(jNot1);
//                } else if (tipo == 1) {
//                    String[] numT = {"1", "8", "10"};
//                    String delimi = "[{colum:5,operador:0,valor1:" + jNot1.get("Ides_Proceso") + "}]";
//                    JSONObject jVer = new JSONArray(new Elomac(6, 2).Select(numT, delimi)).getJSONObject(0);
//                    jNot1.put("Producto", jVer.get("Nom_P_Virtual") + " " + jVer.get("Num_Version"));
//                    jNot1.put("Url_Version", jVer.get("Url_Version"));
//                    jNot1.remove("Id_Tipo_Notificacion");
//                    jNot2.put(jNot1);
//                }
//
//            }
//            return "" + jNot2;//SOLUCION AL MAYOR PROBLEMA (OBJECT -> STRING)
//        } catch (Exception e) {
//            return e.getMessage();
//        }
//    }
//    //------------------ CAMBIO CORRECCION --------------- 14/04/2014
//
//    
//    public String ConsultaNotificacion(String[] consultaNoti){
//        try {
//            JSONArray jArrayConsulta = new JSONArray(Elomac.M_ResultSet(Group(consultaNoti, '~'), 12));
//            return jArrayConsulta.toString();
//        } catch (Exception e) {
//            return e.getMessage();
//        }
//    }
    
    public String ConsultarNotificacion_M(String[] parametrosNotificacion){
        
        try {
            JSONArray arrayConsulta = new JSONArray(Elomac.M_ResultSet(Group(parametrosNotificacion, '~'), 12));
            return arrayConsulta.toString();
        } catch (Exception e) {
             return e.getMessage();
        }
    }
    
//    public Object NotificacionCorreccion(String[] elegir, String delimitador) {
//
//        String[] numColum = {"0"};
//        String notiAntigua = (String) this.NotificacionAR(elegir, delimitador);
//        String verCance = new Elomac("Version",1).Select(numColum, "[{colum:10,operador:0,valor1:8}]");
//        try {
//            
//            JSONArray jNotAhoraA = new JSONArray(notiAntigua);
//            if(verCance != "false"){// solucion 12/04/2017
//                JSONArray jVerCanceA = new JSONArray(verCance);
//
//                for (int i = 0; i < jVerCanceA.length(); i++) {
//                    for (int j = 0; j < jNotAhoraA.length(); j++) {
//                        if ((jNotAhoraA.getJSONObject(j).getInt("Id_Version") == jVerCanceA.getJSONObject(i).getInt("Id_Version"))) {
//                            jNotAhoraA.remove(j);
//                            i--;
//                            break;
//                        }
//                    }
//                }
//            }
//            return jNotAhoraA;
//        } catch (Exception e) {
//            return e.getMessage();
//        }
//    }
    //------------------ CAMBIO CORRECCION ------------------------------------ 
}