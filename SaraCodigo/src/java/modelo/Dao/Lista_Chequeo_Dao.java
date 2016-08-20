
package modelo.Dao;

import com.google.gson.Gson;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Bean.Lista_Chequeo_Bean;
import util.InterfaceCrud;

public class Lista_Chequeo_Dao extends InterfaceCrud{
    
    public int Id_Lista_Chequeo;
    public String Nom_Lista_Chequeo;
    public String Des_Lista_Chequeo;
    public Timestamp  Fecha_Creacion;
    public int    Id_Funcionario;
    private ArrayList<Lista_Chequeo_Bean> listarLChequeo = new ArrayList<Lista_Chequeo_Bean>();
    private Lista_Chequeo_Bean lChequeo;
    private final String procedure = "{call RegistrarListaChequeo(?,?,?,?,?)}";

    public Lista_Chequeo_Dao(){}
    
    public Lista_Chequeo_Dao(Lista_Chequeo_Bean list){
        
        this.Id_Lista_Chequeo = list.getId_Lista_Chequeo();
        this.Nom_Lista_Chequeo = list.getNom_Lista_Chequeo();
        this.Des_Lista_Chequeo = list.getDes_Lista_Chequeo();
        this.Fecha_Creacion = list.getFecha_Creacion();
        this.Id_Funcionario = list.getId_Funcionario();
    }
    
    @Override
    public Object OperacionRegistro(String val, int num, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,num,"Lista_Chequeo","Id_Lista_Chequeo",(int)objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            lChequeo = new Lista_Chequeo_Bean(rs.getString("Nom_Lista_Chequeo"),rs.getString("Des_Lista_Chequeo"),rs.getInt("Id_Funcionario"));
                            lChequeo.setId_Lista_Chequeo(rs.getInt("Id_Lista_Chequeo"));
                            lChequeo.setFecha_Creacion(rs.getTimestamp("Fecha_Creacion"));
                            if(num == 1)
                               listarLChequeo.add(lChequeo);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        if(val == "INSERT" && num == 1){
                            listo = RegistrarListaChequeo((int[]) objeto);}
                        else{    
                        this.saraCrud(val,3,"Lista_Chequeo","Id_Lista_Chequeo",this.Id_Lista_Chequeo,"Nom_Lista_Chequeo",this.Nom_Lista_Chequeo,"Des_Lista_Chequeo",this.Des_Lista_Chequeo,
                                      "Id_Funcionario",""+this.Id_Funcionario+"","", "", "", "", "","", "", "", "", "", "", "", "", "","","");
                        listo = true;}
                    break;
            }
        } catch (Exception lc1) {
            lc1.printStackTrace();
        }
        if(num == 1 && val == "SELECT"){
            return  json = new Gson().toJson(listarLChequeo);
        }else{
            if(num == 2 && val == "SELECT"){
                return lChequeo;
            }else{
                return listo;
            }
        }
    }
    
    private boolean RegistrarListaChequeo(int[] array){
        
        String items = "";
        for (int i = 0; i < array.length; i++) {
             
             if(i == 0)
                 items += array[i];
             else
                 items += ","+array[i];
        }
        System.out.println(items);
        try {
            cst = this.obtenerConn().prepareCall(procedure);
            cst.setString(1, this.Nom_Lista_Chequeo);
            cst.setString(2, this.Des_Lista_Chequeo);
            cst.setInt(3, this.Id_Funcionario);
            cst.setString(4, items);
            cst.setInt(5, array.length);
            cst.execute();
            
            listo = true;
        } catch (Exception lc2) {
            Logger.getLogger(InterfaceCrud.class.getName()).log(Level.SEVERE,null,lc2);
        }
        return listo;
    }
    
}
