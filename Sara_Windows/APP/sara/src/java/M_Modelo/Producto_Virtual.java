package M_Modelo;

import M_Util.Elomac;
import static M_Util.M_Crud.M_Format;
import java.util.ArrayList;
import java.util.Date;
import org.json.JSONArray;
import org.json.JSONObject;

public class Producto_Virtual extends Elomac {

    public Producto_Virtual() {
        super("producto_virtual", 1);
    }

    private String Autores(String consulta) {

        try {

            JSONArray arr = new JSONArray();

            for (int i = 0; i < new JSONArray(consulta).length(); i++) {
                String autores = "";
                JSONObject conJ = new JSONArray(consulta).getJSONObject(i);
                String delimitador = "[{colum:2,operador:0,valor1:" + conJ.getInt("id_version") + "}]";
                String consulta2 = new Elomac(21, 2).Select(delimitador);

                for (int j = 0; j < new JSONArray(consulta2).length(); j++) {
                    JSONObject con2J = new JSONArray(consulta2).getJSONObject(j);
                    if (j == 0) {
                        autores += con2J.getString("nombrecompleto");
                    } else {
                        autores += "," + con2J.getString("nombrecompleto");
                    }
                }
                conJ.put("Autores", autores);
                arr.put(conJ);
            }
            return arr.toString();
        } catch (Exception ex) {
            return "null";
        }
    }

    public String ConsultarProducto(String[] filtros, int caso) {
          ArrayList<String> delimitadorA = new ArrayList<String>();
        String deli = "";
        String añada = "}";
        String[] numC = {"0","1","2","3","4","6","5","7"};
        Object[] delimitador = null;
        String consulta = "";
        try {
            if(caso == 1){
                if (!filtros[0].equals("")) {//Nombre Producto Vitual
                    //delimitadorA.add("{colum:1,operador:0,valor1: '\"" + filtros[0] + "\"'");-->Consulta por el texto no por el id
                    delimitadorA.add("{colum:0,operador:0,valor1:"+filtros[0]);//->>> Filtro por el id PRODUCTO VIRTUAL
                }
                if (!filtros[1].equals("")) {// ID FORMATO
                    delimitadorA.add("{colum:3,operador:0,valor1:" + filtros[1]);
                }
                if ((!filtros[2].equals("") && !filtros[3].equals(""))) {//Fecha Inical y Fecha Final
                    
                    Date f = new Date((filtros[3]));
                    f.setDate(f.getDate()+1);
                    f.setYear(Integer.parseInt("20"+new String(""+f.getYear()).substring(1,new String(""+f.getYear()).length())));
                    
                    filtros[2] = M_Format(filtros[2]);
                    filtros[3] = f.getYear()+"-"+(f.getMonth()+1)+"-"+f.getDate();
                    delimitadorA.add("{colum:4,operador:8,valor1:'\"" + filtros[2] + "\"',valor2:'\"" + filtros[3] + "\"'");

                } else if (!filtros[2].equals("")) {//Fecha EXACTA
                    filtros[2] = M_Format(filtros[2]);
                    delimitadorA.add("{colum:4,operador:9,valor1:" + filtros[2]);
                }

                if (!filtros[4].equals("")) {//Nombre Autor Funcionario
                    //delimitadorA.add("{colum:7,operador:6,valor1:'" + filtros[4] + "'"); Buscas por el texto
                    delimitadorA.add("{colum:6,operador:0,valor1:"+ filtros[4]); // Por el id del funcionario
                }
                if (!filtros[5].equals("")) {//CATEGORIA - PROGRAMA
                    delimitadorA.add("{colum:10,operador:0,valor1:"+filtros[6]);
                    switch(filtros[6]){
                        case "0":// Programa de Formacion 
                            delimitadorA.add("{colum:8,operador:6,valor1:'" + filtros[5] + "'");
                            break;
                        case "1":// Categoria
                            delimitadorA.add("{colum:9,operador:6,valor1:'" + filtros[5] + "'");
                            break;
                    }
                }

                delimitador = delimitadorA.toArray();
                for (int i = 0; i < delimitador.length; i++) {
                    if ((i + 1) < delimitador.length) {
                        añada = ",añadir:0},";
                    } else {
                        añada = "}";
                    }
                    deli += delimitador[i] + "" + añada;
                }
                deli = "[" + deli + "]";

                System.out.println(deli);
                consulta = new Elomac(40, 2).Select(numC, deli);
                return this.Autores(consulta);

            } else {
                consulta = new Elomac(40, 2).Select(numC);
                return this.Autores(consulta);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "null";
        }

    }

    //TRAER TODAS LAS VERSIONES DEL PRODUCTO SELECIONADO,
    //DE CADA VERSION TRAER TODOS LOS DATOS DE DICHA VERSION
    //TRAER DE CADA VERSION LOS COMENTARIOS REALIZADOS POR LOS DEMAS INSTRUCTORES
    //TRAER TAMBIEN EL NOMBRE COMPLETO DEL INSTRUCTOR QUE REALIZO EL COMENTARIO
    public Object DetallesConsulta(int idPV) {

        try {
            String delimitador = "[{colum:0,operador:0,valor1:" + idPV + "}]";
            String[] numCamp = {"4", "5", "6", "7", "8", "9", "10"};

            String consulta1 = new Elomac(22, 2).Select(numCamp, delimitador);
            JSONArray arr = new JSONArray();

            for (int i = 0; i < new JSONArray(consulta1).length(); i++) {
                String autores = "";
                String comentarios = ""; // Modificado
                JSONObject conJ = new JSONArray(consulta1).getJSONObject(i);

                delimitador = "[{colum:4,operador:0,valor1:" + conJ.getInt("id_version") + "}]";
                String[] numCamp1 = {"0", "1", "2", "3"};
                //Mo
                try {
                    comentarios = new Elomac(25, 2).Select(numCamp1, delimitador);
                } catch (Exception e) {
                    comentarios = " ";
                }
                //Mo
                String delimitador1 = "[{colum:2,operador:0,valor1:" + conJ.getInt("id_version") + "}]";
                String consulta2 = new Elomac(21, 2).Select(delimitador1);

                for (int j = 0; j < new JSONArray(consulta2).length(); j++) {
                    JSONObject con2J = new JSONArray(consulta2).getJSONObject(j);
                    if (j == 0) {
                        autores += con2J.getString("nombrecompleto");
                    } else {
                        autores += "," + con2J.getString("nombrecompleto");
                    }
                }

                conJ.put("Comentarios", comentarios);
                conJ.put("Autores", autores);
                arr.put(conJ);
            }
            return arr;
        } catch (Exception ex) {
            return ex.getMessage();
        }
    }
    
    // 

}
