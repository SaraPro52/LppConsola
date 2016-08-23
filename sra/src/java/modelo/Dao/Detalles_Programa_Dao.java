
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Detalles_Programa_Bean;
import util.InterfaceCrud;

public class Detalles_Programa_Dao extends InterfaceCrud{
    
    public int Id_Detalles_Programa;
    public int Id_Tema;
    public int Id_Programa;
    private ArrayList<Detalles_Programa_Bean> listarDP = new ArrayList<Detalles_Programa_Bean>();
    private Detalles_Programa_Bean detaP = null;
    
    public Detalles_Programa_Dao(){}
    
    public Detalles_Programa_Dao(Detalles_Programa_Bean dp){
    
        this.Id_Detalles_Programa = dp.getId_Detalles_Programa();
        this.Id_Tema = dp.getId_Tema();
        this.Id_Programa = dp.getId_Programa();
    }

    @Override
    public Object OperacionRegistro(String val, int num, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,num,"Detalles_Programa","Id_Detalles_Programa",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            detaP = new Detalles_Programa_Bean(rs.getInt("Id_Tema"),rs.getInt("Id_Programa"));
                            detaP.setId_Detalles_Programa(rs.getInt("Id_Detalles_Programa"));
                            if(num == 1)
                                listarDP.add(detaP);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,2,"Detalles_Programa","Id_Detalles_Programa",this.Id_Detalles_Programa,"Id_Tema",""+this.Id_Tema+"","Id_Programa",""+this.Id_Programa+"",
                                "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                        listo = true;
                    break;
            }
        } catch (Exception dp1) {
            dp1.printStackTrace();
        }
        if(num == 1 && val == "SELECT"){
            return json = new Gson().toJson(listarDP);
        }else{
            if(num == 2 && val == "SELECT"){
                return detaP;
            }else{
                return listo;
            }
        }
    }
    
    
    
}
