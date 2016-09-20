
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Estado_Bean;
import util.InterfaceCrud;

public class Estado_Dao extends InterfaceCrud{
    
    public int Id_Estado;
    public String Nom_Estado;
    public int  Id_Tipo_Estado;
    private ArrayList<Estado_Bean> listarEstado = new ArrayList<Estado_Bean>();
    private Estado_Bean estado = null;
    
    public Estado_Dao(){}
    
    public Estado_Dao(Estado_Bean est){
        
        this.Id_Estado = est.getId_Estado();
        this.Nom_Estado = est.getNom_Estado();
        this.Id_Tipo_Estado = est.getId_Tipo_Estado();
        
    }
    
    @Override
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                    rs = saraCrud(val,operador+"1","Estado","Id_Estado",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                    while(rs.next()){
                        
                        estado = new Estado_Bean(rs.getString("Nom_Estado"),rs.getInt("Id_Tipo_Estado"));
                        estado.setId_Estado(rs.getInt("Id_Estado"));
                        if(operador == "-")
                            listarEstado.add(estado);
                    }
                    rs.close();
                    cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                    this.saraCrud(val,"2", "Estado", "Id_Estado",this.Id_Estado , "Nom_Estado", this.Nom_Estado, 
                                         "Id_Tipo_Estado",""+this.Id_Tipo_Estado+"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                                         "", "");
                    listo = true;
                    break;
            }
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            return json = new Gson().toJson(listarEstado);
        }else{
            if(operador == "" && val == "SELECT"){
                return estado;
            }else{
                return listo;
            }
        }
    }
    
}
