
package modelo.Bean;

public class Autor_Bean {
    
    private int Id_Autor;
    private int Id_Funcionario;
    private int Id_Version;
    
    public Autor_Bean(){}
    
    public Autor_Bean(int id_fun, int id_ver){
        
        this.Id_Funcionario = id_fun;
        this.Id_Version = id_ver;
    }

    public int getId_Autor() {
        return Id_Autor;
    }

    public void setId_Autor(int Id_Autor) {
        this.Id_Autor = Id_Autor;
    }

    public int getId_Funcionario() {
        return Id_Funcionario;
    }

    public void setId_Funcionario(int Id_Funcionario) {
        this.Id_Funcionario = Id_Funcionario;
    }

    public int getId_Version() {
        return Id_Version;
    }

    public void setId_Version(int Id_Version) {
        this.Id_Version = Id_Version;
    }
    
    
}
