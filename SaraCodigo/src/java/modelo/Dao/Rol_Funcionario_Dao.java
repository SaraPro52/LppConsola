
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import modelo.Bean.Rol_Funcionario_Bean;
import util.InterfaceCrud;

public class Rol_Funcionario_Dao extends InterfaceCrud {
    
    public int Id_Rol_Funcionario;
    public int Id_Rol;
    public int Id_Funcionario;
    private ArrayList<Rol_Funcionario_Bean> listarRF = new ArrayList<Rol_Funcionario_Bean>();
    private Rol_Funcionario_Bean rfun = null;
    
    public Rol_Funcionario_Dao(){}
    
    public Rol_Funcionario_Dao(Rol_Funcionario_Bean rfb){
        
        this.Id_Rol_Funcionario = rfb.getId_Rol_Funcionario();
        this.Id_Rol = rfb.getId_Rol();
        this.Id_Funcionario = rfb.getId_Funcionario();
    }

    @Override
    public Object OperacionRegistro(String val, int num, int id) {
        try {
            switch(val){
                case "SELECT":
                        rs = saraCrud(val,num,"Rol_Funcionario","Id_Rol_Funcionario",id,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
                        while(rs.next()){
                            
                            rfun = new Rol_Funcionario_Bean(rs.getInt("Id_Rol"),rs.getInt("Id_Funcionario"));
                            rfun.setId_Rol_Funcionario(rs.getInt("Id_Rol_Funcionario"));
                            if(num == 1)
                                listarRF.add(rfun);
                        }
                        rs.close();
                        cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                        this.saraCrud(val,2, "Rol_Funcionario", "Id_Rol_Funcionario",this.Id_Rol_Funcionario , "Id_Rol", ""+this.Id_Rol+"", 
                                         "Id_Funcionario", ""+this.Id_Funcionario+"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
                                         "", "");
                        listo = true;
                    break;
            }
        } catch (Exception rf1) {
            rf1.printStackTrace();
        }
        if(num == 1 && val == "SELECT"){
            return new Gson().toJson(listarRF);
        }else{
            if(num ==2 && val == "SELECT"){
                return rfun;
            }else{
                return listo;
            }
        }
    }
   
}
