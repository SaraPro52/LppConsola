
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Detalles_Tema_Bean;
import util.InterfaceCrud;

public class Detalles_Tema_Dao extends InterfaceCrud{
    
    public int Id_Detalles_Tema;
    public int Id_Tema;
    public int Id_P_Virtual;
    private ArrayList<Detalles_Tema_Bean> listarDT = new ArrayList<Detalles_Tema_Bean>();
    private Detalles_Tema_Bean detaT = null;
    
    public Detalles_Tema_Dao(){}
    
    public Detalles_Tema_Dao(Detalles_Tema_Bean dt){
        
        this.Id_Detalles_Tema = dt.getId_Detalles_Tema();
        this.Id_Tema = dt.getId_Tema();
        this.Id_P_Virtual = dt.getId_P_Virtual();
        
    }

    @Override
    public Object OperacionRegistro(String val, int num, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                    rs = saraCrud(val,num,"Detalles_Tema","Id_Detalles_Tema",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                    while(rs.next()){
                        
                        detaT = new Detalles_Tema_Bean(rs.getInt("Id_Tema"),rs.getInt("Id_P_Virtual"));
                        detaT.setId_Detalles_Tema(rs.getInt("Id_Detalles_Tema"));
                        if(num == 1)
                            listarDT.add(detaT);
                    }
                    rs.close();
                    cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,2,"Detalles_Tema","Id_Detalles_Tema",this.Id_Detalles_Tema,"Id_Tema",""+this.Id_Tema+"","Id_P_Virtual",""+this.Id_P_Virtual+"",
                                     "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""); 
                        listo = true;
                    break;
            }
        } catch (Exception dt1) {
            dt1.printStackTrace();
        }
        if(num == 1 && val == "SELECT"){
            return json = new Gson().toJson(listarDT);
        }else{
            if(num == 2 && val == "SELECT"){
                return detaT;
            }else{
                return listo;
            }
        }
    }
    
    
}
