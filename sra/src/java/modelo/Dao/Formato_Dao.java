
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Formato_Bean;
import util.InterfaceCrud;

public class Formato_Dao extends InterfaceCrud{
    
    public int Id_Formato;
    public String Nom_Formato;
    public String Des_Formato;
    private ArrayList<Formato_Bean> listarFormato = new ArrayList<Formato_Bean>();
    private Formato_Bean formato = null;
    
    public Formato_Dao(){}
    
    public Formato_Dao(Formato_Bean fmt){
        
        this.Id_Formato = fmt.getId_Formato();
        this.Nom_Formato = fmt.getNom_Formato();
        this.Des_Formato = fmt.getDes_Formato();
    }

    @Override
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,operador+"1","Formato","Id_Formato",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            formato = new Formato_Bean(rs.getString("Nom_Formato"),rs.getString("Des_Formato"));
                            formato.setId_Formato(rs.getInt("Id_Formato"));
                            if(operador == "-")
                                listarFormato.add(formato);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                     this.saraCrud(val,"2","Formato","Id_Formato",this.Id_Formato,"Nom_Formato",this.Nom_Formato,"Des_Formato",this.Des_Formato,
                             "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                     listo = true;
                    break;
            }
        } catch (Exception fmt1) {
            fmt1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            return json = new Gson().toJson(listarFormato);
        }else{
            if(operador == "" && val == "SELECT"){
                return formato;
            }else{
                return listo;
            }
        }
    }
    
    
    
    
    
}
