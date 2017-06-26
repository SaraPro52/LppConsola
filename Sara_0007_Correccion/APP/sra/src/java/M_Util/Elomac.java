package M_Util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Elomac extends M_Crud {

    public Map<String, Object> atributos = new LinkedHashMap<String, Object>();
    private String tabla;
    private String primaryKey;
    public String arrayAtributos[] = null;
    public String[] opRelacional = {"=", ">", "<", ">=", "<=", "!=", "IN", "NOT IN", "BETWEEN", "LIKE"};
    public String[] opLogico = {"AND", "OR", "NOT"};
    private int tipoElo = 1;
    public M_EstructuraJSON estrucDB = new M_EstructuraJSON();

    public void cerrarConexiones() throws SQLException {
        this.CerrarConn(this.obtenerConn());
    }

    public Elomac(int tab, int tipo) {
        this.tipoElo = tipo;
        this.tabla = estrucDB.TablaDB(tipoElo, tab);//------14/04/2017
        cargarAtributos();
        this.arrayAtributos = cargarArrayAtributos();
    }

    public Elomac(String tab, int tipo) {
        this.tipoElo = tipo;
        this.tabla = tab;
        cargarAtributos();
        this.arrayAtributos = cargarArrayAtributos();
    }

    public Elomac(int tab, int tipo, Object[] datos) {
        this.tipoElo = tipo;
        this.tabla = estrucDB.TablaDB(tipoElo, tab);//------14/04/2017
        cargarAtributos(datos);
        this.arrayAtributos = cargarArrayAtributos();
    }

    public Elomac(int tab, int tipo, ArrayList<String> datosLista) {
        this.tipoElo = tipo;
        this.tabla = estrucDB.TablaDB(tipoElo, tab);//------14/04/2017
        cargarAtributos(datosLista.toArray());
        this.arrayAtributos = cargarArrayAtributos();
    }

    private void cargarAtributos() {
        atributosLista(null);
    }

    private void cargarAtributos(Object[] datos) {
        atributosLista(datos);
    }
//------14/04/2017
    private void atributosLista(Object[] obj) {
        try {
            System.out.println(estrucDB.ColumnasTabla(tabla));
            JSONArray jArrayAtributos = new JSONArray(estrucDB.ColumnasTabla(tabla));
            
            for (int i = 0; i < jArrayAtributos.length(); i++) {
                String nomColum = jArrayAtributos.getJSONObject(i).getJSONArray("Columna").getString(0);
                if (i == 0) {
                    this.primaryKey = nomColum;
                }
                if (obj == null) {
                    atributos.put(nomColum, " ");
                } else {
                    atributos.put(nomColum, obj[i]);
                }
            }
                
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //------14/04/2017

    private String[] cargarArrayAtributos() {
        String[] array = new String[atributos.size()];
        int i = 0;
        for (Entry<String, Object> enti : atributos.entrySet()) {
            array[i] = enti.getKey();
            i++;
        }
        return array;
    }

    

    public void load(String json) {
        cargarLoad(json, 1);
    }

    private void cargarLoad(String var, int a) {
        try {
            JSONObject jso = new JSONArray(var).getJSONObject(0);
            for (int i = 0; i < jso.names().length(); i++) {
                for (Entry<String, Object> enti : atributos.entrySet()) {
                    switch (a) {
                        case 1:
                            if (((String) jso.names().get(i)).equals((String) enti.getKey())) {
                                atributos.replace(enti.getKey(), jso.getString(enti.getKey()));
                                System.out.println(enti.getKey() + "  " + jso.getString(enti.getKey()));
                                break;
                            }
                            break;
                        case 2:
                            if (((String) arrayAtributos[Integer.parseInt((String) jso.names().get(i))]).equals((String) enti.getKey())) {
                                atributos.replace(enti.getKey(), jso.getString((String) jso.names().get(i)));
                                System.out.println(enti.getKey() + " " + enti.getValue() + "  " + (String) jso.names().get(i) + "--" + jso.getString((String) jso.names().get(i)));
                                break;
                            }
                            break;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //------------------------- SELECT -----------------------------
    private void EspecificarColumnas(String[] numsTablas) {
        Map<String, Object> redefinir = new LinkedHashMap<String, Object>();
        try {
            for (int i = 0; i < numsTablas.length; i++) {
                redefinir.put(arrayAtributos[Integer.parseInt(numsTablas[i])], " ");
            }
            atributos = redefinir;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String DelimitarSentencia(String delimtadores) {
        String concat = "";
        try {
            int ope = 0, num = new JSONArray(delimtadores).length();
            for (int j = 0; j < num; j++) {
                String colum = "", operador = "", valor1 = "", valor2 = "", añadir = "";
                String key = "", value = "";

                JSONObject deli = new JSONArray(delimtadores).getJSONObject(j);
                for (int i = 0; i < deli.names().length(); i++) {
                    key = deli.names().getString(i);
                    value = deli.getString(key);
                    switch (key) {
                        case "colum":
                            colum = arrayAtributos[Integer.parseInt(value)];
                            break;
                        case "operador":
                            ope = Integer.parseInt(value);
                            operador = opRelacional[ope];
                            break;
                        case "valor1":
                            valor1 = value;
                            break;
                        case "valor2":
                            valor2 = value;
                            break;
                        case "añadir":
                            if (num > 0) {
                                añadir = opLogico[Integer.parseInt(value)];
                            }
                            break;
                    }
                }
                switch (ope) {
                    case 6:
                    case 7:
                        concat += " " + colum + " " + operador + " (" + valor1 + ") " + añadir;
                        break;
                    case 8:
                        concat += " " + colum + " " + operador + " " + valor1 + " AND " + valor2 + " " + añadir;
                        break;
                    case 9:
                        concat += " " + colum + " " + operador + " '%" + valor1 + "%' " + añadir;
                        break;
                    default:
                        concat += " " + colum + " " + operador + " " + valor1 + " " + añadir;
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(concat);
        return concat;
    }

    public String Select(String[] numsTablas, String colum, String operador, String valor) {
        this.EspecificarColumnas(numsTablas);
        return this.Select(colum, operador, valor);
    }

    public String Select(String[] numsTablas, String delimitador) {
        this.EspecificarColumnas(numsTablas);
        return Select(delimitador);
    }

    public String Select(String[] numsTablas) {
        this.EspecificarColumnas(numsTablas);
        return this.Select();
    }

    public String Select(String[] numsTablas, int id) {
        this.EspecificarColumnas(numsTablas);
        return this.Select(id);
    }

    public String Select(int id) {
        return  this.SuperP("SELECT", this.tabla, atributos, "" + primaryKey + " = " + id + "");
    }

    public String Select() {
        return  this.SuperP("SELECT", this.tabla, atributos, "");
    }

    public String Select(String delimitador) {
        String bandera = null;
        try {
            bandera =  this.SuperP("SELECT", this.tabla, atributos, this.DelimitarSentencia(delimitador));
        } catch (Exception e) {
            System.out.println(e.getMessage());
            bandera = "false";
        }
        return bandera;
    }

    public String Select(String colum, String operador, String valor) {
        return this.SuperP("SELECT", this.tabla, atributos, "" + colum + " " + operador + " " + valor + "");
    }

    //------------------------- INSERT -----------------------------
    public boolean Insert() {
        boolean bo = false;
        String s = this.SuperP("INSERT", this.tabla, atributos, "");
        if(s == "true"){
            bo = true;
        }
        this.load(this.Select(Integer.parseInt(this.ObtenerId())));
        return bo;
    }

    private String ObtenerId() {
        String[] arr = cargarArrayAtributos();
        String delimitador = "";
        String añada = "";
        String[] numColum = {"0"};
        String id = "";
        for (int i = 0; i < arr.length; i++) {

            for (Entry<String, Object> enti : atributos.entrySet()) {

                if (arr[i].equals(enti.getKey())) {
                    if ((i + 1) < arr.length) {
                        añada = ",añadir:0},";
                    } else {
                        añada = "}]";
                    }

                    if (i == 1) {
                        delimitador += "[{colum:" + i + ",operador:0,valor1:'\"" + enti.getValue() + "\"'" + añada;
                    } else if (i > 1) {
                        delimitador += "{colum:" + i + ",operador:0,valor1:'\"" + enti.getValue() + "\"'" + añada;
                    }
                }

            }
        }
        System.out.println(delimitador);
        id = this.Select(numColum, delimitador);
        System.out.println(id);
        try {
            JSONObject idJ = new JSONArray(id).getJSONObject(0);
            return idJ.getString(idJ.names().getString(0));//obtener el valor de un json por medio del nombre de la llave
        } catch (Exception e) {
            return "NO ID";
        }
    }

    //------------------------- UPDATE -----------------------------
    public boolean Update() {
        if(this.SuperP("UPDATE", this.tabla, atributos, "" + primaryKey + " = " + atributos.get(primaryKey) + "") =="true"){
            return true;
        }else{
            return false;
        }
    }

    public boolean Update(String colum, String operador, String valor) {
        if(this.SuperP("UPDATE", this.tabla, atributos, "" + colum + " " + operador + " " + valor + "") =="true"){
            return true;
        }else{
            return false;
        }
    }

    public boolean Update(String delimitador) {
        if(this.SuperP("UPDATE", this.tabla, atributos, this.DelimitarSentencia(delimitador)) =="true"){
            return true;
        }else{
            return false;
        }
    }

    public boolean Update(String json, String jsonUpdate) {
        this.load(json);
        this.arrayAtributos = cargarArrayAtributos();
        this.cargarLoad(jsonUpdate, 2);
        return this.Update();
    }

    //------------------------- DELETE -----------------------------
//    public boolean Delete() {
//        
//        return (boolean) this.SuperP("DELETE", this.tabla, atributos, "" + primaryKey + " = " + atributos.get(primaryKey) + "");
//    }
//
//    public boolean Delete(int id) {
//        return (boolean) this.SuperP("DELETE", this.tabla, atributos, "" + primaryKey + " = " + id + "");
//    }
//
//    public boolean Delete(String colum, String operador, String valor) {
//        return (boolean) this.SuperP("DELETE", this.tabla, atributos, "" + colum + " " + operador + " " + valor + "");
//    }

    //---------------------------- CONVERTIDORES ------------------------
    public static String[] M_toArray(String arrayFalse) throws JSONException {
        JSONArray j = new JSONArray(arrayFalse);
        String[] arrayVerdad = new String[j.length()];

        for (int i = 0; i < j.length(); i++) {
            System.out.println(j.getString(i));
            arrayVerdad[i] = j.getString(i);
        }
        return arrayVerdad;
    }

    public static String M_ResultSet(String datos, int procedure) {
        M_Procedure mp = new M_Procedure();
        JSONObject jo = null;
        JSONArray ja = new JSONArray();
        try {
            mp.rs = (ResultSet) mp.Registar(datos, procedure);
            
            while (mp.rs.next()) {
                jo = new JSONObject();
                //System.out.println(mp.rs.getMetaData().getColumnCount());
                for (int i = 0; i < mp.rs.getMetaData().getColumnCount(); i++) {
                    //System.out.println(mp.rs.getMetaData().getColumnName(i + 1));
                    //System.out.println(mp.rs.getString(i + 1));
                    jo.append(mp.rs.getMetaData().getColumnName(i + 1), mp.rs.getString(i + 1));
                    //System.out.println(i);
                }
                //System.out.println("" + jo);
                ja.put(jo);
            }
            
            return "" + ja;
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}