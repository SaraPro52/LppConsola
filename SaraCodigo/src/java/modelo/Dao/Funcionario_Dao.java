
package modelo.Dao;

import com.google.gson.Gson;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Bean.Funcionario_Bean;
import util.ClaseConn;
import util.InterfaceCrud;

public class Funcionario_Dao extends InterfaceCrud{

    public int Id_Funcionario;
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
    
    public static Funcionario_Bean consultarRegistro(int id){
    
        Funcionario_Bean funB = null;
        
        try {
            ClaseConn c = new ClaseConn();
            Connection co = c.obtenerConn();
            ResultSet rs = null;
            CallableStatement cst = co.prepareCall("{call seleccionar(?,?,?,?)}");
            cst.setInt(1, 2);
            cst.setString(2, "Funcionario");
            cst.setString(3, "Id_Funcionario");
            cst.setInt(4, id);
            cst.execute();
            rs = cst.getResultSet();
            
            while(rs.next()){
                
                funB = new Funcionario_Bean(
                           rs.getDouble("Num_Documento"),
                           rs.getString("Nom_Funcionario"),
                           rs.getString("Apellidos"),
                           rs.getString("Correo"),
                           rs.getString("Cargo"),
                           rs.getString("Ip_Sena"),
                           rs.getString("Contraseña"),
                           rs.getInt("Id_Estado"),
                           rs.getInt("Id_Area_Centro")
                );
                funB.setId_Funcionario(id);
            
            }
            rs.close();
            cst.close();
            
        } catch (Exception f1) {
            f1.printStackTrace();
        }
 
        return funB;
    }
    
    public String listar(){
    
        ClaseConn  c = new  ClaseConn();
        ArrayList<Funcionario_Bean> listarFuncionarios = new ArrayList<Funcionario_Bean>();
        
        try {
            procedure = "{call seleccionar(?,?,null,null)}";
            cst = c.obtenerConn().prepareCall(procedure);
            cst.setInt(1, 1);
            cst.setString(2, "Funcionario");
            cst.execute();
            rs = cst.getResultSet();
            
            while(rs.next()){
                
                Id_Funcionario = rs.getInt("Id_Funcionario");
                Num_Documento = rs.getDouble("Num_Documento");
                Nom_Funcionario = rs.getString("Nom_Funcionario");
                Apellidos = rs.getString("Apellidos");
                Correo = rs.getString("Correo");
                Cargo = rs.getString("Cargo");
                Ip_Sena = rs.getString("Ip_Sena");
                Contraseña = rs.getString("Contraseña");
                Id_Estado = rs.getInt("Id_Estado");
                Id_Area_Centro = rs.getInt("Id_Area_Centro");
                
                Funcionario_Bean fun = new Funcionario_Bean(
                        Num_Documento,
                        Nom_Funcionario,
                        Apellidos,
                        Correo,
                        Cargo,
                        Ip_Sena,
                        Contraseña,
                        Id_Estado,
                        Id_Area_Centro);
                
                fun.setId_Funcionario(Id_Funcionario);
                listarFuncionarios.add(fun);
            }
        } catch (Exception f2) {
            f2.printStackTrace();
        }
        return new Gson().toJson(listarFuncionarios);
    }
    public boolean AgregarFuncionario(int id_Rol){
    
        try {
            ClaseConn c = new ClaseConn();
            procedure = "{call RegistrarFuncionario(?,?,?,?,?,?,?,?,?,?)}";
            cst = c.obtenerConn().prepareCall(procedure);
            cst.setInt(1, id_Rol);
            cst.setDouble(2,this.Num_Documento);
            cst.setString(3, this.Nom_Funcionario);
            cst.setString(4, this.Apellidos);
            cst.setString(5, this.Correo);
            cst.setString(6, this.Cargo);
            cst.setString(7, this.Ip_Sena);
            cst.setString(8, this.Contraseña);
            cst.setInt(9, this.Id_Estado);
            cst.setInt(10, this.Id_Area_Centro);
            cst.execute();
            
            listo = true;
            
        } catch (Exception f3) {
            System.out.println("no listo");
            Logger.getLogger(InterfaceCrud.class.getName()).log(Level.SEVERE,null,f3);
        }
        return listo;
    }
    @Override
    public boolean AgregarRegistro() {
        
        listo = AgregarRegistroProce(9,"Funcionario", 
                                    "Num_Documento",""+this.Num_Documento+"",
                                    "Nom_Funcionario",this.Nom_Funcionario,
                                    "Apellidos",this.Apellidos, 
                                    "Correo", this.Correo,
                                    "Cargo", this.Cargo,
                                    "Ip_Sena", this.Ip_Sena,
                                    "Contraseña",this.Contraseña,
                                    "Id_Estado", ""+this.Id_Estado+"",
                                    "Id_Area_Centro", ""+this.Id_Area_Centro+"", "", "", "", "");
        
        return listo;
    }

    @Override
    public boolean ActualizarRegistro() {
        
        listo = ActualizarRegistroProce(9, "Funcionario", "Id_Funcionario",this.Id_Funcionario , 
                                        "Num_Documento",""+this.Num_Documento+"",
                                        "Nom_Funcionario",this.Nom_Funcionario,
                                        "Apellidos",this.Apellidos, 
                                        "Correo", this.Correo,
                                        "Cargo", this.Cargo,
                                        "Ip_Sena", this.Ip_Sena,
                                        "Contraseña",this.Contraseña,
                                        "Id_Estado", ""+this.Id_Estado+"",
                                        "Id_Area_Centro", ""+this.Id_Area_Centro+"",
                                         "", "","","");
        return listo;
    }
    
}
