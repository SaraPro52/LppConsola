
package M_Util;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import org.json.JSONArray;
import org.json.JSONObject;

public class Elomac extends M_Crud{
    
    public Map<String,Object> atributos = new LinkedHashMap<String, Object>();
    private String tabla;
    private String primaryKey;
    public String arrayTablas[]= null;
    public String arrayAtributos[] = null;
    public String[] opRelacional = {"=",">","<",">=","<=","!=","IN","NOT IN","BETWEEN","LIKE"};
    public String[] opLogico = {"AND","OR","NOT"};
    private int tipoElo = 1;
    
    public Elomac(int tab, int tipo){
        this.tipoElo = tipo;
        this.arrayTablas = cargarTablas();
        this.tabla = arrayTablas[tab];
        cargarAtributos();
        this.arrayAtributos = cargarArrayAtributos();
    }

    public Elomac(String tab,int tipo){
        this.tipoElo = tipo;
        this.tabla = tab;
        cargarAtributos();
        this.arrayAtributos = cargarArrayAtributos();
    }
    public Elomac(int tab,int tipo,String[] datos){
        this.tipoElo = tipo;
        this.arrayTablas = cargarTablas();
        this.tabla = arrayTablas[tab];
        cargarAtributos(datos);
        this.arrayAtributos = cargarArrayAtributos();
    }
    
    private void cargarAtributos(){
        atributosLista(null);
    }
    
    private void cargarAtributos(String[] datos){
        atributosLista(datos);
    }
    
