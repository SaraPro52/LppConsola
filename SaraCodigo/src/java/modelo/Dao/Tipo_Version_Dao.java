
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Tipo_Version_Bean;
import util.InterfaceCrud;

public class Tipo_Version_Dao extends InterfaceCrud{
    
    public int Id_Tipo_Version;
    public String Nom_Tipo_Version;
    public String Des_Version;
    private ArrayList<Tipo_Version_Bean> listarTV = new ArrayList<Tipo_Version_Bean>();
    private Tipo_Version_Bean tipoV = null;
    
    public Tipo_Version_Dao(){}
    
    public Tipo_Version_Dao(Tipo_Version_Bean tipo){
        
        this.Id_Tipo_Version = tipo.getId_Tipo_Version();
        this.Nom_Tipo_Version = tipo.getNom_Tipo_Version();
        this.Des_Version = tipo.getDes_Version();
    }

    @Override
    public Object OperacionRegistro(String val, int num, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,num,"Tipo_Version","Id_Tipo_Version",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            tipoV = new Tipo_Version_Bean(rs.getString("Nom_Tipo_Version"),rs.getString("Des_Version"));
                            tipoV.setId_Tipo_Version(rs.getInt("Id_Tipo_Version"));
                            if(num == 1)
                                listarTV.add(tipoV);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,2,"Tipo_Version","Id_Tipo_Version",this.Id_Tipo_Version,"Nom_Tipo_Version",this.Nom_Tipo_Version,"Des_Version",this.Des_Version,
                                "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                        listo = true;
                    break;
            }
        } catch (Exception tv1) {
            tv1.printStackTrace();
        }
        if(num == 1 && val == "SELECT"){
            return json = new Gson().toJson(listarTV);
        }else{
            if(num == 2 && val == "SELECT"){
                return tipoV;
            }else{
                return listo;
            }
        }
    }
    
    
    
    
}
