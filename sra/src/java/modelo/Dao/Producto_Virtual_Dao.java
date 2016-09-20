
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Producto_Virtual_Bean;
import util.InterfaceCrud;

public class Producto_Virtual_Dao extends InterfaceCrud{
    
    public int Id_P_Virtual;
    public String Nom_P_Virtual;
    public String Des_P_Virtual;
    public String Palabras_Clave;
    public int Id_Formato;
    private ArrayList<Producto_Virtual_Bean> listarPV = new ArrayList<Producto_Virtual_Bean>();
    private Producto_Virtual_Bean proVir = null;
    
    public Producto_Virtual_Dao(){}
    
    public Producto_Virtual_Dao(Producto_Virtual_Bean pv){
    
        this.Id_P_Virtual = pv.getId_P_Virtual();
        this.Nom_P_Virtual = pv.getNom_P_Virtual();
        this.Des_P_Virtual = pv.getDes_P_Virtual();
        this.Palabras_Clave = pv.getPalabras_Clave();
        this.Id_Formato = pv.getId_Formato();
    }

    @Override
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,operador+"1","Producto_Virtual","Id_P_Virtual",(int) objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            proVir = new Producto_Virtual_Bean(rs.getString("Nom_P_Virtual"),rs.getString("Des_P_Virtual"),rs.getString("Palabras_Clave"),rs.getInt("Id_Formato"));
                            proVir.setId_P_Virtual(rs.getInt("Id_P_Virtual"));
                            if(operador == "-")
                                listarPV.add(proVir);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,"4","Producto_Virtual","Id_P_Virtual",this.Id_P_Virtual,"Nom_P_Virtual",this.Nom_P_Virtual,"Des_P_Virtual",this.Des_P_Virtual,"Palabras_Clave",this.Palabras_Clave,"Id_Formato",""+this.Id_Formato+"",
                                "", "", "", "", "","", "", "", "", "", "", "", "", "");
                        listo = true;
                    break;
            }
        } catch (Exception pv1) {
            pv1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            return json = new Gson().toJson(listarPV);
        }else{
            if(operador == "" && val == "SELECT"){
                return proVir;
            }else{
                return listo;
            }
        }
        
    }
    
    
}
