
package modelo.Dao;


import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Tipo_Estado_Bean;
import util.InterfaceCrud;

public class Tipo_Estado_Dao extends InterfaceCrud{

    public int Id_Tipo_Estado;
    public String Nom_Tipo_Estado;
    private ArrayList<Tipo_Estado_Bean> listarTE = new ArrayList<Tipo_Estado_Bean>();
    private Tipo_Estado_Bean tipoE = null; 
    
    public Tipo_Estado_Dao (){}
    
    public Tipo_Estado_Dao(Tipo_Estado_Bean tipoB){
        
        this.Id_Tipo_Estado = tipoB.getId_Tipo_Estado();
        this.Nom_Tipo_Estado = tipoB.getNom_Tipo_Estado();
    }
    

    @Override
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        try{
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,operador+"","Tipo_Estado","Id_Tipo_Estado",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            tipoE = new Tipo_Estado_Bean(rs.getString("Nom_Tipo_Estado"));
                            tipoE.setId_Tipo_Estado(rs.getInt("Id_Tipo_Estado"));
                            if(operador == "-")
                                listarTE.add(tipoE);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        
                    this.saraCrud(val,"1","Tipo_Estado","Id_Tipo_Estado",this.Id_Tipo_Estado,"Nom_Tipo_Estado",this.Nom_Tipo_Estado,
                            "","","","","","","","","","","","","","","","","","","","");
                    listo = true;
                    break;
            }
        } catch (Exception te1) {
            te1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            return json = new Gson().toJson(listarTE);
        }else{
            if(operador == "" && val == "SELECT"){
                return tipoE;
            }else{
                return listo;
            }
        }
    }
    
    
}
