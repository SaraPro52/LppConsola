package M_Modelo;

import M_Util.Elomac;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

public class Producto_Virtual extends Elomac {

    public Producto_Virtual() {
        super("Producto_Virtual", 1);
    }

    private Object Autores(String consulta) {

        try {
            
            JSONArray arr = new JSONArray();

            for (int i = 0; i < new JSONArray(consulta).length(); i++) {
                String autores = "";
                JSONObject conJ = new JSONArray(consulta).getJSONObject(i);
                String delimitador = "[{colum:2,operador:0,valor1:" + conJ.getInt("Id_Version") + "}]";
                String consulta2 = new Elomac(21, 2).Select(delimitador);

                for (int j = 0; j < new JSONArray(consulta2).length(); j++) {
                    JSONObject con2J = new JSONArray(consulta2).getJSONObject(j);
                    if (j == 0) {
                        autores += con2J.getString("NombreCompleto");
                    } else {
                        autores += "," + con2J.getString("NombreCompleto");
                    }
                }
                conJ.put("Autores", autores);
                arr.put(conJ);
            }
            return arr;
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }

    public Object ConsultarProducto(String[] filtros, int caso) {
        ArrayList<String> delimitadorA = new ArrayList<String>();
        String deli = "";
        String añada = "}";
        String[] numC = {"0", "1", "2", "4","7"};
        Object[] delimitador = null;
        String consulta = "";
        try {
            if (caso == 27 || caso == 28) {

                if (!filtros[0].equals("")) {
                    delimitadorA.add("{colum:1,operador:0,valor1: '\"" + filtros[0] + "\"'");
                }
                if (filtros[1] != "") {
                    delimitadorA.add("{colum:3,operador:0,valor1:" + filtros[1]);
                }
                if ((filtros[2] != "" && filtros[3] != "null")) {
                    delimitadorA.add("{colum:4,operador:8,valor1:'\"" + filtros[2] + "\"',valor2:'\"" + filtros[3] + "\"'");

                } else if ((filtros[2] != "")) {
                    delimitadorA.add("{colum:4,operador:9,valor1:" + filtros[2]);
                }
                if (filtros[4] != "") {
                    delimitadorA.add("{colum:5,operador:6,valor1:'" + filtros[4] + "'");
                }
                if (filtros[5] != "") {
                    delimitadorA.add("{colum:6,operador:6,valor1:'" + filtros[5] + "'");
                }

                delimitador = delimitadorA.toArray();
                for (int i = 0; i < delimitador.length; i++) {
                    if ((i + 1) < delimitador.length) {
                        añada = ",añadir:0},";
                    } else {
                        añada = "}]";
                    }
                    deli += delimitador[i] + "" + añada;
                }
                deli = "[" + deli + "]";

                System.out.println(deli);
                consulta = new Elomac(caso, 2).Select(numC, deli);
                return this.Autores(consulta);

            } else {
                consulta = new Elomac(caso, 2).Select();
                return this.Autores(consulta);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }

    }

}
