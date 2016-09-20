
package modelo.Dao;

import modelo.Bean.Rol_Funcionario_Bean;
import util.M_Crud;

public class Rol_Funcionario_Dao extends M_Crud{
    
    public int Id_Rol_Funcionario;
    public int Id_Rol;
    public int Id_Funcionario;
    
    public Rol_Funcionario_Dao(){}
    
    public Rol_Funcionario_Dao(Rol_Funcionario_Bean rfb){
        
        this.Id_Rol_Funcionario = rfb.getId_Rol_Funcionario();
        this.Id_Rol = rfb.getId_Rol();
        this.Id_Funcionario = rfb.getId_Funcionario();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Rol_Funcionario", ""+this.Id_Rol_Funcionario);
        cont1.put("Id_Rol",             ""+this.Id_Rol);
        cont1.put("Id_Funcionario",     ""+this.Id_Funcionario);
        return SuperP(sentencia,"Area",cont1,condicion);
    }
   
}
