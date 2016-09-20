
package modelo.Dao;


import modelo.Bean.Funcionario_Bean;
import util.M_Crud;

public class Funcionario_Dao extends M_Crud{

    public int Id_Funcionario;
    public int Id_Tipo_Documento;
    public double Num_Documento;
    public String Nom_Funcionario;
    public String Apellidos;
    public String Correo;
    public String Cargo;
    public String Ip_Sena;
    public String Contraseña;
    public int Id_Estado;
    public int Id_Area_Centro;
    
    public Funcionario_Dao(){}
    
    public Funcionario_Dao(Funcionario_Bean funB){
        
        this.Id_Funcionario = funB.getId_Funcionario();
        this.Id_Tipo_Documento = funB.getId_Tipo_Documento();
        this.Num_Documento = funB.getNum_Documento();
        this.Nom_Funcionario = funB.getNom_Funcionario();
        this.Apellidos = funB.getApellidos();
        this.Correo = funB.getCorreo();
        this.Cargo = funB.getCargo();
        this.Ip_Sena = funB.getIp_Sena();
        this.Contraseña = funB.getContraseña();
        this.Id_Estado = funB.getId_Estado();
        this.Id_Area_Centro = funB.getId_Area_Centro();
    }

    @Override
    public Object Crud(String sentencia, String dTabla , String condicion) {
        cont1.put("Id_Funcionario", ""+this.Id_Funcionario);
        cont1.put("Id_Tipo_Documento",   ""+this.Id_Tipo_Documento);
        cont1.put("Num_Documento", ""+this.Num_Documento);
        cont1.put("Nom_Funcionario", this.Nom_Funcionario);
        cont1.put("Apellidos", this.Apellidos);
        cont1.put("Correo", this.Correo);
        cont1.put("Cargo", this.Cargo);
        cont1.put("Ip_Sena", this.Ip_Sena);
        cont1.put("Contraseña", this.Contraseña);
        cont1.put("Id_Estado", ""+this.Id_Estado);
        cont1.put("Id_Area_Centro", ""+this.Id_Area_Centro);
        return SuperP(sentencia,"Funcionario",cont1,condicion);
    }
    
    public boolean RegistrarFuncionario(String[] fun){
        String todoFun = "";
        for(int i= 0; i < fun.length; i++){
            if(i == 0)
                todoFun += fun[i];
            else
                todoFun += "~"+fun[i];
        }
        return (boolean)this.Registar(todoFun, 2);
    }
}
