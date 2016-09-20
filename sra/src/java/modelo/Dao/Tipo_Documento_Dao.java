
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Tipo_Documento_Bean;
import util.InterfaceCrud;

public class Tipo_Documento_Dao extends InterfaceCrud{

    public int Id_Tipo_Documento;
    public String Nom_Tipo_Documento;
    private ArrayList<Tipo_Documento_Bean> listarTD = new ArrayList<Tipo_Documento_Bean>();
    private Tipo_Documento_Bean tipoD = null;
            
    public Tipo_Documento_Dao(){}
    
    public Tipo_Documento_Dao(Tipo_Documento_Bean tipoD){
    
        this.Id_Tipo_Documento = tipoD.getId_Tipo_Documento();
        this.Nom_Tipo_Documento = tipoD.getNom_Tipo_Documento();
    }
    
    @Override
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,operador+"","Tipo_Documento","Id_Tipo_Documento",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            tipoD = new Tipo_Documento_Bean(rs.getString("Nom_Tipo_Documento"));
                            tipoD.setId_Tipo_Documento(rs.getInt("Id_Tipo_Documento"));
                            if(operador == "-")
                                listarTD.add(tipoD);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,"1","Tipo_Documento","Id_Tipo_Documento",this.Id_Tipo_Documento,"Nom_Tipo_Documento",this.Nom_Tipo_Documento,
                                    "","","","","","","","","","","","","","","","","","","","");
                        listo = true;
                    break;
            }
        } catch (Exception td1) {
            td1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            return json = new Gson().toJson(listarTD);
        }else{
            if(operador == "" && val == "SELECT"){
                return tipoD;
            }else{
                return listo;
            }
        }
    }
}
