
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Ciudad_Bean;
import util.InterfaceCrud;

public class Ciudad_Dao extends InterfaceCrud{
    
    public int Id_Ciudad;
    public String Nom_Ciudad;
    private ArrayList<Ciudad_Bean> listarCiudad = new ArrayList<Ciudad_Bean>();
    private Ciudad_Bean ciuB = null;
    
    public Ciudad_Dao(){}
    
    public Ciudad_Dao(Ciudad_Bean ciuB){
    
        this.Id_Ciudad = ciuB.getId_Ciudad();
        this.Nom_Ciudad = ciuB.getNom_Ciudad();
    }
    
    @Override
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        
        try {
            switch(val){
                case "SELECT":
                    rs = saraCrud(val,operador+"1","Ciudad","Id_Ciudad",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                    
                    while(rs.next()){
                        
                        ciuB = new Ciudad_Bean(rs.getString("Nom_Ciudad"));
                        ciuB.setId_Ciudad(rs.getInt("Id_Ciudad"));
                        if(operador == "-")
                            listarCiudad.add(ciuB);
                    }
                    rs.close();
                    cst.close();
                    break;
                case "INSERT":
                case "UPDATE":   
                    this.saraCrud(val,"1","Ciudad", "Id_Ciudad",this.Id_Ciudad , "Nom_Ciudad", this.Nom_Ciudad, 
                                                 "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                                                 "", "");
                    listo = true;
                    break;
            }
        } catch (Exception c1) {
            c1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            return json = new Gson().toJson(listarCiudad);
        }else{
            if(operador == "" && val == "SELECT")
            {
                return ciuB;
            }else{
                return listo;
            }
        }
        
    }
    
}
