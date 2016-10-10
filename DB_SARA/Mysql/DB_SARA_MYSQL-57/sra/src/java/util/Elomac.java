
package util;

import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;

public abstract class Elomac extends M_Crud{
    
    protected Map<String,Object> atributos = new LinkedHashMap<String, Object>();
    private String tabla;
    private String primaryKey;
    
    
    public Elomac(String tab,String primary){
        this.tabla = tab;
        this.primaryKey = primary;
        
        try {
            rs = (ResultSet)this.Registar("DESCRIBE "+this.tabla+"",4);
            int i = 0;
            while(rs.next()){
                atributos.put(rs.getString("Field")," ");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String Select(int id){
        return (String)this.SuperP("SELECT",this.tabla,atributos,""+primaryKey+" = "+id+"");
    }
    public String Select(){
        return (String)this.SuperP("SELECT",this.tabla,atributos,"");
    }
    
    public String Select(String colum, String operador,String valor){
        return (String)this.SuperP("SELECT",this.tabla,atributos,""+colum+" "+operador+" "+valor+"");
    }
    
    public boolean Insert(){
        return (boolean)this.SuperP("INSERT",this.tabla,atributos,"");
    }
    
    public boolean Update(){
        return (boolean)this.SuperP("UPDATE",this.tabla,atributos,""+primaryKey+" = "+atributos.get(primaryKey)+"");
    }
    
    public boolean Update(String colum, String operador ,String valor){
        return (boolean)this.SuperP("UPDATE",this.tabla,atributos,""+colum+" "+operador+" "+valor+"");
    }
    
    public boolean Delete(){
        return true;
    }

}
