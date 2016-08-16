
package modelo.Bean;


public class Rol_Funcionario_Bean {
    
    private int Id_Rol_Funcionario;
    private int Id_Rol;
    private int Id_Funcionario;
    
    public Rol_Funcionario_Bean(){}
    
    public Rol_Funcionario_Bean(int id_Rol,int id_Funcionario){
        
        this.Id_Rol = id_Rol;
        this.Id_Funcionario = id_Funcionario;
        
    }

    public int getId_Rol_Funcionario() {
        return Id_Rol_Funcionario;
    }

    public void setId_Rol_Funcionario(int Id_Rol_Funcionario) {
        this.Id_Rol_Funcionario = Id_Rol_Funcionario;
    }

    public int getId_Rol() {
        return Id_Rol;
    }

    public void setId_Rol(int Id_Rol) {
        this.Id_Rol = Id_Rol;
    }

    public int getId_Funcionario() {
        return Id_Funcionario;
    }

    public void setId_Funcionario(int Id_Funcionario) {
        this.Id_Funcionario = Id_Funcionario;
    }
}
