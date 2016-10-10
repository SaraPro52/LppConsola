
package modelo.Dao;

import com.google.gson.Gson;
import java.sql.ResultSet;
import java.util.Map.Entry;
import modelo.Bean.Funcionario_Bean;
import org.json.JSONArray;
import org.json.JSONObject;
import util.M_Crud;

public class Funcionario_Dao extends M_Crud{

    public int Id_Funcionario;
    public int Id_Tipo_Documento;
    public double Num_Documento;
    public String Nom_Funcionario;
    public String Apellidos;
    public String Correo;
    public String Cargo;
    public String Ip_Sena;
    public String Contraseña;
    public int Id_Estado;
    public int Id_Area_Centro;
    
    public Funcionario_Dao(){
        carga(1);
    }
    
    
    public Funcionario_Dao(Funcionario_Bean funB){
        
        cont1.clear();
        cont1.put("Id_Funcionario",         ""+funB.getId_Funcionario());
        cont1.put("Id_Tipo_Documento",      ""+funB.getId_Tipo_Documento());
        cont1.put("Num_Documento",          ""+funB.getNum_Documento());
        cont1.put("Nom_Funcionario",        funB.getNom_Funcionario());
        cont1.put("Apellidos",              funB.getApellidos());
        cont1.put("Correo",                 funB.getCorreo());
        cont1.put("Cargo",                  funB.getCargo());
        cont1.put("Ip_Sena",                funB.getIp_Sena());
        cont1.put("Contraseña",             funB.getContraseña());
        cont1.put("Id_Estado",              ""+funB.getId_Estado());
        cont1.put("Id_Area_Centro",         ""+funB.getId_Area_Centro());
        carga(2);
        carga(1);
    }
    
    public Funcionario_Dao(String funJ){
        carga(1);
        try {
            JSONObject jso = new JSONArray(funJ).getJSONObject(0);
            for(int i = 0; i < jso.names().length(); i++){
                for(Entry<String,Object> enti : cont1.entrySet()){
                    if(((String)jso.names().get(i)).equals((String)enti.getKey())){
                        cont1.put(enti.getKey(), jso.getString(enti.getKey()));
                    }else{
                        System.out.println("NO JSON");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        carga(2);
        System.out.println(json = new Gson().toJson(cont1));
        
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        carga(1);
        return SuperP(sentencia,"Funcionario",this.cont1,condicion);
    }
    
    public Object Select(String fun){
        return this.Crud("SELECT", "Funcionario", "Id_Funcionario = "+fun+"");
    }
    
    public boolean RegistrarFuncionario(String[] fun){
        String todoFun = "";
        for(int i= 0; i < fun.length; i++){
            if(i == 0)
                todoFun += fun[i];
            else
                todoFun += "~"+fun[i];
        }
        return (boolean)this.Registar(todoFun, 2);
    }
    
    @Override
    public void carga(int i){
        switch(i){
            case 1:
                cont1.put("Id_Funcionario",     ""+this.Id_Funcionario);
                cont1.put("Id_Tipo_Documento",  ""+this.Id_Tipo_Documento);
                cont1.put("Num_Documento",      ""+this.Num_Documento);
                cont1.put("Nom_Funcionario",    this.Nom_Funcionario);
                cont1.put("Apellidos",          this.Apellidos);
                cont1.put("Correo",             this.Correo);
                cont1.put("Cargo",              this.Cargo);
                cont1.put("Ip_Sena",            this.Ip_Sena);
                cont1.put("Contraseña",         this.Contraseña);
                cont1.put("Id_Estado",          ""+this.Id_Estado);
                cont1.put("Id_Area_Centro",     ""+this.Id_Area_Centro);
                break;
            case 2:
                this.Id_Funcionario =       Integer.parseInt((String)cont1.get("Id_Funcionario"));
                this.Id_Tipo_Documento =    Integer.parseInt((String)cont1.get("Id_Tipo_Documento"));
                this.Num_Documento =        Double.parseDouble((String) cont1.get("Num_Documento"));
                this.Nom_Funcionario =      (String) cont1.get("Nom_Funcionario");
                this.Apellidos =            (String)cont1.get("Apellidos");
                this.Correo =               (String)cont1.get("Correo");
                this.Cargo =                (String)cont1.get("Cargo");
                this.Ip_Sena =              (String)cont1.get("Ip_Sena");
                this.Contraseña =           (String)cont1.get("Contraseña");
                this.Id_Estado =            Integer.parseInt((String)cont1.get("Id_Estado"));
                this.Id_Area_Centro =       Integer.parseInt((String)cont1.get("Id_Area_Centro"));
                break;
        }
        
    }
}