    private void atributosLista(Object[] obj){
        try {
            rs = (ResultSet)this.Registar("DESCRIBE "+this.tabla+"",4);
            int i = 0;
            while(rs.next()){
                if(i == 0) this.primaryKey = rs.getString("Field");
                if(obj == null)atributos.put(rs.getString("Field")," ");
                else atributos.put(rs.getString("Field"),obj[i]);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    }
    
    private String[] cargarArrayAtributos(){
        String[] array  = new String[atributos.size()];
        int i = 0;
        for (Entry<String, Object> enti : atributos.entrySet()) {
            array[i] = enti.getKey();
            i++;
        }
        return array;
    }
    private String[] cargarTablas(){
        List<String> tablas = new ArrayList<String>();
        String sentencia = "SHOW TABLES";
        if(this.tipoElo == 2) sentencia = "SHOW full TABLES where Table_type='VIEW'";
         try {
            rs = (ResultSet)this.Registar(sentencia,4);
            while(rs.next()){
                tablas.add(rs.getString(1));
            }
            return  tablas.toArray(new String[tablas.size()]);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public void load(String json){
        cargarLoad(json,1);
    }
    private void cargarLoad(String var, int a){
        try {
            JSONObject jso = new JSONArray(var).getJSONObject(0);
            for(int i = 0; i < jso.names().length(); i++){
                for(Entry<String,Object> enti : atributos.entrySet()){
                    switch(a){
                        case 1 :
                            if(((String)jso.names().get(i)).equals((String)enti.getKey())){
                                atributos.replace(enti.getKey(), jso.getString(enti.getKey()));
                                System.out.println(enti.getKey()+"  "+jso.getString(enti.getKey()));
                                break;
                            }
                            break;
                        case 2:
                            if(((String)arrayAtributos[Integer.parseInt((String)jso.names().get(i))]).equals((String)enti.getKey())){
                                atributos.replace(enti.getKey(), jso.getString((String)jso.names().get(i)));
                                System.out.println(enti.getKey()+ " "+enti.getValue() +"  "+ (String)jso.names().get(i) +"--" +jso.getString((String)jso.names().get(i)));
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
    private void EspecificarColumnas(String[] numsTablas){
        Map<String,Object> redefinir = new LinkedHashMap<String, Object>();
        try {
            for(int i = 0; i < numsTablas.length; i++){
                redefinir.put(arrayAtributos[Integer.parseInt(numsTablas[i])], " ");
            }
           atributos = redefinir;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private  String DelimitarConsulta(String delimtadores){
        String concat = "";
        try {
            int ope = 0,num = new JSONArray(delimtadores).length();
            for (int j = 0; j < num; j++) {
                String colum = "",operador = "",valor1 = "",valor2 = "",añadir = "";
                String key = "",value = "";
                
                JSONObject deli = new JSONArray(delimtadores).getJSONObject(j);
                for (int i = 0; i < deli.names().length(); i++) {
                    key = deli.names().getString(i);value = deli.getString(key);
                    switch (key){
                        case "colum":   colum = arrayAtributos[Integer.parseInt(value)];break;
                        case "operador":
                            ope = Integer.parseInt(value);
                            operador = opRelacional[ope];break;
                        case "valor1":  valor1 = value;break;
                        case "valor2":  valor2 = value;break;
                        case "añadir":  
                            if(num > 0)añadir = opLogico[Integer.parseInt(value)];
                            break;
                    }
                }
                switch (ope){
                        case 6:case 7:concat += " " +colum +" "+ operador + " ("+valor1+") "+añadir;break;
                        case 8:concat += " " +colum +" "+ operador + " "+valor1+" AND "+valor2+" "+añadir;break;
                        case 9:concat += " " +colum +" "+ operador + " '%"+valor1+"%' "+añadir;break;
                        default:concat += " " +colum +" "+ operador + " "+valor1+" "+añadir;break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return concat;
    }
    
    
    public String Select(String[] numsTablas, String colum, String operador,String valor){
        this.EspecificarColumnas(numsTablas);
        return this.Select(colum, operador, valor);
    }
    public String Select(String[] numsTablas,String delimitador){
        this.EspecificarColumnas(numsTablas);
        return Select(delimitador);
    }
    public String Select(String[] numsTablas){
        this.EspecificarColumnas(numsTablas);
        return this.Select();
    }
    public String Select(String[] numsTablas,int id){
        this.EspecificarColumnas(numsTablas);
        return this.Select(id);
    }
    
    public String Select(int id){
        return (String)this.SuperP("SELECT",this.tabla,atributos,""+primaryKey+" = "+id+"");
    }
    public String Select(){
        return (String)this.SuperP("SELECT",this.tabla,atributos,"");
    }
    public String Select(String delimitador){
        System.out.println(this.DelimitarConsulta(delimitador));
        return (String)this.SuperP("SELECT",this.tabla,atributos,this.DelimitarConsulta(delimitador));
    }
    public String Select(String colum, String operador,String valor){
        return (String)this.SuperP("SELECT",this.tabla,atributos,""+colum+" "+operador+" "+valor+"");
    }
    
    
    
    //------------------------- INSERT -----------------------------
    public boolean Insert(){
        return (boolean)this.SuperP("INSERT",this.tabla,atributos,"");
    }
    
    //------------------------- UPDATE -----------------------------
    public boolean Update(){
        return (boolean)this.SuperP("UPDATE",this.tabla,atributos,""+primaryKey+" = "+atributos.get(primaryKey)+"");
    }
    public boolean Update(String colum, String operador ,String valor){
        return (boolean)this.SuperP("UPDATE",this.tabla,atributos,""+colum+" "+operador+" "+valor+"");
    }
    
    public boolean Update(String json,String jsonUpdate){
        this.load(json);this.arrayAtributos = cargarArrayAtributos();this.cargarLoad(jsonUpdate, 2);
        return this.Update();
    }
    
    //------------------------- DELETE -----------------------------
    public boolean Delete(){
        return (boolean)this.SuperP("DELETE",this.tabla,atributos,""+primaryKey+" = "+atributos.get(primaryKey)+"");
    }
    public boolean Delete(int id){
        return (boolean)this.SuperP("DELETE",this.tabla,atributos,""+primaryKey+" = "+id+"");
    }
    public boolean Delete(String colum, String operador ,String valor){
        return (boolean)this.SuperP("DELETE",this.tabla,atributos,""+colum+" "+operador+" "+valor+"");
    }

}
