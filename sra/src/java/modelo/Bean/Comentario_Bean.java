
package modelo.Bean;

public class Comentario_Bean {
  
    private int Id_Comentario;
    private String Comentario;
    private int Id_Funcionario;
    private int Id_Version;
    
    public Comentario_Bean(){}
    public Comentario_Bean(String comentario,int id_fun,int id_ver){
        
        this.Comentario = comentario;
        this.Id_Funcionario = id_fun;
        this.Id_Version = id_ver;
    }

    public int getId_Comentario() {
        return Id_Comentario;
    }

    public void setId_Comentario(int Id_Comentario) {
        this.Id_Comentario = Id_Comentario;
    }

    public String getComentario() {
        return Comentario;
    }

    public void setComentario(String Comentario) {
        this.Comentario = Comentario;
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
