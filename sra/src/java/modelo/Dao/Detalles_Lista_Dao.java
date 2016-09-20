
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Detalles_Lista_Bean;
import util.InterfaceCrud;

public class Detalles_Lista_Dao extends InterfaceCrud{
    
    public int Id_Detalles_Lista;
    public int Id_Lista_Chequeo;
    public int Id_Item_Lista;
    private ArrayList<Detalles_Lista_Bean> listarDeLista = new ArrayList<Detalles_Lista_Bean>();
    private Detalles_Lista_Bean detaL = null;
    
    public Detalles_Lista_Dao(){}
    
    public Detalles_Lista_Dao(Detalles_Lista_Bean det){
    
        this.Id_Detalles_Lista = det.getId_Detalles_Lista();
        this.Id_Lista_Chequeo = det.getId_Lista_Chequeo();
        this.Id_Item_Lista = det.getId_Item_Lista();
    }
    
    @Override
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,operador+"4","V_Detalles_Lista","Id_Detalles_Lista",(int) objeto,"Id_Lista_Chequeo",null,"Id_Item_Lista",null,"Id_Detalles_Lista",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            detaL = new Detalles_Lista_Bean(rs.getInt("Id_Lista_Chequeo"),rs.getInt("Id_Item_Lista"));
                            detaL.setId_Detalles_Lista(rs.getInt("Id_Detalles_Lista"));
                            if(operador == "-")
                                listarDeLista.add(detaL);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,"2","Detalles_Lista","Id_Detalles_Lista",this.Id_Detalles_Lista,"Id_Lista_Chequeo",""+this.Id_Lista_Chequeo+"","Id_Item_Lista",""+this.Id_Item_Lista+"",
                                  "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                        listo = true;
                    break;
            }
        } catch (Exception dt1) {
            dt1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            return json = new Gson().toJson(listarDeLista);
        }else{
            if(operador == "" && val == "SELECT"){
                return detaL;
            }else{
                return listo;
            }
        }
    }
    
}
