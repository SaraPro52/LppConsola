
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Rol_Bean;
import util.InterfaceCrud;

public class Rol_Dao extends InterfaceCrud{

    public int Id_Rol;
    public String Nom_Rol;
    public String Des_Rol;
    private ArrayList<Rol_Bean> listarRol = new ArrayList<Rol_Bean>();
    private Rol_Bean rol = null;
    
    public Rol_Dao(){}
    
    public Rol_Dao(Rol_Bean rolB){
        this.Id_Rol = rolB.getId_Rol();
        this.Nom_Rol = rolB.getNom_Rol();
        this.Des_Rol = rolB.getDes_Rol();
    }
    
    @Override
    public Object OperacionRegistro(String val, int num, int id) {
        
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,num,"Rol","Id_Rol",id,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            rol = new Rol_Bean(rs.getString("Nom_Rol"),rs.getString("Des_Rol"));
                            rol.setId_Rol(rs.getInt("Id_Rol"));
                            if(num == 1)
                                listarRol.add(rol);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,2, "Rol", "Id_Rol",this.Id_Rol , "Nom_Rol", this.Nom_Rol,"Des_Rol",this.Des_Rol,
                                         "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                        listo = true;
                    break;
            }
        } catch (Exception r1) {
            r1.printStackTrace();
        }
            if(num == 1 && val == "SELECT"){
            return json = new Gson().toJson(listarRol);
        }else{
            if(num == 2 && val == "SELECT"){
                return rol;
            }else{
                return listo;
            }
        }
    }
   
}
