
package modelo.Dao;

import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Bean.Funcionario_Bean;
import util.InterfaceCrud;

public class Funcionario_Dao extends InterfaceCrud{

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
    private ArrayList<Funcionario_Bean> listarFun = new ArrayList<Funcionario_Bean>();
    private Funcionario_Bean fun = null;
    private String procedure = "{call RegistrarFuncionario(?,?,?,?,?,?,?,?,?,?,?)}";
    
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
    public Object OperacionRegistro(String val, String operador, Object objeto) {
        try {
            switch(val){
                case "SELECT":
                    rs = saraCrud(val,operador+"1","Funcionario","Id_Funcionario",(int)objeto,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);    
                    
                    while(rs.next()){
                        
                        fun = new Funcionario_Bean( rs.getInt("Id_Tipo_Documento"),
                                                    rs.getDouble("Num_Documento"),
                                                    rs.getString("Nom_Funcionario"),
                                                    rs.getString("Apellidos"),
                                                    rs.getString("Correo"),
                                                    rs.getString("Cargo"),
                                                    rs.getString("Ip_Sena"),
                                                    rs.getString("Contraseña"),
                                                    rs.getInt("Id_Estado"),
                                                    rs.getInt("Id_Area_Centro"));
                        fun.setId_Funcionario(rs.getInt("Id_Funcionario"));
                        if(operador == "-")
                            listarFun.add(fun);
                    }
                    rs.close();
                    cst.close();
                    break;
                case "INSERT":
                case "UPDATE":
                    if(val == "INSERT" && operador == ""){
                    listo = AgregarFuncionario((int)objeto);}
                    else{
                        this.saraCrud(val,"10","Funcionario", "Id_Funcionario",this.Id_Funcionario ,
                                        "Id_Tipo_Documento",""+this.Id_Tipo_Documento+"",
                                        "Num_Documento",""+this.Num_Documento+"",
                                        "Nom_Funcionario",this.Nom_Funcionario,
                                        "Apellidos",this.Apellidos, 
                                        "Correo", this.Correo,
                                        "Cargo", this.Cargo,
                                        "Ip_Sena", this.Ip_Sena,
                                        "Contraseña",this.Contraseña,
                                        "Id_Estado", ""+this.Id_Estado+"",
                                        "Id_Area_Centro", ""+this.Id_Area_Centro+"",
                                        "","");
                        listo = true;
                    }
                    
                    break;
            }
        } catch (Exception f1) {
            f1.printStackTrace();
        }
        if(operador == "-" && val == "SELECT"){
            return json = new Gson().toJson(listarFun);
        }else{
            if(operador == "" && val == "SELECT"){
                return fun;
            }else{
                return listo;
            }
        }
    }
    
    
    private boolean AgregarFuncionario(int id_Rol){
    
        try {
            cst = this.obtenerConn().prepareCall(procedure);
            cst.setInt(1, id_Rol);
            cst.setInt(2, this.Id_Tipo_Documento);
            cst.setDouble(3,this.Num_Documento);
            cst.setString(4, this.Nom_Funcionario);
            cst.setString(5, this.Apellidos);
            cst.setString(6, this.Correo);
            cst.setString(7, this.Cargo);
            cst.setString(8, this.Ip_Sena);
            cst.setString(9, this.Contraseña);
            cst.setInt(10, this.Id_Estado);
            cst.setInt(11, this.Id_Area_Centro);
            cst.execute();
            
            listo = true;
            
        } catch (Exception f2) {
            Logger.getLogger(InterfaceCrud.class.getName()).log(Level.SEVERE,null,f2);
        }
        return listo;
    }
    
}
