
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
    
    public Programa_Dao(){}
    
    public Programa_Dao(Programa_Bean p){
        
        this.Id_Programa = p.getId_Programa();
        this.Nom_Programa = p.getNom_Programa();
        this.Nivel_Formacion = p.getNivel_Formacion();
    }
    
    @Override
    public Object OperacionRegistro(String val, int num, int id) {
        try {
            switch(val){
                case "SELECT":
                    rs = saraCrud(val,num,"Programa","Id_Programa",id,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                    while(rs.next()){
                        
                        pro = new Programa_Bean(rs.getString("Nom_Programa"),rs.getString("Nivel_Formacion"));
                        pro.setId_Programa(rs.getInt("Id_Programa"));
                        if(num == 1)
                            listarPro.add(pro);
                    }
                    rs.close();
                    cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,2,"Programa","Id_Programa",this.Id_Programa,"Nom_Programa",this.Nom_Programa,"Nivel_Formacion",this.Nivel_Formacion,
                                        "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                        listo = true;
                    break;
            }
        } catch (Exception p1) {
            p1.printStackTrace();
        }
        if(num == 1 && val == "SELECT"){
            return json = new Gson().toJson(listarPro);
        }else{
            if(num == 2 && val == "SELECT"){
                return pro;
            }else{
                return listo;
            }
        }
    }
    
}
