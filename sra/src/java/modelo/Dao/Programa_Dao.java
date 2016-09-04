
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Programa_Bean;
import util.InterfaceCrud;

public class Programa_Dao extends InterfaceCrud{

    public int Id_Programa;
    public String Nom_Programa;
    public String Nivel_Formacion;
    private ArrayList<Programa_Bean> listarPro = new ArrayList<Programa_Bean>();
    private Programa_Bean pro = null;
    private String tabla = "Programa";
    private String columnaId = "Id_Programa";
    public char ope = 'N';
    
    public Programa_Dao(){}
    
    public Programa_Dao(Programa_Bean p){
        
        this.Id_Programa = p.getId_Programa();
        this.Nom_Programa = p.getNom_Programa();
        this.Nivel_Formacion = p.getNivel_Formacion();
    }
    
    @Override
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                    if(ope == 'S'){
                        this.tabla = "V_Detalles_Area";
                        this.columnaId = "Id_Area";
                    }
                        
                    rs = saraCrud(val,operador+"4",this.tabla,this.columnaId,(int) objeto,"Id_Programa",null,"Nom_Programa",null,"Nivel_Formacion",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                    while(rs.next()){
                        
                        pro = new Programa_Bean(rs.getString("Nom_Programa"),rs.getString("Nivel_Formacion"));
                        pro.setId_Programa(rs.getInt("Id_Programa"));
                        if((operador == "-") || (operador == "" && ope == 'S'))
                            listarPro.add(pro);
                    }
                    rs.close();
                    cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,"2","Programa","Id_Programa",this.Id_Programa,"Nom_Programa",this.Nom_Programa,"Nivel_Formacion",this.Nivel_Formacion,
                                        "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                        listo = true;
                    break;
            }
        } catch (Exception p1) {
            p1.printStackTrace();
        }
        if((operador == "-" && val == "SELECT") || (operador == "" && val == "SELECT" && ope == 'S')){
            return json = new Gson().toJson(listarPro);
        }else{
            if(operador == "" && val == "SELECT" && ope == 'N'){
                return pro;
            }else{
                return listo;
            }
        }
    }
    
}
